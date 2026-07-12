package com.smarthealthcare.backend.service;

import com.smarthealthcare.backend.dto.dashboard.DashboardStatsResponse;
import com.smarthealthcare.backend.repository.DrugInteractionRepository;
import com.smarthealthcare.backend.repository.PrescriptionMedicineRepository;
import com.smarthealthcare.backend.repository.PrescriptionRepository;
import org.springframework.stereotype.Service;

import com.smarthealthcare.backend.dto.dashboard.RecentActivityResponse;
import com.smarthealthcare.backend.entity.Prescription;

import java.util.List;
import com.smarthealthcare.backend.dto.dashboard.DashboardSummaryResponse;
import com.smarthealthcare.backend.repository.PrescriptionInteractionRepository;

@Service
public class DashboardService {

    private final PrescriptionRepository prescriptionRepository;
    private final PrescriptionMedicineRepository prescriptionMedicineRepository;
    private final PrescriptionInteractionRepository prescriptionInteractionRepository;

    public DashboardService(
        PrescriptionRepository prescriptionRepository,
        PrescriptionMedicineRepository prescriptionMedicineRepository,
        PrescriptionInteractionRepository prescriptionInteractionRepository) {

    this.prescriptionRepository = prescriptionRepository;
    this.prescriptionMedicineRepository = prescriptionMedicineRepository;
    this.prescriptionInteractionRepository =
            prescriptionInteractionRepository;
}

    public DashboardStatsResponse getDashboardStats() {

        long totalPrescriptions =
                prescriptionRepository.count();

        long totalMedicines =
                prescriptionMedicineRepository.count();

        long verifiedMedicines =
                prescriptionMedicineRepository.countByVerifiedTrue();

        long detectedInteractions =
        prescriptionInteractionRepository.count();

        return new DashboardStatsResponse(
        totalPrescriptions,
        totalMedicines,
        verifiedMedicines,
        detectedInteractions
);
    }

    public List<RecentActivityResponse> getRecentActivity() {

    return prescriptionRepository
            .findTop5ByOrderByUploadedAtDesc()
            .stream()
            .map(this::mapToRecentActivity)
            .toList();
}

public DashboardSummaryResponse getDashboardSummary() {

    return new DashboardSummaryResponse(
            getDashboardStats(),
            getRecentActivity()
    );
}

private RecentActivityResponse mapToRecentActivity(
        Prescription prescription) {

    return new RecentActivityResponse(
            prescription.getPrescriptionId(),
            "Prescription Uploaded",
            prescription.getMedicinesFound(),
            prescription.getUploadedAt()
    );
}
}