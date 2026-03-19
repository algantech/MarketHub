# MarketHub MongoDB Veri Modeli

Bu dokuman iki bolumden olusur:

1. Mevcut uygulamada halihazirda bulunan MongoDB yapisi
2. Marketing Dashboard projesi icin onerilen hedef veri modeli

## 1. Mevcut MongoDB Yapisi

Su an repo icinde aktif olarak kullanilan temel koleksiyonlar asagidadir.

### `companies`

Amaç: Sistemdeki firmalari tutar.

Ornek alanlar:

- `id`
- `name`
- `active`
- `createdAt`
- `updatedAt`

Not:

- Bu koleksiyon uygulamanin tenant temelidir.
- Firma kullanicilari diger koleksiyonlarda `companyId` ile bu kayda baglanir.

### `users`

Amac: Sistem admin ve firma kullanicilarini tutar.

Ornek alanlar:

- `id`
- `username`
- `passwordHash`
- `fullName`
- `email`
- `active`
- `userType`
- `companyId`
- `roles`
- `createdAt`
- `updatedAt`

Not:

- `userType` su an `SYSTEM_ADMIN` ve `COMPANY_USER` degerlerini kullanir.
- Firma kullanicilari icin `companyId` zorunludur.

### `refresh_tokens`

Amac: Login session yenileme ve logout/revoke islemleri icin refresh token kayitlarini tutar.

Ornek alanlar:

- `id`
- `tokenHash`
- `sessionId`
- `userId`
- `username`
- `userType`
- `companyId`
- `revoked`
- `expiresAt`
- `lastUsedAt`
- `createdAt`
- `revokedAt`

### `audit_logs`

Amac: Sistem icindeki temel yonetsel islemlerin kaydini tutar.

Ornek alanlar:

- `id`
- `action`
- `status`
- `actorUserId`
- `actorUsername`
- `actorUserType`
- `entityType`
- `entityId`
- `entityName`
- `message`
- `metadata`
- `createdAt`

## 2. Mevcut Yapinin Sinirlari

Su anki yapi login, firma yonetimi ve kullanici yonetimi icin yeterlidir; ancak Marketing Dashboard icin yetersiz kalir.

Eksik olan ana alanlar:

- Meta entegrasyon bilgileri
- Firma bazli reklam hesaplari
- Urun tanimlari
- Ulke tanimlari
- Funnel tanimlari
- Funnel asamalarina atanmis campaign iliskileri
- Campaign, ad set, ad ve audience master datasi
- Gunluk performans verileri
- Aylik aggregate veriler
- CRM kaynakli conversion ve repeat purchase verileri
- Senkronizasyon loglari

## 3. Onerilen Hedef Veri Modeli

Onerilen model 3 ana gruba ayrilir:

1. Master data
2. Mapping / configuration data
3. Fact / metric data

Bu yapinin temel prensibi sudur:

- Her veri firma bazli calisir.
- Her koleksiyonda gerekli yerlerde `companyId` tutulur.
- Meta'dan gelen ham veya operasyonel veri ile ekranda kullanilan aggregate veri ayrilir.
- Gunluk veri saklanir, dashboard icin aylik ozetler ayrica uretilir.

## 4. Master Data Koleksiyonlari

### `companies`

Mevcut koleksiyon genisletilebilir.

Eklenmesi onerilen alanlar:

- `code`
- `timezone`
- `defaultCurrency`
- `defaultCountry`
- `settings`
- `createdAt`
- `updatedAt`

### `users`

Mevcut koleksiyon korunur.

Eklenmesi opsiyonel alanlar:

- `lastLoginAt`
- `permissions`
- `preferredLanguage`
- `timezone`

### `company_integrations`

Amac: Firma bazli dis sistem baglantilarini tutmak.

Onerilen alanlar:

- `id`
- `companyId`
- `provider`
- `status`
- `accessTokenEncrypted`
- `refreshTokenEncrypted`
- `tokenExpiresAt`
- `metaBusinessId`
- `adAccountIds`
- `syncTimezone`
- `dailySyncHour`
- `lastSuccessfulSyncAt`
- `lastFailedSyncAt`
- `lastError`
- `createdAt`
- `updatedAt`

