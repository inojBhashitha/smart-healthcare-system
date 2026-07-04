package com.smarthealthcare.backend.dto.medicine;

public class MedicineValidationResponse {

    private boolean found;
    private Integer medicineId;
    private String matchedAs;
    private String genericName;
    private String brandName;

    public MedicineValidationResponse() {
    }

    public MedicineValidationResponse(
            boolean found,
            Integer medicineId,
            String matchedAs,
            String genericName,
            String brandName) {

        this.found = found;
        this.medicineId = medicineId;
        this.matchedAs = matchedAs;
        this.genericName = genericName;
        this.brandName = brandName;
    }

    public boolean isFound() {
        return found;
    }

    public Integer getMedicineId() {
        return medicineId;
    }

    public String getMatchedAs() {
        return matchedAs;
    }

    public String getGenericName() {
        return genericName;
    }

    public String getBrandName() {
        return brandName;
    }
}