# vpn_app


## 🧩Proje Yapısı ve Mimari Kararlar

- **StateManagement:** GetX kullanılmıştır. 
- **Mimari:** MVC(Model - View - Controller) yapısı uygulanmıştır.
    - **Model:** Veri yapılarını içerir.
    - **View:** Arayüz yapıları ayrı widget dosyalarında yer alır.
    - **Controller:** Sayfa mantığı `GetxController` sınıflarıyla kontrol edilir.
- **Sayfa Yönetimi:** `main.dart` içinden `BottomBar()` ile sayfa geçişleri sağlanır.
- **Temiz Kod Yapısı:** Sayfa bileşenleri `view/widgets/` klasörü altında ayrıştırılmıştır. 

## 🧱Sayfa Bileşenleri (Widgets)

- `headerCountriesSearch()` &#8594; Ülke arama barı
- `connectionTimer()` &#8594; VPN bağlantı süresi sayacı
- `connectedCountry()` &#8594; Bağlanılan ülke, download/upload hız bilgisi
- `freeLocationList()` &#8594; Ücretsiz VPN lokasyonlarını listeleyen yapı
- `AnimationCardWidget` sınıfı &#8594; Lottie animasyonlu download/upload kartları
- `cardWidget()` &#8594; Ekranda ortak kullanılan Card yapısının template'i 
- `buttonWidget()` &#8594; Ücretsiz VPN lokasyonlarına bağlantı gerçekleştirmek için oluşturulan tıklanılabilir kutu yapısı
- `DialogWidget` sınıfı &#8594; Bağlantı gerçekleştirmek ya da bağlantıyı kesmek için power tuşuna basıldıktan sonra ekrana gelen AlertDialog yapısı. `Get.dialog` ile ulaşılmıştır.

## 🧠Controller Sınıfları

Uygulamadaki tüm sayfa ve işlevler GetxController sınıfları ile yönetilmektedir.

- `HomeController`
  - Ana sayfa(HomePage) mantığını yönetir.
  - VPN bağlantı durumu, ülke seçimi, bağlantı süresi, download/upload hesaplamaları buradadır.
- `SearchCountryController`
  - Ülke arama ekranındaki filtreleme ve listeleme işlemlerini kontrol eder.
  - SearchBar etkileşimleri ve sonuç güncellemeleri bu controller ile yapılır.
- `BottomBarController`
  - Bottom navigation bar ile sayfa geçişlerini yönetir.
  - Aktif sekmeyi tutar ve UI geçişlerini sağlar.
> **Not:** Controller sınıfları `lib/controllers/` klasörünün altında tanımlanmıştır.

## 🎨Renk, String, Görsel ve Stil Tanımlamaları

Uygulamanın tüm renk, metin, görsel ve stil tanımları aşağıdaki dosyalarda merkezi olarak yönetilmektedir:
- `app_colors.dart` 
  - Uygulamanın renk paletini ve tema değişimine uyumlu renk tanımlarını içerir.
  - Örnek kullanım
  ```bash
  static const Color bgWhite = Color(0xFFFFFFFF);
  color: AppColors.bgWhite,
  ```
- `app_strings.dart`
  - Uygulamanın metin sabitlerini içerir.
  ```bash
  static const String strength = 'Strength';
  Text(AppStrings.strength),
  ```
- `app_style.dart`
  - Uygulamadaki yazı stilini ve boyutlandırma ayarlarını içerir.
  ```bash
  static var subText = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textMediumGrey,
  );
  Text(AppStrings.strength,style: AppStyle.subText),
  ```
- `app_drawable.dart`
  - Uygulama içerisinde kullanılmak için `assets/` klasörü altında png, svg tanımlanan dosyaların sabitlerini içerir.
  ```bash
  final String category = 'assets/svg/category.svg';
  child: SvgPicture.asset(AppDrawable.svg.category),
  ```
> **Not:** Bu dosyalar `lib/resources/` klasörü altında tanımlanmıştır.

## 📦Kullanılan Üçüncü Parti Paketler

- [get](https://pub.dev/packages/get)
  - GetX state management için kullanılmıştır. Hızlı ve sade yönetim sağlar.
- [lottie](https://pub.dev/packages/lottie)
  - VPN hız göstergesi için animasyonlu görseller eklenmiştir.
  - `assets/animations` klasöründe `.json` dosyaları barındırır.
  - `Lottie.asset()` ile animasyonlar görüntülenir.
  ```bash
  Lottie.asset(
    'assets/animations/upload.json',
    repeat: true,
  ),
  ```
- [flutter_svg](https://pub.dev/packages/flutter_svg)
  - `assets/svg` klasörü altında `.svg` uzantılı dosyaların ekranda gösterilmesi için  eklenmiştir.
  - `SvgPicture.asset()` ile görseller görüntülenir.
  ```bash
   SvgPicture.asset(AppDrawable.svg.category),
  ```
## 🧰 Yardımcı Fonksiyonlar (Helpers)
-  `flag_helper.dart`
- Ülke kodlarını emoji bayrağa çevirir.
- Örnek: `"us"` → 🇺🇸

```dart
String toFlag(String countryCode) {
  return countryCode.toUpperCase().replaceAllMapped(
    RegExp(r'[A-Z]'),
    (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
  );
}
```
## ⚙️Uygulama Davranışı ve Fonksiyonlar

- VPN bağlantısı yapılabilen ülkeler listelenir.
- Bağlantı kurulan ülke, bağlantı süresi, hız bilgileri (download/upload) gösterilir.
- Ülke bağlantısı sonlandırılabilir.
- VPN gücü gösterimi sağlanır.
- `power` tuşu dinamik çalışır: aktifken mavi, pasifken gri.
- Bağlantı bilgileri `mockConnectionState` üzerinden simüle edilir.
- Download ve upload hızları `Random()` ile değişen, gerçekçi değerlerle gösterilir.
- Bağlantı süresi için `startTimer()` fonksiyonu kullanılmıştır.
- `AppTheme` sınıfı ile `dark` ve `light` mod tanımlamaları yapılmıştır.

## 📸 Uygulama Görselleri

- Aşağıda uygulamanın farklı ekranlarına ait örnek görseller yer almaktadır:
- Ana Sayfa: VPN bağlantı durumu, ülke seçimi, hız göstergeleri
- Ülke Arama Sayfası: Ülke filtreleme ve seçim arayüzü
  

<p>
  <img src="https://github.com/user-attachments/assets/a6a3e31f-1d64-4ed0-ad42-78656c25fdc1" width="200" />
  <img src="https://github.com/user-attachments/assets/6d0d4670-e20f-44ee-bd2c-2edb1ceef1f9" width="200" />
  <img src="https://github.com/user-attachments/assets/51d4e50b-3b19-4875-be79-289920a4cfa4" width="200" />
  <img src="https://github.com/user-attachments/assets/e641b06c-cdf1-4caa-8377-be8e12db7ca8" width="200" />
</p>



