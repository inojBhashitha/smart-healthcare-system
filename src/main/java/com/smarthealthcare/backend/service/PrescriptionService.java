package com.smarthealthcare.backend.service;

import com.smarthealthcare.backend.entity.Prescription;
import com.smarthealthcare.backend.repository.PrescriptionRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class PrescriptionService {

    private final PrescriptionRepository prescriptionRepository;

    public PrescriptionService(PrescriptionRepository prescriptionRepository) {
        this.prescriptionRepository = prescriptionRepository;
    }

    public List<Prescription> getAllPrescriptions() {
        return prescriptionRepository.findAll();
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
}