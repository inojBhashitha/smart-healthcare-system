package com.smarthealthcare.backend.dto.prescription;

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

    public PrescriptionDetailsResponse() {
    }

    public Long getPrescriptionId() {
        return prescriptionId;
    }

    public void setPrescriptionId(Long prescriptionId) {
        this.prescriptionId = prescriptionId;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getExtractedText() {
        return extractedText;
    }

    public void setExtractedText(String extractedText) {
        this.extractedText = extractedText;
    }

    public Integer getMedicinesFound() {
        return medicinesFound;
    }

    public void setMedicinesFound(Integer medicinesFound) {
        this.medicinesFound = medicinesFound;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getUploadedAt() {
        return uploadedAt;
    }

    public void setUploadedAt(LocalDateTime uploadedAt) {
        this.uploadedAt = uploadedAt;
    }

    public List<PrescriptionMedicineResponse> getMedicines() {
        return medicines;
    }

    public void setMedicines(List<PrescriptionMedicineResponse> medicines) {
        this.medicines = medicines;
    }
}