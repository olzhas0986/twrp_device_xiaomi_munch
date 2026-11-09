# TWRP device tree for munch (Redmi K40S / POCO F4)
This tree is for building TeamWin Recovery Project for the _munch_ devices

The Redmi K40S, POCO F4 (codenamed _"munch"_) is a mid range smartphone from Xiaomi.

# Device specifications

| Device       | Redmi K40S / POCO F4                        |
| -----------: | :----------------------------------------------------------|
| SoC          | Qualcomm SM8250-AC Snapdragon 870 5G                          |
| CPU          | 8x Qualcomm® Kryo™ 585 up to 3.2GHz                       |
| GPU          | Adreno 650                                                 |
| Memory       | 6GB / 8GB / 12GB (LPDDR5)                                       |
| Shipped Android version | 12                    			    |
| Storage      | 128GB / 256GB (UFS 3.1)                                           |
| Battery      | Li-Po 4500 mAh, non-removable                              |
| Dimensions   | 163.2 × 75.95 × 7.7 mm                                      |
| Display      | 1080 x 2400 (20:9), 6.67 inches, AMOLED, 120Hz, HDR10+                           |

## Features

**Works**

- Booting
- **Decryption** (Android 12+)
- ADB
- MTP
- OTG
- vA/B partition functions
- Vibration

The Redmi K40S / POCO F4 devices use a Virtual A/B Partition Scheme!

## Building

_Lunch_ command :
```
lunch twrp_munch-eng && mka adbd bootimage
```

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
