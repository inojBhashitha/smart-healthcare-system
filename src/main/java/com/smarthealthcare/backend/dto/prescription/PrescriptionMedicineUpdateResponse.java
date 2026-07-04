package com.smarthealthcare.backend.dto.prescription;

public class PrescriptionMedicineUpdateResponse {

    private Long id;
    private String medicineName;
    private String strength;
    private String instruction;
    private Boolean verified;

    public PrescriptionMedicineUpdateResponse() {
    }

    public PrescriptionMedicineUpdateResponse(
            Long id,
            String medicineName,
            String strength,
            String instruction,
            Boolean verified) {

        this.id = id;
        this.medicineName = medicineName;
        this.strength = strength;
        this.instruction = instruction;
        this.verified = verified;
    }

    public Long getId() {
        return id;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public String getStrength() {
        return strength;
    }

    public String getInstruction() {
        return instruction;
    }

    public Boolean getVerified() {
        return verified;
    }
}