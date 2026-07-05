package com.smarthealthcare.backend.repository;

import com.smarthealthcare.backend.entity.DrugInteraction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DrugInteractionRepository
        extends JpaRepository<DrugInteraction, Long> {

    @Query("""
        SELECT d
        FROM DrugInteraction d
        WHERE
            (LOWER(d.drug1) = LOWER(?1) AND LOWER(d.drug2) = LOWER(?2))
        OR
            (LOWER(d.drug1) = LOWER(?2) AND LOWER(d.drug2) = LOWER(?1))
    """)
    List<DrugInteraction> findInteraction(
            String drug1,
            String drug2
    );
}