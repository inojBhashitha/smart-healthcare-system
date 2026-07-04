package com.smarthealthcare.backend.dto.prescription;

public class PrescriptionMedicineResponse {

    private String medicineName;
    private String strength;
    private String instruction;
    private Boolean verified;

    public PrescriptionMedicineResponse() {
    }

    public PrescriptionMedicineResponse(
            String medicineName,
            String strength,
            String instruction,
            Boolean verified) {

        this.medicineName = medicineName;
        this.strength = strength;
        this.instruction = instruction;
        this.verified = verified;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public String getStrength() {
        return strength;
    }

    public void setStrength(String strength) {
        this.strength = strength;
    }

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public Boolean getVerified() {
        return verified;
    }

    public void setVerified(Boolean verified) {
        this.verified = verified;
    }
}