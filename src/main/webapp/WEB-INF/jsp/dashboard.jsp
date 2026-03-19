<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="MarketHub Dashboard" />
<!DOCTYPE html>
<html lang="tr">
<head>
    <%@ include file="/WEB-INF/jsp/fragments/tailwind-head.jspf" %>
</head>
<body data-authenticated-page="true" class="bg-background-light font-display text-slate-900">
<div class="relative flex min-h-screen w-full flex-col overflow-x-hidden">
    <%@ include file="/WEB-INF/jsp/fragments/app-topbar.jspf" %>

    <div class="flex flex-1 overflow-hidden">
        <aside class="hidden w-[320px] flex-col border-r border-slate-200 bg-white xl:flex">
            <div class="px-8 py-8">
                <h2 class="mb-5 text-xs font-semibold uppercase tracking-[0.16em] text-slate-400">Select Country</h2>
                <nav id="countryList" class="space-y-3" aria-label="Country selection"></nav>
            </div>
        </aside>

        <div class="flex flex-1 flex-col overflow-y-auto">
            <div class="w-full border-b border-slate-200 bg-white px-4 py-4 md:px-8">
                <div class="mx-auto flex max-w-[1600px] flex-wrap items-center gap-4">
                    <button type="button" class="inline-flex min-h-[54px] items-center gap-3 rounded-2xl bg-slate-100 px-5 py-3 text-[15px] font-medium text-slate-700">
                        <span class="material-symbols-outlined text-[20px] text-slate-500">flag</span>
                        <span id="countryFilterLabel">Country: TR</span>
                        <span class="material-symbols-outlined text-[20px] text-slate-500">expand_more</span>
                    </button>
                    <div class="flex-1"></div>
                    <button type="button" class="inline-flex min-h-[54px] items-center gap-3 rounded-2xl bg-slate-100 px-5 py-3 text-[15px] font-medium text-slate-700">
                        <span class="material-symbols-outlined text-[20px] text-slate-500">calendar_today</span>
                        <span id="dateRangeLabel">Jan 01, 2024 - Jan 31, 2024</span>
                        <span class="material-symbols-outlined text-[20px] text-slate-500">expand_more</span>
                    </button>
                </div>
            </div>

            <main class="mx-auto flex w-full max-w-[1600px] flex-1 flex-col gap-8 px-4 py-8 md:px-8 md:py-10">
                <section class="flex flex-col gap-4 lg:flex-row lg:items-start lg:justify-between">
                    <div class="flex flex-col gap-2">
                        <h1 id="dashboardTitle" class="text-[34px] font-extrabold tracking-tight text-slate-950">Country Performance Dashboard</h1>
                        <p id="dashboardSubtitle" class="text-[17px] text-slate-500">Overview of market performance and funnel metrics for Turkey (TR)</p>
                    </div>
                    <a href="funnel/new" class="inline-flex h-12 items-center justify-center rounded-2xl bg-primary px-5 text-[15px] font-semibold text-white transition-colors hover:bg-blue-600">
                        <span class="material-symbols-outlined mr-2 text-[18px]">add</span>
                        New Funnel
                    </a>
                </section>

                <section id="summaryCards" class="grid grid-cols-2 gap-4 md:grid-cols-3 2xl:grid-cols-6"></section>

                <section class="grid grid-cols-1 gap-8 2xl:grid-cols-[minmax(0,1.8fr)_minmax(320px,0.75fr)]">
                    <div class="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-panel">
                        <div class="flex items-center justify-between border-b border-slate-100 px-8 py-7">
                            <h2 id="funnelTableTitle" class="text-[20px] font-bold tracking-tight text-slate-950">Active Funnels in TR</h2>
                            <div class="flex items-center gap-4">
                                <a href="funnel/new" class="text-[15px] font-medium text-primary hover:underline">New Funnel</a>
                                <button type="button" class="text-[15px] font-medium text-primary hover:underline">View All</button>
                            </div>
                        </div>
                        <div class="overflow-x-auto">
                            <table class="min-w-full text-left">
                                <thead class="bg-slate-50 text-[12px] font-semibold uppercase tracking-[0.06em] text-slate-500">
                                <tr>
                                    <th class="px-8 py-5">Funnel Name</th>
                                    <th class="px-8 py-5">Campaigns</th>
                                    <th class="px-8 py-5">Spend</th>
                                    <th class="px-8 py-5">Sales</th>
                                    <th class="px-8 py-5">Status</th>
                                </tr>
                                </thead>
                                <tbody id="funnelTableBody" class="divide-y divide-slate-100 bg-white"></tbody>
                            </table>
                        </div>
                    </div>

                    <div class="rounded-3xl border border-slate-200 bg-white p-8 shadow-panel">
                        <h2 class="text-[20px] font-bold tracking-tight text-slate-950">Top Funnels Comparison</h2>

                        <div class="mt-8 space-y-8">
                            <section>
                                <div class="mb-4 flex items-center justify-between text-[12px] font-semibold uppercase tracking-[0.08em] text-slate-500">
                                    <span>Spend Comparison</span>
                                    <span id="spendMaxLabel">$0 Max</span>
                                </div>
                                <div id="spendComparisonList" class="space-y-5"></div>
                            </section>

                            <section class="border-t border-slate-100 pt-8">
                                <div class="mb-4 flex items-center justify-between text-[12px] font-semibold uppercase tracking-[0.08em] text-slate-500">
                                    <span>Sales Comparison</span>
                                    <span id="salesMaxLabel">0 Max</span>
                                </div>
                                <div id="salesComparisonList" class="space-y-5"></div>
                            </section>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/fragments/common-scripts.jspf" %>
<script src="assets/js/dashboard.js"></script>
</body>
</html>
