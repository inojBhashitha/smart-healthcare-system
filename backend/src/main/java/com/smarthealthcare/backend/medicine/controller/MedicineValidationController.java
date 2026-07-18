package com.smarthealthcare.backend.medicine.controller;

import com.smarthealthcare.backend.medicine.dto.MedicineValidationResponse;
import com.smarthealthcare.backend.medicine.service.MedicineValidationService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/medicine-validation")
public class MedicineValidationController {

    private final MedicineValidationService validationService;

    public MedicineValidationController(
            MedicineValidationService validationService) {

        this.validationService = validationService;
    }

    @GetMapping("/{medicineName}")
    public MedicineValidationResponse validateMedicine(
            @PathVariable String medicineName) {

        return validationService.validate(medicineName);
    }
}