Not:

- Bu koleksiyon ilk etapta `provider = META_ADS` icin kullanilabilir.
- Ileride Google Ads veya baska kaynaklar eklenirse ayni model genisletilebilir.

### `products`

Amac: Firma bazli urun veya cozum listesini tutmak.

Onerilen alanlar:

- `id`
- `companyId`
- `name`
- `code`
- `active`
- `createdAt`
- `updatedAt`

### `countries`

Amac: Uygulamada kullanilacak ulke tanimlarini standartlastirmak.

Onerilen alanlar:

- `id`
- `code`
- `name`
- `currency`
- `timezone`
- `active`

Not:

- Bu koleksiyon global de tutulabilir.
- Firma bazli ekstra ayar gerekiyorsa `company_country_settings` da eklenebilir.

### `funnels`

Amac: `ulke + urun` bazli funnel tanimini tutmak.

Onerilen alanlar:

- `id`
- `companyId`
- `productId`
- `productName`
- `countryCode`
- `countryName`
- `name`
- `active`
- `createdBy`
- `createdAt`
- `updatedAt`

Kurallar:

- Bir firma icin ayni `productId + countryCode` kombinasyonunda tek aktif funnel olmali.
- Funnel adi tipik olarak `TR - MastiPro` formatinda uretilmeli.

### `campaigns`

Amac: Meta campaign master bilgisini tutmak.

Onerilen alanlar:

- `id`
- `companyId`
- `integrationId`
- `provider`
- `adAccountId`
- `externalCampaignId`
- `name`
- `status`
- `objective`
- `buyingType`
- `startTime`
- `stopTime`
- `dailyBudget`
- `lifetimeBudget`
- `createdTime`
- `lastSyncedAt`
- `raw`

Not:

- `raw` alani ilk etapta Meta cevabinin sade bir snapshot'ini tutabilir.

### `ad_sets`

Amac: Meta ad set master bilgisini tutmak.

Onerilen alanlar:

- `id`
- `companyId`
- `integrationId`
- `provider`
- `adAccountId`
- `campaignId`
- `externalAdSetId`
- `name`
- `status`
- `budget`
- `optimizationGoal`
- `billingEvent`
- `targetingSummary`
- `startTime`
- `endTime`
- `lastSyncedAt`
- `raw`

### `ads`

Amac: Meta ad master bilgisini tutmak.

Onerilen alanlar:

- `id`
- `companyId`
- `integrationId`
- `provider`
- `campaignId`
- `adSetId`
- `externalAdId`
- `name`
- `status`
- `creativeId`
- `previewUrl`
- `thumbnailUrl`
- `lastSyncedAt`
- `raw`

### `audiences`

Amac: Kullanilan audience segmentlerini tutmak.

Onerilen alanlar:

- `id`
- `companyId`
- `integrationId`
- `provider`
- `externalAudienceId`
- `name`
- `type`
- `description`
- `status`
- `estimatedSize`
- `matchRate`
- `ruleSummary`
- `lastSyncedAt`
- `raw`

## 5. Mapping / Configuration Koleksiyonlari

### `funnel_stage_assignments`

Amac: Campaign'in hangi funnel'in hangi asamasinda oldugunu belirtmek.

Bu koleksiyon projenin en kritik koleksiyonlarindan biridir.

Onerilen alanlar:

- `id`
- `companyId`
- `funnelId`
- `stageCode`
- `stageName`
- `campaignId`
- `externalCampaignId`
- `campaignName`
- `active`
- `assignedBy`
- `assignedAt`
- `updatedAt`

Kurallar:

- Bir campaign ayni anda sadece bir funnel stage icinde aktif olmali.
- Stage kodlari merkezi olarak sabit tutulmali.

Onerilen stage kodlari:

