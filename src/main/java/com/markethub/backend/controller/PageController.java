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

    @GetMapping("/system-admin")
    public String systemAdmin() {
        return "system-admin";
    }
}
