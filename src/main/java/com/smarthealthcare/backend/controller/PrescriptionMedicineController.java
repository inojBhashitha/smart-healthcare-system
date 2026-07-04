package com.smarthealthcare.backend.controller;

import com.smarthealthcare.backend.dto.prescription.PrescriptionMedicineUpdateResponse;
import com.smarthealthcare.backend.dto.prescription.VerifyMedicineRequest;
import com.smarthealthcare.backend.service.PrescriptionMedicineManagementService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/prescription-medicines")
public class PrescriptionMedicineController {

    private final PrescriptionMedicineManagementService medicineService;

    public PrescriptionMedicineController(
            PrescriptionMedicineManagementService medicineService) {

        this.medicineService = medicineService;
    }

    @PutMapping("/{id}/verify")
    public ResponseEntity<PrescriptionMedicineUpdateResponse> verifyMedicine(
            @PathVariable Long id,
            @RequestBody VerifyMedicineRequest request) {

        PrescriptionMedicineUpdateResponse response =
                medicineService.verifyMedicine(
                        id,
                        request.getVerified()
                );

        return ResponseEntity.ok(response);
    }
}