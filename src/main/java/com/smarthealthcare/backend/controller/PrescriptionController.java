package com.smarthealthcare.backend.controller;

import com.smarthealthcare.backend.entity.Prescription;
import com.smarthealthcare.backend.service.PrescriptionService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.smarthealthcare.backend.dto.PrescriptionRequest;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

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

    @PostMapping("/api/prescriptions")
    public Prescription createPrescription(
        @RequestBody PrescriptionRequest request) {

        return prescriptionService.createPrescription(request);

}

}