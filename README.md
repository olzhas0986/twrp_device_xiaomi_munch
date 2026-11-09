AERA Recovery A16 device configuration for POCO F4 / Redmi K40S
=========================================

Initial **Unofficial Alpha** bring-up from the TWRP Android 12.1 tree.
The build product remains `twrp_munch`, as in the AERA reference trees.
This configuration has not yet been built in a complete AERA checkout or
boot-tested. The first intended test ROM is **crDroid Android 17 QPR0**;
decryption on that ROM is unverified, including in the original TWRP tree.

## Build

Use a Linux build host with the [AERA Android 16 sources](https://github.com/AERA-Recovery/android_manifest/tree/aera-16.0)
already synced. Place this tree at `device/xiaomi/munch`. From the source root:

```bash
mkdir -p .repo/local_manifests
cp device/xiaomi/munch/local_manifest.xml .repo/local_manifests/munch.xml
repo sync -c --no-clone-bundle --no-tags -j2 \
    hardware/qcom-caf/bootctrl vendor/qcom/opensource/interfaces
source build/envsetup.sh
source device/xiaomi/munch/vendorsetup.sh munch
lunch twrp_munch-bp2a-eng
mka adbd bootimage
```

The local manifest supplies Qualcomm HIDL boot-control defaults and the
`vendor.display.config@1.0/@2.0` interfaces. On an existing custom checkout,
merge these projects with its local manifests rather than declaring the same
paths twice. The AERA manifest already supplies `device/qcom/twrp-common`;
retain that AERA version for `qcom_decrypt` and `qcom_decrypt_fbe`.

Expected primary artifact: `out/target/product/munch/boot.img` (AERA may also
produce a branded image/archive). Munch uses **recovery-as-boot**, boot header
v3 and HIDL boot control. There is no separate recovery partition. For the
first temporary boot, retain the installed ROM's `vendor_boot` and DTBO.

The original prebuilt kernel (`4.19.297-Uvite`), vendor blobs, partition sizes
and wrapped-key FBEv2 parameters are retained. The shipping API remains the
original vendor baseline, 30; it is not the recovery SDK or installed ROM API.
GPU acceleration and WLAN have no validated device-specific stack here.

## First boot and decryption checks

Start with temporary boot on an unlocked device that supports it:

```bash
fastboot boot out/target/product/munch/boot.img
```

Check display/touch/brightness, ADB, MTP, battery reporting and haptics. Try
unlocking `/data` with the existing screen credential and confirm files under
`/data/media/0` are readable. Check both active-slot reporting and fastbootd
before testing installation or slot switching. Do not use Format Data as a
decryption diagnostic; it destroys the encrypted data being investigated.

Collect these after a failed unlock or UI startup (from a host with ADB):

```bash
mkdir -p munch-aera-logs
adb pull /tmp/recovery.log munch-aera-logs/
adb logcat -b all -d > munch-aera-logs/logcat.txt
adb shell dmesg > munch-aera-logs/dmesg.txt
adb shell getprop > munch-aera-logs/getprop.txt
adb shell cat /proc/mounts > munch-aera-logs/mounts.txt
```

If ADB never appears, retain `/sys/fs/pstore` after the next successful boot
where accessible. A16 userspace with this kernel and these Keymaster/Gatekeeper
blobs does not establish A17 ROM compatibility. Logs and the installed ROM's
fstab/firmware are needed before changing crypto flags or replacing blobs.

## Bring-up references

Compared with the `aera-16.0` configurations for
[peridot](https://github.com/AERA-Recovery/android_device_xiaomi_peridot-AERA),
[dada](https://github.com/AERA-Recovery/android_device_xiaomi_dada-AERA),
[chiron](https://github.com/AERA-Recovery/android_device_xiaomi_chiron-AERA),
[myron](https://github.com/AERA-Recovery/android_device_xiaomi_myron-AERA),
[garnet](https://github.com/AERA-Recovery/android_device_xiaomi_garnet-AERA) and
[sm84xx-common](https://github.com/AERA-Recovery/android_device_xiaomi_sm84xx-common-AERA).
Public flags were checked against AERA's
[configuration mapping](https://github.com/AERA-Recovery/android_bootable_recovery/blob/aera-16.0/aera_config.mk).
Device-specific partition layouts, modules and firmware from those trees are
not imported into munch.

The POCO F4 / Redmi K40S (codenamed munch) is a high-end smartphone from Xiaomi.

It was announced in June (F4) / March (K40S)

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
Platform | Snapdragon® 870 5G (SM8250-AC)
Storage & RAM | 128/256 GB UFS 3.1, 6/8/12 GB LPDDR5 RAM
Shipped Android Version | Android 12
Battery | 4500 mAh Li-Po (non-removable), 67W quick charge
Display | 6.67 inch, 1080 x 2400 pixels, E4 AMOLED, Dolby Vision, HDR10+, 120Hz
Camera | 64 MP (POCO F4) / 48 MP (Redmi K40S) (main), 8 MP (ultrawide), 2 MP (macro), 20 MP (front)

## Device picture

![POCO F4](https://www.notebookcheck.net/fileadmin/Notebooks/News/_nc3/Untitled8469.jpg)


## Credits
- [Original alioth tree by Nebrassy](https://github.com/TeamWin/android_device_xiaomi_alioth)
- [Kernel](https://github.com/AOSPA/android_kernel_xiaomi_sm8250.git)

### Copyright
 ```
  /*
  *  Copyright (C) 2022-2024 The OrangeFox Recovery Project
  *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 3 of the License, or
  * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  *
  */
  ```
