package com.smarthealthcare.backend.prescription.controller;

import com.smarthealthcare.backend.dto.druginteraction.DrugInteractionResult;
import com.smarthealthcare.backend.dto.prescription.UploadPrescriptionResponse;
import com.smarthealthcare.backend.entity.Prescription;
import com.smarthealthcare.backend.ocr.dto.MedicineInfo;
import com.smarthealthcare.backend.ocr.parser.MedicineParser;
import com.smarthealthcare.backend.ocr.service.OcrService;
import com.smarthealthcare.backend.prescription.service.FileStorageService;
import com.smarthealthcare.backend.service.DrugInteractionService;
import com.smarthealthcare.backend.service.PrescriptionInteractionService;
import com.smarthealthcare.backend.service.PrescriptionMedicineService;
import com.smarthealthcare.backend.service.PrescriptionService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Path;
import java.util.List;

@RestController
@RequestMapping("/api/prescriptions")
public class PrescriptionUploadController {

    private final FileStorageService fileStorageService;
    private final PrescriptionService prescriptionService;
    private final PrescriptionMedicineService prescriptionMedicineService;
    private final PrescriptionInteractionService prescriptionInteractionService;
    private final DrugInteractionService drugInteractionService;
    private final OcrService ocrService;
    private final MedicineParser medicineParser;

    public PrescriptionUploadController(
            FileStorageService fileStorageService,
            PrescriptionService prescriptionService,
            PrescriptionMedicineService prescriptionMedicineService,
            PrescriptionInteractionService prescriptionInteractionService,
            DrugInteractionService drugInteractionService,
            OcrService ocrService,
            MedicineParser medicineParser) {

        this.fileStorageService = fileStorageService;
        this.prescriptionService = prescriptionService;
        this.prescriptionMedicineService = prescriptionMedicineService;
        this.prescriptionInteractionService = prescriptionInteractionService;
        this.drugInteractionService = drugInteractionService;
        this.ocrService = ocrService;
        this.medicineParser = medicineParser;
    }

    @PostMapping("/upload")
    public ResponseEntity<UploadPrescriptionResponse> uploadPrescription(
            @RequestParam("file") MultipartFile file) {

        try {

            // Save uploaded image
            Path savedFile = fileStorageService.saveFile(file);

            String filename = savedFile.getFileName().toString();

            // OCR
            String text = ocrService.extractText(
                    savedFile.toFile()
            );

            // Extract medicines
            List<MedicineInfo> medicines =
                    medicineParser.parse(text);

            // Extract medicine names
            List<String> medicineNames =
                    medicines.stream()
                            .map(MedicineInfo::getName)
                            .toList();

            // Detect interactions
            List<DrugInteractionResult> interactions =
                    drugInteractionService.checkInteractions(
                            medicineNames
                    );

            // Save prescription
            Prescription prescription =
                    prescriptionService.savePrescription(
                            filename,
                            text,
                            medicines.size()
                    );

            // Save medicines
            prescriptionMedicineService.saveMedicines(
                    prescription,
                    medicines
            );

            // Save detected interactions
            prescriptionInteractionService.saveInteractions(
                    prescription,
                    interactions
            );

            // Debug
            System.out.println("========== OCR TEXT ==========");
            System.out.println(text);

            System.out.println("====== MEDICINES FOUND ======");

            for (MedicineInfo medicine : medicines) {
                System.out.println(
                        medicine.getName()
                                + " "
                                + medicine.getStrength()
                                + " -> "
                                + medicine.getInstruction()
                );
            }

            System.out.println("====== INTERACTIONS FOUND ======");

            for (DrugInteractionResult interaction : interactions) {
                System.out.println(
                        interaction.getDrug1()
                                + " <-> "
                                + interaction.getDrug2()
                );
            }

            UploadPrescriptionResponse response =
                    new UploadPrescriptionResponse(
                            prescription.getPrescriptionId(),
                            filename,
                            prescription.getStatus(),
                            "Prescription uploaded successfully"
                    );

            return ResponseEntity.ok(response);

        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity.internalServerError().body(
                    new UploadPrescriptionResponse(
                            null,
                            null,
                            "FAILED",
                            "Upload failed: " + e.getMessage()
                    )
            );
        }
    }
}