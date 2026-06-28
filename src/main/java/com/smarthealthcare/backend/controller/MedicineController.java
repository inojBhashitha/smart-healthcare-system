package com.smarthealthcare.backend.controller;

import com.smarthealthcare.backend.entity.Medicine;
import com.smarthealthcare.backend.service.MedicineService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class MedicineController {

    private final MedicineService medicineService;

    public MedicineController(MedicineService medicineService) {
        this.medicineService = medicineService;
    }

    @GetMapping("/api/medicines")
    public List<Medicine> getMedicines() {
        return medicineService.getAllMedicines();
    }
}