const apiClient = (() => {
    const configuredBaseUrl = localStorage.getItem("apiBaseUrl");
    const baseUrl = configuredBaseUrl && configuredBaseUrl.trim().length > 0
        ? configuredBaseUrl.trim()
        : window.location.origin;

    function request(method, path, data) {
        const token = localStorage.getItem("accessToken");
        return $.ajax({
            url: `${baseUrl}${path}`,
            method,
            contentType: "application/json",
            data: data ? JSON.stringify(data) : undefined,
            headers: token ? { Authorization: `Bearer ${token}` } : {}
        });
    }

    return {
        request,
        baseUrl
    };
})();
