<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="MarketHub Login" />
<!DOCTYPE html>
<html lang="tr">
<head>
    <%@ include file="/WEB-INF/jsp/fragments/tailwind-head.jspf" %>
    <style>
        .login-shell {
            background:
                radial-gradient(circle at top left, rgba(24, 118, 242, 0.12), transparent 30%),
                radial-gradient(circle at bottom right, rgba(59, 130, 246, 0.08), transparent 28%);
        }
    </style>
</head>
<body class="bg-background-light font-display text-slate-900">
<div class="login-shell relative min-h-screen overflow-hidden">
    <header class="relative z-10 border-b border-slate-200 bg-white/90 backdrop-blur">
        <div class="mx-auto flex max-w-[1600px] items-center px-6 py-5 md:px-8">
            <a class="flex items-center gap-3 text-primary" href="${pageContext.request.contextPath}/login" aria-label="MarketHub Login">
                <span class="material-symbols-outlined text-[38px] leading-none">hub</span>
                <span class="text-[22px] font-extrabold tracking-tight text-slate-950">MarketHub</span>
            </a>
        </div>
    </header>

    <main class="relative z-10 mx-auto flex min-h-[calc(100vh-79px)] w-full max-w-[1600px] items-center px-6 py-10 md:px-8">
        <div class="grid w-full items-center gap-10 xl:grid-cols-[minmax(0,1.1fr)_minmax(430px,520px)]">
            <section class="hidden xl:block">
                <div class="max-w-2xl">
                    <div class="inline-flex items-center rounded-full border border-blue-100 bg-blue-50 px-4 py-2 text-sm font-semibold text-primary">
                        Marketing Analytics Workspace
                    </div>
                    <h1 class="mt-6 text-[54px] font-extrabold leading-[1.02] tracking-tight text-slate-950">
                        Firma kullanicilari icin funnel odakli marketing kontrol merkezi.
                    </h1>
                    <p class="mt-5 max-w-xl text-[18px] leading-8 text-slate-500">
                        Dashboard, funnels, campaign, audience ve comparison ekranlari tek bir ortak arayuz diliyle burada bulusur.
                    </p>

                    <div class="mt-10 grid gap-5 md:grid-cols-3">
                        <article class="rounded-3xl border border-slate-200 bg-white p-6 shadow-panel">
                            <p class="text-[13px] font-semibold uppercase tracking-[0.08em] text-slate-500">Country View</p>
                            <p class="mt-3 text-[30px] font-bold tracking-tight text-slate-950">7</p>
                            <p class="mt-2 text-sm text-slate-500">Aktif ulke dashboard gorunumu</p>
                        </article>
                        <article class="rounded-3xl border border-slate-200 bg-white p-6 shadow-panel">
                            <p class="text-[13px] font-semibold uppercase tracking-[0.08em] text-slate-500">Funnels</p>
                            <p class="mt-3 text-[30px] font-bold tracking-tight text-slate-950">24</p>
                            <p class="mt-2 text-sm text-slate-500">Firma bazli urun-ulke funnel yapisi</p>
                        </article>
                        <article class="rounded-3xl border border-slate-200 bg-white p-6 shadow-panel">
                            <p class="text-[13px] font-semibold uppercase tracking-[0.08em] text-slate-500">Monthly View</p>
                            <p class="mt-3 text-[30px] font-bold tracking-tight text-slate-950">3</p>
                            <p class="mt-2 text-sm text-slate-500">Ayni ekranda son 3 donem karsilastirma</p>
                        </article>
                    </div>
                </div>
            </section>

            <section class="mx-auto w-full max-w-[520px]">
                <div class="rounded-[32px] border border-slate-200 bg-white p-8 shadow-panel md:p-10">
                    <div class="mb-8">
                        <p class="text-sm font-semibold uppercase tracking-[0.12em] text-slate-400">System Access</p>
                        <h2 class="mt-3 text-[34px] font-extrabold tracking-tight text-slate-950">Sign in to MarketHub</h2>
                        <p class="mt-3 text-[16px] leading-7 text-slate-500">
                            Firma kullanicisi veya system admin olarak giris yapabilirsiniz.
                        </p>
                    </div>

                    <form id="loginForm" class="space-y-5">
                        <div>
                            <label class="mb-2 block text-sm font-semibold text-slate-700" for="username">Kullanici Adi</label>
                            <input id="username" name="username" type="text" required
                                   class="h-14 w-full rounded-2xl border border-slate-200 bg-white px-4 text-[15px] text-slate-900 placeholder:text-slate-400 focus:border-primary focus:ring-primary"
                                   placeholder="kullanici adinizi girin">
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-semibold text-slate-700" for="password">Sifre</label>
                            <input id="password" name="password" type="password" required
                                   class="h-14 w-full rounded-2xl border border-slate-200 bg-white px-4 text-[15px] text-slate-900 placeholder:text-slate-400 focus:border-primary focus:ring-primary"
                                   placeholder="sifrenizi girin">
                        </div>

                        <div id="loginError" class="d-none rounded-2xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm font-medium text-rose-700"></div>

                        <button type="submit"
                                class="inline-flex h-14 w-full items-center justify-center rounded-2xl bg-primary px-6 text-[15px] font-semibold text-white transition-transform hover:scale-[1.01] hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-primary focus:ring-offset-2">
                            Giris Yap
                        </button>
                    </form>
                </div>
            </section>
        </div>
    </main>
</div>

<%@ include file="/WEB-INF/jsp/fragments/common-scripts.jspf" %>
</body>
</html>
