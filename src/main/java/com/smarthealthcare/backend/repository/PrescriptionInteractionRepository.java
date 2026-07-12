package com.smarthealthcare.backend.repository;

import com.smarthealthcare.backend.entity.PrescriptionInteraction;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PrescriptionInteractionRepository
        extends JpaRepository<PrescriptionInteraction, Long> {

    List<PrescriptionInteraction> findByPrescriptionPrescriptionId(
            Long prescriptionId
    );

}