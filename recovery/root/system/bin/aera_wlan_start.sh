#!/system/bin/sh

PATH=/system/bin:/sbin
export PATH
umask 022
mkdir -p /tmp/wlan /tmp/recovery/sockets || exit 1
chmod 0770 /tmp/recovery/sockets
exec >>/tmp/wlan/driver.log 2>&1

fail() {
    echo "AERA WLAN: $*"
    setprop wifi.driver.ready false
    exit 1
}

firmware_mount=/mnt/aera-wlan-firmware
mounted=0
cleanup() {
    if [ "$mounted" = 1 ]; then
        umount "$firmware_mount"
    fi
}
trap cleanup EXIT

if [ ! -e /sys/class/net/wlan0 ]; then
    firmware=/tmp/wlan/firmware
    if [ ! -f "$firmware/.ready" ]; then
        slot=$(getprop ro.boot.slot_suffix)
        case "$slot" in
            _a|_b) ;;
            *) fail "Unknown active slot: $slot" ;;
        esac
        modem=
        for base in /dev/block/bootdevice/by-name /dev/block/by-name; do
            if [ -b "$base/modem$slot" ]; then
                modem="$base/modem$slot"
                break
            fi
        done
        [ -n "$modem" ] || fail "Active modem partition missing"
        mkdir -p "$firmware_mount" "$firmware" || fail "Cannot create firmware directories"
        mount -t vfat -o ro,nosuid,nodev,noexec,fmask=0022,dmask=0022 "$modem" "$firmware_mount" || fail "Cannot mount modem firmware"
        mounted=1
        [ -d "$firmware_mount/image/qca6390" ] || fail "QCA6390 firmware missing"
        cp -R "$firmware_mount/image/qca6390" "$firmware/" || fail "Cannot stage QCA6390 firmware"
        umount "$firmware_mount" || fail "Cannot unmount modem firmware"
        mounted=0
        ln -sfn /system/etc/firmware/wlan "$firmware/wlan" || fail "Cannot link WLAN configuration"
        touch "$firmware/.ready" || fail "Cannot mark firmware ready"
    fi
    printf '%s\n' "$firmware" > /sys/module/firmware_class/parameters/path || fail "Cannot set firmware search path"
    fs_ready=
    for node in /sys/kernel/cnss/fs_ready /sys/bus/platform/drivers/cnss2/*/fs_ready; do
        if [ -w "$node" ]; then
            fs_ready="$node"
            break
        fi
    done
    [ -n "$fs_ready" ] || fail "CNSS fs_ready node missing"
    printf '1\n' > "$fs_ready" || fail "CNSS startup failed"
    count=0
    while [ ! -e /sys/class/net/wlan0 ]; do
        [ "$count" -lt 45 ] || fail "wlan0 missing after 45 seconds"
        sleep 1
        count=$((count + 1))
    done
fi

setprop wifi.driver.ready true
echo "AERA WLAN: starting supplicant on wlan0"
exec /system/bin/wpa_supplicant -Dnl80211 -iwlan0 -O/tmp/recovery/sockets -c/system/etc/wifi/wpa_supplicant.conf
