package com.smarthealthcare.backend.ocr.dto;

public class MedicineInfo {

    private String name;
    private String strength;
    private String instruction;

    public MedicineInfo() {
    }

    public MedicineInfo(String name, String strength, String instruction) {
        this.name = name;
        this.strength = strength;
        this.instruction = instruction;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
}