- `AWARENESS`
- `INTEREST`
- `INTENT`
- `CONVERSION`
- `LOYALTY`
- `ADVOCACY`

Not:

- Audience ekranindaki `EXCLUDED` mantigi icin audience tarafinda ek bir stage veya classification tutulabilir.

### `metric_definitions`

Amac: Ekranlarda kullanilacak metriklerin tanimini merkezi olarak tutmak.

Onerilen alanlar:

- `id`
- `code`
- `nameTr`
- `nameEn`
- `descriptionTr`
- `descriptionEn`
- `source`
- `aggregationType`
- `formula`
- `active`

Bu koleksiyon neden gerekli:

- `Video Views` tam olarak hangi Meta metriği olacak net degil.
- `CPA`, `Conversion Rate`, `ROAS`, `MQL`, `Final Conversion` gibi alanlar zamanla netlestirilecek.
- Tooltip metinleri de ayni yerden yonetilebilir.

### `company_metric_preferences`

Amac: Firma bazli metrik formulu veya gosterim tercihi tutmak.

Onerilen alanlar:

- `id`
- `companyId`
- `metricCode`
- `enabled`
- `formulaOverride`
- `displayOrder`
- `updatedAt`

## 6. Fact / Metric Koleksiyonlari

### `campaign_metrics_daily`

Amac: Gunluk campaign performans verisini saklamak.

Onerilen alanlar:

- `id`
- `companyId`
- `integrationId`
- `provider`
- `date`
- `monthKey`
- `campaignId`
- `externalCampaignId`
- `campaignName`
- `adAccountId`
- `funnelId`
- `productId`
- `countryCode`
- `stageCode`
- `impressions`
- `reach`
- `clicks`
- `landingPageViews`
- `videoViews`
- `leads`
- `spend`
- `ctr`
- `cpc`
- `cpm`
- `frequency`
- `actions`
- `costPerAction`
- `raw`
- `syncedAt`

Not:

- Dashboard sorgulari hizli olsun diye `funnelId`, `countryCode`, `productId`, `stageCode` denormalize tutulmalidir.

### `ad_set_metrics_daily`

Amac: Gunluk ad set performans verisini saklamak.

Onerilen alanlar:

- `id`
- `companyId`
- `integrationId`
- `provider`
- `date`
- `monthKey`
- `campaignId`
- `adSetId`
- `externalAdSetId`
- `adSetName`
- `funnelId`
- `countryCode`
- `productId`
- `stageCode`
- `impressions`
- `reach`
- `clicks`
- `results`
- `spend`
- `ctr`
- `cpc`
- `cpm`
- `frequency`
- `syncedAt`

### `ad_metrics_daily`

Amac: Gunluk ad / creative performansini saklamak.

Onerilen alanlar:

- `id`
- `companyId`
- `integrationId`
- `provider`
- `date`
- `monthKey`
- `campaignId`
- `adSetId`
- `adId`
- `externalAdId`
- `adName`
- `creativeId`
- `thumbnailUrl`
- `funnelId`
- `countryCode`
- `productId`
- `stageCode`
- `impressions`
- `reach`
- `clicks`
- `videoViews`
- `spend`
- `ctr`
- `cpc`
- `syncedAt`

### `crm_metrics_daily`

Amac: CRM veya siparis sisteminden gelen conversion bazli verileri gunluk bazda tutmak.

Onerilen alanlar:

- `id`
- `companyId`
- `date`
- `monthKey`
- `funnelId`
- `productId`
- `countryCode`
- `campaignId`
- `adSetId`
- `audienceId`
- `leads`
- `mql`
- `purchases`
- `revenue`
- `repeatPurchases`
- `retainedCustomers`
- `activeCustomersAtPeriodStart`
- `activeCustomersAtPeriodEnd`
- `sourceSystem`
- `syncedAt`

Not:

- SRS'teki `Purchases`, `Repeat Purchases`, `Retention Rate`, `ROAS` gibi alanlar icin bu katman gerekir.

### `funnel_metrics_monthly`

