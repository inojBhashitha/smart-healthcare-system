package com.smarthealthcare.backend.service;

import com.smarthealthcare.backend.entity.Prescription;
import com.smarthealthcare.backend.entity.PrescriptionMedicine;
import com.smarthealthcare.backend.ocr.dto.MedicineInfo;
import com.smarthealthcare.backend.repository.PrescriptionMedicineRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PrescriptionMedicineService {

    private final PrescriptionMedicineRepository repository;

    public PrescriptionMedicineService(
            PrescriptionMedicineRepository repository) {

        this.repository = repository;
    }

    public void saveMedicines(
            Prescription prescription,
            List<MedicineInfo> medicines) {

        for (MedicineInfo medicineInfo : medicines) {

            PrescriptionMedicine medicine =
                    new PrescriptionMedicine();

            medicine.setPrescription(prescription);
            medicine.setMedicineName(medicineInfo.getName());
            medicine.setStrength(medicineInfo.getStrength());
            medicine.setInstruction(medicineInfo.getInstruction());
            medicine.setVerified(false);

            repository.save(medicine);
        }
    }
}