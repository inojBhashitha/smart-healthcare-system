package com.smarthealthcare.backend.controller;

import com.smarthealthcare.backend.dto.prescription.PrescriptionDetailsResponse;
import com.smarthealthcare.backend.dto.prescription.PrescriptionRequest;
import com.smarthealthcare.backend.dto.prescription.PrescriptionSummaryResponse;
import com.smarthealthcare.backend.entity.Prescription;
import com.smarthealthcare.backend.service.PrescriptionService;
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

    @GetMapping("/status/{status}")
public List<PrescriptionSummaryResponse> getByStatus(
        @PathVariable String status) {

    return prescriptionService.getPrescriptionsByStatus(status);
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