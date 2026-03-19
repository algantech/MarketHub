$(function () {
    const dashboardData = {
        dateRangeLabel: "Jan 01, 2024 - Jan 31, 2024",
        countries: [
            {
                code: "TR",
                name: "Turkey",
                summaryName: "Turkey (TR)",
                metrics: [
                    { label: "Total Spend", value: "$12,450", trend: "+12%", trendUp: true },
                    { label: "Engagement", value: "85.2K", trend: "+5%", trendUp: true },
                    { label: "Total Leads", value: "1,240", trend: "-2%", trendUp: false },
                    { label: "Purchases", value: "450", trend: "+8%", trendUp: true },
                    { label: "Repeat Rate", value: "15.4%", trend: "+15%", trendUp: true },
                    { label: "ROAS", value: "4.2x", trend: "+4%", trendUp: true }
                ],
                funnels: [
                    { name: "TR - MastiPro", campaigns: 12, spend: 4230, sales: 184, status: "Active" },
                    { name: "TR - Actimoo", campaigns: 8, spend: 3100, sales: 92, status: "Active" },
                    { name: "TR - GlowSet", campaigns: 5, spend: 1850, sales: 45, status: "Scaling" },
                    { name: "TR - ZenMode", campaigns: 3, spend: 940, sales: 22, status: "Testing" }
                ]
            },
            {
                code: "US",
                name: "United States",
                summaryName: "United States (US)",
                metrics: [
                    { label: "Total Spend", value: "$18,920", trend: "+9%", trendUp: true },
                    { label: "Engagement", value: "120.6K", trend: "+6%", trendUp: true },
                    { label: "Total Leads", value: "1,960", trend: "+4%", trendUp: true },
                    { label: "Purchases", value: "530", trend: "+3%", trendUp: true },
                    { label: "Repeat Rate", value: "18.1%", trend: "+2%", trendUp: true },
                    { label: "ROAS", value: "4.8x", trend: "+5%", trendUp: true }
                ],
                funnels: [
                    { name: "US - MastiPro", campaigns: 10, spend: 6250, sales: 205, status: "Active" },
                    { name: "US - DentalCare", campaigns: 6, spend: 5140, sales: 164, status: "Scaling" },
                    { name: "US - GlowSet", campaigns: 5, spend: 3890, sales: 118, status: "Active" }
                ]
            },
            {
                code: "UK",
                name: "United Kingdom",
                summaryName: "United Kingdom (UK)",
                metrics: [
                    { label: "Total Spend", value: "$9,880", trend: "+7%", trendUp: true },
                    { label: "Engagement", value: "58.7K", trend: "+4%", trendUp: true },
                    { label: "Total Leads", value: "810", trend: "-1%", trendUp: false },
                    { label: "Purchases", value: "288", trend: "+6%", trendUp: true },
                    { label: "Repeat Rate", value: "14.6%", trend: "+3%", trendUp: true },
                    { label: "ROAS", value: "3.9x", trend: "+2%", trendUp: true }
                ],
                funnels: [
                    { name: "UK - MastiPro", campaigns: 7, spend: 3410, sales: 126, status: "Active" },
                    { name: "UK - Actimoo", campaigns: 5, spend: 2590, sales: 83, status: "Active" },
                    { name: "UK - GlowSet", campaigns: 4, spend: 1940, sales: 61, status: "Testing" }
                ]
            },
            {
                code: "FR",
                name: "France",
                summaryName: "France (FR)",
                metrics: [
                    { label: "Total Spend", value: "$8,760", trend: "+5%", trendUp: true },
                    { label: "Engagement", value: "52.1K", trend: "+3%", trendUp: true },
                    { label: "Total Leads", value: "702", trend: "-3%", trendUp: false },
                    { label: "Purchases", value: "231", trend: "+4%", trendUp: true },
                    { label: "Repeat Rate", value: "12.2%", trend: "+1%", trendUp: true },
                    { label: "ROAS", value: "3.6x", trend: "+2%", trendUp: true }
                ],
                funnels: [
                    { name: "FR - MastiPro", campaigns: 6, spend: 3180, sales: 104, status: "Active" },
                    { name: "FR - GlowSet", campaigns: 4, spend: 2270, sales: 75, status: "Scaling" },
                    { name: "FR - ZenMode", campaigns: 3, spend: 1460, sales: 39, status: "Testing" }
                ]
            },
            {
                code: "DE",
                name: "Germany",
                summaryName: "Germany (DE)",
                metrics: [
                    { label: "Total Spend", value: "$10,330", trend: "+8%", trendUp: true },
                    { label: "Engagement", value: "63.5K", trend: "+5%", trendUp: true },
                    { label: "Total Leads", value: "860", trend: "+1%", trendUp: true },
                    { label: "Purchases", value: "260", trend: "+4%", trendUp: true },
                    { label: "Repeat Rate", value: "13.1%", trend: "+3%", trendUp: true },
                    { label: "ROAS", value: "4.0x", trend: "+2%", trendUp: true }
                ],
                funnels: [
                    { name: "DE - Actimoo", campaigns: 7, spend: 3620, sales: 118, status: "Active" },
                    { name: "DE - MastiPro", campaigns: 6, spend: 2940, sales: 89, status: "Scaling" },
                    { name: "DE - GlowSet", campaigns: 4, spend: 1760, sales: 53, status: "Testing" }
                ]
            },
            {
                code: "ES",
                name: "Spain",
                summaryName: "Spain (ES)",
                metrics: [
                    { label: "Total Spend", value: "$7,940", trend: "+6%", trendUp: true },
                    { label: "Engagement", value: "46.2K", trend: "+4%", trendUp: true },
                    { label: "Total Leads", value: "680", trend: "-2%", trendUp: false },
                    { label: "Purchases", value: "210", trend: "+5%", trendUp: true },
                    { label: "Repeat Rate", value: "11.8%", trend: "+2%", trendUp: true },
                    { label: "ROAS", value: "3.5x", trend: "+1%", trendUp: true }
                ],
                funnels: [
                    { name: "ES - MastiPro", campaigns: 5, spend: 2760, sales: 92, status: "Active" },
                    { name: "ES - ZenMode", campaigns: 4, spend: 1980, sales: 64, status: "Scaling" },
                    { name: "ES - GlowSet", campaigns: 3, spend: 1320, sales: 36, status: "Testing" }
                ]
            },
            {
                code: "IT",
                name: "Italy",
                summaryName: "Italy (IT)",
                metrics: [
                    { label: "Total Spend", value: "$8,210", trend: "+5%", trendUp: true },
                    { label: "Engagement", value: "49.8K", trend: "+4%", trendUp: true },
                    { label: "Total Leads", value: "710", trend: "+1%", trendUp: true },
                    { label: "Purchases", value: "218", trend: "+3%", trendUp: true },
                    { label: "Repeat Rate", value: "12.7%", trend: "+2%", trendUp: true },
                    { label: "ROAS", value: "3.7x", trend: "+2%", trendUp: true }
                ],
                funnels: [
                    { name: "IT - MastiPro", campaigns: 6, spend: 2910, sales: 95, status: "Active" },
                    { name: "IT - Actimoo", campaigns: 4, spend: 2030, sales: 61, status: "Scaling" },
                    { name: "IT - GlowSet", campaigns: 3, spend: 1510, sales: 42, status: "Testing" }
                ]
            }
        ]
    };

    const state = {
        selectedCountryCode: "TR",
        currentUser: null
    };

    const elements = {
        countryList: $("#countryList"),
        countryFilterLabel: $("#countryFilterLabel"),
        dateRangeLabel: $("#dateRangeLabel"),
        dashboardTitle: $("#dashboardTitle"),
        dashboardSubtitle: $("#dashboardSubtitle"),
        summaryCards: $("#summaryCards"),
        funnelTableTitle: $("#funnelTableTitle"),
        funnelTableBody: $("#funnelTableBody"),
        spendMaxLabel: $("#spendMaxLabel"),
        salesMaxLabel: $("#salesMaxLabel"),
        spendComparisonList: $("#spendComparisonList"),
        salesComparisonList: $("#salesComparisonList"),
        profileMenuButton: $("#profileMenuButton"),
        profileMenu: $("#profileMenu"),
        profileInitials: $("#profileInitials"),
        profileName: $("#profileName"),
        profileEmail: $("#profileEmail")
    };

    elements.dateRangeLabel.text(dashboardData.dateRangeLabel);
    bindEvents();
    render();

    document.addEventListener("markethub:user-loaded", function (event) {
        state.currentUser = event.detail;
        renderProfile(event.detail);
    });

    function bindEvents() {
        elements.countryList.on("click", "[data-country-code]", function () {
            state.selectedCountryCode = $(this).data("countryCode");
            render();
        });

        elements.profileMenuButton.on("click", function () {
            const isHidden = elements.profileMenu.hasClass("hidden");
            elements.profileMenu.toggleClass("hidden", !isHidden);
            elements.profileMenuButton.attr("aria-expanded", String(isHidden));
        });

        $(document).on("click", function (event) {
            if (!$(event.target).closest("#profileMenuButton, #profileMenu").length) {
                elements.profileMenu.addClass("hidden");
                elements.profileMenuButton.attr("aria-expanded", "false");
            }
        });
    }

    function render() {
        const selectedCountry = getSelectedCountry();
        renderCountryList(selectedCountry.code);
        renderHeader(selectedCountry);
        renderSummary(selectedCountry.metrics);
        renderFunnels(selectedCountry);
        renderComparison(selectedCountry.funnels);
    }

    function getSelectedCountry() {
        const match = dashboardData.countries.find(function (country) {
            return country.code === state.selectedCountryCode;
        });
        return match || dashboardData.countries[0];
    }

    function renderCountryList(selectedCode) {
        elements.countryList.empty();

        dashboardData.countries.forEach(function (country) {
            const isActive = country.code === selectedCode;
            const item = $(
                "<button type='button' class='flex w-full items-center gap-4 rounded-2xl px-5 py-4 text-left transition-colors'></button>"
            );

            item.attr("data-country-code", country.code);
            item.toggleClass("bg-primary/10 text-primary font-bold", isActive);
            item.toggleClass("text-slate-700 hover:bg-slate-100", !isActive);
            item.append("<span class='material-symbols-outlined text-[22px]'>flag</span>");
            item.append(
                $("<span class='text-[17px] leading-snug'></span>").text(country.summaryName)
            );

            elements.countryList.append(item);
        });
    }

    function renderHeader(country) {
        elements.countryFilterLabel.text("Country: " + country.code);
        elements.dashboardSubtitle.text(
            "Overview of market performance and funnel metrics for " + country.summaryName
        );
        elements.funnelTableTitle.text("Active Funnels in " + country.code);
    }

    function renderSummary(metrics) {
        elements.summaryCards.empty();

        metrics.forEach(function (metric) {
            const trendClass = metric.trendUp ? "text-emerald-600" : "text-rose-600";
            const trendIcon = metric.trendUp ? "trending_up" : "trending_down";

            elements.summaryCards.append(
                "<article class='rounded-3xl border border-slate-200 bg-white p-7 shadow-panel'>" +
                    "<p class='mb-3 text-[13px] font-semibold uppercase tracking-[0.08em] text-slate-500'>" + escapeHtml(metric.label) + "</p>" +
                    "<p class='mb-2 text-[24px] font-bold tracking-tight text-slate-950'>" + escapeHtml(metric.value) + "</p>" +
                    "<div class='inline-flex items-center gap-1 text-[15px] font-medium " + trendClass + "'>" +
                        "<span class='material-symbols-outlined text-[18px]'>" + trendIcon + "</span>" +
                        "<span>" + escapeHtml(metric.trend) + "</span>" +
                    "</div>" +
                "</article>"
            );
        });
    }

    function renderFunnels(country) {
        elements.funnelTableBody.empty();

        country.funnels.forEach(function (funnel) {
            elements.funnelTableBody.append(
                "<tr class='transition-colors hover:bg-slate-50'>" +
                    "<td class='px-8 py-6 text-[18px] font-medium text-slate-950'>" + escapeHtml(funnel.name) + "</td>" +
                    "<td class='px-8 py-6 text-[16px] text-slate-600'>" + funnel.campaigns + " Active</td>" +
                    "<td class='px-8 py-6 text-[16px] text-slate-600'>" + formatCurrency(funnel.spend) + "</td>" +
                    "<td class='px-8 py-6 text-[16px] text-slate-600'>" + funnel.sales + "</td>" +
                    "<td class='px-8 py-6'>" + statusBadge(funnel.status) + "</td>" +
                "</tr>"
            );
        });
    }

    function renderComparison(funnels) {
        const spendTop = funnels.slice().sort(function (left, right) {
            return right.spend - left.spend;
        }).slice(0, 3);
        const salesTop = funnels.slice().sort(function (left, right) {
            return right.sales - left.sales;
        }).slice(0, 3);
        const spendMax = spendTop.length ? spendTop[0].spend : 0;
        const salesMax = salesTop.length ? salesTop[0].sales : 0;

        elements.spendMaxLabel.text(formatCompactCurrency(spendMax) + " Max");
        elements.salesMaxLabel.text(salesMax + " Max");
        elements.spendComparisonList.empty();
        elements.salesComparisonList.empty();

        spendTop.forEach(function (funnel) {
            elements.spendComparisonList.append(progressRow(funnel.name, formatCurrency(funnel.spend), funnel.spend, spendMax, "bg-primary", ""));
        });

        salesTop.forEach(function (funnel) {
            elements.salesComparisonList.append(progressRow(funnel.name, String(funnel.sales), funnel.sales, salesMax, "bg-emerald-500", "text-emerald-600"));
        });
    }

    function renderProfile(user) {
        const initials = user.fullName
            .split(/\s+/)
            .filter(Boolean)
            .slice(0, 2)
            .map(function (part) {
                return part.charAt(0);
            })
            .join("")
            .toUpperCase() || "MH";

        elements.profileInitials.text(initials);
        elements.profileName.text(user.fullName);
        elements.profileEmail.text(user.email || user.username);
    }

    function statusBadge(status) {
        if (status === "Active") {
            return "<span class='inline-flex rounded-full bg-emerald-100 px-3 py-1 text-[13px] font-bold text-emerald-700'>Active</span>";
        }
        if (status === "Scaling") {
            return "<span class='inline-flex rounded-full bg-amber-100 px-3 py-1 text-[13px] font-bold text-amber-700'>Scaling</span>";
        }
        return "<span class='inline-flex rounded-full bg-slate-100 px-3 py-1 text-[13px] font-bold text-slate-600'>Testing</span>";
    }

    function progressRow(name, valueLabel, value, maxValue, barClass, valueClass) {
        const width = maxValue > 0 ? Math.max(8, Math.round((value / maxValue) * 100)) : 0;
        const valueLabelClass = valueClass ? " " + valueClass : "";

        return (
            "<div>" +
                "<div class='mb-2 flex items-center justify-between gap-4 text-[15px]'>" +
                    "<span class='text-slate-700'>" + escapeHtml(stripCountryPrefix(name)) + "</span>" +
                    "<span class='font-bold" + valueLabelClass + "'>" + escapeHtml(valueLabel) + "</span>" +
                "</div>" +
                "<div class='h-3 w-full overflow-hidden rounded-full bg-slate-100'>" +
                    "<div class='h-full rounded-full " + barClass + "' style='width:" + width + "%'></div>" +
                "</div>" +
            "</div>"
        );
    }

    function stripCountryPrefix(name) {
        const parts = name.split(" - ");
        return parts.length > 1 ? parts.slice(1).join(" - ") : name;
    }

    function formatCurrency(amount) {
        return amount.toLocaleString("en-US", {
            style: "currency",
            currency: "USD",
            maximumFractionDigits: 0
        });
    }

    function formatCompactCurrency(amount) {
        if (amount >= 1000) {
            return "$" + (amount / 1000).toFixed(1) + "K";
        }
        return formatCurrency(amount);
    }

    function escapeHtml(value) {
        return String(value)
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/\"/g, "&quot;")
            .replace(/'/g, "&#39;");
    }
});
