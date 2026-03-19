<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Campaign Ad Sets" />
<!DOCTYPE html>
<html lang="tr">
<head>
    <%@ include file="/WEB-INF/jsp/fragments/tailwind-head.jspf" %>
</head>
<body data-authenticated-page="true" class="bg-background-light font-display text-slate-900">
<div class="relative flex min-h-screen w-full flex-col overflow-x-hidden">
    <%@ include file="/WEB-INF/jsp/fragments/app-topbar.jspf" %>

    <div class="flex flex-1 overflow-hidden">
        <%@ include file="/WEB-INF/jsp/fragments/campaign-sidebar.jspf" %>

        <div class="flex flex-1 flex-col overflow-y-auto">
            <div class="w-full border-b border-slate-200 bg-white px-4 py-4 md:px-8">
                <div class="mx-auto flex max-w-[1600px] flex-wrap items-center gap-4">
                    <div class="flex items-center gap-2 text-sm text-slate-500">
                        <a href="${pageContext.request.contextPath}/campaign" class="hover:text-primary">Campaigns</a>
                        <span class="material-symbols-outlined text-[16px]">chevron_right</span>
                        <span class="font-medium text-slate-900">Awareness - MastiPro - Q1</span>
                    </div>
                    <div class="flex-1"></div>
                    <button type="button" class="inline-flex min-h-[54px] items-center gap-3 rounded-2xl bg-slate-100 px-5 py-3 text-[15px] font-medium text-slate-700">
                        <span class="material-symbols-outlined text-[20px] text-slate-500">calendar_today</span>
                        <span>Jan 01, 2024 - Jan 31, 2024</span>
                        <span class="material-symbols-outlined text-[20px] text-slate-500">expand_more</span>
                    </button>
                </div>
            </div>

            <main class="mx-auto flex w-full max-w-[1600px] flex-1 flex-col gap-6 px-4 py-8 md:px-8 md:py-10">
                <section class="flex flex-col gap-2">
                    <div class="flex items-center gap-2 text-sm text-slate-500">
                        <a href="${pageContext.request.contextPath}/campaign" class="hover:text-primary">Campaigns</a>
                        <span class="material-symbols-outlined text-[16px]">chevron_right</span>
                        <span class="font-medium text-slate-900">Awareness - MastiPro - Q1</span>
                    </div>
                    <h1 class="text-[40px] font-extrabold tracking-tight text-slate-950">Ad Sets Performance</h1>
                    <p class="text-[17px] text-slate-500">Showing all active and paused ad sets for the current period.</p>
                </section>

                <section class="flex flex-wrap items-center gap-3">
                    <button type="button" class="inline-flex min-h-[44px] items-center gap-2 rounded-2xl bg-slate-200 px-5 text-[15px] font-bold uppercase tracking-[0.08em] text-slate-700">
                        <span>Status: All</span>
                        <span class="material-symbols-outlined text-[18px]">close</span>
                    </button>
                    <button type="button" class="inline-flex min-h-[44px] items-center gap-2 rounded-2xl bg-primary/10 px-5 text-[15px] font-bold uppercase tracking-[0.08em] text-primary">
                        <span>Add Filter</span>
                        <span class="material-symbols-outlined text-[18px]">add</span>
                    </button>
                </section>

                <section class="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-panel">
                    <div class="overflow-x-auto">
                        <table class="min-w-[1180px] w-full text-left">
                            <thead class="border-b border-slate-200 bg-white text-[12px] font-bold uppercase tracking-[0.08em] text-slate-500">
                            <tr>
                                <th class="px-8 py-6">Ad Set Name</th>
                                <th class="px-8 py-6">Status</th>
                                <th class="px-8 py-6">Budget</th>
                                <th class="px-8 py-6">Results</th>
                                <th class="px-8 py-6">Reach</th>
                                <th class="px-8 py-6">Impressions</th>
                                <th class="px-8 py-6">Cost/Result</th>
                                <th class="px-8 py-6">Spend</th>
                            </tr>
                            </thead>
                            <tbody class="divide-y divide-slate-100 text-[18px] text-slate-950">
                            <tr>
                                <td class="px-8 py-7 font-medium text-primary">Prospective - US - 25-45</td>
                                <td class="px-8 py-7">
                                    <span class="inline-flex items-center gap-2 rounded-full bg-emerald-100 px-3 py-1 text-[13px] font-bold text-emerald-700">
                                        <span class="h-2 w-2 rounded-full bg-emerald-500"></span>ACTIVE
                                    </span>
                                </td>
                                <td class="px-8 py-7 text-slate-700">$150.00 / day</td>
                                <td class="px-8 py-7">12,402</td>
                                <td class="px-8 py-7">84,102</td>
                                <td class="px-8 py-7">102,492</td>
                                <td class="px-8 py-7">$0.12</td>
                                <td class="px-8 py-7 font-semibold">$1,488.24</td>
                            </tr>
                            <tr>
                                <td class="px-8 py-7 font-medium text-primary">Retargeting - LAL 1% - Cart</td>
                                <td class="px-8 py-7">
                                    <span class="inline-flex items-center gap-2 rounded-full bg-emerald-100 px-3 py-1 text-[13px] font-bold text-emerald-700">
                                        <span class="h-2 w-2 rounded-full bg-emerald-500"></span>ACTIVE
                                    </span>
                                </td>
                                <td class="px-8 py-7 text-slate-700">$200.00 / day</td>
                                <td class="px-8 py-7">5,192</td>
                                <td class="px-8 py-7">24,501</td>
                                <td class="px-8 py-7">48,922</td>
                                <td class="px-8 py-7">$0.45</td>
                                <td class="px-8 py-7 font-semibold">$2,336.40</td>
                            </tr>
                            <tr>
                                <td class="px-8 py-7 font-medium text-primary">Interest - High Intent - Tech</td>
                                <td class="px-8 py-7">
                                    <span class="inline-flex items-center gap-2 rounded-full bg-slate-100 px-3 py-1 text-[13px] font-bold text-slate-500">
                                        <span class="h-2 w-2 rounded-full bg-slate-300"></span>PAUSED
                                    </span>
                                </td>
                                <td class="px-8 py-7 text-slate-700">$50.00 / day</td>
                                <td class="px-8 py-7">842</td>
                                <td class="px-8 py-7">12,332</td>
                                <td class="px-8 py-7">15,004</td>
                                <td class="px-8 py-7">$0.85</td>
                                <td class="px-8 py-7 font-semibold">$715.70</td>
                            </tr>
                            <tr>
                                <td class="px-8 py-7 font-medium text-primary">Video Views - Custom Audience</td>
                                <td class="px-8 py-7">
                                    <span class="inline-flex items-center gap-2 rounded-full bg-emerald-100 px-3 py-1 text-[13px] font-bold text-emerald-700">
                                        <span class="h-2 w-2 rounded-full bg-emerald-500"></span>ACTIVE
                                    </span>
                                </td>
                                <td class="px-8 py-7 text-slate-700">$100.00 / day</td>
                                <td class="px-8 py-7">32,102</td>
                                <td class="px-8 py-7">156,229</td>
                                <td class="px-8 py-7">210,044</td>
                                <td class="px-8 py-7">$0.03</td>
                                <td class="px-8 py-7 font-semibold">$963.06</td>
                            </tr>
                            <tr>
                                <td class="px-8 py-7 font-medium text-primary">Broad - Lookalike 5%</td>
                                <td class="px-8 py-7">
                                    <span class="inline-flex items-center gap-2 rounded-full bg-slate-100 px-3 py-1 text-[13px] font-bold text-slate-500">
                                        <span class="h-2 w-2 rounded-full bg-slate-300"></span>PAUSED
                                    </span>
                                </td>
                                <td class="px-8 py-7 text-slate-700">$75.00 / day</td>
                                <td class="px-8 py-7">2,240</td>
                                <td class="px-8 py-7">42,100</td>
                                <td class="px-8 py-7">51,002</td>
                                <td class="px-8 py-7">$0.34</td>
                                <td class="px-8 py-7 font-semibold">$761.60</td>
                            </tr>
                            <tr>
                                <td class="px-8 py-7 font-medium text-primary">Interest - SMB Owners</td>
                                <td class="px-8 py-7">
                                    <span class="inline-flex items-center gap-2 rounded-full bg-emerald-100 px-3 py-1 text-[13px] font-bold text-emerald-700">
                                        <span class="h-2 w-2 rounded-full bg-emerald-500"></span>ACTIVE
                                    </span>
                                </td>
                                <td class="px-8 py-7 text-slate-700">$300.00 / day</td>
                                <td class="px-8 py-7">1,104</td>
                                <td class="px-8 py-7">8,223</td>
                                <td class="px-8 py-7">11,402</td>
                                <td class="px-8 py-7">$2.15</td>
                                <td class="px-8 py-7 font-semibold">$2,373.60</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
            </main>

            <%@ include file="/WEB-INF/jsp/fragments/app-footer.jspf" %>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/fragments/common-scripts.jspf" %>
</body>
</html>
