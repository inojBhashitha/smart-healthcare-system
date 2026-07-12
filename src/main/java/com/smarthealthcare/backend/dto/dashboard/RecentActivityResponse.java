package com.smarthealthcare.backend.dto.dashboard;

import java.time.LocalDateTime;

public class RecentActivityResponse {

    private Long prescriptionId;
    private String activity;
    private Integer medicinesFound;
    private LocalDateTime uploadedAt;

    public RecentActivityResponse() {
    }

    public RecentActivityResponse(
            Long prescriptionId,
            String activity,
            Integer medicinesFound,
            LocalDateTime uploadedAt) {

        this.prescriptionId = prescriptionId;
        this.activity = activity;
        this.medicinesFound = medicinesFound;
        this.uploadedAt = uploadedAt;
    }

    public Long getPrescriptionId() {
        return prescriptionId;
    }

    public void setPrescriptionId(Long prescriptionId) {
        this.prescriptionId = prescriptionId;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
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