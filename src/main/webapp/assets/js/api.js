const apiClient = (() => {
    const baseUrl = localStorage.getItem("apiBaseUrl") || "http://localhost:8080";

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
