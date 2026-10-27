#!/system/bin/sh
MODDIR="${MODDIR:-$(cd "$(dirname "$0")/.." && pwd)}"
export MODDIR

PIDFILE="$MODDIR/daemon.pid"
LOGFILE="$MODDIR/daemon.log"
DEXFILE="$MODDIR/bin/shizzi-core.dex"
LIBDIR="$MODDIR/lib/arm64-v8a"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] بدء محاولة تشغيل خدمة بث الـ VPN..." >> "$LOGFILE"

# فحص ما إذا كان قيد التشغيل بالفعل
if [ -f "$PIDFILE" ]; then
    OLD_PID=$(cat "$PIDFILE")
    if [ -d "/proc/$OLD_PID" ]; then
        echo "[!] الخدمة قيد التشغيل بالفعل برقم العملية: $OLD_PID" >> "$LOGFILE"
        echo "ALREADY_RUNNING"
        exit 0
    else
        rm -f "$PIDFILE"
    fi
fi

# نسخ المكتبة إلى /data/local/tmp لأن /sdcard محظور من تنفيذ المكتبات noexec
TMPLIBDIR="/data/local/tmp/shizzi/lib"
mkdir -p "$TMPLIBDIR" 2>/dev/null
if [ -f "$LIBDIR/libgojni.so" ]; then
    cp -f "$LIBDIR/libgojni.so" "$TMPLIBDIR/libgojni.so" 2>/dev/null
    chmod 755 "$TMPLIBDIR/libgojni.so" 2>/dev/null
fi

# إعطاء صلاحيات التشغيل
chmod 755 "$MODDIR/scripts"/*.sh 2>/dev/null
chmod 755 "$LIBDIR"/*.so 2>/dev/null

# إعداد المتغيرات لتشغيل جافا عبر app_process
export CLASSPATH="$DEXFILE"
export ANDROID_DATA="/data/local/tmp"
export LD_LIBRARY_PATH="$TMPLIBDIR:$LIBDIR:$LD_LIBRARY_PATH"

# تشغيل كود Shizzi في الخلفية بصلاحيات الشيل
VPN_MODE="${1:-AUTO}"

nohup /system/bin/app_process \
    -Djava.library.path="$TMPLIBDIR:$LIBDIR" \
    /system/bin dev.shizzi.cli.Main start "$VPN_MODE" >> "$LOGFILE" 2>&1 &

NEW_PID=$!
echo "$NEW_PID" > "$PIDFILE"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] تم تشغيل العملية بنجاح! PID: $NEW_PID" >> "$LOGFILE"
echo "STARTED"
