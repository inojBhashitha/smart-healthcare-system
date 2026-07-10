package com.smarthealthcare.backend.prescription.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

@Service
public class FileStorageService {

    private static final String UPLOAD_DIR = "uploads";

    public Path saveFile(MultipartFile file) throws IOException {

        // Create uploads directory if it doesn't exist
        Path uploadPath = Paths.get(UPLOAD_DIR).toAbsolutePath();

        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        // Generate unique filename
        String filename =
                UUID.randomUUID() + "_" + file.getOriginalFilename();

        // Full file path
        Path filePath = uploadPath.resolve(filename);

        // Save file (replace if somehow exists)
        Files.copy(
                file.getInputStream(),
                filePath,
                StandardCopyOption.REPLACE_EXISTING
        );

        // Debug information
        System.out.println("========== FILE SAVED ==========");
        System.out.println("Filename      : " + filename);
        System.out.println("Absolute Path : " + filePath.toAbsolutePath());
        System.out.println("Exists        : " + Files.exists(filePath));
        System.out.println("Size (bytes)  : " + Files.size(filePath));
        System.out.println("===============================");

        return filePath;
    }
}