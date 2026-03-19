<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Comparison - Campaigns" />
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
            <h1 class="text-[48px] font-extrabold tracking-tight text-slate-950">Campaign Comparison</h1>
            <p class="text-[17px] text-slate-500">Analyze performance across multiple active campaigns.</p>
        </section>

        <%@ include file="/WEB-INF/jsp/fragments/comparison-tabs.jspf" %>

        <section class="grid grid-cols-[220px_repeat(4,minmax(0,1fr))] gap-6">
            <div class="pt-[180px] text-[12px] font-bold uppercase tracking-[0.14em] text-slate-400">
                <div class="h-[170px]"></div>
                <div class="flex h-[171px] items-center">Ad Spend</div>
                <div class="flex h-[171px] items-center">Impressions</div>
                <div class="flex h-[171px] items-center">Clicks</div>
                <div class="flex h-[171px] items-center">CTR</div>
                <div class="flex h-[171px] items-center">Leads</div>
                <div class="flex h-[171px] items-center">Final Conv.</div>
            </div>

            <article class="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-panel">
                <div class="border-b border-slate-100 p-7">
                    <div class="flex items-start justify-between gap-4">
                        <span class="rounded-lg bg-emerald-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-emerald-700">Active</span>
                        <span class="material-symbols-outlined text-slate-400">more_vert</span>
                    </div>
                    <h2 class="mt-6 text-[22px] font-bold tracking-tight text-slate-950">Prospective - US</h2>
                    <p class="mt-2 text-[15px] text-slate-500">ID: CAM-98231</p>
                </div>
                <div class="divide-y divide-slate-100">
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8">
                        <div><p class="text-[22px] font-bold text-slate-950">$12,450</p><p class="mt-2 text-[15px] text-slate-400">$9,200 / $8,800</p></div>
                        <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-3"></span><span class="w-3 rounded-sm bg-primary/40 h-6"></span><span class="w-3 rounded-sm bg-primary/70 h-9"></span><span class="w-3 rounded-sm bg-primary h-7"></span></div>
                    </div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8">
                        <div><p class="text-[22px] font-bold text-slate-950">1.2M</p><p class="mt-2 text-[15px] text-slate-400">1.1M / 1.0M</p></div>
                        <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-4"></span><span class="w-3 rounded-sm bg-primary/40 h-8"></span><span class="w-3 rounded-sm bg-primary/70 h-9"></span><span class="w-3 rounded-sm bg-primary h-7"></span></div>
                    </div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8">
                        <div><p class="text-[22px] font-bold text-slate-950">42,300</p><p class="mt-2 text-[15px] text-slate-400">38k / 35k</p></div>
                        <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-4"></span><span class="w-3 rounded-sm bg-primary/40 h-8"></span><span class="w-3 rounded-sm bg-primary/70 h-6"></span><span class="w-3 rounded-sm bg-primary h-10"></span></div>
                    </div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8">
                        <div><p class="text-[22px] font-bold text-slate-950">3.52%</p><p class="mt-2 text-[15px] text-slate-400">3.2% / 3.0%</p></div>
                        <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-3"></span><span class="w-3 rounded-sm bg-primary/40 h-6"></span><span class="w-3 rounded-sm bg-primary/70 h-8"></span><span class="w-3 rounded-sm bg-primary h-10"></span></div>
                    </div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8">
                        <div><p class="text-[22px] font-bold text-slate-950">842</p><p class="mt-2 text-[15px] text-slate-400">720 / 680</p></div>
                        <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-4"></span><span class="w-3 rounded-sm bg-primary/40 h-6"></span><span class="w-3 rounded-sm bg-primary/70 h-8"></span><span class="w-3 rounded-sm bg-primary h-10"></span></div>
                    </div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8">
                        <div><p class="text-[22px] font-bold text-slate-950">156</p><p class="mt-2 text-[15px] text-slate-400">140 / 132</p></div>
                        <div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-3"></span><span class="w-3 rounded-sm bg-primary/40 h-8"></span><span class="w-3 rounded-sm bg-primary/70 h-6"></span><span class="w-3 rounded-sm bg-primary h-10"></span></div>
                    </div>
                </div>
            </article>

            <article class="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-panel">
                <div class="border-b border-slate-100 p-7">
                    <div class="flex items-start justify-between gap-4">
                        <span class="rounded-lg bg-emerald-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-emerald-700">Active</span>
                        <span class="material-symbols-outlined text-slate-400">more_vert</span>
                    </div>
                    <h2 class="mt-6 text-[22px] font-bold tracking-tight text-slate-950">Retargeting - LAL</h2>
                    <p class="mt-2 text-[15px] text-slate-500">ID: CAM-98442</p>
                </div>
                <div class="divide-y divide-slate-100">
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">$8,200</p><p class="mt-2 text-[15px] text-slate-400">$8,500 / $7,900</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-6"></span><span class="w-3 rounded-sm bg-primary/40 h-10"></span><span class="w-3 rounded-sm bg-primary/70 h-8"></span><span class="w-3 rounded-sm bg-primary h-5"></span></div></div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">640k</p><p class="mt-2 text-[15px] text-slate-400">680k / 710k</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-10"></span><span class="w-3 rounded-sm bg-primary/40 h-7"></span><span class="w-3 rounded-sm bg-primary/70 h-5"></span><span class="w-3 rounded-sm bg-primary h-5"></span></div></div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">18,500</p><p class="mt-2 text-[15px] text-slate-400">17k / 16k</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-4"></span><span class="w-3 rounded-sm bg-primary/40 h-7"></span><span class="w-3 rounded-sm bg-primary/70 h-10"></span><span class="w-3 rounded-sm bg-primary h-5"></span></div></div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">2.89%</p><p class="mt-2 text-[15px] text-slate-400">2.5% / 2.2%</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-3"></span><span class="w-3 rounded-sm bg-primary/40 h-5"></span><span class="w-3 rounded-sm bg-primary/70 h-7"></span><span class="w-3 rounded-sm bg-primary h-10"></span></div></div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">1,120</p><p class="mt-2 text-[15px] text-slate-400">980 / 890</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-4"></span><span class="w-3 rounded-sm bg-primary/40 h-6"></span><span class="w-3 rounded-sm bg-primary/70 h-8"></span><span class="w-3 rounded-sm bg-primary h-10"></span></div></div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">312</p><p class="mt-2 text-[15px] text-slate-400">290 / 280</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-5"></span><span class="w-3 rounded-sm bg-primary/40 h-7"></span><span class="w-3 rounded-sm bg-primary/70 h-6"></span><span class="w-3 rounded-sm bg-primary h-10"></span></div></div>
                </div>
            </article>

            <article class="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-panel">
                <div class="border-b border-slate-100 p-7">
                    <div class="flex items-start justify-between gap-4">
                        <span class="rounded-lg bg-emerald-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-emerald-700">Active</span>
                        <span class="material-symbols-outlined text-slate-400">more_vert</span>
                    </div>
                    <h2 class="mt-6 text-[22px] font-bold tracking-tight text-slate-950">Interest - Tech</h2>
                    <p class="mt-2 text-[15px] text-slate-500">ID: CAM-98510</p>
                </div>
                <div class="divide-y divide-slate-100">
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">$5,400</p><p class="mt-2 text-[15px] text-slate-400">$3.1k / $3.0k</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-3"></span><span class="w-3 rounded-sm bg-primary/40 h-5"></span><span class="w-3 rounded-sm bg-primary/70 h-7"></span><span class="w-3 rounded-sm bg-primary h-10"></span></div></div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">410k</p><p class="mt-2 text-[15px] text-slate-400">350k / 320k</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-4"></span><span class="w-3 rounded-sm bg-primary/40 h-7"></span><span class="w-3 rounded-sm bg-primary/70 h-6"></span><span class="w-3 rounded-sm bg-primary h-10"></span></div></div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">12,100</p><p class="mt-2 text-[15px] text-slate-400">14k / 15k</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-10"></span><span class="w-3 rounded-sm bg-primary/40 h-8"></span><span class="w-3 rounded-sm bg-primary/70 h-4"></span><span class="w-3 rounded-sm bg-primary h-3"></span></div></div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">2.95%</p><p class="mt-2 text-[15px] text-slate-400">3.2% / 3.4%</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-10"></span><span class="w-3 rounded-sm bg-primary/40 h-7"></span><span class="w-3 rounded-sm bg-primary/70 h-4"></span><span class="w-3 rounded-sm bg-primary h-3"></span></div></div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">310</p><p class="mt-2 text-[15px] text-slate-400">280 / 260</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-4"></span><span class="w-3 rounded-sm bg-primary/40 h-6"></span><span class="w-3 rounded-sm bg-primary/70 h-7"></span><span class="w-3 rounded-sm bg-primary h-10"></span></div></div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">48</p><p class="mt-2 text-[15px] text-slate-400">52 / 50</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-3"></span><span class="w-3 rounded-sm bg-primary/40 h-10"></span><span class="w-3 rounded-sm bg-primary/70 h-7"></span><span class="w-3 rounded-sm bg-primary h-5"></span></div></div>
                </div>
            </article>

            <article class="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-panel">
                <div class="border-b border-slate-100 p-7">
                    <div class="flex items-start justify-between gap-4">
                        <span class="rounded-lg bg-emerald-100 px-3 py-1 text-[12px] font-bold uppercase tracking-[0.06em] text-emerald-700">Active</span>
                        <span class="material-symbols-outlined text-slate-400">more_vert</span>
                    </div>
                    <h2 class="mt-6 text-[22px] font-bold tracking-tight text-slate-950">Video Views</h2>
                    <p class="mt-2 text-[15px] text-slate-500">ID: CAM-98115</p>
                </div>
                <div class="divide-y divide-slate-100">
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">$2,100</p><p class="mt-2 text-[15px] text-slate-400">$2.5k / $2.8k</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-10"></span><span class="w-3 rounded-sm bg-primary/40 h-7"></span><span class="w-3 rounded-sm bg-primary/70 h-4"></span><span class="w-3 rounded-sm bg-primary h-3"></span></div></div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">890k</p><p class="mt-2 text-[15px] text-slate-400">810k / 790k</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-4"></span><span class="w-3 rounded-sm bg-primary/40 h-5"></span><span class="w-3 rounded-sm bg-primary/70 h-7"></span><span class="w-3 rounded-sm bg-primary h-10"></span></div></div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">5,200</p><p class="mt-2 text-[15px] text-slate-400">4.8k / 4.5k</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-4"></span><span class="w-3 rounded-sm bg-primary/40 h-4"></span><span class="w-3 rounded-sm bg-primary/70 h-4"></span><span class="w-3 rounded-sm bg-primary h-10"></span></div></div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">0.58%</p><p class="mt-2 text-[15px] text-slate-400">0.5% / 0.4%</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-3"></span><span class="w-3 rounded-sm bg-primary/40 h-5"></span><span class="w-3 rounded-sm bg-primary/70 h-7"></span><span class="w-3 rounded-sm bg-primary h-10"></span></div></div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">42</p><p class="mt-2 text-[15px] text-slate-400">28 / 15</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-3"></span><span class="w-3 rounded-sm bg-primary/40 h-5"></span><span class="w-3 rounded-sm bg-primary/70 h-7"></span><span class="w-3 rounded-sm bg-primary h-10"></span></div></div>
                    <div class="flex min-h-[171px] items-center justify-between gap-4 px-7 py-8"><div><p class="text-[22px] font-bold text-slate-950">12</p><p class="mt-2 text-[15px] text-slate-400">8 / 2</p></div><div class="flex h-10 w-20 items-end gap-1 rounded-xl bg-primary/10 px-2 py-2"><span class="w-3 rounded-sm bg-primary/20 h-3"></span><span class="w-3 rounded-sm bg-primary/40 h-3"></span><span class="w-3 rounded-sm bg-primary/70 h-3"></span><span class="w-3 rounded-sm bg-primary h-10"></span></div></div>
                </div>
            </article>
        </section>
    </main>

    <%@ include file="/WEB-INF/jsp/fragments/app-footer.jspf" %>
</div>

<%@ include file="/WEB-INF/jsp/fragments/common-scripts.jspf" %>
</body>
</html>
