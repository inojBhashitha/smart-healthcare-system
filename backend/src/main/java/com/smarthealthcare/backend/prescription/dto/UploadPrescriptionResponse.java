package com.smarthealthcare.backend.prescription.dto;

public class UploadPrescriptionResponse {

    private Long prescriptionId;
    private String imageUrl;
    private String status;
    private String message;

    public UploadPrescriptionResponse() {
    }

    public UploadPrescriptionResponse(
            Long prescriptionId,
            String imageUrl,
            String status,
            String message) {

        this.prescriptionId = prescriptionId;
        this.imageUrl = imageUrl;
        this.status = status;
        this.message = message;
    }

    public Long getPrescriptionId() {
        return prescriptionId;
    }

    public void setPrescriptionId(Long prescriptionId) {
        this.prescriptionId = prescriptionId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}