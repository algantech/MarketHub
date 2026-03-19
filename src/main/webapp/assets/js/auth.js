$(function () {
    const loginForm = $("#loginForm");
    const logoutButton = $("#logoutButton");
    const token = localStorage.getItem("accessToken");
    const authenticatedPage = $("body").data("authenticatedPage") === true;
    const profileMenuButton = $("#profileMenuButton");
    const profileMenu = $("#profileMenu");

    if (loginForm.length) {
        loginForm.on("submit", function (event) {
            event.preventDefault();

            $("#loginError").addClass("d-none").text("");

            apiClient.request("POST", "/api/auth/login", {
                username: $("#username").val(),
                password: $("#password").val()
            }, { skipAuthRefresh: true, skipAuthorization: true }).done(function (response) {
                apiClient.storeSession(response.data);
                redirectToLandingPage(response.data.user);
            }).fail(function (xhr) {
                const response = xhr.responseJSON;
                const message = response?.message || "Giris sirasinda hata olustu";
                $("#loginError").removeClass("d-none").text(message);
            });
        });
    }

    if (authenticatedPage || $("#profileBox").length) {
        if (!token) {
            window.location.href = "/login";
            return;
        }

        apiClient.request("GET", "/api/auth/me").done(function (response) {
            const user = response.data;
            if (user.userType === "SYSTEM_ADMIN") {
                window.location.href = "/system-admin";
                return;
            }
            if ($("#welcomeText").length) {
                $("#welcomeText").text(`${user.fullName} olarak giris yapildi`);
            }
            if ($("#profileBox").length) {
                $("#profileBox").text(JSON.stringify(user, null, 2));
            }
            renderSharedProfile(user);
            document.dispatchEvent(new CustomEvent("markethub:user-loaded", {
                detail: user
            }));
        }).fail(function () {
            clearSessionAndRedirect();
        });
    }

    if (logoutButton.length) {
        logoutButton.on("click", function () {
            clearSessionAndRedirect();
        });
    }

    if (profileMenuButton.length && profileMenu.length) {
        profileMenuButton.on("click", function () {
            const isHidden = profileMenu.hasClass("hidden");
            profileMenu.toggleClass("hidden", !isHidden);
            profileMenuButton.attr("aria-expanded", String(isHidden));
        });

        $(document).on("click", function (event) {
            if (!$(event.target).closest("#profileMenuButton, #profileMenu").length) {
                profileMenu.addClass("hidden");
                profileMenuButton.attr("aria-expanded", "false");
            }
        });
    }
});

function redirectToLandingPage(user) {
    if (user?.userType === "SYSTEM_ADMIN") {
        window.location.href = "/system-admin";
        return;
    }
    window.location.href = "/dashboard";
}

function clearSessionAndRedirect() {
    const refreshToken = localStorage.getItem("refreshToken");
    const finalize = function () {
        apiClient.clearSession();
        window.location.href = "/login";
    };

    if (!refreshToken) {
        finalize();
        return;
    }

    apiClient.request("POST", "/api/auth/logout", { refreshToken }, {
        skipAuthRefresh: true,
        skipAuthorization: true
    }).always(finalize);
}

function renderSharedProfile(user) {
    if (!user) {
        return;
    }

    const initials = (user.fullName || user.username || "MH")
        .split(/\s+/)
        .filter(Boolean)
        .slice(0, 2)
        .map(function (part) {
            return part.charAt(0);
        })
        .join("")
        .toUpperCase() || "MH";

    if ($("#profileInitials").length) {
        $("#profileInitials").text(initials);
    }
    if ($("#profileName").length) {
        $("#profileName").text(user.fullName || user.username || "MarketHub User");
    }
    if ($("#profileEmail").length) {
        $("#profileEmail").text(user.email || user.username || "");
    }
}
