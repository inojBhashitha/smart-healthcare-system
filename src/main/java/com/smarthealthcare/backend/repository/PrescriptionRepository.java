package com.smarthealthcare.backend.repository;

import com.smarthealthcare.backend.entity.Prescription;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.List;

public interface PrescriptionRepository
        extends JpaRepository<Prescription, Long> {

    @EntityGraph(attributePaths = {
        "medicines",
        "medicines.medicine"
})
    Optional<Prescription> findWithMedicinesByPrescriptionId(Long prescriptionId);

    List<Prescription> findTop5ByOrderByUploadedAtDesc();
}