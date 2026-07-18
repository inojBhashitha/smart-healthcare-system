package com.smarthealthcare.backend.ocr.parser;

import com.smarthealthcare.backend.ocr.dto.MedicineInfo;

import java.util.List;

public interface MedicineParser {

    List<MedicineInfo> parse(String text);

}