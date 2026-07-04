package com.smarthealthcare.backend.service;

import com.smarthealthcare.backend.dto.prescription.PrescriptionMedicineUpdateResponse;
import com.smarthealthcare.backend.entity.PrescriptionMedicine;
import com.smarthealthcare.backend.repository.PrescriptionMedicineRepository;
import org.springframework.stereotype.Service;

@Service
public class PrescriptionMedicineManagementService {

    private final PrescriptionMedicineRepository repository;

    public PrescriptionMedicineManagementService(
            PrescriptionMedicineRepository repository) {

        this.repository = repository;
    }

    public PrescriptionMedicineUpdateResponse verifyMedicine(
            Long id,
            Boolean verified) {

        PrescriptionMedicine medicine =
                repository.findById(id)
                        .orElseThrow(() ->
                                new RuntimeException("Medicine not found"));

        medicine.setVerified(verified);

        PrescriptionMedicine updatedMedicine =
                repository.save(medicine);

        return new PrescriptionMedicineUpdateResponse(
                updatedMedicine.getId(),
                updatedMedicine.getMedicineName(),
                updatedMedicine.getStrength(),
                updatedMedicine.getInstruction(),
                updatedMedicine.getVerified()
        );
    }
}