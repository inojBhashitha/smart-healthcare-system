package com.smarthealthcare.backend.controller;

import com.smarthealthcare.backend.entity.Prescription;
import com.smarthealthcare.backend.service.PrescriptionService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class PrescriptionController {

    private final PrescriptionService prescriptionService;

    public PrescriptionController(PrescriptionService prescriptionService) {
        this.prescriptionService = prescriptionService;
    }

    @GetMapping("/api/prescriptions")
    public List<Prescription> getPrescriptions() {
        return prescriptionService.getAllPrescriptions();
    }

}