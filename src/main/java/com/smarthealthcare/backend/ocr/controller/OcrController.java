package com.smarthealthcare.backend.ocr.controller;

import com.smarthealthcare.backend.ocr.dto.OcrResponse;
import com.smarthealthcare.backend.ocr.service.OcrService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@RestController
@RequestMapping("/api/ocr")
public class OcrController {

    private final OcrService ocrService;

    public OcrController(OcrService ocrService) {
        this.ocrService = ocrService;
    }

    @PostMapping("/test")
    public ResponseEntity<OcrResponse> testOcr(
            @RequestParam("file") MultipartFile file) {

        try {

            File tempFile = File.createTempFile("ocr_", ".png");

            file.transferTo(tempFile);

            String text = ocrService.extractText(
                    tempFile.getAbsolutePath());

            tempFile.delete();

            return ResponseEntity.ok(
                    new OcrResponse(text)
            );

        } catch (Exception e) {

            return ResponseEntity.internalServerError().body(
                    new OcrResponse("OCR Failed: " + e.getMessage())
            );
        }
    }
}