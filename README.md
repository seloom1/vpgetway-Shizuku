# vpgetway-Shizuku

إضافة أندرويد لتمرير اتصال VPN عبر نقطة الاتصال (Hotspot) ضمن بيئة متوافقة مع وحدات **Shizuku-Next**. تتضمن واجهة ويب عربية، وأدوات تشغيل/إيقاف/حالة، ومحرك Shizzi المضمّن.

> اسم المشروع في GitHub هو `vpgetway-Shizuku`. معرّف الوحدة داخل `module.prop` بقي `vpngetway` كما ورد في الحزمة الأصلية.

## الميزات

- أوضاع تشغيل `AUTO` و`ALWAYS` و`NEVER`.
- تشغيل الخدمة وإيقافها ومتابعة حالتها وسجلها من ملفات الوحدة وواجهة الويب.
- عرض حالة الخدمة وواجهة الشبكة وعدد الأجهزة المتصلة وفق البيانات المتاحة على الجهاز.
- ملفات مكتبة مضمّنة لمعمارية `arm64-v8a`.

## المتطلبات والتوافق

- جهاز Android وبيئة متوافقة مع وحدات Shizuku-Next وواجهات التحكم المستخدمة في هذه الإضافة.
- معمارية ARM64 للمكتبة المضمّنة.
- قد يختلف دعم تمرير VPN إلى نقطة الاتصال باختلاف إصدار Android والشركة المصنّعة وتطبيق VPN وإعدادات الشبكة. اختبرها على جهازك، واستخدمها وفق القوانين وشروط مزود الخدمة.

## التثبيت والاستخدام

1. نزّل `vpgetway-Shizuku-v1.0.0.zip` من قسم **Releases**.
2. ثبّت/استورد الحزمة باستخدام بيئة إدارة الوحدات المتوافقة مع Shizuku-Next.
3. فعّل الوحدة، ثم استخدم عناصر الخدمة/الإجراء أو واجهة الويب لبدء البث ومتابعة الحالة.
4. اختر وضع VPN المناسب من الواجهة. يتوقف سلوك `ALWAYS` و`NEVER` على منطق المحرك المضمّن.

لا تتضمن هذه المستودع تعليمات لرفع صلاحيات النظام أو تجاوز قيود Android. لا تفعّل الإضافة إلا إذا كنت تفهم الصلاحيات التي تحتاجها وتثق بمصدر ملفاتها.

## الملفات

- `module.prop`, `service.sh`, `action.sh`: بيانات الوحدة ونقاط التشغيل.
- `scripts/`: سكربتات البدء والحالة والإيقاف.
- `webui/`: واجهة المستخدم العربية.
- `bin/shizzi-core.dex` و`lib/arm64-v8a/libgojni.so`: ملفات المحرك والمكتبة المضمّنة.
- `dist/`: حزمة الإصدار المنشورة.

## الإصدار

النسخة الحالية: **v1.0.0** (مطابقة لقيمة `version` في `module.prop`).

## النسب

تحتفظ الحزمة بنسبة المطورين كما وردت في بياناتها: **seloom1 (@seloom1)** و**Carlelieser**. وتذكر الواجهة قناة المشروع `@freevpsiraq`. يرد اسم Shizzi في ملفات الوحدة بوصفه المحرك/المكوّن المضمّن؛ لا يعني ذلك أن هذا المستودع هو المستودع الرسمي لمشروع Shizzi.

## الترخيص

مرخّص بموجب MIT؛ راجع [LICENSE](LICENSE). هذا الترخيص منشور بناءً على تأكيد صاحب الحساب بأن لديه صلاحية نشر وترخيص جميع الملفات المضمّنة.

---

# vpgetway-Shizuku (English)

An Android add-on intended to route a VPN connection through a Wi-Fi hotspot in a compatible **Shizuku-Next** module environment. It includes an Arabic WebUI, service control/status scripts, and the bundled Shizzi engine.

> The GitHub project is named `vpgetway-Shizuku`. The module identifier in `module.prop` remains `vpngetway`, unchanged from the supplied package.

## Features

- `AUTO`, `ALWAYS`, and `NEVER` modes.
- Start, stop, and status helpers, with a compact Arabic WebUI.
- Displays service, network-interface, and connected-client information when available on the device.
- Bundled native library for `arm64-v8a`.

## Requirements and compatibility

- Android device and a module environment compatible with Shizuku-Next and the control interfaces used by this add-on.
- ARM64 for the bundled native library.
- VPN tethering behavior can vary by Android version, device vendor, VPN app, and network configuration. Test on your own device and follow applicable laws and provider terms.

## Install and use

1. Download `vpgetway-Shizuku-v1.0.0.zip` from **Releases**.
2. Install/import it with a module manager compatible with Shizuku-Next.
3. Enable the module, then use its service/action controls or WebUI to start streaming and check status.
4. Select the VPN mode in the UI. The behavior of `ALWAYS` and `NEVER` depends on the bundled engine.

This repository does not provide instructions for elevating system privileges or bypassing Android restrictions. Only enable the add-on if you understand and trust the permissions and files involved.

## Credits

The package credits **seloom1 (@seloom1)** and **Carlelieser**, and references the `@freevpsiraq` Telegram channel. Shizzi is identified in the supplied module files as a bundled engine/component; this repository is not represented as the official Shizzi project.

## License

MIT; see [LICENSE](LICENSE). The account owner confirmed authorization to publish and license the included files.
