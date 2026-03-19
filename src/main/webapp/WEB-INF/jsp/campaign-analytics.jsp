<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Campaign Analytics" />
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
                    <div class="flex-1"></div>
                    <button type="button" class="inline-flex min-h-[54px] items-center gap-3 rounded-2xl bg-slate-100 px-5 py-3 text-[15px] font-medium text-slate-700">
                        <span class="material-symbols-outlined text-[20px] text-slate-500">calendar_today</span>
                        <span>Jan 01, 2024 - Jan 31, 2024</span>
                        <span class="material-symbols-outlined text-[20px] text-slate-500">expand_more</span>
                    </button>
                </div>
            </div>

            <main class="mx-auto flex w-full max-w-[1600px] flex-1 flex-col gap-8 px-4 py-8 md:px-8 md:py-10">
                <section class="flex items-center gap-4">
                    <h1 class="text-[40px] font-extrabold tracking-tight text-slate-950">Campaign Analytics</h1>
                    <span class="inline-flex items-center rounded-xl bg-emerald-100 px-3 py-1 text-[14px] font-bold uppercase tracking-[0.08em] text-emerald-700">Live</span>
                </section>

                <section class="grid grid-cols-1 gap-5 lg:grid-cols-2 2xl:grid-cols-4">
                    <article class="rounded-3xl border border-slate-200 bg-white p-7 shadow-panel">
                        <div class="mb-8 flex items-start justify-between">
                            <span class="material-symbols-outlined rounded-2xl bg-primary/10 p-4 text-[28px] text-primary">payments</span>
                            <span class="text-[14px] font-bold text-emerald-600">↗12.5%</span>
                        </div>
                        <p class="text-[16px] font-medium text-slate-500">Total Ad Spend</p>
                        <p class="mt-3 text-[42px] font-bold tracking-tight text-slate-950">$12,450.00</p>
                        <div class="mt-8 h-1.5 overflow-hidden rounded-full bg-slate-100">
                            <div class="h-full w-[74%] rounded-full bg-primary"></div>
                        </div>
                    </article>
                    <article class="rounded-3xl border border-slate-200 bg-white p-7 shadow-panel">
                        <div class="mb-8 flex items-start justify-between">
                            <span class="material-symbols-outlined rounded-2xl bg-violet-100 p-4 text-[28px] text-violet-600">visibility</span>
                            <span class="text-[14px] font-bold text-rose-500">↘2.4%</span>
                        </div>
                        <p class="text-[16px] font-medium text-slate-500">Impressions</p>
                        <p class="mt-3 text-[42px] font-bold tracking-tight text-slate-950">842.5K</p>
                        <div class="mt-8 h-1.5 overflow-hidden rounded-full bg-slate-100">
                            <div class="h-full w-[62%] rounded-full bg-violet-500"></div>
                        </div>
                    </article>
                    <article class="rounded-3xl border border-slate-200 bg-white p-7 shadow-panel">
                        <div class="mb-8 flex items-start justify-between">
                            <span class="material-symbols-outlined rounded-2xl bg-emerald-100 p-4 text-[28px] text-emerald-600">ads_click</span>
                            <span class="text-[14px] font-bold text-emerald-600">↗8.1%</span>
                        </div>
                        <p class="text-[16px] font-medium text-slate-500">Total Conversions</p>
                        <p class="mt-3 text-[42px] font-bold tracking-tight text-slate-950">3,120</p>
                        <div class="mt-8 h-1.5 overflow-hidden rounded-full bg-slate-100">
                            <div class="h-full w-[48%] rounded-full bg-emerald-500"></div>
                        </div>
                    </article>
                    <article class="rounded-3xl border border-slate-200 bg-white p-7 shadow-panel">
                        <div class="mb-8 flex items-start justify-between">
                            <span class="material-symbols-outlined rounded-2xl bg-orange-100 p-4 text-[28px] text-orange-600">point_of_sale</span>
                            <span class="text-[14px] font-bold text-emerald-600">↗14.2%</span>
                        </div>
                        <p class="text-[16px] font-medium text-slate-500">Return on Spend</p>
                        <p class="mt-3 text-[42px] font-bold tracking-tight text-slate-950">4.2x</p>
                        <div class="mt-8 h-1.5 overflow-hidden rounded-full bg-slate-100">
                            <div class="h-full w-[82%] rounded-full bg-orange-500"></div>
                        </div>
                    </article>
                </section>

                <section class="grid grid-cols-1 gap-6 2xl:grid-cols-[minmax(0,1.9fr)_minmax(320px,0.85fr)]">
                    <article class="overflow-hidden rounded-3xl border border-slate-200 bg-white p-8 shadow-panel">
                        <div class="mb-8 flex flex-wrap items-start justify-between gap-4">
                            <div>
                                <h2 class="text-[22px] font-bold tracking-tight text-slate-950">Performance Trends</h2>
                                <p class="mt-2 text-[16px] text-slate-500">Daily ad spend vs total conversions</p>
                            </div>
                            <div class="flex items-center gap-8 text-[15px]">
                                <span class="flex items-center gap-3"><span class="h-4 w-4 rounded-full border-[3px] border-primary"></span>Spend</span>
                                <span class="flex items-center gap-3 text-slate-500"><span class="h-4 w-4 rounded-full bg-slate-200"></span>Conversions</span>
                            </div>
                        </div>

                        <div class="rounded-[28px] bg-[linear-gradient(180deg,#ffffff_0%,#f8fbff_100%)] p-4">
                            <svg viewBox="0 0 860 430" class="h-[430px] w-full" role="img" aria-label="Performance trends">
                                <defs>
                                    <linearGradient id="spendFill" x1="0" x2="0" y1="0" y2="1">
                                        <stop offset="0%" stop-color="#1f76f0" stop-opacity="0.24"/>
                                        <stop offset="100%" stop-color="#1f76f0" stop-opacity="0.02"/>
                                    </linearGradient>
                                </defs>
                                <path d="M20 360 C80 330,110 345,160 340 C220 338,240 330,300 270 C350 220,390 235,450 210 C510 185,520 150,575 120 C625 95,680 110,730 75 C770 46,805 50,840 25 L840 390 L20 390 Z"
                                      fill="url(#spendFill)"/>
                                <path d="M20 360 C80 330,110 345,160 340 C220 338,240 330,300 270 C350 220,390 235,450 210 C510 185,520 150,575 120 C625 95,680 110,730 75 C770 46,805 50,840 25"
                                      fill="none" stroke="#1f76f0" stroke-width="5" stroke-linecap="round"/>
                                <path d="M20 405 C95 398,145 404,220 398 C290 396,345 387,410 352 C470 322,520 314,585 304 C645 297,690 294,740 280 C785 268,815 254,840 242"
                                      fill="none" stroke="#9aa7ba" stroke-width="4" stroke-linecap="round" stroke-dasharray="6 6"/>
                                <g fill="#94a3b8" font-size="16" font-weight="600">
                                    <text x="34" y="420">OCT 01</text>
                                    <text x="218" y="420">OCT 08</text>
                                    <text x="404" y="420">OCT 15</text>
                                    <text x="590" y="420">OCT 22</text>
                                    <text x="772" y="420">OCT 29</text>
                                </g>
                            </svg>
                        </div>
                    </article>

                    <article class="rounded-3xl border border-slate-200 bg-white p-8 shadow-panel">
                        <h2 class="text-[22px] font-bold tracking-tight text-slate-950">Platform Breakdown</h2>
                        <p class="mt-4 text-[16px] leading-8 text-slate-500">Performance across major channels</p>

                        <div class="mt-10 space-y-8">
                            <div>
                                <div class="mb-3 flex items-center justify-between gap-4">
                                    <span class="text-[18px] font-medium text-slate-950">Google Ads</span>
                                    <span class="text-[18px] text-slate-950">45%</span>
                                </div>
                                <div class="h-3 overflow-hidden rounded-full bg-slate-100">
                                    <div class="h-full w-[45%] rounded-full bg-primary"></div>
                                </div>
                            </div>
                            <div>
                                <div class="mb-3 flex items-center justify-between gap-4">
                                    <span class="text-[18px] font-medium text-slate-950">Meta Ads</span>
                                    <span class="text-[18px] text-slate-950">32%</span>
                                </div>
                                <div class="h-3 overflow-hidden rounded-full bg-slate-100">
                                    <div class="h-full w-[32%] rounded-full bg-blue-400"></div>
                                </div>
                            </div>
                            <div>
                                <div class="mb-3 flex items-center justify-between gap-4">
                                    <span class="text-[18px] font-medium text-slate-950">TikTok Business</span>
                                    <span class="text-[18px] text-slate-950">15%</span>
                                </div>
                                <div class="h-3 overflow-hidden rounded-full bg-slate-100">
                                    <div class="h-full w-[15%] rounded-full bg-slate-900"></div>
                                </div>
                            </div>
                            <div>
                                <div class="mb-3 flex items-center justify-between gap-4">
                                    <span class="text-[18px] font-medium text-slate-950">LinkedIn Campaign</span>
                                    <span class="text-[18px] text-slate-950">8%</span>
                                </div>
                                <div class="h-3 overflow-hidden rounded-full bg-slate-100">
                                    <div class="h-full w-[8%] rounded-full bg-indigo-600"></div>
                                </div>
                            </div>
                        </div>

                        <div class="mt-10 border-t border-slate-100 pt-10">
                            <a href="#" class="text-[16px] font-bold text-primary transition-colors hover:text-blue-700">View Full Platform Report</a>
                        </div>
                    </article>
                </section>

                <section class="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-panel">
                    <div class="flex items-center justify-between gap-4 px-8 py-7">
                        <h2 class="text-[22px] font-bold tracking-tight text-slate-950">Top Performing Campaigns</h2>
                        <button type="button" class="text-slate-400 transition-colors hover:text-slate-700">
                            <span class="material-symbols-outlined">more_horiz</span>
                        </button>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="min-w-full text-left">
                            <thead class="border-t border-slate-200 bg-slate-50 text-[12px] font-bold uppercase tracking-[0.08em] text-slate-500">
                            <tr>
                                <th class="px-8 py-4">Campaign</th>
                                <th class="px-8 py-4">Spend</th>
                                <th class="px-8 py-4">Conversions</th>
                                <th class="px-8 py-4">ROAS</th>
                                <th class="px-8 py-4">CTR</th>
                            </tr>
                            </thead>
                            <tbody class="divide-y divide-slate-100 text-[16px]">
                            <tr>
                                <td class="px-8 py-5 font-medium text-slate-950">TR Awareness Prospecting</td>
                                <td class="px-8 py-5">$4,230</td>
                                <td class="px-8 py-5">1,142</td>
                                <td class="px-8 py-5 font-semibold text-emerald-600">4.8x</td>
                                <td class="px-8 py-5">2.9%</td>
                            </tr>
                            <tr>
                                <td class="px-8 py-5 font-medium text-slate-950">TR Retargeting Recovery</td>
                                <td class="px-8 py-5">$3,180</td>
                                <td class="px-8 py-5">964</td>
                                <td class="px-8 py-5 font-semibold text-emerald-600">4.4x</td>
                                <td class="px-8 py-5">2.6%</td>
                            </tr>
                            <tr>
                                <td class="px-8 py-5 font-medium text-slate-950">TR Lookalike Scale</td>
                                <td class="px-8 py-5">$2,910</td>
                                <td class="px-8 py-5">718</td>
                                <td class="px-8 py-5 font-semibold text-emerald-600">3.9x</td>
                                <td class="px-8 py-5">2.1%</td>
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
