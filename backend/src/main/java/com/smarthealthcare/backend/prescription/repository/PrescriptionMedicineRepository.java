package com.smarthealthcare.backend.prescription.repository;

import com.smarthealthcare.backend.prescription.entity.PrescriptionMedicine;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PrescriptionMedicineRepository
        extends JpaRepository<PrescriptionMedicine, Long> {
}