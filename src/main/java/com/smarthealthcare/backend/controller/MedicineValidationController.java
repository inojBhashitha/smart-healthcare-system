package com.smarthealthcare.backend.controller;

import com.smarthealthcare.backend.dto.medicine.MedicineValidationResponse;
import com.smarthealthcare.backend.service.MedicineValidationService;
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