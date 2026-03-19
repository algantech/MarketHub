const apiClient = (() => {
    const configuredBaseUrl = localStorage.getItem("apiBaseUrl");
    const baseUrl = configuredBaseUrl && configuredBaseUrl.trim().length > 0
        ? configuredBaseUrl.trim()
        : window.location.origin;
    let refreshPromise = null;

    function buildAjaxOptions(method, path, data, options) {
        const token = localStorage.getItem("accessToken");
        const headers = {};
        if (token && !options.skipAuthorization) {
            headers.Authorization = `Bearer ${token}`;
        }

        return {
            url: `${baseUrl}${path}`,
            method,
            contentType: "application/json",
            data: data ? JSON.stringify(data) : undefined,
            headers
        };
    }

    function executeRequest(method, path, data, options) {
        return $.ajax(buildAjaxOptions(method, path, data, options));
    }

    function request(method, path, data, options = {}) {
        const requestOptions = Object.assign({
            skipAuthRefresh: false,
            skipAuthorization: false
        }, options);

        const deferred = $.Deferred();

        executeRequest(method, path, data, requestOptions)
            .done(deferred.resolve)
            .fail(function (xhr) {
                const shouldRefresh = xhr.status === 401 &&
                    !requestOptions.skipAuthRefresh &&
                    path !== "/api/auth/refresh" &&
                    path !== "/api/auth/login" &&
                    Boolean(localStorage.getItem("refreshToken"));

                if (!shouldRefresh) {
                    deferred.reject(xhr);
                    return;
                }

                refreshAccessToken()
                    .done(function () {
                        executeRequest(method, path, data, requestOptions)
                            .done(deferred.resolve)
                            .fail(deferred.reject);
                    })
                    .fail(function () {
                        clearSession();
                        deferred.reject(xhr);
                    });
            });

        return deferred.promise();
    }

    function refreshAccessToken() {
        if (refreshPromise) {
            return refreshPromise;
        }

        const refreshToken = localStorage.getItem("refreshToken");
        if (!refreshToken) {
            return $.Deferred().reject().promise();
        }

        refreshPromise = $.ajax({
            url: `${baseUrl}/api/auth/refresh`,
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({ refreshToken })
        }).done(function (response) {
            storeSession(response.data);
        }).always(function () {
            refreshPromise = null;
        });

        return refreshPromise;
    }

    function storeSession(authResponse) {
        localStorage.setItem("accessToken", authResponse.accessToken);
        localStorage.setItem("refreshToken", authResponse.refreshToken);
    }

    function clearSession() {
        localStorage.removeItem("accessToken");
        localStorage.removeItem("refreshToken");
    }

    return {
        request,
        baseUrl,
        storeSession,
        clearSession
    };
})();
