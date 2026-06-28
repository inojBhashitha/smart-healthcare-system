package com.smarthealthcare.backend.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name = "prescriptions")
@Getter
@Setter
public class Prescription {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "prescription_id")
    private Integer prescriptionId;

    @Column(name = "patient_id")
    private Integer patientId;

    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "doctor_name")
    private String doctorName;

    private String hospital;

    @Column(name = "scan_date")
    private LocalDateTime scanDate;

    private String status;

}