package com.smarthealthcare.backend.medicine.repository;

import com.smarthealthcare.backend.medicine.entity.Medicine;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface MedicineRepository extends JpaRepository<Medicine, Integer> {

    Optional<Medicine> findByGenericNameIgnoreCase(String genericName);

    Optional<Medicine> findByBrandNameIgnoreCase(String brandName);

}