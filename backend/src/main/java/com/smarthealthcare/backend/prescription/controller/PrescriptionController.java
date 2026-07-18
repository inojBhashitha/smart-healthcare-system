package com.smarthealthcare.backend.prescription.controller;

import com.smarthealthcare.backend.prescription.dto.PrescriptionDetailsResponse;
import com.smarthealthcare.backend.prescription.dto.PrescriptionRequest;
import com.smarthealthcare.backend.prescription.dto.PrescriptionSummaryResponse;
import com.smarthealthcare.backend.prescription.entity.Prescription;
import com.smarthealthcare.backend.prescription.service.PrescriptionService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/prescriptions")
public class PrescriptionController {

    private final PrescriptionService prescriptionService;

    public PrescriptionController(
            PrescriptionService prescriptionService) {

        this.prescriptionService = prescriptionService;
    }

    @GetMapping
    public List<PrescriptionSummaryResponse> getPrescriptions() {
        return prescriptionService.getAllPrescriptions();
    }

    @GetMapping("/{id}")
    public PrescriptionDetailsResponse getPrescription(
            @PathVariable Long id) {

        return prescriptionService.getPrescription(id);
    }

    @PostMapping
    public Prescription createPrescription(
            @RequestBody PrescriptionRequest request) {

        throw new UnsupportedOperationException(
                "Use /api/prescriptions/upload instead.");
    }
}