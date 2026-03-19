<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Comparison - Countries" />
<!DOCTYPE html>
<html lang="tr">
<head>
    <%@ include file="/WEB-INF/jsp/fragments/tailwind-head.jspf" %>
</head>
<body data-authenticated-page="true" class="bg-background-light font-display text-slate-900">
<div class="relative flex min-h-screen w-full flex-col overflow-x-hidden">
    <%@ include file="/WEB-INF/jsp/fragments/app-topbar.jspf" %>

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
        <section class="flex flex-col gap-2">
            <h1 class="text-[48px] font-extrabold tracking-tight text-slate-950">Analytics Comparison</h1>
            <p class="text-[17px] text-slate-500">Deep-dive performance benchmarks across your active entities.</p>
        </section>

        <%@ include file="/WEB-INF/jsp/fragments/comparison-tabs.jspf" %>

        <section class="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-panel">
            <div class="grid grid-cols-[260px_repeat(3,minmax(0,1fr))] border-b border-slate-200 bg-white">
                <div class="px-8 py-8 text-[12px] font-bold uppercase tracking-[0.14em] text-slate-400">Metrics</div>
                <div class="px-8 py-8">
                    <div class="flex items-center gap-4">
                        <div>
                            <h2 class="text-[22px] font-bold tracking-tight text-slate-950">Turkey (TR)</h2>
                            <p class="mt-3 text-[16px] text-slate-400">EMEA Region</p>
                        </div>
                        <span class="rounded-full bg-emerald-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-emerald-700">Top Growth</span>
                    </div>
                </div>
                <div class="px-8 py-8">
                    <div class="flex items-center gap-4">
                        <div>
                            <h2 class="text-[22px] font-bold tracking-tight text-slate-950">United States (US)</h2>
                            <p class="mt-3 text-[16px] text-slate-400">NA Region</p>
                        </div>
                        <span class="rounded-full bg-primary/10 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-primary">Primary</span>
                    </div>
                </div>
                <div class="px-8 py-8">
                    <div class="flex items-center gap-4">
                        <div>
                            <h2 class="text-[22px] font-bold tracking-tight text-slate-950">United Kingdom (UK)</h2>
                            <p class="mt-3 text-[16px] text-slate-400">EMEA Region</p>
                        </div>
                        <span class="rounded-full bg-slate-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-slate-500">Stable</span>
                    </div>
                </div>
            </div>

            <div class="grid grid-cols-[260px_repeat(3,minmax(0,1fr))] divide-y divide-slate-100">
                <div class="contents">
                    <div class="px-8 py-10 text-[20px] font-medium text-slate-950">Ad Spend</div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">$12,400</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1 month: $11,200</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2 month: $10,800</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-5"></span>
                                <span class="w-3 rounded-sm bg-primary/50 h-7"></span>
                                <span class="w-3 rounded-sm bg-primary h-8"></span>
                            </div>
                        </div>
                    </div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">$28,900</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1 month: $29,100</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2 month: $28,500</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-5"></span>
                                <span class="w-3 rounded-sm bg-primary/50 h-8"></span>
                                <span class="w-3 rounded-sm bg-primary h-7"></span>
                            </div>
                        </div>
                    </div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">$15,200</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1 month: $14,800</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2 month: $14,500</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-7"></span>
                                <span class="w-3 rounded-sm bg-primary/50 h-8"></span>
                                <span class="w-3 rounded-sm bg-primary h-8"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="contents">
                    <div class="px-8 py-10 text-[20px] font-medium text-slate-950">Impressions</div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">1.2M</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1 month: 1.1M</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2 month: 1.0M</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-5"></span>
                                <span class="w-3 rounded-sm bg-primary/50 h-7"></span>
                                <span class="w-3 rounded-sm bg-primary h-9"></span>
                            </div>
                        </div>
                    </div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">3.4M</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1 month: 3.5M</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2 month: 3.2M</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-6"></span>
                                <span class="w-3 rounded-sm bg-primary/50 h-8"></span>
                                <span class="w-3 rounded-sm bg-primary h-7"></span>
                            </div>
                        </div>
                    </div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">1.8M</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1 month: 1.7M</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2 month: 1.6M</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-7"></span>
                                <span class="w-3 rounded-sm bg-primary/50 h-7"></span>
                                <span class="w-3 rounded-sm bg-primary h-9"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="contents">
                    <div class="px-8 py-10 text-[20px] font-medium text-slate-950">CTR</div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">3.76%</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1 month: 3.82%</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2 month: 4.01%</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-3 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-7"></span>
                                <span class="w-3 rounded-sm bg-primary h-6"></span>
                            </div>
                        </div>
                    </div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">2.45%</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1 month: 2.40%</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2 month: 2.35%</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-3 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-6"></span>
                                <span class="w-3 rounded-sm bg-primary h-8"></span>
                            </div>
                        </div>
                    </div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">3.12%</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1 month: 3.15%</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2 month: 3.10%</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-3 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-8"></span>
                                <span class="w-3 rounded-sm bg-primary h-8"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="contents">
                    <div class="px-8 py-10 text-[20px] font-medium text-slate-950">Final Conversions</div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">152</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1 month: 140</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2 month: 135</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-3 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-6"></span>
                                <span class="w-3 rounded-sm bg-primary h-8"></span>
                            </div>
                        </div>
                    </div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">412</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1 month: 390</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2 month: 385</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-3 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-6"></span>
                                <span class="w-3 rounded-sm bg-primary h-9"></span>
                            </div>
                        </div>
                    </div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">218</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1 month: 210</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2 month: 205</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-7"></span>
                                <span class="w-3 rounded-sm bg-primary/50 h-8"></span>
                                <span class="w-3 rounded-sm bg-primary h-8"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="grid grid-cols-1 gap-6 xl:grid-cols-3">
            <article class="rounded-3xl border border-slate-200 bg-white p-8 shadow-panel">
                <div class="flex items-center gap-3">
                    <span class="material-symbols-outlined rounded-full bg-primary/10 p-2 text-primary">public</span>
                    <h2 class="text-[16px] font-bold uppercase tracking-[0.08em] text-slate-950">Region Leader</h2>
                </div>
                <p class="mt-8 text-[17px] leading-9 text-slate-700">Turkey (TR) shows the highest conversion rate improvement across all compared countries this month.</p>
            </article>
            <article class="rounded-3xl border border-slate-200 bg-white p-8 shadow-panel">
                <div class="flex items-center gap-3">
                    <span class="material-symbols-outlined rounded-full bg-primary/10 p-2 text-primary">bar_chart</span>
                    <h2 class="text-[16px] font-bold uppercase tracking-[0.08em] text-slate-950">Volume Insight</h2>
                </div>
                <p class="mt-8 text-[17px] leading-9 text-slate-700">US market continues to provide the largest volume of conversions but at a lower CTR compared to EMEA.</p>
            </article>
            <article class="rounded-3xl border border-slate-200 bg-white p-8 shadow-panel">
                <div class="flex items-center gap-3">
                    <span class="material-symbols-outlined rounded-full bg-orange-100 p-2 text-orange-600">trending_up</span>
                    <h2 class="text-[16px] font-bold uppercase tracking-[0.08em] text-slate-950">Opportunity</h2>
                </div>
                <p class="mt-8 text-[17px] leading-9 text-slate-700">UK metrics are stable; consider increasing ad spend in this region to test scalability.</p>
            </article>
        </section>
    </main>

    <%@ include file="/WEB-INF/jsp/fragments/app-footer.jspf" %>
</div>

<%@ include file="/WEB-INF/jsp/fragments/common-scripts.jspf" %>
</body>
</html>
