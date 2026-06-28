package com.smarthealthcare.backend.repository;

import com.smarthealthcare.backend.entity.Prescription;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PrescriptionRepository
        extends JpaRepository<Prescription, Integer> {

}