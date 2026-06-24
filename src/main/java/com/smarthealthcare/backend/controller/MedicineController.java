package com.smarthealthcare.backend.controller;

import com.smarthealthcare.backend.entity.Medicine;
import com.smarthealthcare.backend.repository.MedicineRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class MedicineController {

    private final MedicineRepository medicineRepository;

    public MedicineController(MedicineRepository medicineRepository) {
        this.medicineRepository = medicineRepository;
    }

    @GetMapping("/api/medicines")
    public List<Medicine> getMedicines() {
        return medicineRepository.findAll();
    }
}