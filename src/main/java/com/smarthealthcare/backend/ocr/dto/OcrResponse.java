package com.smarthealthcare.backend.ocr.dto;

import java.util.List;

public class OcrResponse {

    private String text;
    private List<MedicineInfo> medicines;

    public OcrResponse() {
    }

    public OcrResponse(String text, List<MedicineInfo> medicines) {
        this.text = text;
        this.medicines = medicines;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<MedicineInfo> getMedicines() {
        return medicines;
    }

    public void setMedicines(List<MedicineInfo> medicines) {
        this.medicines = medicines;
    }
}