package com.smarthealthcare.backend.dto.prescription;

import com.smarthealthcare.backend.dto.druginteraction.DrugInteractionResult;

import java.time.LocalDateTime;
import java.util.List;

public class PrescriptionDetailsResponse {

    private Long prescriptionId;
    private String imagePath;
    private String extractedText;
    private Integer medicinesFound;
    private String status;
    private LocalDateTime uploadedAt;

    private List<PrescriptionMedicineResponse> medicines;
    private List<DrugInteractionResult> drugInteractions;

    public PrescriptionDetailsResponse() {
    }

    public PrescriptionDetailsResponse(
            Long prescriptionId,
            String imagePath,
            String extractedText,
            Integer medicinesFound,
            String status,
            LocalDateTime uploadedAt,
            List<PrescriptionMedicineResponse> medicines,
            List<DrugInteractionResult> drugInteractions) {

        this.prescriptionId = prescriptionId;
        this.imagePath = imagePath;
        this.extractedText = extractedText;
        this.medicinesFound = medicinesFound;
        this.status = status;
        this.uploadedAt = uploadedAt;
        this.medicines = medicines;
        this.drugInteractions = drugInteractions;
    }

    // Getters

    public Long getPrescriptionId() {
        return prescriptionId;
    }

    public String getImagePath() {
        return imagePath;
    }

    public String getExtractedText() {
        return extractedText;
    }

    public Integer getMedicinesFound() {
        return medicinesFound;
    }

    public String getStatus() {
        return status;
    }

    public LocalDateTime getUploadedAt() {
        return uploadedAt;
    }

    public List<PrescriptionMedicineResponse> getMedicines() {
        return medicines;
    }

    public List<DrugInteractionResult> getDrugInteractions() {
        return drugInteractions;
    }

    // Setters

    public void setPrescriptionId(Long prescriptionId) {
        this.prescriptionId = prescriptionId;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public void setExtractedText(String extractedText) {
        this.extractedText = extractedText;
    }

    public void setMedicinesFound(Integer medicinesFound) {
        this.medicinesFound = medicinesFound;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setUploadedAt(LocalDateTime uploadedAt) {
        this.uploadedAt = uploadedAt;
    }

    public void setMedicines(List<PrescriptionMedicineResponse> medicines) {
        this.medicines = medicines;
    }

    public void setDrugInteractions(List<DrugInteractionResult> drugInteractions) {
        this.drugInteractions = drugInteractions;
    }
}