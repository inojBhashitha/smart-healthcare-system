package com.smarthealthcare.backend.prescription.controller;

import com.smarthealthcare.backend.prescription.dto.PrescriptionMedicineUpdateResponse;
import com.smarthealthcare.backend.prescription.dto.UpdateMedicineRequest;
import com.smarthealthcare.backend.prescription.dto.VerifyMedicineRequest;
import com.smarthealthcare.backend.prescription.service.PrescriptionMedicineManagementService;
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

    @PutMapping("/{id}")
    public ResponseEntity<PrescriptionMedicineUpdateResponse> updateMedicine(
            @PathVariable Long id,
            @RequestBody UpdateMedicineRequest request) {

        PrescriptionMedicineUpdateResponse response =
                medicineService.updateMedicine(
                        id,
                        request.getMedicineName(),
                        request.getStrength(),
                        request.getInstruction(),
                        request.getVerified()
                );

        return ResponseEntity.ok(response);
    }
}