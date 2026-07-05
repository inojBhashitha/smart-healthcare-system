package com.smarthealthcare.backend.dto.druginteraction;

public class DrugInteractionResult {

    private String drug1;
    private String drug2;
    private String description;

    public DrugInteractionResult() {
    }

    public DrugInteractionResult(
            String drug1,
            String drug2,
            String description) {

        this.drug1 = drug1;
        this.drug2 = drug2;
        this.description = description;
    }

    public String getDrug1() {
        return drug1;
    }

    public void setDrug1(String drug1) {
        this.drug1 = drug1;
    }

    public String getDrug2() {
        return drug2;
    }

    public void setDrug2(String drug2) {
        this.drug2 = drug2;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}