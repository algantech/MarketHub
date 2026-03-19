<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Campaign Ads" />
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
                <section class="flex flex-col gap-2">
                    <h1 class="text-[40px] font-extrabold tracking-tight text-slate-950">Ads</h1>
                    <p class="text-[17px] text-slate-500">Creatives</p>
                </section>

                <section class="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-panel">
                    <div class="overflow-x-auto">
                        <table class="min-w-[1180px] w-full text-left">
                            <thead class="border-b border-slate-200 bg-white text-[12px] font-bold uppercase tracking-[0.08em] text-slate-500">
                            <tr>
                                <th class="px-8 py-6">Preview &amp; Name</th>
                                <th class="px-8 py-6">Status</th>
                                <th class="px-8 py-6">Delivery</th>
                                <th class="px-8 py-6">Results</th>
                                <th class="px-8 py-6">Reach</th>
                                <th class="px-8 py-6">Cost/Result</th>
                                <th class="px-8 py-6">Amt Spent</th>
                            </tr>
                            </thead>
                            <tbody class="divide-y divide-slate-100 text-[17px] text-slate-950">
                            <tr>
                                <td class="px-8 py-5">
                                    <div class="flex items-center gap-5">
                                        <div class="flex h-20 w-16 items-center justify-center rounded-md bg-[linear-gradient(180deg,#5d7c69_0%,#55735f_100%)] text-[8px] font-medium uppercase tracking-[0.18em] text-white/40">Creative</div>
                                        <div>
                                            <p class="text-[18px] font-medium text-slate-950">Hero Static - Red Sneaker</p>
                                            <p class="mt-1 text-sm text-slate-500">ID: 849204859</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-8 py-5">
                                    <span class="inline-flex items-center gap-2 text-emerald-600"><span class="h-2.5 w-2.5 rounded-full bg-emerald-500"></span>Active</span>
                                </td>
                                <td class="px-8 py-5 text-slate-600">Learning</td>
                                <td class="px-8 py-5">
                                    <div class="font-semibold text-slate-950">142</div>
                                    <div class="mt-1 text-sm text-slate-500">Purchases</div>
                                </td>
                                <td class="px-8 py-5">24,812</td>
                                <td class="px-8 py-5">$4.12</td>
                                <td class="px-8 py-5">$585.04</td>
                            </tr>
                            <tr>
                                <td class="px-8 py-5">
                                    <div class="flex items-center gap-5">
                                        <div class="relative flex h-20 w-16 items-center justify-center rounded-md bg-[linear-gradient(180deg,#c8beb4_0%,#b9aea3_100%)]">
                                            <span class="material-symbols-outlined rounded-full bg-white/90 p-1 text-[18px] text-slate-500">play_arrow</span>
                                        </div>
                                        <div>
                                            <p class="text-[18px] font-medium text-slate-950">Lifestyle Video - Watch v2</p>
                                            <p class="mt-1 text-sm text-slate-500">ID: 849204901</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-8 py-5">
                                    <span class="inline-flex items-center gap-2 text-emerald-600"><span class="h-2.5 w-2.5 rounded-full bg-emerald-500"></span>Active</span>
                                </td>
                                <td class="px-8 py-5 text-slate-600">Active</td>
                                <td class="px-8 py-5">
                                    <div class="font-semibold text-slate-950">98</div>
                                    <div class="mt-1 text-sm text-slate-500">Purchases</div>
                                </td>
                                <td class="px-8 py-5">18,290</td>
                                <td class="px-8 py-5">$6.45</td>
                                <td class="px-8 py-5">$632.10</td>
                            </tr>
                            <tr>
                                <td class="px-8 py-5">
                                    <div class="flex items-center gap-5">
                                        <div class="flex h-20 w-16 items-center justify-center rounded-md bg-[linear-gradient(180deg,#c8d0b0_0%,#b5bf9a_100%)] text-[8px] font-medium uppercase tracking-[0.18em] text-white/50">Product</div>
                                        <div>
                                            <p class="text-[18px] font-medium text-slate-950">Product - Black Headphones</p>
                                            <p class="mt-1 text-sm text-slate-500">ID: 849204955</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-8 py-5">
                                    <span class="inline-flex items-center gap-2 text-slate-500"><span class="h-2.5 w-2.5 rounded-full bg-slate-300"></span>Paused</span>
                                </td>
                                <td class="px-8 py-5 text-slate-600">Paused</td>
                                <td class="px-8 py-5">
                                    <div class="font-semibold text-slate-950">54</div>
                                    <div class="mt-1 text-sm text-slate-500">Purchases</div>
                                </td>
                                <td class="px-8 py-5">9,421</td>
                                <td class="px-8 py-5">$5.18</td>
                                <td class="px-8 py-5">$279.72</td>
                            </tr>
                            <tr>
                                <td class="px-8 py-5">
                                    <div class="flex items-center gap-5">
                                        <div class="flex h-20 w-16 items-center justify-center rounded-md bg-[linear-gradient(180deg,#c8dcfb_0%,#b7cff5_100%)] text-primary">
                                            <span class="material-symbols-outlined text-[30px]">view_carousel</span>
                                        </div>
                                        <div>
                                            <p class="text-[18px] font-medium text-slate-950">Carousel - Best Sellers</p>
                                            <p class="mt-1 text-sm text-slate-500">ID: 849204990</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-8 py-5">
                                    <span class="inline-flex items-center gap-2 text-emerald-600"><span class="h-2.5 w-2.5 rounded-full bg-emerald-500"></span>Active</span>
                                </td>
                                <td class="px-8 py-5 text-slate-600">Active</td>
                                <td class="px-8 py-5">
                                    <div class="font-semibold text-slate-950">215</div>
                                    <div class="mt-1 text-sm text-slate-500">Purchases</div>
                                </td>
                                <td class="px-8 py-5">41,050</td>
                                <td class="px-8 py-5">$3.95</td>
                                <td class="px-8 py-5">$849.25</td>
                            </tr>
                            <tr>
                                <td class="px-8 py-5">
                                    <div class="flex items-center gap-5">
                                        <div class="flex h-20 w-16 items-center justify-center rounded-md bg-[linear-gradient(180deg,#d4c7ae_0%,#c3b494_100%)] text-[8px] font-medium uppercase tracking-[0.18em] text-white/50">Vintage</div>
                                        <div>
                                            <p class="text-[18px] font-medium text-slate-950">Vintage Promo - Still</p>
                                            <p class="mt-1 text-sm text-slate-500">ID: 849205112</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-8 py-5">
                                    <span class="inline-flex items-center gap-2 text-emerald-600"><span class="h-2.5 w-2.5 rounded-full bg-emerald-500"></span>Active</span>
                                </td>
                                <td class="px-8 py-5 text-slate-600">Active</td>
                                <td class="px-8 py-5">
                                    <div class="font-semibold text-slate-950">76</div>
                                    <div class="mt-1 text-sm text-slate-500">Purchases</div>
                                </td>
                                <td class="px-8 py-5">12,488</td>
                                <td class="px-8 py-5">$7.20</td>
                                <td class="px-8 py-5">$547.20</td>
                            </tr>
                            </tbody>
                            <tfoot class="border-t border-slate-200 bg-slate-50 text-[17px] font-semibold text-slate-950">
                            <tr>
                                <td class="px-8 py-5">Total for Set</td>
                                <td class="px-8 py-5"></td>
                                <td class="px-8 py-5"></td>
                                <td class="px-8 py-5">585</td>
                                <td class="px-8 py-5">106,061</td>
                                <td class="px-8 py-5">$4.95</td>
                                <td class="px-8 py-5 text-primary">$2,893.31</td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>

                    <div class="flex flex-col gap-4 border-t border-slate-200 px-8 py-5 text-[15px] text-slate-500 md:flex-row md:items-center md:justify-between">
                        <p>Showing 1 to 5 of 6 ads</p>
                        <div class="flex items-center gap-2">
                            <button type="button" class="inline-flex h-11 items-center justify-center rounded-xl border border-slate-200 px-5 text-slate-400">Previous</button>
                            <button type="button" class="inline-flex h-11 w-11 items-center justify-center rounded-xl bg-primary font-semibold text-white">1</button>
                            <button type="button" class="inline-flex h-11 w-11 items-center justify-center rounded-xl border border-slate-200 font-semibold text-slate-700">2</button>
                            <button type="button" class="inline-flex h-11 items-center justify-center rounded-xl border border-slate-200 px-5 font-semibold text-slate-700">Next</button>
                        </div>
                    </div>
                </section>

                <section class="grid grid-cols-1 gap-6 xl:grid-cols-3">
                    <article class="rounded-3xl border border-slate-200 bg-white p-8 shadow-panel">
                        <div class="flex items-center gap-3 text-slate-500">
                            <span class="material-symbols-outlined text-[18px]">ads_click</span>
                            <p class="text-[12px] font-bold uppercase tracking-[0.12em]">Average CTR</p>
                        </div>
                        <p class="mt-5 text-[42px] font-bold tracking-tight text-slate-950">2.48%</p>
                        <p class="mt-3 text-[15px] font-medium text-emerald-600">↗ 0.4% from last week</p>
                    </article>
                    <article class="rounded-3xl border border-slate-200 bg-white p-8 shadow-panel">
                        <div class="flex items-center gap-3 text-slate-500">
                            <span class="material-symbols-outlined text-[18px]">bolt</span>
                            <p class="text-[12px] font-bold uppercase tracking-[0.12em]">ROAS</p>
                        </div>
                        <p class="mt-5 text-[42px] font-bold tracking-tight text-slate-950">3.8x</p>
                        <p class="mt-3 text-[15px] font-medium text-emerald-600">↗ 12% above goal</p>
                    </article>
                    <article class="rounded-3xl border border-slate-200 bg-white p-8 shadow-panel">
                        <div class="flex items-center gap-3 text-slate-500">
                            <span class="material-symbols-outlined text-[18px]">visibility</span>
                            <p class="text-[12px] font-bold uppercase tracking-[0.12em]">Frequency</p>
                        </div>
                        <p class="mt-5 text-[42px] font-bold tracking-tight text-slate-950">1.42</p>
                        <p class="mt-3 text-[15px] font-medium text-slate-400">- Stable performance</p>
                    </article>
                </section>
            </main>

            <%@ include file="/WEB-INF/jsp/fragments/app-footer.jspf" %>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/fragments/common-scripts.jspf" %>
</body>
</html>
