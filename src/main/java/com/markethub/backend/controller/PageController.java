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

    @GetMapping("/system-admin")
    public String systemAdmin() {
        return "system-admin";
    }
}
