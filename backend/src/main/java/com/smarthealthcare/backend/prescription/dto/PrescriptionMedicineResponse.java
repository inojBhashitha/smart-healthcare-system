package com.smarthealthcare.backend.prescription.dto;

public class PrescriptionMedicineResponse {

    private String medicineName;
    private String strength;
    private String instruction;
    private Boolean verified;

    // Information from the master Medicine table
    private DatabaseMedicineResponse databaseMedicine;

    public PrescriptionMedicineResponse() {
    }

    public PrescriptionMedicineResponse(
            String medicineName,
            String strength,
            String instruction,
            Boolean verified,
            DatabaseMedicineResponse databaseMedicine) {

        this.medicineName = medicineName;
        this.strength = strength;
        this.instruction = instruction;
        this.verified = verified;
        this.databaseMedicine = databaseMedicine;
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

    public DatabaseMedicineResponse getDatabaseMedicine() {
        return databaseMedicine;
    }

    public void setDatabaseMedicine(DatabaseMedicineResponse databaseMedicine) {
        this.databaseMedicine = databaseMedicine;
    }
}