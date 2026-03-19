<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="MarketHub Funnel Dashboard" />
<!DOCTYPE html>
<html lang="tr">
<head>
    <%@ include file="/WEB-INF/jsp/fragments/tailwind-head.jspf" %>
</head>
<body data-authenticated-page="true" class="bg-background-light font-display text-slate-900">
<div class="relative flex min-h-screen w-full flex-col overflow-x-hidden">
    <%@ include file="/WEB-INF/jsp/fragments/app-topbar.jspf" %>

    <div class="flex flex-1 flex-col overflow-y-auto">
        <div class="w-full border-b border-slate-200 bg-white px-4 py-4 md:px-8">
            <div class="mx-auto flex max-w-[1600px] flex-wrap items-center gap-4">
                <button type="button" class="inline-flex min-h-[54px] items-center gap-3 rounded-2xl bg-slate-100 px-5 py-3 text-[15px] font-medium text-slate-700">
                    <span class="material-symbols-outlined text-[20px] text-slate-500">flag</span>
                    <span id="funnelCountryLabel">Country: TR</span>
                    <span class="material-symbols-outlined text-[20px] text-slate-500">expand_more</span>
                </button>
                <div class="flex-1"></div>
                <button type="button" class="inline-flex min-h-[54px] items-center gap-3 rounded-2xl bg-slate-100 px-5 py-3 text-[15px] font-medium text-slate-700">
                    <span class="material-symbols-outlined text-[20px] text-slate-500">calendar_today</span>
                    <span id="funnelDateRangeLabel">Jan 01, 2024 - Jan 31, 2024</span>
                    <span class="material-symbols-outlined text-[20px] text-slate-500">expand_more</span>
                </button>
            </div>
        </div>

        <main class="mx-auto flex w-full max-w-[1600px] flex-1 flex-col gap-6 px-4 py-8 md:px-8 md:py-10">
            <section class="flex flex-col gap-2">
                <h1 id="funnelPageTitle" class="text-[34px] font-extrabold tracking-tight text-slate-950">Funnel Dashboard</h1>
                <p class="text-[17px] text-slate-500">
                    MarketHub Performance Overview
                    <span class="mx-1 text-slate-300">•</span>
                    <span id="funnelSourceLabel" class="font-medium text-primary">Meta Ads Global</span>
                </p>
            </section>

            <section class="rounded-3xl border border-slate-200 bg-white p-6 shadow-panel overflow-hidden">
                <div class="mb-8 flex items-center justify-between gap-4">
                    <h2 class="flex items-center gap-2 text-[22px] font-bold tracking-tight text-slate-950">
                        <span class="material-symbols-outlined text-primary">analytics</span>
                        Conversion Funnel Performance
                    </h2>
                    <div class="flex items-center gap-4 text-xs font-medium text-slate-500">
                        <span class="flex items-center gap-1"><span class="h-3 w-3 rounded-full bg-primary"></span>Volume</span>
                        <span class="flex items-center gap-1"><span class="h-3 w-3 rounded-full bg-primary/20"></span>Drop-off</span>
                    </div>
                </div>

                <div id="funnelOverview" class="grid grid-cols-6 gap-0 relative min-w-[980px]"></div>
            </section>

            <div id="funnelStages" class="flex flex-col gap-6"></div>

            <section class="rounded-3xl bg-slate-900 px-6 py-7 text-white shadow-panel">
                <div class="flex flex-col gap-5 lg:flex-row lg:items-center lg:justify-between">
                    <div class="flex items-start gap-4">
                        <div class="flex h-14 w-14 items-center justify-center rounded-2xl bg-primary/20 text-primary">
                            <span class="material-symbols-outlined text-[28px]">bolt</span>
                        </div>
                        <div>
                            <h3 id="roiTitle" class="text-[28px] font-extrabold tracking-tight">Overall Monthly ROI: 284%</h3>
                            <p id="roiSubtitle" class="mt-1 text-[16px] text-slate-300">Total Spend: $142,500 | Total Revenue: $405,000</p>
                        </div>
                    </div>
                    <div class="flex flex-wrap gap-3">
                        <button type="button" class="inline-flex h-12 items-center justify-center rounded-2xl border border-slate-600 px-5 text-sm font-semibold text-white transition-colors hover:bg-slate-800">
                            Create Alert
                        </button>
                        <button type="button" class="inline-flex h-12 items-center justify-center rounded-2xl bg-primary px-5 text-sm font-semibold text-white transition-colors hover:bg-blue-600">
                            Launch New Campaign
                        </button>
                    </div>
                </div>
            </section>
        </main>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/fragments/common-scripts.jspf" %>
<script src="assets/js/funnel.js"></script>
</body>
</html>