Amac: Funnel dashboard ekrani icin aylik aggregate veri tutmak.

Onerilen alanlar:

- `id`
- `companyId`
- `funnelId`
- `productId`
- `countryCode`
- `monthKey`
- `stageCode`
- `metrics`
- `campaignCount`
- `topCampaigns`
- `aiInsight`
- `calculatedAt`

`metrics` icinde tipik alanlar:

- `impressions`
- `reach`
- `videoViews`
- `clicks`
- `landingPageViews`
- `leads`
- `purchases`
- `repeatPurchases`
- `spend`
- `ctr`
- `cpm`
- `cpc`
- `cpa`
- `conversionRate`
- `roas`
- `retentionRate`
- `shares`

Not:

- Dashboard ekrani son ay, `-1`, `-2` ay gosterdigi icin bu koleksiyon sorgu performansini ciddi sekilde iyilestirir.

### `country_metrics_monthly`

Amac: Country ekrani icin ulke bazli aggregate veri tutmak.

Onerilen alanlar:

- `id`
- `companyId`
- `countryCode`
- `monthKey`
- `totalSpend`
- `totalEngagement`
- `totalLeads`
- `totalPurchases`
- `totalRepeatPurchases`
- `roas`
- `conversionRate`
- `funnelCount`
- `topFunnels`
- `calculatedAt`

### `comparison_snapshots_monthly`

Amac: Comparison ekrani icin ortak metrik seti ile hizli karsilastirma yapmak.

Onerilen alanlar:

- `id`
- `companyId`
- `entityType`
- `entityId`
- `entityName`
- `monthKey`
- `funnelId`
- `countryCode`
- `productId`
- `status`
- `metrics`
- `trend`
- `calculatedAt`

Not:

- `entityType`: `FUNNEL`, `CAMPAIGN`, `AD_SET`

## 7. Senkronizasyon ve Operasyon Koleksiyonlari

### `sync_runs`

Amac: Her veri cekme operasyonunu loglamak.

Onerilen alanlar:

- `id`
- `companyId`
- `integrationId`
- `provider`
- `syncType`
- `scope`
- `status`
- `startedAt`
- `finishedAt`
- `recordsFetched`
- `recordsWritten`
- `errorMessage`
- `details`

### `sync_checkpoints`

Amac: Incremental veri cekme icin son senkron referansini tutmak.

Onerilen alanlar:

- `id`
- `companyId`
- `integrationId`
- `entityType`
- `lastCursor`
- `lastSyncedDate`
- `updatedAt`

## 8. Onerilen Index Yapisi

Asagidaki indexler ilk asamada kritik gorulmektedir.

### `companies`

- unique: `name`

### `users`

- unique: `username`
- unique: `email`
- index: `companyId`
- index: `userType`

### `company_integrations`

- index: `companyId`
- unique: `companyId + provider`
- index: `status`

### `products`

- unique: `companyId + code`
- index: `companyId + active`

### `funnels`

- unique: `companyId + productId + countryCode`
- index: `companyId + active`
- index: `companyId + countryCode`

### `campaigns`

- unique: `companyId + provider + externalCampaignId`
- index: `companyId + adAccountId`
- index: `companyId + status`

### `ad_sets`

- unique: `companyId + provider + externalAdSetId`
- index: `companyId + campaignId`

### `ads`

- unique: `companyId + provider + externalAdId`
- index: `companyId + adSetId`

### `audiences`

- unique: `companyId + provider + externalAudienceId`
- index: `companyId + type`

### `funnel_stage_assignments`

- unique: `companyId + campaignId`
- index: `companyId + funnelId + stageCode`

### `campaign_metrics_daily`

- unique: `companyId + campaignId + date`
- index: `companyId + funnelId + monthKey`
- index: `companyId + countryCode + monthKey`
- index: `companyId + stageCode + monthKey`

### `ad_set_metrics_daily`

- unique: `companyId + adSetId + date`
- index: `companyId + campaignId + monthKey`

### `ad_metrics_daily`

