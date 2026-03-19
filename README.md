# MarketHub

Bu repo, Eclipse'te tek Maven proje olarak acilabilecek sekilde duzenlendi.

## Yapi

- `src/main/java`: Spring Boot + MongoDB + JWT tabanli REST API
- `src/main/resources`: uygulama konfigurasyonlari
- `src/main/webapp`: Bootstrap/jQuery tabanli istemci dosyalari
- `src/test/java`: testler
- `docs`: teknik dokumanlar

## Paketler

- `audit`: audit log modeli, repository ve servis
- `mapper`: domain -> response donusumleri
- `util`: normalization ve security yardimcilari
- `validation`: ozel bean validation kurallari

## Konfigurasyon

Backend ayarlari dosyadan okunur:

- `src/main/resources/application.yml`
- `src/main/resources/application-dev.yml`
- `src/main/resources/application-test.yml`

Ortam bazli degerler environment variable ile override edilebilir:

- `SERVER_PORT`
- `MONGODB_URI`
- `JWT_SECRET`
- `JWT_ACCESS_EXPIRATION_SECONDS`
- `JWT_REFRESH_EXPIRATION_SECONDS`
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
- `refresh token` ile session yenileme
- `logout` ile refresh token iptali
- `roles` endpointi
- `SYSTEM_ADMIN` tarafindan firma CRUD islemleri
- `SYSTEM_ADMIN` tarafindan firma kullanicisi CRUD islemleri
- Firma kullanicilarinin sistem admin tarafindan listelenmesi
- Giris yapan kullanicinin kendi profilini okuma
- Audit log kayitlari
- Unit ve entegrasyon testleri

## Not

Bu ortamda `mvn` kurulu olmadigi icin Maven build burada calistirilmadi. Dosya yapisi Maven tabanli devam edecek sekilde hazirlandi.

## Dokumanlar

- `docs/mongodb-data-model.md`: mevcut MongoDB yapisi ve Marketing Dashboard icin onerilen hedef veri modeli
