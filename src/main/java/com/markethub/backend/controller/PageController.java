package com.markethub.backend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

    @GetMapping("/")
    public String root() {
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("activePage", "dashboard");
        return "dashboard";
    }

    @GetMapping("/funnel")
    public String funnel(Model model) {
        model.addAttribute("activePage", "dashboard");
        return "funnel";
    }

    @GetMapping("/funnel/new")
    public String newFunnel(Model model) {
        model.addAttribute("activePage", "funnels");
        return "funnel-create";
    }

    @GetMapping("/campaign")
    public String campaign(Model model) {
        model.addAttribute("activePage", "campaign");
        model.addAttribute("campaignSection", "overview");
        return "campaign";
    }

    @GetMapping("/campaign/ad-sets")
    public String campaignAdSets(Model model) {
        model.addAttribute("activePage", "campaign");
        model.addAttribute("campaignSection", "adSets");
        return "campaign-ad-sets";
    }

    @GetMapping("/campaign/ads")
    public String campaignAds(Model model) {
        model.addAttribute("activePage", "campaign");
        model.addAttribute("campaignSection", "ads");
        return "campaign-ads";
    }

    @GetMapping("/campaign/analytics")
    public String campaignAnalytics(Model model) {
        model.addAttribute("activePage", "campaign");
        model.addAttribute("campaignSection", "analytics");
        return "campaign-analytics";
    }

    @GetMapping("/audience")
    public String audience(Model model) {
        model.addAttribute("activePage", "audience");
        return "audience";
    }

    @GetMapping("/comparison")
    public String comparison() {
        return "redirect:/comparison/countries";
    }

    @GetMapping("/comparison/countries")
    public String comparisonCountries(Model model) {
        model.addAttribute("activePage", "comparison");
        model.addAttribute("comparisonSection", "countries");
        return "comparison-countries";
    }

    @GetMapping("/comparison/funnels")
    public String comparisonFunnels(Model model) {
        model.addAttribute("activePage", "comparison");
        model.addAttribute("comparisonSection", "funnels");
        return "comparison-funnels";
    }

    @GetMapping("/comparison/companies")
    public String comparisonCompanies(Model model) {
        model.addAttribute("activePage", "comparison");
        model.addAttribute("comparisonSection", "companies");
        model.addAttribute("comparisonLabel", "Companies");
        return "comparison-placeholder";
    }

    @GetMapping("/comparison/ad-sets")
    public String comparisonAdSets(Model model) {
        model.addAttribute("activePage", "comparison");
        model.addAttribute("comparisonSection", "adSets");
        model.addAttribute("comparisonLabel", "Ad Sets");
        return "comparison-placeholder";
    }

    @GetMapping("/comparison/ads")
    public String comparisonAds(Model model) {
        model.addAttribute("activePage", "comparison");
        model.addAttribute("comparisonSection", "ads");
        model.addAttribute("comparisonLabel", "Ads");
        return "comparison-placeholder";
    }

    @GetMapping("/system-admin")
    public String systemAdmin() {
        return "system-admin";
    }
}
