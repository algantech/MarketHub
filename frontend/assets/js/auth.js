$(function () {
    const loginForm = $("#loginForm");
    const logoutButton = $("#logoutButton");

    if (loginForm.length) {
        loginForm.on("submit", function (event) {
            event.preventDefault();

            $("#loginError").addClass("d-none").text("");

            apiClient.request("POST", "/api/auth/login", {
                username: $("#username").val(),
                password: $("#password").val()
            }).done(function (response) {
                localStorage.setItem("accessToken", response.data.accessToken);
                window.location.href = "dashboard.html";
            }).fail(function (xhr) {
                const response = xhr.responseJSON;
                const message = response?.message || "Giris sirasinda hata olustu";
                $("#loginError").removeClass("d-none").text(message);
            });
        });
    }

    if ($("#profileBox").length) {
        const token = localStorage.getItem("accessToken");
        if (!token) {
            window.location.href = "login.html";
            return;
        }

        apiClient.request("GET", "/api/auth/me").done(function (response) {
            const user = response.data;
            $("#welcomeText").text(`${user.fullName} olarak giris yapildi`);
            $("#profileBox").text(JSON.stringify(user, null, 2));
        }).fail(function () {
            localStorage.removeItem("accessToken");
            window.location.href = "login.html";
        });
    }

    if (logoutButton.length) {
        logoutButton.on("click", function () {
            localStorage.removeItem("accessToken");
            window.location.href = "login.html";
        });
    }
});
