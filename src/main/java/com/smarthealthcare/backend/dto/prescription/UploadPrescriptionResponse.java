package com.smarthealthcare.backend.dto.prescription;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class UploadPrescriptionResponse {

    private String imageUrl;
    private String message;

}