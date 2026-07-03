package com.smarthealthcare.backend.repository;

import com.smarthealthcare.backend.entity.PrescriptionMedicine;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PrescriptionMedicineRepository
        extends JpaRepository<PrescriptionMedicine, Long> {
}