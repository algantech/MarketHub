$(function () {
    const loginForm = $("#loginForm");
    const logoutButton = $("#logoutButton");
    const token = localStorage.getItem("accessToken");

    if (loginForm.length) {
        loginForm.on("submit", function (event) {
            event.preventDefault();

            $("#loginError").addClass("d-none").text("");

            apiClient.request("POST", "/api/auth/login", {
                username: $("#username").val(),
                password: $("#password").val()
            }).done(function (response) {
                localStorage.setItem("accessToken", response.data.accessToken);
                redirectToLandingPage(response.data.user);
            }).fail(function (xhr) {
                const response = xhr.responseJSON;
                const message = response?.message || "Giris sirasinda hata olustu";
                $("#loginError").removeClass("d-none").text(message);
            });
        });
    }

    if ($("#profileBox").length) {
        if (!token) {
            window.location.href = "login.html";
            return;
        }

        apiClient.request("GET", "/api/auth/me").done(function (response) {
            const user = response.data;
            if (user.userType === "SYSTEM_ADMIN") {
                window.location.href = "system-admin.html";
                return;
            }
            $("#welcomeText").text(`${user.fullName} olarak giris yapildi`);
            $("#profileBox").text(JSON.stringify(user, null, 2));
        }).fail(function () {
            clearSessionAndRedirect();
        });
    }

    if (logoutButton.length) {
        logoutButton.on("click", function () {
            clearSessionAndRedirect();
        });
    }
});

function redirectToLandingPage(user) {
    if (user?.userType === "SYSTEM_ADMIN") {
        window.location.href = "system-admin.html";
        return;
    }
    window.location.href = "dashboard.html";
}

function clearSessionAndRedirect() {
    localStorage.removeItem("accessToken");
    window.location.href = "login.html";
}
