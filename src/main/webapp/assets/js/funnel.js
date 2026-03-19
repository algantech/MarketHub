$(function () {
    if (!$("#funnelStages").length) {
        return;
    }

    const funnelData = {
        countryCode: "TR",
        funnelName: "TR - MastiPro",
        sourceLabel: "Meta Ads Global",
        dateRangeLabel: "Jan 01, 2024 - Jan 31, 2024",
        roiTitle: "Overall Monthly ROI: 284%",
        roiSubtitle: "Total Spend: $142,500 | Total Revenue: $405,000",
        overview: [
            { name: "Awareness", value: "1.2M", unit: "Impressions", fillClass: "bg-primary", labelClass: "text-white", first: true },
            { name: "Interest", value: "850K", unit: "Clicks", fillClass: "bg-primary/85", labelClass: "text-white", dropOff: "-29%" },
            { name: "Intent", value: "125K", unit: "Leads", fillClass: "bg-primary/70", labelClass: "text-white", dropOff: "-85%" },
            { name: "Purchase", value: "42K", unit: "Purchases", fillClass: "bg-primary/55", labelClass: "text-white", dropOff: "-66%" },
            { name: "Loyalty", value: "12.5K", unit: "Repeaters", fillClass: "bg-primary/40", labelClass: "text-white", dropOff: "-70%" },
            { name: "Advocacy", value: "3.1K", unit: "Shares", fillClass: "bg-primary/25", labelClass: "text-slate-950", dropOff: "-75%" }
        ],
        stages: [
            {
                name: "Awareness",
                colorClass: "text-blue-600",
                dotClass: "bg-blue-500",
                headerBgClass: "bg-blue-50/30",
                badgeLabel: "Top of Funnel",
                badgeClass: "bg-blue-100 text-blue-700",
                borderClass: "border-slate-200",
                metrics: [
                    { label: "Reach", current: "840.2K" },
                    { label: "Views", current: "412K" },
                    { label: "CPM", current: "$4.12" }
                ],
                campaigns: [
                    { name: "TR_Prospecting_V1", value: "412K Impr." },
                    { name: "TR_Interest_Generic", value: "285K Impr." },
                    { name: "TR_Brand_Awareness", value: "120K Impr." }
                ],
                insight: {
                    colorClass: "text-blue-600",
                    boxClass: "bg-blue-50/50 border-blue-100/50",
                    icon: "lightbulb",
                    text: "CPM is 12% lower than TR average. Consider increasing budget for 'Prospecting_V1'."
                },
                linkLabel: "View All Awareness"
            },
            {
                name: "Interest",
                colorClass: "text-amber-600",
                dotClass: "bg-amber-500",
                headerBgClass: "bg-amber-50/30",
                badgeLabel: "Mid Funnel",
                badgeClass: "bg-amber-100 text-amber-700",
                borderClass: "border-slate-200",
                metrics: [
                    { label: "Reach", current: "840.2K", prev1: "792K", prev2: "750K" },
                    { label: "Views", current: "412K", prev1: "395K", prev2: "380K" },
                    { label: "CPM", current: "$4.12", prev1: "$4.30", prev2: "$4.45" }
                ],
                campaigns: [
                    { name: "TR_Retargeting_V1", value: "85K Clicks" },
                    { name: "TR_Comparison_Page", value: "62K Clicks" },
                    { name: "TR_Dynamic_Creative", value: "41K Clicks" }
                ],
                insight: {
                    colorClass: "text-amber-600",
                    boxClass: "bg-amber-50/50 border-amber-100/50",
                    icon: "warning",
                    text: "Landing page bounce rate is high (65%). Verify mobile optimization for TR landing pages."
                },
                linkLabel: "View All Interest"
            },
            {
                name: "Intent",
                colorClass: "text-orange-600",
                dotClass: "bg-orange-500",
                headerBgClass: "bg-orange-50/30",
                badgeLabel: "Warm Audience",
                badgeClass: "bg-orange-100 text-orange-700",
                borderClass: "border-slate-200",
                metrics: [
                    { label: "CTR", current: "2.45%", prev1: "2.30%", prev2: "2.15%" },
                    { label: "LP Views", current: "182K", prev1: "165K", prev2: "150K" },
                    { label: "CPC", current: "$0.45", prev1: "$0.48", prev2: "$0.52" }
                ],
                campaigns: [
                    { name: "TR_LeadGen_Newsletter", value: "4.2K Leads" },
                    { name: "TR_Product_Quiz", value: "3.1K Leads" }
                ],
                insight: null,
                linkLabel: "View All Intent"
            },
            {
                name: "Purchase",
                colorClass: "text-primary",
                dotClass: "bg-green-500",
                headerBgClass: "bg-primary/5",
                badgeLabel: "Bottom Funnel",
                badgeClass: "bg-green-100 text-green-700",
                borderClass: "border-primary/30",
                emphasis: true,
                metrics: [
                    { label: "Leads", current: "12K", prev1: "10.5K", prev2: "9.8K" },
                    { label: "Add to Carts", current: "45K", prev1: "42K", prev2: "38K" },
                    { label: "CPL", current: "$1.80", prev1: "$1.95", prev2: "$2.10" }
                ],
                campaigns: [
                    { name: "TR_Advantage+_Shopping", value: "18.2K Conv." },
                    { name: "TR_DABA_Purchasers", value: "12.1K Conv." },
                    { name: "TR_Manual_Sales_LAL", value: "6.5K Conv." }
                ],
                insight: {
                    colorClass: "text-primary",
                    boxClass: "bg-primary/5 border-primary/20",
                    icon: "verified",
                    text: "Conversion Rate is trending up (+5%). Advantage+ campaigns are delivering 20% better ROAS than manual."
                },
                linkLabel: "View All Conversions"
            },
            {
                name: "Loyalty",
                colorClass: "text-violet-600",
                dotClass: "bg-violet-500",
                headerBgClass: "bg-violet-50/30",
                badgeLabel: "Retention",
                badgeClass: "bg-violet-100 text-violet-700",
                borderClass: "border-slate-200",
                metrics: [
                    { label: "CVR", current: "4.2%", prev1: "3.8%", prev2: "3.5%", highlight: true },
                    { label: "CPA", current: "$12.40", prev1: "$13.50", prev2: "$14.20" },
                    { label: "ROAS", current: "3.2x", prev1: "3.0x", prev2: "2.8x" }
                ],
                campaigns: [
                    { name: "TR_Loyalty_Reward", value: "6.2K Rep." }
                ],
                insight: null,
                linkLabel: "View All Loyalty"
            },
            {
                name: "Advocacy",
                colorClass: "text-pink-600",
                dotClass: "bg-pink-500",
                headerBgClass: "bg-pink-50/30",
                badgeLabel: "Viral Growth",
                badgeClass: "bg-pink-100 text-pink-700",
                borderClass: "border-slate-200",
                metrics: [
                    { label: "Retention", current: "18.5%", prev1: "17.2%", prev2: "16.8%" },
                    { label: "Repeats", current: "12.5K", prev1: "11.2K", prev2: "10.5K" },
                    { label: "LTV", current: "$124.00", prev1: "$118.00", prev2: "$112.00" }
                ],
                campaigns: [
                    { name: "TR_Refer_a_Friend", value: "1.2K Shares" }
                ],
                insight: null,
                linkLabel: "View All Advocacy"
            }
        ]
    };

    const elements = {
        funnelCountryLabel: $("#funnelCountryLabel"),
        funnelDateRangeLabel: $("#funnelDateRangeLabel"),
        funnelPageTitle: $("#funnelPageTitle"),
        funnelSourceLabel: $("#funnelSourceLabel"),
        funnelOverview: $("#funnelOverview"),
        funnelStages: $("#funnelStages"),
        roiTitle: $("#roiTitle"),
        roiSubtitle: $("#roiSubtitle")
    };

    render();

    function render() {
        elements.funnelCountryLabel.text("Country: " + funnelData.countryCode);
        elements.funnelDateRangeLabel.text(funnelData.dateRangeLabel);
        elements.funnelPageTitle.text("Funnel Dashboard");
        elements.funnelSourceLabel.text(funnelData.sourceLabel);
        elements.roiTitle.text(funnelData.roiTitle);
        elements.roiSubtitle.text(funnelData.roiSubtitle);

        renderOverview();
        renderStages();
    }

    function renderOverview() {
        elements.funnelOverview.empty();

        funnelData.overview.forEach(function (step, index) {
            const card = $("<div class='col-span-1 flex flex-col items-center'></div>");
            const stepClass = step.first ? "funnel-step-first" : "funnel-step-clip";
            const block = $("<div class='relative flex h-16 w-full items-center justify-center text-center text-sm font-bold'></div>");
            block.addClass(step.fillClass + " " + stepClass + " " + step.labelClass);
            block.text(step.name);

            if (step.dropOff) {
                const marker = $(
                    "<span class='absolute right-[-18px] top-1/2 z-20 -translate-y-1/2 rounded-md border border-red-200 bg-[#ffd9d9] px-2 py-1 text-[11px] font-extrabold leading-none text-red-600 shadow-sm'>" +
                        step.dropOff +
                    "</span>"
                );
                block.append(marker);
            }

            card.append(block);

            card.append(
                "<div class='mt-4 text-center'>" +
                    "<p class='text-[30px] font-black tracking-tight text-slate-950'>" + step.value + "</p>" +
                    "<p class='text-[10px] font-bold uppercase tracking-[0.18em] text-slate-400'>" + step.unit + "</p>" +
                "</div>"
            );

            elements.funnelOverview.append(card);
        });
    }

    function renderStages() {
        elements.funnelStages.empty();

        funnelData.stages.forEach(function (stage) {
            const section = $("<section class='overflow-hidden rounded-3xl border bg-white shadow-panel'></section>");
            section.addClass(stage.borderClass);
            if (stage.emphasis) {
                section.addClass("border-2");
            }

            section.append(
                "<div class='flex items-center justify-between border-b border-slate-100 p-4 " + stage.headerBgClass + "'>" +
                    "<h3 class='flex items-center gap-2 text-[26px] font-bold tracking-tight " + stage.colorClass + "'>" +
                        "<span class='h-3 w-3 rounded-full " + stage.dotClass + "'></span>" +
                        stage.name +
                    "</h3>" +
                    "<span class='rounded-full px-3 py-1 text-xs font-bold " + stage.badgeClass + "'>" + stage.badgeLabel + "</span>" +
                "</div>"
            );

            const content = $("<div class='grid grid-cols-1 gap-8 p-6 md:grid-cols-3'></div>");
            content.append(renderMetricBlock(stage));
            content.append(renderCampaignBlock(stage));
            content.append(renderInsightBlock(stage));
            section.append(content);

            elements.funnelStages.append(section);
        });
    }

    function renderMetricBlock(stage) {
        const block = $("<div class='space-y-4'></div>");
        block.append("<p class='border-b pb-2 text-xs font-bold uppercase tracking-[0.12em] text-slate-400'>Key Metrics</p>");

        const grid = $("<div class='grid grid-cols-3 gap-3'></div>");
        stage.metrics.forEach(function (metric) {
            const currentClass = metric.highlight ? " text-primary" : "";
            let html =
                "<div>" +
                    "<p class='mb-1 text-[10px] font-bold uppercase tracking-[0.12em] text-slate-400'>" + metric.label + "</p>" +
                    "<div class='flex flex-col'>" +
                        "<span class='text-[18px] font-black" + currentClass + "'>" + metric.current + "</span>";

            if (metric.prev1) {
                html += "<span class='text-[11px] text-slate-500'>-1M: " + metric.prev1 + "</span>";
            }
            if (metric.prev2) {
                html += "<span class='text-[11px] text-slate-500'>-2M: " + metric.prev2 + "</span>";
            }

            html += "</div></div>";
            grid.append(html);
        });

        block.append(grid);
        return block;
    }

    function renderCampaignBlock(stage) {
        const block = $("<div class='space-y-4'></div>");
        block.append(
            "<p class='border-b pb-2 text-xs font-bold uppercase tracking-[0.12em] text-slate-400'>" +
                "Top Campaigns" +
                "<a class='float-right text-[10px] font-bold normal-case text-primary hover:underline' href='#'>View All</a>" +
            "</p>"
        );

        const list = $("<div class='space-y-2'></div>");
        stage.campaigns.forEach(function (campaign) {
            list.append(
                "<div class='flex justify-between gap-4 text-xs'>" +
                    "<span class='font-medium text-slate-700'>" + campaign.name + "</span>" +
                    "<span class='font-bold text-slate-950'>" + campaign.value + "</span>" +
                "</div>"
            );
        });
        block.append(list);
        return block;
    }

    function renderInsightBlock(stage) {
        const block = $("<div class='flex flex-col justify-between'></div>");

        if (stage.insight) {
            block.append(
                "<div class='flex gap-3 rounded-2xl border p-4 " + stage.insight.boxClass + "'>" +
                    "<span class='material-symbols-outlined " + stage.insight.colorClass + "'>" + stage.insight.icon + "</span>" +
                    "<p class='text-xs leading-6 text-slate-600'>" +
                        "<span class='font-bold " + stage.insight.colorClass + "'>AI Insight:</span> " +
                        stage.insight.text +
                    "</p>" +
                "</div>"
            );
        } else {
            block.append("<div></div>");
        }

        block.append(
            "<a class='mt-4 flex items-center justify-end gap-1 text-[11px] font-bold uppercase tracking-[0.14em] text-primary hover:underline' href='#'>" +
                stage.linkLabel +
                "<span class='material-symbols-outlined text-sm'>arrow_forward</span>" +
            "</a>"
        );

        return block;
    }
});
