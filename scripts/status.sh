#!/system/bin/sh
MODDIR="${MODDIR:-$(cd "$(dirname "$0")/.." && pwd)}"
export MODDIR

PIDFILE="$MODDIR/daemon.pid"
STATUSFILE="$MODDIR/status.json"

RUNNING=false
PID=0

if [ -f "$PIDFILE" ]; then
    CHECK_PID=$(cat "$PIDFILE")
    if [ -d "/proc/$CHECK_PID" ]; then
        RUNNING=true
        PID=$CHECK_PID
    else
        rm -f "$PIDFILE"
    fi
fi

# فحص كرت الشبكة الخاص بالـ VPN
VPN_IFACE=$(ip route show 2>/dev/null | grep -E "dev (tun|wg|ppp)" | awk '{print $3}' | head -n 1)
if [ -z "$VPN_IFACE" ]; then
    VPN_IFACE=$(ifconfig 2>/dev/null | grep -E "^(tun[0-9]|wg[0-9])" | awk '{print $1}')
fi
[ -z "$VPN_IFACE" ] && VPN_IFACE="None"

# حساب عدد الأجهزة المتصلة ببث نقطة الاتصال
CLIENTS_COUNT=0
if [ -f /proc/net/arp ]; then
    CLIENTS_COUNT=$(awk '$4 != "00:00:00:00:00:00" && $6 ~ /(wlan|ap)/ {count++} END {print count+0}' /proc/net/arp 2>/dev/null)
fi
if [ "$CLIENTS_COUNT" -eq 0 ]; then
    CLIENTS_COUNT=$(ip neigh show 2>/dev/null | grep -E "dev (wlan|ap)" | grep -v "FAILED" | wc -l)
fi

# قراءة تفاصيل الحالة المخزنة من محرك Shizzi
DETAIL=""
BYTES_UP=0
BYTES_DOWN=0

if [ -f "$STATUSFILE" ]; then
    DETAIL=$(cat "$STATUSFILE" | tr -d '\r\n')
fi

# إخراج النتيجة بتنسيق JSON نظيف
echo "{"
echo "  \"ok\": true,"
echo "  \"running\": $RUNNING,"
echo "  \"pid\": $PID,"
echo "  \"vpn\": \"$VPN_IFACE\","
echo "  \"clients\": $CLIENTS_COUNT,"
echo "  \"shizzi_state\": ${DETAIL:-"{}"}"
echo "}"
