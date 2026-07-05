package com.smarthealthcare.backend.service;

import com.smarthealthcare.backend.dto.druginteraction.DrugInteractionResult;
import com.smarthealthcare.backend.dto.prescription.DatabaseMedicineResponse;
import com.smarthealthcare.backend.dto.prescription.PrescriptionDetailsResponse;
import com.smarthealthcare.backend.dto.prescription.PrescriptionMedicineResponse;
import com.smarthealthcare.backend.dto.prescription.PrescriptionSummaryResponse;
import com.smarthealthcare.backend.entity.Prescription;
import com.smarthealthcare.backend.entity.PrescriptionMedicine;
import com.smarthealthcare.backend.repository.PrescriptionRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class PrescriptionService {

    private final PrescriptionRepository prescriptionRepository;
    private final DrugInteractionService drugInteractionService;

    public PrescriptionService(
            PrescriptionRepository prescriptionRepository,
            DrugInteractionService drugInteractionService) {

        this.prescriptionRepository = prescriptionRepository;
        this.drugInteractionService = drugInteractionService;
    }

    public List<PrescriptionSummaryResponse> getPrescriptionsByStatus(String status) {

    return prescriptionRepository.findByStatus(status)
            .stream()
            .map(prescription -> new PrescriptionSummaryResponse(
                    prescription.getPrescriptionId(),
                    prescription.getStatus(),
                    prescription.getMedicinesFound(),
                    prescription.getUploadedAt()
            ))
            .toList();
}

    public List<PrescriptionSummaryResponse> getAllPrescriptions() {

        return prescriptionRepository.findAll()
                .stream()
                .map(prescription -> new PrescriptionSummaryResponse(
                        prescription.getPrescriptionId(),
                        prescription.getStatus(),
                        prescription.getMedicinesFound(),
                        prescription.getUploadedAt()
                ))
                .collect(Collectors.toList());
    }

    public Prescription savePrescription(
            String imagePath,
            String extractedText,
            int medicinesFound) {

        Prescription prescription = new Prescription();

        prescription.setImagePath(imagePath);
        prescription.setExtractedText(extractedText);
        prescription.setMedicinesFound(medicinesFound);
        prescription.setStatus("OCR_COMPLETED");
        prescription.setUploadedAt(LocalDateTime.now());

        return prescriptionRepository.save(prescription);
    }

    public PrescriptionDetailsResponse getPrescription(Long id) {

        Prescription prescription =
                prescriptionRepository
                        .findWithMedicinesByPrescriptionId(id)
                        .orElseThrow(() ->
                                new RuntimeException("Prescription not found"));

        PrescriptionDetailsResponse response =
                new PrescriptionDetailsResponse();

        response.setPrescriptionId(prescription.getPrescriptionId());
        response.setImagePath(prescription.getImagePath());
        response.setExtractedText(prescription.getExtractedText());
        response.setMedicinesFound(prescription.getMedicinesFound());
        response.setStatus(prescription.getStatus());
        response.setUploadedAt(prescription.getUploadedAt());

        List<PrescriptionMedicineResponse> medicineResponses =
                prescription.getMedicines()
                        .stream()
                        .map(this::mapMedicine)
                        .collect(Collectors.toList());

        response.setMedicines(medicineResponses);

        // Check drug interactions
        List<String> medicineNames =
                prescription.getMedicines()
                        .stream()
                        .map(PrescriptionMedicine::getMedicineName)
                        .toList();

        List<DrugInteractionResult> interactions =
                drugInteractionService.checkInteractions(medicineNames);

        response.setDrugInteractions(interactions);

        return response;
    }

    private PrescriptionMedicineResponse mapMedicine(
            PrescriptionMedicine medicine) {

        DatabaseMedicineResponse databaseMedicine = null;

        if (medicine.getMedicine() != null) {

            databaseMedicine = new DatabaseMedicineResponse(
                    medicine.getMedicine().getMedicineId(),
                    medicine.getMedicine().getGenericName(),
                    medicine.getMedicine().getBrandName(),
                    medicine.getMedicine().getCategory(),
                    medicine.getMedicine().getDescription(),
                    medicine.getMedicine().getSideEffects()
            );
        }

        return new PrescriptionMedicineResponse(
                medicine.getMedicineName(),
                medicine.getStrength(),
                medicine.getInstruction(),
                medicine.getVerified(),
                databaseMedicine
        );
    }
}