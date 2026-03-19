<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Audience Management" />
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
            <h1 class="text-[48px] font-extrabold tracking-tight text-slate-950">Audience Management</h1>
            <p class="text-[17px] text-slate-500">Manage target segments and analyze cross-funnel performance.</p>
        </section>

        <section class="grid grid-cols-1 gap-8 2xl:grid-cols-[minmax(0,1.9fr)_minmax(360px,0.92fr)]">
            <article class="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-panel">
                <div class="flex flex-wrap items-center justify-between gap-4 border-b border-slate-200 px-8 py-6">
                    <h2 class="text-[22px] font-bold tracking-tight text-slate-950">Audience List</h2>
                    <div class="flex items-center gap-3">
                        <button type="button" class="rounded-full bg-primary/10 px-4 py-2 text-sm font-bold text-primary">All</button>
                        <button type="button" class="rounded-full bg-slate-100 px-4 py-2 text-sm font-bold text-slate-500">Custom</button>
                        <button type="button" class="rounded-full bg-slate-100 px-4 py-2 text-sm font-bold text-slate-500">Lookalike</button>
                    </div>
                </div>

                <div class="overflow-x-auto">
                    <table class="min-w-full text-left">
                        <thead class="bg-slate-50 text-[12px] font-bold uppercase tracking-[0.08em] text-slate-500">
                        <tr>
                            <th class="px-8 py-4">Audience Name</th>
                            <th class="px-8 py-4">Type</th>
                            <th class="px-8 py-4">Funnel Stage</th>
                            <th class="px-8 py-4 text-right">Campaigns</th>
                        </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100 text-[16px]">
                        <tr class="bg-primary/[0.03]">
                            <td class="border-l-4 border-primary px-8 py-6">
                                <p class="font-medium text-slate-950">High-Value Retargeting L30D</p>
                                <p class="mt-2 text-slate-500">ID: 89234012</p>
                            </td>
                            <td class="px-8 py-6"><span class="rounded-lg bg-primary/10 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-primary">Custom</span></td>
                            <td class="px-8 py-6"><span class="rounded-lg bg-emerald-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-emerald-700">Purchase</span></td>
                            <td class="px-8 py-6 text-right text-slate-950">12</td>
                        </tr>
                        <tr>
                            <td class="px-8 py-6">
                                <p class="font-medium text-slate-950">Lookalike (US, 1%) - Purchases</p>
                                <p class="mt-2 text-slate-500">ID: 77230192</p>
                            </td>
                            <td class="px-8 py-6"><span class="rounded-lg bg-violet-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-violet-700">Lookalike</span></td>
                            <td class="px-8 py-6"><span class="rounded-lg bg-amber-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-amber-700">Awareness</span></td>
                            <td class="px-8 py-6 text-right text-slate-950">5</td>
                        </tr>
                        <tr>
                            <td class="px-8 py-6">
                                <p class="font-medium text-slate-950">Fitness &amp; Gym Enthusiasts</p>
                                <p class="mt-2 text-slate-500">ID: 11092837</p>
                            </td>
                            <td class="px-8 py-6"><span class="rounded-lg bg-slate-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-slate-700">Saved</span></td>
                            <td class="px-8 py-6"><span class="rounded-lg bg-indigo-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-indigo-700">Interest</span></td>
                            <td class="px-8 py-6 text-right text-slate-950">8</td>
                        </tr>
                        <tr>
                            <td class="px-8 py-6">
                                <p class="font-medium text-slate-950">Loyalty Program Platinum</p>
                                <p class="mt-2 text-slate-500">ID: 55620194</p>
                            </td>
                            <td class="px-8 py-6"><span class="rounded-lg bg-primary/10 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-primary">Custom</span></td>
                            <td class="px-8 py-6"><span class="rounded-lg bg-pink-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-pink-700">Loyalty</span></td>
                            <td class="px-8 py-6 text-right text-slate-950">3</td>
                        </tr>
                        <tr>
                            <td class="px-8 py-6">
                                <p class="font-medium text-slate-950">Advocates &amp; Reviewers</p>
                                <p class="mt-2 text-slate-500">ID: 22019283</p>
                            </td>
                            <td class="px-8 py-6"><span class="rounded-lg bg-primary/10 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-primary">Custom</span></td>
                            <td class="px-8 py-6"><span class="rounded-lg bg-cyan-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-cyan-700">Advocacy</span></td>
                            <td class="px-8 py-6 text-right text-slate-950">2</td>
                        </tr>
                        <tr>
                            <td class="px-8 py-6">
                                <p class="font-medium text-slate-950">Bounced Visitors (Non-Converters)</p>
                                <p class="mt-2 text-slate-500">ID: 99281726</p>
                            </td>
                            <td class="px-8 py-6"><span class="rounded-lg bg-primary/10 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-primary">Custom</span></td>
                            <td class="px-8 py-6"><span class="rounded-lg bg-slate-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-slate-700">Excluded</span></td>
                            <td class="px-8 py-6 text-right text-slate-950">1</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="flex flex-col gap-4 border-t border-slate-200 px-8 py-5 text-[15px] text-slate-500 md:flex-row md:items-center md:justify-between">
                    <p>Showing 6 of 42 audiences</p>
                    <div class="flex items-center gap-2">
                        <button type="button" class="inline-flex h-11 items-center justify-center rounded-xl border border-slate-200 px-5 font-semibold text-slate-700">Previous</button>
                        <button type="button" class="inline-flex h-11 items-center justify-center rounded-xl border border-slate-200 px-5 font-semibold text-slate-700">Next</button>
                    </div>
                </div>
            </article>

            <article class="rounded-3xl border border-slate-200 bg-white shadow-panel">
                <div class="flex items-center justify-between rounded-t-3xl bg-primary px-8 py-6 text-white">
                    <h2 class="text-[22px] font-bold tracking-tight">Audience Detail</h2>
                    <span class="material-symbols-outlined">edit</span>
                </div>
                <div class="p-8">
                    <h3 class="text-[20px] font-bold tracking-tight text-slate-950">High-Value Retargeting L30D</h3>
                    <div class="mt-5 flex flex-wrap gap-3">
                        <span class="rounded-lg bg-primary/10 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-primary">Custom Audience</span>
                        <span class="rounded-lg bg-emerald-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-emerald-700">Purchase Stage</span>
                    </div>

                    <div class="mt-8">
                        <p class="text-[12px] font-bold uppercase tracking-[0.16em] text-slate-500">Description</p>
                        <p class="mt-4 text-[17px] leading-9 text-slate-700">This segment includes users who have visited high-ticket product pages more than twice or added items over $500 to their cart in the last 30 days without completing a purchase. Highly qualified for bottom-of-funnel conversion campaigns.</p>
                    </div>

                    <div class="mt-8 grid grid-cols-1 gap-4 sm:grid-cols-2">
                        <div class="rounded-2xl bg-slate-50 p-5">
                            <p class="text-[12px] font-bold uppercase tracking-[0.08em] text-slate-500">Estimated Size</p>
                            <p class="mt-3 text-[20px] font-bold text-slate-950">45k - 52k</p>
                        </div>
                        <div class="rounded-2xl bg-slate-50 p-5">
                            <p class="text-[12px] font-bold uppercase tracking-[0.08em] text-slate-500">Match Rate</p>
                            <p class="mt-3 text-[20px] font-bold text-slate-950">92%</p>
                        </div>
                    </div>

                    <div class="mt-8">
                        <p class="text-[12px] font-bold uppercase tracking-[0.16em] text-slate-500">Segment Rules</p>
                        <div class="mt-5 space-y-4 text-[16px] text-slate-700">
                            <p class="flex items-center gap-3"><span class="material-symbols-outlined text-[18px] text-primary">check_circle</span>Pixel: <span class="rounded-md bg-slate-100 px-2 py-1">AddToCart</span></p>
                            <p class="flex items-center gap-3"><span class="material-symbols-outlined text-[18px] text-primary">check_circle</span>Retention: 30 Days</p>
                            <p class="flex items-center gap-3"><span class="material-symbols-outlined text-[18px] text-primary">check_circle</span>Value Rule: Total &gt; $500</p>
                        </div>
                    </div>

                    <div class="mt-10 border-t border-slate-100 pt-8">
                        <button type="button" class="inline-flex min-h-[56px] w-full items-center justify-center rounded-2xl border-2 border-primary px-6 text-[18px] font-bold text-primary transition-colors hover:bg-primary/5">Sync to Meta Ads Manager</button>
                    </div>
                </div>
            </article>
        </section>

        <section class="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-panel">
            <div class="border-b border-slate-200 px-8 py-6">
                <h2 class="text-[22px] font-bold tracking-tight text-slate-950">Related Campaigns</h2>
                <p class="mt-2 text-[17px] text-slate-500">Campaigns currently utilizing this audience segment.</p>
            </div>
            <div class="overflow-x-auto">
                <table class="min-w-full text-left">
                    <thead class="bg-slate-50 text-[12px] font-bold uppercase tracking-[0.08em] text-slate-500">
                    <tr>
                        <th class="px-8 py-4">Campaign Name</th>
                        <th class="px-8 py-4">Objective</th>
                        <th class="px-8 py-4">Funnel Stage</th>
                        <th class="px-8 py-4 text-right">Spend</th>
                        <th class="px-8 py-4 text-right">Engagement</th>
                    </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100 text-[16px]">
                    <tr>
                        <td class="px-8 py-6 font-medium text-slate-950">Q4 Luxury Watch Retargeting</td>
                        <td class="px-8 py-6 text-slate-700">Conversions</td>
                        <td class="px-8 py-6"><span class="rounded-lg bg-emerald-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-emerald-700">Purchase</span></td>
                        <td class="px-8 py-6 text-right text-slate-950">$12,450.00</td>
                        <td class="px-8 py-6">
                            <div class="flex items-center justify-end gap-3">
                                <span>4.2%</span>
                                <div class="h-2 w-20 overflow-hidden rounded-full bg-slate-100"><div class="h-full w-[42%] rounded-full bg-primary"></div></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="px-8 py-6 font-medium text-slate-950">Flash Sale: Abandoned Carts</td>
                        <td class="px-8 py-6 text-slate-700">Sales</td>
                        <td class="px-8 py-6"><span class="rounded-lg bg-emerald-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-emerald-700">Purchase</span></td>
                        <td class="px-8 py-6 text-right text-slate-950">$8,900.20</td>
                        <td class="px-8 py-6">
                            <div class="flex items-center justify-end gap-3">
                                <span>5.8%</span>
                                <div class="h-2 w-20 overflow-hidden rounded-full bg-slate-100"><div class="h-full w-[58%] rounded-full bg-primary"></div></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="px-8 py-6 font-medium text-slate-950">Premium Subscriber Upsell</td>
                        <td class="px-8 py-6 text-slate-700">Engagement</td>
                        <td class="px-8 py-6"><span class="rounded-lg bg-pink-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-pink-700">Loyalty</span></td>
                        <td class="px-8 py-6 text-right text-slate-950">$2,100.00</td>
                        <td class="px-8 py-6">
                            <div class="flex items-center justify-end gap-3">
                                <span>12.1%</span>
                                <div class="h-2 w-20 overflow-hidden rounded-full bg-slate-100"><div class="h-full w-[78%] rounded-full bg-primary"></div></div>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </main>

    <%@ include file="/WEB-INF/jsp/fragments/app-footer.jspf" %>
</div>

<%@ include file="/WEB-INF/jsp/fragments/common-scripts.jspf" %>
</body>
</html>
