#!/system/bin/sh
MODDIR="${MODDIR:-$(cd "$(dirname "$0")/.." && pwd)}"
export MODDIR

PIDFILE="$MODDIR/daemon.pid"
LOGFILE="$MODDIR/daemon.log"
DEXFILE="$MODDIR/bin/shizzi-core.dex"
LIBDIR="$MODDIR/lib/arm64-v8a"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] جاري إيقاف خدمة بث الـ VPN..." >> "$LOGFILE"

# تشغيل أمر الإيقاف الداخلي لتنظيف كرت الشبكة التجريبي
export CLASSPATH="$DEXFILE"
export ANDROID_DATA="/data/local/tmp"

/system/bin/app_process \
    -Djava.library.path="$LIBDIR" \
    /system/bin dev.shizzi.cli.Main stop >> "$LOGFILE" 2>&1

# إيقاف العملية الرئيسية إذا كانت ما زالت حية
if [ -f "$PIDFILE" ]; then
    PID=$(cat "$PIDFILE")
    if [ -d "/proc/$PID" ]; then
        kill -15 "$PID" 2>/dev/null
        sleep 1
        kill -9 "$PID" 2>/dev/null
    fi
    rm -f "$PIDFILE"
fi

# تنظيف أي عمليات متبقية لـ Main
pkill -f "dev.shizzi.cli.Main" 2>/dev/null

echo "[$(date '+%Y-%m-%d %H:%M:%S')] تم إيقاف الخدمة بالكامل." >> "$LOGFILE"
echo "STOPPED"
