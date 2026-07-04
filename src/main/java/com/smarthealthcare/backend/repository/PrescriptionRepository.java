package com.smarthealthcare.backend.repository;

import com.smarthealthcare.backend.entity.Prescription;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PrescriptionRepository
        extends JpaRepository<Prescription, Long> {

    @EntityGraph(attributePaths = "medicines")
    Optional<Prescription> findWithMedicinesByPrescriptionId(Long prescriptionId);
}