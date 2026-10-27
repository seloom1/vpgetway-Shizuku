#!/system/bin/sh
MODDIR="${MODDIR:-$(cd "$(dirname "$0")" && pwd)}"
export MODDIR

echo "============================================"
echo "         vpngetway - Quick Action           "
echo "============================================"

PIDFILE="$MODDIR/daemon.pid"

if [ -f "$PIDFILE" ] && [ -d "/proc/$(cat "$PIDFILE")" ]; then
    echo "[*] الخدمة قيد التشغيل حالياً (PID: $(cat "$PIDFILE"))."
    echo "[*] جاري إيقاف الخدمة..."
    sh "$MODDIR/scripts/stop.sh"
    echo "[✔] تم إيقاف بث الـ VPN بنجاح."
else
    echo "[*] الخدمة متوقفة."
    echo "[*] جاري بدء بث الـ VPN..."
    sh "$MODDIR/scripts/start.sh"
    sleep 2
    if [ -f "$PIDFILE" ]; then
        echo "[✔] تم تفعيل الخدمة بنجاح! PID: $(cat "$PIDFILE")"
    else
        echo "[✘] حدث خطأ أثناء تشغيل الخدمة، يرجى مراجعة daemon.log."
    fi
fi
echo "============================================"
