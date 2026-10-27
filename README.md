# vpgetway-Shizuku

إضافة لأجهزة Android تهدف إلى تمرير اتصال VPN عبر نقطة اتصال Wi-Fi ضمن بيئة وحدات متوافقة مع **Shizuku-Next**. تتضمن الإضافة واجهة ويب عربية، وسكربتات للتحكم بالخدمة ومتابعة حالتها، ومحرك Shizzi المضمّن.

اسم المشروع في GitHub هو `vpgetway-Shizuku`، بينما معرّف الوحدة التقني في `module.prop` هو `vpngetway` حفاظًا على التوافق مع الحزمة الأصلية.

## الميزات

- أوضاع تشغيل `AUTO` و`ALWAYS` و`NEVER`.
- سكربتات لبدء الخدمة وإيقافها والاستعلام عن حالتها.
- واجهة ويب عربية تعرض حالة الخدمة وواجهة الشبكة وعدد الأجهزة المتصلة عند توفر البيانات على الجهاز.
- مكتبة أصلية مضمّنة لمعمارية `arm64-v8a`.

## المتطلبات والتوافق

تعتمد الإضافة على جهاز Android وبيئة وحدات متوافقة مع Shizuku-Next وواجهات التحكم المستخدمة فيها. المكتبة الأصلية المرفقة مخصصة لمعمارية ARM64. يختلف سلوك تمرير VPN إلى نقطة الاتصال بحسب إصدار Android والشركة المصنّعة وتطبيق VPN وإعدادات الشبكة.

## طريقة التوزيع والاستخدام

تتوفر حزمة `vpgetway-Shizuku-v1.0.0.zip` ضمن [إصدار v1.0.0](https://github.com/seloom1/vpgetway-Shizuku/releases/tag/v1.0.0)، وهي معدّة للاستيراد عبر بيئة إدارة وحدات متوافقة مع Shizuku-Next. تتضمن الحزمة عناصر التحكم بالخدمة وواجهة الويب، وتعرض الواجهة أوضاع VPN المتاحة. يعتمد سلوك `ALWAYS` و`NEVER` على منطق المحرك المضمّن.

## المشاريع المساعدة

- **Shizzi** — المحرك/المكوّن المضمّن الذي تعتمد عليه الإضافة لتوجيه اتصال الشبكة. وجوده ضمن ملفات الحزمة يوضّح اعتماده التقني، ولا يجعل هذا المستودع المستودع الرسمي لمشروع Shizzi.

## بنية الملفات

- `module.prop` و`service.sh` و`action.sh`: بيانات الوحدة ونقاط تشغيل الخدمة والإجراء.
- `scripts/`: سكربتات البدء والحالة والإيقاف.
- `webui/`: ملفات واجهة المستخدم العربية.
- `bin/shizzi-core.dex` و`lib/arm64-v8a/libgojni.so`: ملفات المحرك والمكتبة الأصلية المضمّنة.
- `dist/`: حزمة الإصدار.

## الإصدار

الإصدار الحالي هو **v1.0.0**، وهو متوافق مع قيمة `version` في `module.prop`.

## الاعتمادات والنسب

تتضمن بيانات الحزمة نسب المطورين **seloom1 (@seloom1)** و**Carlelieser**، وتشير الواجهة إلى قناة `@freevpsiraq`.

## الترخيص

المشروع مرخّص بموجب MIT؛ تفاصيل الترخيص في ملف [LICENSE](LICENSE).

---

# vpgetway-Shizuku (English)

An Android add-on intended to route a VPN connection through a Wi-Fi hotspot in a module environment compatible with **Shizuku-Next**. It includes an Arabic WebUI, service control and status scripts, and the bundled Shizzi engine.

The GitHub project is named `vpgetway-Shizuku`. The technical module identifier in `module.prop` remains `vpngetway` for compatibility with the original package.

## Features

- `AUTO`, `ALWAYS`, and `NEVER` modes.
- Scripts for starting, stopping, and checking the service.
- An Arabic WebUI that displays service status, network interface, and connected-client information when available on the device.
- A bundled native library for `arm64-v8a`.

## Requirements and compatibility

The add-on depends on an Android device and a module environment compatible with Shizuku-Next and its control interfaces. The bundled native library targets ARM64. VPN tethering behavior varies by Android version, device vendor, VPN app, and network configuration.

## Distribution and use

The `vpgetway-Shizuku-v1.0.0.zip` package is available in the [v1.0.0 release](https://github.com/seloom1/vpgetway-Shizuku/releases/tag/v1.0.0) and is intended for import through a Shizuku-Next-compatible module manager. The package includes service controls and the WebUI, which presents the available VPN modes. The behavior of `ALWAYS` and `NEVER` depends on the bundled engine.

## Supporting projects

- **Shizzi** — the bundled engine/component used by the add-on for network routing. Its inclusion describes a technical dependency and does not identify this repository as the official Shizzi project.

## Project structure

- `module.prop`, `service.sh`, and `action.sh`: module metadata and service/action entry points.
- `scripts/`: start, status, and stop scripts.
- `webui/`: Arabic user-interface files.
- `bin/shizzi-core.dex` and `lib/arm64-v8a/libgojni.so`: bundled engine and native library.
- `dist/`: release package.

## Release

The current release is **v1.0.0**, matching the `version` value in `module.prop`.

## Credits

The package credits **seloom1 (@seloom1)** and **Carlelieser**, and references the `@freevpsiraq` channel in the interface.

## License

The project is licensed under MIT; see [LICENSE](LICENSE).
