package com.smarthealthcare.backend.dto.prescription;

public class VerifyMedicineRequest {

    private Boolean verified;

    public VerifyMedicineRequest() {
    }

    public Boolean getVerified() {
        return verified;
    }

    public void setVerified(Boolean verified) {
        this.verified = verified;
    }
}