package com.smarthealthcare.backend.prescription.dto;

public class DatabaseMedicineResponse {

    private Integer medicineId;
    private String genericName;
    private String brandName;
    private String category;
    private String description;
    private String sideEffects;

    public DatabaseMedicineResponse() {
    }

    public DatabaseMedicineResponse(
            Integer medicineId,
            String genericName,
            String brandName,
            String category,
            String description,
            String sideEffects) {

        this.medicineId = medicineId;
        this.genericName = genericName;
        this.brandName = brandName;
        this.category = category;
        this.description = description;
        this.sideEffects = sideEffects;
    }

    public Integer getMedicineId() {
        return medicineId;
    }

    public String getGenericName() {
        return genericName;
    }

    public String getBrandName() {
        return brandName;
    }

    public String getCategory() {
        return category;
    }

    public String getDescription() {
        return description;
    }

    public String getSideEffects() {
        return sideEffects;
    }
}