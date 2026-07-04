package com.smarthealthcare.backend.service;

import com.smarthealthcare.backend.dto.medicine.MedicineValidationResponse;
import com.smarthealthcare.backend.entity.Medicine;
import com.smarthealthcare.backend.repository.MedicineRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class MedicineValidationService {

    private final MedicineRepository repository;

    public MedicineValidationService(
            MedicineRepository repository) {

        this.repository = repository;
    }

    public MedicineValidationResponse validate(String medicineName) {

        Optional<Medicine> generic =
                repository.findByGenericNameIgnoreCase(medicineName);

        if (generic.isPresent()) {

            Medicine medicine = generic.get();

            return new MedicineValidationResponse(
                    true,
                    medicine.getMedicineId(),
                    "GENERIC",
                    medicine.getGenericName(),
                    medicine.getBrandName()
            );
        }

   

        Optional<Medicine> brand =
                repository.findByBrandNameIgnoreCase(medicineName);

        if (brand.isPresent()) {

            Medicine medicine = brand.get();

            return new MedicineValidationResponse(
                    true,
                    medicine.getMedicineId(),
                    "BRAND",
                    medicine.getGenericName(),
                    medicine.getBrandName()
            );
        }

        return new MedicineValidationResponse(
                false,
                null,
                "NONE",
                null,
                null
        );
    }
     public Medicine findMatchingMedicine(String medicineName) {

    return repository.findByGenericNameIgnoreCase(medicineName)
            .or(() -> repository.findByBrandNameIgnoreCase(medicineName))
            .orElse(null);
    }
}