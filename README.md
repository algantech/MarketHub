# MarketHub

Bu repo, `backend` ve `frontend` klasorlerinden olusan ayrik bir yapi ile baslatildi.

## Yapi

- `backend`: Spring Boot + MongoDB + JWT tabanli REST API
- `frontend`: Bootstrap/jQuery tabanli statik istemci iskeleti

## Konfigurasyon

Backend ayarlari dosyadan okunur:

- `backend/src/main/resources/application.yml`
- `backend/src/main/resources/application-dev.yml`
- `backend/src/main/resources/application-test.yml`

Ortam bazli degerler environment variable ile override edilebilir:

- `SERVER_PORT`
- `MONGODB_URI`
- `JWT_SECRET`
- `JWT_EXPIRATION_SECONDS`
- `JWT_ISSUER`
- `CORS_ALLOWED_ORIGINS`
- `SYSTEM_ADMIN_USERNAME`
- `SYSTEM_ADMIN_PASSWORD`
- `SYSTEM_ADMIN_FULL_NAME`
- `SYSTEM_ADMIN_EMAIL`

## Ilk kapsam

Hazirlanan ilk iskelet su senaryoyu kapsar:

- Sistem acilisinda bir `SYSTEM_ADMIN` kullanicisinin seed edilmesi
- `SYSTEM_ADMIN` girisi
- `SYSTEM_ADMIN` tarafindan firma olusturma
- `SYSTEM_ADMIN` tarafindan firma kullanicisi olusturma
- Giris yapan kullanicinin kendi profilini okuma

## Not

Bu ortamda `mvn` kurulu olmadigi icin Maven build burada calistirilmadi. Dosya yapisi Maven tabanli devam edecek sekilde hazirlandi.
