package com.smarthealthcare.backend.controller;

import com.smarthealthcare.backend.dto.dashboard.DashboardStatsResponse;
import com.smarthealthcare.backend.dto.dashboard.DashboardSummaryResponse;
import com.smarthealthcare.backend.dto.dashboard.RecentActivityResponse;
import com.smarthealthcare.backend.service.DashboardService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/dashboard")
public class DashboardController {

    private final DashboardService dashboardService;

    public DashboardController(
            DashboardService dashboardService) {

        this.dashboardService = dashboardService;
    }

    @GetMapping("/stats")
    public DashboardStatsResponse getDashboardStats() {
        return dashboardService.getDashboardStats();
    }

    @GetMapping("/recent-activity")
    public List<RecentActivityResponse> getRecentActivity() {
        return dashboardService.getRecentActivity();
    }

    @GetMapping("/summary")
public DashboardSummaryResponse getDashboardSummary() {

    return dashboardService.getDashboardSummary();
}
}