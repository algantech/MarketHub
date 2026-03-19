<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Campaign Detail" />
<!DOCTYPE html>
<html lang="tr">
<head>
    <%@ include file="/WEB-INF/jsp/fragments/tailwind-head.jspf" %>
</head>
<body data-authenticated-page="true" class="bg-background-light font-display text-slate-900">
<div class="relative flex min-h-screen w-full flex-col overflow-x-hidden">
    <%@ include file="/WEB-INF/jsp/fragments/app-topbar.jspf" %>

    <div class="flex flex-1 overflow-hidden">
        <aside class="hidden w-[280px] flex-col border-r border-slate-200 bg-white xl:flex">
            <div class="flex items-center gap-3 px-8 py-8">
                <div class="flex h-12 w-12 items-center justify-center rounded-full bg-primary text-white">
                    <span class="material-symbols-outlined">hub</span>
                </div>
                <div>
                    <h2 class="text-[20px] font-bold tracking-tight text-slate-950">MarketHub</h2>
                    <p class="text-sm text-slate-500">Ad Manager</p>
                </div>
            </div>

            <nav class="flex flex-1 flex-col gap-2 px-4">
                <a href="#" class="flex items-center gap-3 rounded-2xl bg-primary/10 px-4 py-3 text-primary">
                    <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1">grid_view</span>
                    <span class="text-[16px] font-medium">Overview</span>
                </a>
                <a href="#" class="flex items-center gap-3 rounded-2xl px-4 py-3 text-slate-700 transition-colors hover:bg-slate-100">
                    <span class="material-symbols-outlined">layers</span>
                    <span class="text-[16px] font-medium">Ad Sets</span>
                </a>
                <a href="#" class="flex items-center gap-3 rounded-2xl px-4 py-3 text-slate-700 transition-colors hover:bg-slate-100">
                    <span class="material-symbols-outlined">ads_click</span>
                    <span class="text-[16px] font-medium">Ads</span>
                </a>
                <a href="#" class="flex items-center gap-3 rounded-2xl px-4 py-3 text-slate-700 transition-colors hover:bg-slate-100">
                    <span class="material-symbols-outlined">bar_chart</span>
                    <span class="text-[16px] font-medium">Analytics</span>
                </a>
            </nav>

            <div class="border-t border-slate-200 p-4">
                <div class="flex items-center gap-3 px-3 py-2">
                    <div class="h-10 w-10 rounded-full bg-slate-200"></div>
                    <div class="flex-1 overflow-hidden">
                        <p class="truncate text-sm font-medium text-slate-950">Alex Rivard</p>
                        <p class="truncate text-xs text-slate-500">Marketing Lead</p>
                    </div>
                    <span class="material-symbols-outlined text-slate-400 text-[18px]">settings</span>
                </div>
            </div>
        </aside>

        <div class="flex flex-1 flex-col overflow-y-auto">
            <div class="w-full border-b border-slate-200 bg-white px-4 py-4 md:px-8">
                <div class="mx-auto flex max-w-[1600px] flex-wrap items-center gap-4">
                    <div class="flex items-center gap-2 text-sm text-slate-500">
                        <a href="#" class="hover:text-primary">Campaigns</a>
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
                    <h1 class="text-[40px] font-extrabold tracking-tight text-slate-950">Awareness - MastiPro - Q1</h1>
                    <div class="flex flex-wrap gap-x-5 gap-y-2 text-[15px] text-slate-600">
                        <span class="flex items-center gap-2"><span class="material-symbols-outlined text-[18px]">inventory_2</span>Product: MastiPro</span>
                        <span class="flex items-center gap-2"><span class="material-symbols-outlined text-[18px]">public</span>Country: TR</span>
                        <span class="flex items-center gap-2"><span class="material-symbols-outlined text-[18px]">track_changes</span>Objective: Awareness</span>
                        <span class="flex items-center gap-2"><span class="material-symbols-outlined text-[18px]">filter_list</span>Funnel: Top of Funnel</span>
                    </div>
                </section>

                <section class="grid grid-cols-1 gap-4 md:grid-cols-2 2xl:grid-cols-4">
                    <article class="rounded-3xl border border-slate-200 bg-white p-6 shadow-panel">
                        <div class="mb-3 flex items-center justify-between">
                            <p class="text-[16px] font-medium text-slate-500">Total Spend</p>
                            <span class="material-symbols-outlined rounded-full bg-primary/10 p-2 text-primary text-[20px]">payments</span>
                        </div>
                        <p class="text-[42px] font-bold tracking-tight text-slate-950">$12,450.00</p>
                        <p class="mt-3 inline-flex items-center gap-1 text-sm font-semibold text-emerald-600"><span class="material-symbols-outlined text-[16px]">trending_up</span>+4.2% vs prev. quarter</p>
                    </article>
                    <article class="rounded-3xl border border-slate-200 bg-white p-6 shadow-panel">
                        <div class="mb-3 flex items-center justify-between">
                            <p class="text-[16px] font-medium text-slate-500">Total Engagement</p>
                            <span class="material-symbols-outlined rounded-full bg-primary/10 p-2 text-primary text-[20px]">thumb_up</span>
                        </div>
                        <p class="text-[42px] font-bold tracking-tight text-slate-950">842,500</p>
                        <p class="mt-3 inline-flex items-center gap-1 text-sm font-semibold text-emerald-600"><span class="material-symbols-outlined text-[16px]">trending_up</span>+12.5% vs prev. quarter</p>
                    </article>
                    <article class="rounded-3xl border border-slate-200 bg-white p-6 shadow-panel">
                        <div class="mb-3 flex items-center justify-between">
                            <p class="text-[16px] font-medium text-slate-500">Avg. CPM</p>
                            <span class="material-symbols-outlined rounded-full bg-primary/10 p-2 text-primary text-[20px]">visibility</span>
                        </div>
                        <p class="text-[42px] font-bold tracking-tight text-slate-950">$1.48</p>
                        <p class="mt-3 inline-flex items-center gap-1 text-sm font-semibold text-rose-600"><span class="material-symbols-outlined text-[16px]">trending_down</span>-0.15% vs prev. quarter</p>
                    </article>
                    <article class="rounded-3xl border border-slate-200 bg-white p-6 shadow-panel">
                        <div class="mb-3 flex items-center justify-between">
                            <p class="text-[16px] font-medium text-slate-500">Impressions</p>
                            <span class="material-symbols-outlined rounded-full bg-primary/10 p-2 text-primary text-[20px]">groups</span>
                        </div>
                        <p class="text-[42px] font-bold tracking-tight text-slate-950">8.4M</p>
                        <p class="mt-3 inline-flex items-center gap-1 text-sm font-semibold text-emerald-600"><span class="material-symbols-outlined text-[16px]">trending_up</span>+8.1% vs prev. quarter</p>
                    </article>
                </section>

                <section class="grid grid-cols-1 gap-6 2xl:grid-cols-[minmax(0,1.85fr)_minmax(320px,0.8fr)]">
                    <div class="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-panel">
                        <div class="border-b border-slate-200 px-8 py-6">
                            <h2 class="text-[20px] font-bold tracking-tight text-slate-950">Ad Set Performance</h2>
                        </div>
                        <div class="overflow-x-auto">
                            <table class="min-w-full text-left">
                                <thead class="bg-slate-50 text-[12px] font-bold uppercase tracking-[0.08em] text-slate-500">
                                <tr>
                                    <th class="px-8 py-4">Ad Set Name</th>
                                    <th class="px-8 py-4">Budget</th>
                                    <th class="px-8 py-4">Engagement</th>
                                    <th class="px-8 py-4">Budget %</th>
                                    <th class="px-8 py-4">Eng. Ratio</th>
                                </tr>
                                </thead>
                                <tbody class="divide-y divide-slate-100">
                                <tr class="text-[16px]">
                                    <td class="px-8 py-6 font-medium text-primary">TR-Awareness-Interests-01</td>
                                    <td class="px-8 py-6">$5,000</td>
                                    <td class="px-8 py-6">420,000</td>
                                    <td class="px-8 py-6">
                                        <div class="flex items-center gap-3">
                                            <div class="h-3 w-20 overflow-hidden rounded-full bg-slate-100"><div class="h-full w-[40%] rounded-full bg-primary"></div></div>
                                            <span>40%</span>
                                        </div>
                                    </td>
                                    <td class="px-8 py-6 font-semibold text-slate-950">50%</td>
                                </tr>
                                <tr class="text-[16px]">
                                    <td class="px-8 py-6 font-medium text-primary">TR-Awareness-Lookalike-01</td>
                                    <td class="px-8 py-6">$4,500</td>
                                    <td class="px-8 py-6">280,000</td>
                                    <td class="px-8 py-6">
                                        <div class="flex items-center gap-3">
                                            <div class="h-3 w-20 overflow-hidden rounded-full bg-slate-100"><div class="h-full w-[36%] rounded-full bg-primary"></div></div>
                                            <span>36%</span>
                                        </div>
                                    </td>
                                    <td class="px-8 py-6 font-semibold text-slate-950">33%</td>
                                </tr>
                                <tr class="text-[16px]">
                                    <td class="px-8 py-6 font-medium text-primary">TR-Awareness-Retargeting-01</td>
                                    <td class="px-8 py-6">$2,950</td>
                                    <td class="px-8 py-6">142,500</td>
                                    <td class="px-8 py-6">
                                        <div class="flex items-center gap-3">
                                            <div class="h-3 w-20 overflow-hidden rounded-full bg-slate-100"><div class="h-full w-[24%] rounded-full bg-primary"></div></div>
                                            <span>24%</span>
                                        </div>
                                    </td>
                                    <td class="px-8 py-6 font-semibold text-slate-950">17%</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="rounded-3xl border border-slate-200 bg-white p-8 shadow-panel">
                        <h2 class="text-[20px] font-bold tracking-tight text-slate-950">Distribution Comparison</h2>
                        <div class="mt-8 space-y-8">
                            <div>
                                <p class="mb-3 text-[12px] font-bold uppercase tracking-[0.08em] text-slate-500">Budget Distribution</p>
                                <div class="flex h-11 w-full overflow-hidden rounded-2xl">
                                    <div class="h-full w-[40%] bg-primary"></div>
                                    <div class="h-full w-[36%] bg-primary/70"></div>
                                    <div class="h-full w-[24%] bg-primary/40"></div>
                                </div>
                            </div>
                            <div>
                                <p class="mb-3 text-[12px] font-bold uppercase tracking-[0.08em] text-slate-500">Engagement Distribution</p>
                                <div class="flex h-11 w-full overflow-hidden rounded-2xl">
                                    <div class="h-full w-[50%] bg-emerald-500"></div>
                                    <div class="h-full w-[33%] bg-emerald-500/70"></div>
                                    <div class="h-full w-[17%] bg-emerald-500/40"></div>
                                </div>
                            </div>
                            <div class="flex flex-wrap gap-5 pt-2 text-sm text-slate-600">
                                <span class="flex items-center gap-2"><span class="h-3 w-3 rounded bg-primary"></span>Interests</span>
                                <span class="flex items-center gap-2"><span class="h-3 w-3 rounded bg-primary/70"></span>Lookalike</span>
                                <span class="flex items-center gap-2"><span class="h-3 w-3 rounded bg-primary/40"></span>Retargeting</span>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="rounded-3xl border-2 border-primary/20 bg-white p-8 shadow-panel">
                    <div class="mb-8 flex items-center gap-4">
                        <div class="rounded-2xl bg-primary/10 p-3">
                            <span class="material-symbols-outlined text-[34px] text-primary">visibility</span>
                        </div>
                        <div>
                            <h2 class="text-[22px] font-bold tracking-tight text-slate-950">Ad Set Detail: TR-Awareness-Interests-01</h2>
                            <p class="mt-1 text-[16px] text-slate-500">Performance insights for selected ad set and associated creatives</p>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 gap-8 2xl:grid-cols-2">
                        <div>
                            <h3 class="mb-4 text-[12px] font-bold uppercase tracking-[0.18em] text-slate-400">Active Creatives</h3>
                            <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
                                <article class="overflow-hidden rounded-3xl border border-slate-200 bg-slate-50">
                                    <div class="aspect-video bg-[linear-gradient(90deg,#dde8eb_0%,#ffffff_28%,#0f2727_68%,#dde8eb_100%)]"></div>
                                    <div class="p-4">
                                        <p class="mb-2 text-xs font-bold text-slate-500">Creative Variant A</p>
                                        <div class="flex items-center justify-between gap-3">
                                            <span class="text-[16px] font-bold text-slate-950">210k Engagements</span>
                                            <span class="text-sm font-bold text-primary">1.8% CTR</span>
                                        </div>
                                    </div>
                                </article>
                                <article class="overflow-hidden rounded-3xl border border-slate-200 bg-slate-50">
                                    <div class="aspect-video bg-[linear-gradient(90deg,#f5f1ea_0%,#ffffff_30%,#f0d4a4_62%,#ffffff_100%)]"></div>
                                    <div class="p-4">
                                        <p class="mb-2 text-xs font-bold text-slate-500">Creative Variant B</p>
                                        <div class="flex items-center justify-between gap-3">
                                            <span class="text-[16px] font-bold text-slate-950">195k Engagements</span>
                                            <span class="text-sm font-bold text-primary">1.6% CTR</span>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </div>

                        <div>
                            <h3 class="mb-4 text-[12px] font-bold uppercase tracking-[0.18em] text-slate-400">Last 3 Months Performance</h3>
                            <div class="flex h-64 items-end gap-4 rounded-3xl bg-slate-50 px-6 pt-8">
                                <div class="flex flex-1 flex-col items-center justify-end gap-2">
                                    <div class="w-full rounded-t-2xl bg-primary/20 h-[32%]"></div>
                                    <span class="text-xs text-slate-400">Jan</span>
                                </div>
                                <div class="flex flex-1 flex-col items-center justify-end gap-2">
                                    <div class="w-full rounded-t-2xl bg-primary/20 h-[48%]"></div>
                                    <span class="text-xs text-slate-400">Feb</span>
                                </div>
                                <div class="flex flex-1 flex-col items-center justify-end gap-2">
                                    <div class="w-full rounded-t-2xl bg-primary h-[82%]"></div>
                                    <span class="text-xs font-bold text-primary">Mar</span>
                                </div>
                            </div>

                            <div class="mt-6 grid grid-cols-2 gap-4">
                                <div class="rounded-2xl bg-slate-50 p-5">
                                    <p class="text-[12px] font-bold uppercase tracking-[0.08em] text-slate-500">Estimated ROAS</p>
                                    <p class="mt-3 text-[22px] font-bold tracking-tight text-slate-950">3.4x</p>
                                </div>
                                <div class="rounded-2xl bg-slate-50 p-5">
                                    <p class="text-[12px] font-bold uppercase tracking-[0.08em] text-slate-500">Reach</p>
                                    <p class="mt-3 text-[22px] font-bold tracking-tight text-slate-950">1.2M</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <footer class="flex flex-col gap-3 border-t border-slate-200 pt-6 text-sm text-slate-500 md:flex-row md:items-center md:justify-between">
                    <p>© 2024 MarketHub Marketing Analytics. All rights reserved.</p>
                    <div class="flex gap-6">
                        <a href="#" class="hover:text-primary">Privacy Policy</a>
                        <a href="#" class="hover:text-primary">Terms of Service</a>
                        <a href="#" class="hover:text-primary">Support</a>
                    </div>
                </footer>
            </main>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/fragments/common-scripts.jspf" %>
</body>
</html>
