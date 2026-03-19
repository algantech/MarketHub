<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Comparison - Funnels" />
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
            <h1 class="text-[48px] font-extrabold tracking-tight text-slate-950">Funnel Comparison</h1>
            <p class="text-[17px] text-slate-500">Deep-dive performance benchmarks across your active funnels.</p>
        </section>

        <%@ include file="/WEB-INF/jsp/fragments/comparison-tabs.jspf" %>

        <section class="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-panel">
            <div class="grid grid-cols-[260px_repeat(2,minmax(0,1fr))] border-b border-slate-200 bg-white">
                <div class="px-8 py-8 text-[12px] font-bold uppercase tracking-[0.14em] text-slate-400">Metrics</div>
                <div class="px-8 py-8">
                    <div class="flex items-center gap-4">
                        <div>
                            <h2 class="text-[22px] font-bold tracking-tight text-slate-950">TR-MastiPro</h2>
                            <p class="mt-3 text-[16px] text-slate-400">Social Retargeting Funnel</p>
                        </div>
                        <span class="rounded-full bg-emerald-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-emerald-700">Active</span>
                    </div>
                </div>
                <div class="px-8 py-8">
                    <div class="flex items-center gap-4">
                        <div>
                            <h2 class="text-[22px] font-bold tracking-tight text-slate-950">TR-Actimoo</h2>
                            <p class="mt-3 text-[16px] text-slate-400">Search Intent Funnel</p>
                        </div>
                        <span class="rounded-full bg-emerald-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-emerald-700">Active</span>
                    </div>
                </div>
            </div>

            <div class="grid grid-cols-[260px_repeat(2,minmax(0,1fr))] divide-y divide-slate-100">
                <div class="contents">
                    <div class="px-8 py-10 text-[20px] font-medium text-slate-950">Total Visits</div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">45,200</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1M: 42,000</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2M: 38,500</p>
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
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">58,900</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1M: 61,100</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2M: 55,800</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-6"></span>
                                <span class="w-3 rounded-sm bg-primary/50 h-9"></span>
                                <span class="w-3 rounded-sm bg-primary h-8"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="contents">
                    <div class="px-8 py-10 text-[20px] font-medium text-slate-950">Conversion Rate</div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">4.20%</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1M: 3.85%</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2M: 3.50%</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-6"></span>
                                <span class="w-3 rounded-sm bg-primary/50 h-8"></span>
                                <span class="w-3 rounded-sm bg-primary h-9"></span>
                            </div>
                        </div>
                    </div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">2.95%</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1M: 3.10%</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2M: 3.25%</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-8"></span>
                                <span class="w-3 rounded-sm bg-primary/50 h-9"></span>
                                <span class="w-3 rounded-sm bg-primary h-6"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="contents">
                    <div class="px-8 py-10 text-[20px] font-medium text-slate-950">CPA</div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">$12.45</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1M: $14.20</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2M: $15.80</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-8"></span>
                                <span class="w-3 rounded-sm bg-primary/50 h-7"></span>
                                <span class="w-3 rounded-sm bg-primary h-5"></span>
                            </div>
                        </div>
                    </div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">$21.80</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1M: $19.50</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2M: $18.20</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-6"></span>
                                <span class="w-3 rounded-sm bg-primary/50 h-8"></span>
                                <span class="w-3 rounded-sm bg-primary h-9"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="contents">
                    <div class="px-8 py-10 text-[20px] font-medium text-slate-950">Avg. Order Value</div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">$84.00</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1M: $82.50</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2M: $79.00</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-6"></span>
                                <span class="w-3 rounded-sm bg-primary/50 h-8"></span>
                                <span class="w-3 rounded-sm bg-primary h-9"></span>
                            </div>
                        </div>
                    </div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">$112.50</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1M: $115.00</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2M: $118.00</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-6"></span>
                                <span class="w-3 rounded-sm bg-primary/50 h-9"></span>
                                <span class="w-3 rounded-sm bg-primary h-8"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="contents">
                    <div class="px-8 py-10 text-[20px] font-medium text-slate-950">Total Revenue</div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">$159k</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1M: $142k</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2M: $135k</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-6"></span>
                                <span class="w-3 rounded-sm bg-primary/50 h-8"></span>
                                <span class="w-3 rounded-sm bg-primary h-9"></span>
                            </div>
                        </div>
                    </div>
                    <div class="px-8 py-8">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-[28px] font-bold tracking-tight text-slate-950">$192k</p>
                                <p class="mt-3 text-[15px] text-slate-500">-1M: $205k</p>
                                <p class="mt-2 text-[15px] text-slate-500">-2M: $198k</p>
                            </div>
                            <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2">
                                <span class="w-3 rounded-sm bg-primary/30 h-7"></span>
                                <span class="w-3 rounded-sm bg-primary/50 h-9"></span>
                                <span class="w-3 rounded-sm bg-primary h-6"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="grid grid-cols-1 gap-6 xl:grid-cols-3">
            <article class="rounded-3xl border border-slate-200 bg-white p-8 shadow-panel">
                <div class="flex items-center gap-3">
                    <span class="material-symbols-outlined rounded-full bg-primary/10 p-2 text-primary">trending_up</span>
                    <h2 class="text-[16px] font-bold uppercase tracking-[0.08em] text-slate-950">Top Efficiency</h2>
                </div>
                <p class="mt-8 text-[17px] leading-9 text-slate-700">TR-MastiPro leads in conversion efficiency with a significant CPA reduction over the last 3 months.</p>
            </article>
            <article class="rounded-3xl border border-slate-200 bg-white p-8 shadow-panel">
                <div class="flex items-center gap-3">
                    <span class="material-symbols-outlined rounded-full bg-primary/10 p-2 text-primary">bar_chart</span>
                    <h2 class="text-[16px] font-bold uppercase tracking-[0.08em] text-slate-950">Volume Insight</h2>
                </div>
                <p class="mt-8 text-[17px] leading-9 text-slate-700">TR-Actimoo maintains higher traffic volume but shows slight revenue plateauing this month.</p>
            </article>
            <article class="rounded-3xl border border-slate-200 bg-white p-8 shadow-panel">
                <div class="flex items-center gap-3">
                    <span class="material-symbols-outlined rounded-full bg-orange-100 p-2 text-orange-600">info</span>
                    <h2 class="text-[16px] font-bold uppercase tracking-[0.08em] text-slate-950">Strategic Note</h2>
                </div>
                <p class="mt-8 text-[17px] leading-9 text-slate-700">Comparison indicates high-intent search funnels scale better with increased AOV but higher CPA.</p>
            </article>
        </section>
    </main>

    <%@ include file="/WEB-INF/jsp/fragments/app-footer.jspf" %>
</div>

<%@ include file="/WEB-INF/jsp/fragments/common-scripts.jspf" %>
</body>
</html>
