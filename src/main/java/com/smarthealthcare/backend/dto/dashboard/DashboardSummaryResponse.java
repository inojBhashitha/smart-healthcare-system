package com.smarthealthcare.backend.dto.dashboard;

import java.util.List;

public class DashboardSummaryResponse {

    private DashboardStatsResponse stats;
    private List<RecentActivityResponse> recentActivity;

    public DashboardSummaryResponse() {
    }

    public DashboardSummaryResponse(
            DashboardStatsResponse stats,
            List<RecentActivityResponse> recentActivity) {

        this.stats = stats;
        this.recentActivity = recentActivity;
    }

    public DashboardStatsResponse getStats() {
        return stats;
    }

    public void setStats(DashboardStatsResponse stats) {
        this.stats = stats;
    }

    public List<RecentActivityResponse> getRecentActivity() {
        return recentActivity;
    }

    public void setRecentActivity(
            List<RecentActivityResponse> recentActivity) {
        this.recentActivity = recentActivity;
    }
}