- unique: `companyId + adId + date`
- index: `companyId + adSetId + monthKey`

### `crm_metrics_daily`

- index: `companyId + funnelId + date`
- index: `companyId + productId + countryCode + monthKey`

### `funnel_metrics_monthly`

- unique: `companyId + funnelId + stageCode + monthKey`

### `country_metrics_monthly`

- unique: `companyId + countryCode + monthKey`

### `comparison_snapshots_monthly`

- unique: `companyId + entityType + entityId + monthKey`

### `sync_runs`

- index: `companyId + provider + startedAt`
- index: `status + startedAt`

## 9. Ekranlara Gore Veri Kullanimi

### Dashboard

Temel kaynaklar:

- `funnels`
- `funnel_stage_assignments`
- `funnel_metrics_monthly`
- gerektiginde `campaign_metrics_daily`

### Campaign

Temel kaynaklar:

- `campaigns`
- `ad_sets`
- `ads`
- `campaign_metrics_daily`
- `ad_set_metrics_daily`
- `ad_metrics_daily`

### Audience

Temel kaynaklar:

- `audiences`
- `campaigns`
- iliski icin `funnel_stage_assignments`
- performans icin `campaign_metrics_daily`

Not:

- Audience ile campaign arasindaki iliski ileride ayri bir `audience_campaign_links` koleksiyonu ile de normalize edilebilir.

### Comparison

Temel kaynaklar:

- `comparison_snapshots_monthly`
- alternatif olarak `funnel_metrics_monthly`
- alternatif olarak `campaign_metrics_daily`
- alternatif olarak `ad_set_metrics_daily`

### Country

Temel kaynaklar:

- `country_metrics_monthly`
- `funnels`
- `funnel_metrics_monthly`

## 10. Tasarim Kararlari

Bu proje icin asagidaki kararlar onemlidir:

- Tum analitik veri firma bazli tutulmalidir.
- Meta token ve hassas entegrasyon bilgileri sifreli saklanmalidir.
- Gunluk veri ve aylik aggregate ayni koleksiyonda tutulmamalidir.
- Dashboard performansi icin aggregate koleksiyonlar ayri uretilmelidir.
- Campaign bir funnel stage'e tekil sekilde baglanmalidir.
- Meta verisi ile CRM verisi ayri kaynaklar olarak modellenmelidir.
- `provider` alani simdiden tutulmalidir; boylece sistem yalnizca Meta'ya kilitlenmez.

## 11. Ilk Fazda Uygulanabilecek Minimum Koleksiyon Seti

Ilk teknik faz icin minimum uygulanabilir set su olabilir:

- `companies`
- `users`
- `company_integrations`
- `products`
- `funnels`
- `campaigns`
- `funnel_stage_assignments`
- `campaign_metrics_daily`
- `funnel_metrics_monthly`
- `sync_runs`

Bu minimum set ile asagidaki ihtiyaclar karsilanabilir:

- Firma bazli login ve yetkilendirme
- Meta entegrasyonu
- Funnel olusturma
- Campaign'leri funnel stage'lere atama
- Her gun ayni saatte veri cekme
- Dashboard ekraninda 3 aylik stage bazli aylik performans gosterme

## 12. Acik Tasarim Konulari

Kodlamaya gecmeden once netlestirilmesi iyi olacak basliklar:

- Stage enum kesin olarak hangi listeyi kullanacak
- `Interest` ve `Intent` ayrimi ekranda ve veride birebir sabitlenecek mi
- `Audience` stage map'i funnel stage ile ayni mi, ayri mi olacak
- `Conversion Rate` formulu hangisi olacak
- `Video Views` hangi Meta metriği ile temsil edilecek
- `Purchases` ve `Revenue` hangi CRM kaynagindan alinacak
- `MQL` ve `Final Conversion` bu projede gercekten kullanilacak mi

Bu dokuman hedef veri modeli icin referans niteligindedir; implementasyon sirasinda endpoint ve ekran ihtiyaclarina gore revize edilebilir.
