#!/system/bin/sh
MODDIR="${MODDIR:-$(cd "$(dirname "$0")" && pwd)}"
export MODDIR

# هذا السكربت يعمل تلقائياً عند بدء Shizuku-Next
echo "[$(date '+%Y-%m-%d %H:%M:%S')] بدء خدمة Shizzi VPN Hotspot في الخلفية..." >> "$MODDIR/daemon.log"

# بدء التشغيل
sh "$MODDIR/scripts/start.sh" AUTO

# انتظار وانتظار مراقبة العملية
PIDFILE="$MODDIR/daemon.pid"
if [ -f "$PIDFILE" ]; then
    PID=$(cat "$PIDFILE")
    while [ -d "/proc/$PID" ]; do
        sleep 10
    done
fi

echo "[$(date '+%Y-%m-%d %H:%M:%S')] انتهت عملية الخدمة في الخلفية." >> "$MODDIR/daemon.log"
