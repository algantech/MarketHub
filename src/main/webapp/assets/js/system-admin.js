$(function () {
    if (!$("#companyList").length) {
        return;
    }

    const state = {
        currentUser: null,
        companies: [],
        users: [],
        selectedCompanyId: null
    };

    const elements = {
        adminWelcomeText: $("#adminWelcomeText"),
        adminAlert: $("#adminAlert"),
        companyId: $("#companyId"),
        companyName: $("#companyName"),
        companyActive: $("#companyActive"),
        companyList: $("#companyList"),
        companyForm: $("#companyForm"),
        cancelCompanyButton: $("#cancelCompanyButton"),
        newCompanyButton: $("#newCompanyButton"),
        selectedCompanyText: $("#selectedCompanyText"),
        newUserButton: $("#newUserButton"),
        userId: $("#userId"),
        userFullName: $("#userFullName"),
        userUsername: $("#userUsername"),
        userEmail: $("#userEmail"),
        userPassword: $("#userPassword"),
        userActive: $("#userActive"),
        userForm: $("#userForm"),
        saveUserButton: $("#saveUserButton"),
        cancelUserButton: $("#cancelUserButton"),
        userTableBody: $("#userTableBody")
    };

    loadSession();
    bindEvents();

    function bindEvents() {
        elements.companyForm.on("submit", saveCompany);
        elements.cancelCompanyButton.on("click", resetCompanyForm);
        elements.newCompanyButton.on("click", resetCompanyForm);

        elements.userForm.on("submit", saveUser);
        elements.cancelUserButton.on("click", resetUserForm);
        elements.newUserButton.on("click", function () {
            resetUserForm();
            elements.userFullName.trigger("focus");
        });

        elements.companyList.on("click", "[data-company-select]", function () {
            selectCompany($(this).data("companySelect"));
        });

        elements.companyList.on("click", "[data-company-edit]", function (event) {
            event.stopPropagation();
            populateCompanyForm($(this).data("companyEdit"));
        });

        elements.companyList.on("click", "[data-company-delete]", function (event) {
            event.stopPropagation();
            deleteCompany($(this).data("companyDelete"));
        });

        elements.userTableBody.on("click", "[data-user-edit]", function () {
            populateUserForm($(this).data("userEdit"));
        });

        elements.userTableBody.on("click", "[data-user-delete]", function () {
            deleteUser($(this).data("userDelete"));
        });
    }

    function loadSession() {
        apiClient.request("GET", "/api/auth/me").done(function (response) {
            state.currentUser = response.data;
            if (state.currentUser.userType !== "SYSTEM_ADMIN") {
                window.location.href = "dashboard";
                return;
            }

            elements.adminWelcomeText.text(`${state.currentUser.fullName} olarak giris yapildi`);
            loadCompanies();
        }).fail(function () {
            clearSessionAndRedirect();
        });
    }

    function loadCompanies(preferredCompanyId) {
        apiClient.request("GET", "/api/system/companies").done(function (response) {
            state.companies = response.data || [];
            renderCompanies();

            const nextCompanyId = resolveNextCompanyId(preferredCompanyId);
            if (nextCompanyId) {
                selectCompany(nextCompanyId);
            } else {
                state.selectedCompanyId = null;
                renderCompanies();
                renderUsers([]);
                updateUserSectionState();
            }
        }).fail(handleRequestError);
    }

    function loadUsers(companyId) {
        apiClient.request("GET", `/api/system/users?companyId=${encodeURIComponent(companyId)}`).done(function (response) {
            state.users = response.data || [];
            renderUsers(state.users);
        }).fail(handleRequestError);
    }

    function saveCompany(event) {
        event.preventDefault();
        hideAlert();

        const companyId = elements.companyId.val();
        const payload = {
            name: elements.companyName.val()
        };

        if (companyId) {
            payload.active = elements.companyActive.is(":checked");
        }

        const method = companyId ? "PUT" : "POST";
        const path = companyId ? `/api/system/companies/${companyId}` : "/api/system/companies";

        apiClient.request(method, path, payload).done(function (response) {
            showAlert("success", response.message || "Firma kaydedildi");
            resetCompanyForm();
            loadCompanies(companyId || response.data.id);
        }).fail(handleRequestError);
    }

    function saveUser(event) {
        event.preventDefault();
        hideAlert();

        if (!state.selectedCompanyId) {
            showAlert("danger", "Once bir firma seciniz");
            return;
        }

        const roles = $(".user-role:checked").map(function () {
            return $(this).val();
        }).get();

        const userId = elements.userId.val();
        const rawPassword = elements.userPassword.val();
        const payload = {
            companyId: state.selectedCompanyId,
            username: elements.userUsername.val(),
            password: rawPassword,
            fullName: elements.userFullName.val(),
            email: elements.userEmail.val(),
            roles
        };

        if (userId) {
            payload.password = rawPassword && rawPassword.trim().length > 0 ? rawPassword : null;
            payload.active = elements.userActive.is(":checked");
        }

        const method = userId ? "PUT" : "POST";
        const path = userId ? `/api/system/users/${userId}` : "/api/system/users";

        apiClient.request(method, path, payload).done(function (response) {
            showAlert("success", response.message || "Kullanici kaydedildi");
            resetUserForm();
            loadUsers(state.selectedCompanyId);
        }).fail(handleRequestError);
    }

    function selectCompany(companyId) {
        state.selectedCompanyId = companyId;
        renderCompanies();
        resetUserForm();
        updateUserSectionState();

        const company = findCompany(companyId);
        elements.selectedCompanyText.text(company ? `${company.name} kullanicilari` : "Bir firma seciniz");

        if (companyId) {
            loadUsers(companyId);
        }
    }

    function populateCompanyForm(companyId) {
        const company = findCompany(companyId);
        if (!company) {
            return;
        }

        elements.companyId.val(company.id);
        elements.companyName.val(company.name);
        elements.companyActive.prop("checked", company.active);
        selectCompany(company.id);
    }

    function populateUserForm(userId) {
        const user = state.users.find(function (item) {
            return item.id === userId;
        });
        if (!user) {
            return;
        }

        elements.userId.val(user.id);
        elements.userFullName.val(user.fullName);
        elements.userUsername.val(user.username);
        elements.userEmail.val(user.email);
        elements.userPassword.val("");
        elements.userActive.prop("checked", user.active);
        $(".user-role").prop("checked", false);
        (user.roles || []).forEach(function (role) {
            $(`.user-role[value='${role}']`).prop("checked", true);
        });
    }

    function deleteCompany(companyId) {
        const company = findCompany(companyId);
        if (!company) {
            return;
        }

        if (!window.confirm(`"${company.name}" firmasini silmek istiyor musun?`)) {
            return;
        }

        apiClient.request("DELETE", `/api/system/companies/${companyId}`).done(function (response) {
            showAlert("success", response.message || "Firma silindi");
            if (state.selectedCompanyId === companyId) {
                state.selectedCompanyId = null;
            }
            resetCompanyForm();
            resetUserForm();
            loadCompanies();
        }).fail(handleRequestError);
    }

    function deleteUser(userId) {
        const user = state.users.find(function (item) {
            return item.id === userId;
        });
        if (!user) {
            return;
        }

        if (!window.confirm(`"${user.fullName}" kullanicisini silmek istiyor musun?`)) {
            return;
        }

        apiClient.request("DELETE", `/api/system/users/${userId}`).done(function (response) {
            showAlert("success", response.message || "Kullanici silindi");
            resetUserForm();
            loadUsers(state.selectedCompanyId);
        }).fail(handleRequestError);
    }

    function renderCompanies() {
        if (state.companies.length === 0) {
            elements.companyList.html("<div class='text-secondary small'>Henuz firma yok.</div>");
            return;
        }

        const html = state.companies.map(function (company) {
            const activeClass = company.id === state.selectedCompanyId ? "active" : "";
            const statusBadge = company.active
                ? "<span class='badge text-bg-success'>Aktif</span>"
                : "<span class='badge text-bg-secondary'>Pasif</span>";

            return `
                <div class="list-group-item company-row ${activeClass}">
                    <div class="d-flex justify-content-between align-items-start gap-2">
                        <button type="button" class="btn btn-link p-0 text-start text-decoration-none company-select-button" data-company-select="${company.id}">
                            <div class="fw-semibold">${escapeHtml(company.name)}</div>
                            <div class="mt-1">${statusBadge}</div>
                        </button>
                        <div class="btn-group btn-group-sm">
                            <button type="button" class="btn btn-outline-secondary" data-company-edit="${company.id}">Duzenle</button>
                            <button type="button" class="btn btn-outline-danger" data-company-delete="${company.id}">Sil</button>
                        </div>
                    </div>
                </div>
            `;
        }).join("");

        elements.companyList.html(html);
    }

    function renderUsers(users) {
        if (!state.selectedCompanyId) {
            elements.userTableBody.html("<tr><td class='text-secondary' colspan='6'>Bir firma seciniz.</td></tr>");
            return;
        }

        if (users.length === 0) {
            elements.userTableBody.html("<tr><td class='text-secondary' colspan='6'>Bu firmada kullanici yok.</td></tr>");
            return;
        }

        const rows = users.map(function (user) {
            return `
                <tr>
                    <td>${escapeHtml(user.fullName)}</td>
                    <td>${escapeHtml(user.username)}</td>
                    <td>${escapeHtml(user.email)}</td>
                    <td>${escapeHtml((user.roles || []).join(", "))}</td>
                    <td>${user.active ? "<span class='badge text-bg-success'>Aktif</span>" : "<span class='badge text-bg-secondary'>Pasif</span>"}</td>
                    <td class="text-end">
                        <div class="btn-group btn-group-sm">
                            <button type="button" class="btn btn-outline-secondary" data-user-edit="${user.id}">Duzenle</button>
                            <button type="button" class="btn btn-outline-danger" data-user-delete="${user.id}">Sil</button>
                        </div>
                    </td>
                </tr>
            `;
        }).join("");

        elements.userTableBody.html(rows);
    }

    function updateUserSectionState() {
        const enabled = Boolean(state.selectedCompanyId);
        elements.newUserButton.prop("disabled", !enabled);
        elements.saveUserButton.prop("disabled", !enabled);
        elements.cancelUserButton.prop("disabled", !enabled);

        if (!enabled) {
            resetUserForm();
        }
    }

    function resetCompanyForm() {
        elements.companyId.val("");
        elements.companyName.val("");
        elements.companyActive.prop("checked", true);
    }

    function resetUserForm() {
        elements.userId.val("");
        elements.userFullName.val("");
        elements.userUsername.val("");
        elements.userEmail.val("");
        elements.userPassword.val("");
        elements.userActive.prop("checked", true);
        $(".user-role").prop("checked", false);
    }

    function handleRequestError(xhr) {
        showAlert("danger", extractErrorMessage(xhr));
    }

    function showAlert(type, message) {
        elements.adminAlert
            .removeClass("d-none alert-success alert-danger alert-warning")
            .addClass(`alert-${type}`)
            .text(message);
    }

    function hideAlert() {
        elements.adminAlert.addClass("d-none").text("").removeClass("alert-success alert-danger alert-warning");
    }

    function extractErrorMessage(xhr) {
        const response = xhr.responseJSON;
        if (!response) {
            return "Islem sirasinda hata olustu";
        }
        if (Array.isArray(response.details) && response.details.length > 0) {
            return response.details.map(function (item) {
                return `${item.field}: ${item.message}`;
            }).join(" | ");
        }
        return response.message || "Islem sirasinda hata olustu";
    }

    function resolveNextCompanyId(preferredCompanyId) {
        if (preferredCompanyId && findCompany(preferredCompanyId)) {
            return preferredCompanyId;
        }
        if (state.selectedCompanyId && findCompany(state.selectedCompanyId)) {
            return state.selectedCompanyId;
        }
        return state.companies.length > 0 ? state.companies[0].id : null;
    }

    function findCompany(companyId) {
        return state.companies.find(function (item) {
            return item.id === companyId;
        });
    }

    function escapeHtml(value) {
        return $("<div>").text(value || "").html();
    }
});
