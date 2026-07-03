package com.smarthealthcare.backend.ocr.service;

import net.sourceforge.tess4j.ITesseract;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;

@Service
public class TesseractOcrService implements OcrService {

    @Value("${tesseract.data.path}")
    private String tessDataPath;

    @Override
    public String extractText(String imagePath) {

        ITesseract tesseract = new Tesseract();

        tesseract.setDatapath(tessDataPath);
        tesseract.setLanguage("eng");

        try {
            return tesseract.doOCR(new File(imagePath));

        } catch (TesseractException e) {
            throw new RuntimeException("OCR failed", e);
        }
    }
}