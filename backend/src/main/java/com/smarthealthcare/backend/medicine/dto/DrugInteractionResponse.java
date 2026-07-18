package com.smarthealthcare.backend.medicine.dto;

public class DrugInteractionResponse {

    private String medicineA;
    private String medicineB;
    private String severity;
    private String description;

    public DrugInteractionResponse() {
    }

    public DrugInteractionResponse(
            String medicineA,
            String medicineB,
            String severity,
            String description) {

        this.medicineA = medicineA;
        this.medicineB = medicineB;
        this.severity = severity;
        this.description = description;
    }

    public String getMedicineA() {
        return medicineA;
    }

    public String getMedicineB() {
        return medicineB;
    }

    public String getSeverity() {
        return severity;
    }

    public String getDescription() {
        return description;
    }
}