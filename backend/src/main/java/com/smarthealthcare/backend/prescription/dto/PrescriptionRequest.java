package com.smarthealthcare.backend.prescription.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrescriptionRequest {

    private Integer patientId;

    private String imageUrl;

    private String doctorName;

    private String hospital;

    private String status;

}