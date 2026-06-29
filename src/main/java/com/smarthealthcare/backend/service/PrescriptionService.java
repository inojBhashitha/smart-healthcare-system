package com.smarthealthcare.backend.service;

import com.smarthealthcare.backend.entity.Prescription;
import com.smarthealthcare.backend.repository.PrescriptionRepository;
import org.springframework.stereotype.Service;
import com.smarthealthcare.backend.dto.PrescriptionRequest;
import java.time.LocalDateTime;

import java.util.List;

@Service
public class PrescriptionService {

    private final PrescriptionRepository prescriptionRepository;

    public PrescriptionService(PrescriptionRepository prescriptionRepository) {
        this.prescriptionRepository = prescriptionRepository;
    }

    public List<Prescription> getAllPrescriptions() {
        return prescriptionRepository.findAll();
    }

    public Prescription createPrescription(PrescriptionRequest request) {

    Prescription prescription = new Prescription();

    prescription.setPatientId(request.getPatientId());
    prescription.setImageUrl(request.getImageUrl());
    prescription.setDoctorName(request.getDoctorName());
    prescription.setHospital(request.getHospital());
    prescription.setStatus(request.getStatus());

    prescription.setScanDate(LocalDateTime.now());

    return prescriptionRepository.save(prescription);
}

}