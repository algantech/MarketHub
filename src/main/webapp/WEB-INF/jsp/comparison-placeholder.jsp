<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Comparison" />
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

        <section class="rounded-3xl border border-slate-200 bg-white p-10 shadow-panel">
            <h2 class="text-[28px] font-bold tracking-tight text-slate-950">${comparisonLabel} Comparison</h2>
            <p class="mt-4 max-w-3xl text-[17px] leading-9 text-slate-600">Bu alt ekranin detay mockup'i henuz eklenmedi. Sira buna geldiginde ayni comparison yapisi icinde bu sekmeyi ayri olarak tamamlayacagim.</p>
        </section>
    </main>

    <%@ include file="/WEB-INF/jsp/fragments/app-footer.jspf" %>
</div>

<%@ include file="/WEB-INF/jsp/fragments/common-scripts.jspf" %>
</body>
</html>
