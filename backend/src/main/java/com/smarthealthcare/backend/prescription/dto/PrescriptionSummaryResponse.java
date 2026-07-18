package com.smarthealthcare.backend.prescription.dto;

import java.time.LocalDateTime;

public class PrescriptionSummaryResponse {

    private Long prescriptionId;
    private String status;
    private Integer medicinesFound;
    private LocalDateTime uploadedAt;

    public PrescriptionSummaryResponse() {
    }

    public PrescriptionSummaryResponse(
            Long prescriptionId,
            String status,
            Integer medicinesFound,
            LocalDateTime uploadedAt) {

        this.prescriptionId = prescriptionId;
        this.status = status;
        this.medicinesFound = medicinesFound;
        this.uploadedAt = uploadedAt;
    }

    public Long getPrescriptionId() {
        return prescriptionId;
    }

    public void setPrescriptionId(Long prescriptionId) {
        this.prescriptionId = prescriptionId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getMedicinesFound() {
        return medicinesFound;
    }

    public void setMedicinesFound(Integer medicinesFound) {
        this.medicinesFound = medicinesFound;
    }

    public LocalDateTime getUploadedAt() {
        return uploadedAt;
    }

    public void setUploadedAt(LocalDateTime uploadedAt) {
        this.uploadedAt = uploadedAt;
    }
}