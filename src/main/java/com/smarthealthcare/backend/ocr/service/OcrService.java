package com.smarthealthcare.backend.ocr.service;
import java.io.File;

public interface OcrService {

    String extractText(File imageFile);

}