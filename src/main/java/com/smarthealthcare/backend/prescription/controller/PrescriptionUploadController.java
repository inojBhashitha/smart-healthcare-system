package com.smarthealthcare.backend.prescription.controller;

import com.smarthealthcare.backend.dto.prescription.UploadPrescriptionResponse;
import com.smarthealthcare.backend.entity.Prescription;
import com.smarthealthcare.backend.prescription.service.FileStorageService;
import com.smarthealthcare.backend.service.PrescriptionService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/api/prescriptions")
public class PrescriptionUploadController {

    private final FileStorageService fileStorageService;
    private final PrescriptionService prescriptionService;

    public PrescriptionUploadController(
            FileStorageService fileStorageService,
            PrescriptionService prescriptionService) {

        this.fileStorageService = fileStorageService;
        this.prescriptionService = prescriptionService;
    }

    @PostMapping("/upload")
    public ResponseEntity<UploadPrescriptionResponse> uploadPrescription(
            @RequestParam("file") MultipartFile file) {

        try {

            String filename = fileStorageService.saveFile(file);

            Prescription prescription =
                    prescriptionService.savePrescription(filename);

            UploadPrescriptionResponse response =
                    new UploadPrescriptionResponse(
                            prescription.getPrescriptionId(),
                            filename,
                            prescription.getStatus(),
                            "Prescription uploaded successfully"
                    );

            return ResponseEntity.ok(response);

        } catch (Exception e) {

            return ResponseEntity.internalServerError().body(
                    new UploadPrescriptionResponse(
                            null,
                            null,
                            "FAILED",
                            "Upload failed"
                    )
            );

        }
    }
}