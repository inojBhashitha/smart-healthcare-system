package com.smarthealthcare.backend.prescription.controller;

import com.smarthealthcare.backend.dto.prescription.UploadPrescriptionResponse;
import com.smarthealthcare.backend.prescription.service.FileStorageService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/api/prescriptions")
public class PrescriptionUploadController {

    private final FileStorageService fileStorageService;

    public PrescriptionUploadController(FileStorageService fileStorageService) {
        this.fileStorageService = fileStorageService;
    }

    @PostMapping("/upload")
    public ResponseEntity<UploadPrescriptionResponse> uploadPrescription(
            @RequestParam("file") MultipartFile file) {

        try {

            String filename = fileStorageService.saveFile(file);

            UploadPrescriptionResponse response =
                    new UploadPrescriptionResponse(
                            filename,
                            "Prescription uploaded successfully"
                    );

            return ResponseEntity.ok(response);

        } catch (Exception e) {

            return ResponseEntity.internalServerError().body(
                    new UploadPrescriptionResponse(
                            null,
                            "Upload failed"
                    )
            );

        }
    }
}