<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Create New Funnel" />
<!DOCTYPE html>
<html lang="tr">
<head>
    <%@ include file="/WEB-INF/jsp/fragments/tailwind-head.jspf" %>
</head>
<body data-authenticated-page="true" class="bg-background-light font-display text-slate-900">
<div class="relative flex min-h-screen w-full flex-col overflow-x-hidden">
    <%@ include file="/WEB-INF/jsp/fragments/app-topbar.jspf" %>

    <main class="mx-auto flex w-full max-w-[1600px] flex-1 justify-center px-4 py-8 md:px-8 md:py-10">
        <div class="flex w-full max-w-[1280px] flex-col gap-8">
            <section class="flex flex-col gap-2">
                <h1 class="text-[52px] font-extrabold leading-[1.02] tracking-tight text-slate-950">Create New Funnel</h1>
                <p class="text-[17px] leading-8 text-slate-500">Configure your marketing funnel stages and campaign mapping.</p>
            </section>

            <section class="rounded-3xl border border-slate-200 bg-white p-8 shadow-panel">
                <div class="mb-8 flex items-center gap-4">
                    <span class="flex h-10 w-10 items-center justify-center rounded-full bg-primary text-base font-bold text-white">1</span>
                    <h2 class="text-[24px] font-bold tracking-tight text-slate-950">Selection</h2>
                </div>

                <div class="grid grid-cols-1 gap-6 lg:grid-cols-2">
                    <div class="flex flex-col gap-3">
                        <label class="text-[14px] font-semibold text-slate-700" for="countrySelect">Select Country</label>
                        <div class="relative">
                            <select id="countrySelect" class="h-14 w-full appearance-none rounded-2xl border border-slate-300 bg-white px-5 text-[16px] text-slate-900 focus:border-primary focus:ring-primary">
                                <option>Select Country (e.g., TR, USA, UK, FR)</option>
                                <option>Turkey (TR)</option>
                                <option>United States (US)</option>
                                <option>United Kingdom (UK)</option>
                                <option>France (FR)</option>
                            </select>
                            <span class="material-symbols-outlined pointer-events-none absolute right-4 top-1/2 -translate-y-1/2 text-slate-400">expand_more</span>
                        </div>
                    </div>

                    <div class="flex flex-col gap-3">
                        <label class="text-[14px] font-semibold text-slate-700" for="productSelect">Select Product</label>
                        <div class="relative">
                            <select id="productSelect" class="h-14 w-full appearance-none rounded-2xl border border-slate-300 bg-white px-5 text-[16px] text-slate-900 focus:border-primary focus:ring-primary">
                                <option>Select Product (e.g., MastiPro, Actimoo)</option>
                                <option>MastiPro</option>
                                <option>Actimoo</option>
                                <option>DentalCare</option>
                            </select>
                            <span class="material-symbols-outlined pointer-events-none absolute right-4 top-1/2 -translate-y-1/2 text-slate-400">expand_more</span>
                        </div>
                    </div>
                </div>
            </section>

            <section class="flex flex-col gap-6">
                <div class="flex items-center gap-4">
                    <span class="flex h-10 w-10 items-center justify-center rounded-full bg-primary text-base font-bold text-white">2</span>
                    <h2 class="text-[24px] font-bold tracking-tight text-slate-950">Funnel Mapping</h2>
                </div>

                <div class="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-6">
                    <section class="flex min-h-[320px] flex-col gap-4 rounded-3xl border border-slate-200 bg-white p-5 shadow-panel">
                        <div class="border-b border-slate-100 pb-4">
                            <h3 class="text-[18px] font-bold leading-none text-slate-950">Awareness</h3>
                            <p class="mt-2 text-[11px] font-bold uppercase tracking-[0.18em] text-slate-400">Top of Funnel</p>
                        </div>
                        <div class="flex flex-1 flex-col gap-3">
                            <div class="flex items-center justify-between rounded-2xl border border-slate-200 bg-slate-50 px-3 py-3 text-sm font-medium text-slate-700">
                                <span>FB_Lookalike_A1</span>
                                <span class="material-symbols-outlined text-[18px] text-slate-400">close</span>
                            </div>
                            <div class="flex items-center justify-between rounded-2xl border border-slate-200 bg-slate-50 px-3 py-3 text-sm font-medium text-slate-700">
                                <span>Youtube_PreRoll</span>
                                <span class="material-symbols-outlined text-[18px] text-slate-400">close</span>
                            </div>
                        </div>
                        <button type="button" class="inline-flex h-12 w-full items-center justify-center rounded-2xl border border-primary/20 bg-primary/5 text-sm font-bold text-primary transition-colors hover:bg-primary/10">
                            <span class="material-symbols-outlined mr-2 text-[18px]">add</span>
                            Add Campaign
                        </button>
                    </section>

                    <section class="flex min-h-[320px] flex-col gap-4 rounded-3xl border border-slate-200 bg-white p-5 shadow-panel">
                        <div class="border-b border-slate-100 pb-4">
                            <h3 class="text-[18px] font-bold leading-none text-slate-950">Interest &amp; Consideration</h3>
                            <p class="mt-2 text-[11px] font-bold uppercase tracking-[0.18em] text-slate-400">Mid Funnel</p>
                        </div>
                        <div class="flex flex-1 flex-col gap-3">
                            <div class="flex items-center justify-between rounded-2xl border border-slate-200 bg-slate-50 px-3 py-3 text-sm font-medium text-slate-700">
                                <span>Blog_Retargeting</span>
                                <span class="material-symbols-outlined text-[18px] text-slate-400">close</span>
                            </div>
                        </div>
                        <button type="button" class="inline-flex h-12 w-full items-center justify-center rounded-2xl border border-primary/20 bg-primary/5 text-sm font-bold text-primary transition-colors hover:bg-primary/10">
                            <span class="material-symbols-outlined mr-2 text-[18px]">add</span>
                            Add Campaign
                        </button>
                    </section>

                    <section class="flex min-h-[320px] flex-col gap-4 rounded-3xl border border-slate-200 bg-white p-5 shadow-panel">
                        <div class="border-b border-slate-100 pb-4">
                            <h3 class="text-[18px] font-bold leading-none text-slate-950">High Intent</h3>
                            <p class="mt-2 text-[11px] font-bold uppercase tracking-[0.18em] text-slate-400">Evaluation</p>
                        </div>
                        <div class="flex flex-1 flex-col gap-3">
                            <div class="flex items-center justify-between rounded-2xl border border-slate-200 bg-slate-50 px-3 py-3 text-sm font-medium text-slate-700">
                                <span>Google_Search_Branded</span>
                            </div>
                            <div class="flex items-center justify-between rounded-2xl border border-slate-200 bg-slate-50 px-3 py-3 text-sm font-medium text-slate-700">
                                <span>G2_Referral</span>
                                <span class="material-symbols-outlined text-[18px] text-slate-400">close</span>
                            </div>
                        </div>
                        <button type="button" class="inline-flex h-12 w-full items-center justify-center rounded-2xl border border-primary/20 bg-primary/5 text-sm font-bold text-primary transition-colors hover:bg-primary/10">
                            <span class="material-symbols-outlined mr-2 text-[18px]">add</span>
                            Add Campaign
                        </button>
                    </section>

                    <section class="flex min-h-[320px] flex-col gap-4 rounded-3xl border border-slate-200 bg-white p-5 shadow-panel">
                        <div class="border-b border-slate-100 pb-4">
                            <h3 class="text-[18px] font-bold leading-none text-slate-950">Purchase / Conversion</h3>
                            <p class="mt-2 text-[11px] font-bold uppercase tracking-[0.18em] text-slate-400">Bottom of Funnel</p>
                        </div>
                        <div class="flex flex-1 flex-col gap-3">
                            <div class="flex items-center justify-between rounded-2xl border border-slate-200 bg-slate-50 px-3 py-3 text-sm font-medium text-slate-700">
                                <span>Checkout_Recovery</span>
                            </div>
                        </div>
                        <button type="button" class="inline-flex h-12 w-full items-center justify-center rounded-2xl border border-primary/20 bg-primary/5 text-sm font-bold text-primary transition-colors hover:bg-primary/10">
                            <span class="material-symbols-outlined mr-2 text-[18px]">add</span>
                            Add Campaign
                        </button>
                    </section>

                    <section class="flex min-h-[320px] flex-col gap-4 rounded-3xl border border-slate-200 bg-white p-5 shadow-panel">
                        <div class="border-b border-slate-100 pb-4">
                            <h3 class="text-[18px] font-bold leading-none text-slate-950">Loyalty</h3>
                            <p class="mt-2 text-[11px] font-bold uppercase tracking-[0.18em] text-slate-400">Post-Purchase</p>
                        </div>
                        <div class="flex flex-1 flex-col gap-3">
                            <div class="flex items-center justify-between rounded-2xl border border-slate-200 bg-slate-50 px-3 py-3 text-sm font-medium text-slate-700">
                                <span>Newsletter_Exclusive</span>
                            </div>
                        </div>
                        <button type="button" class="inline-flex h-12 w-full items-center justify-center rounded-2xl border border-primary/20 bg-primary/5 text-sm font-bold text-primary transition-colors hover:bg-primary/10">
                            <span class="material-symbols-outlined mr-2 text-[18px]">add</span>
                            Add Campaign
                        </button>
                    </section>

                    <section class="flex min-h-[320px] flex-col gap-4 rounded-3xl border border-slate-200 bg-white p-5 shadow-panel">
                        <div class="border-b border-slate-100 pb-4">
                            <h3 class="text-[18px] font-bold leading-none text-slate-950">Advocacy</h3>
                            <p class="mt-2 text-[11px] font-bold uppercase tracking-[0.18em] text-slate-400">Growth</p>
                        </div>
                        <div class="flex flex-1 flex-col items-center justify-center text-center text-slate-400">
                            <span class="material-symbols-outlined text-[40px]">campaign</span>
                            <p class="mt-3 text-sm">No campaigns added</p>
                        </div>
                        <button type="button" class="inline-flex h-12 w-full items-center justify-center rounded-2xl border border-primary/20 bg-primary/5 text-sm font-bold text-primary transition-colors hover:bg-primary/10">
                            <span class="material-symbols-outlined mr-2 text-[18px]">add</span>
                            Add Campaign
                        </button>
                    </section>
                </div>
            </section>

            <section class="flex items-center justify-end gap-4 border-t border-slate-200 pt-8 pb-12">
                <a href="${pageContext.request.contextPath}/dashboard" class="px-6 py-3 text-sm font-bold text-slate-600 transition-colors hover:text-slate-950">Cancel</a>
                <button type="button" class="inline-flex h-14 items-center justify-center rounded-2xl bg-primary px-8 text-sm font-bold text-white shadow-lg shadow-primary/20 transition-colors hover:bg-blue-600">
                    <span class="material-symbols-outlined mr-2 text-[18px]">save</span>
                    Save Funnel
                </button>
            </section>
        </div>
    </main>

    <%@ include file="/WEB-INF/jsp/fragments/app-footer.jspf" %>
</div>

<%@ include file="/WEB-INF/jsp/fragments/common-scripts.jspf" %>
</body>
</html>
