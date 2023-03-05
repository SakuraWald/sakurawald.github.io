---
title: "Play on Google Pixel"
date: 2023-02-27 05:46:02
tags:
  - pixel
  - phone
  - root
  - magisk
  - android
  - os
---

# Play on Google Pixel

## Install magisk

### Enable developter options

We need to tap `kernel build version` and enable `developer options`.

### Enable adb

Turn on `USB debugging`

### Unlock bootloader

> WARNING: IF YOU UNLOCK BOOTLOADER, ALL YOUR DATA WILL BE WIPED.

Inside `developer options`  , we need to `unlock OEM` so that we can unlock `bootloader` after.

```shell
adb reboot bootloader
fastboot flashing unlock
```

### Download the factory images

1. Install `magisk.apk` from https://github.com/topjohnwu/Magisk 

2. Go to https://link.zhihu.com/?target=https%3A//developers.google.com/android/images to download the `relative factory image` file. 

3. Unzip this `image file` to get `init_boot.img` file.

4. Use `adb push ./init_boot.img /storage/emulated/0/Downloads/` to send `init_boot.img` file to your mobile device.

5. Use `magisk.apk` to patch this `init_boot.img`

6. Use `adb pull /storage/emulated/0/Downloads/{the_patched_init_boot.img} ./` to get `patched init_boot.img` from the mobile device.

7. Flash `the_patched_init_boot.img` file into your mobie device

   ```shell
   adb reboot bootloader
   fastboot flash init_boot {the_patched_init_boot.img}
   fastboot reboot
   ```

8. Done.

## Install OTA Images

> The key difference between `factory image` and `OTA image` is that:
>
> when you use `OTA image`, you don't need to `wipe you mobile` or `unlock the bootloader` .

> Please note that: install a OTA may **cover** the `rooted boot_init.img`.
>
> So, if you want to install a `specific kernel version` with `root` and without `wipe your mobile`. You should use `factory image` instead of `OTA image`
>
> > If you don't want to `wipe your mobile`, just modify `flash-all.sh` :
> >
> > ```shell
> > # fastboot -w update image-cheetah-td1a.220804.009.a2.zip
> > fastboot update image-cheetah-td1a.220804.009.a2.zip
> > ```

1. Download the OTA that you want in https://developers.google.com/android/ota
2. Follow the tutorial.

## Support 32-Bit Applications

> WARNING: If you want to support 32-bit applications, then you must un-install `the installed magisk (if existed)` and then use `forked-magisk` to replace `magisk`, and do the same as previous.

Although Google Pixel 7 / 7 Pro is the first mobile that `only support 64 bit apps`, **the fact is that: all the 32-bit libraries are still available, but Google delete tle supported-abi-list on props.**

So, if we modify the props back, then we still can run 32-bit applications perfectly.

There are 2 forked-magisk can do this, just choose one of them:  

1. https://github.com/ThomasKing2014/Pixel7_32bit_helper
2. https://github.com/MN312001/Magisk-Delta

## Enable VoLTE

If your `SIM` card can use `access the Internet`, but can't send/receive any messages. Then you should enable `VoLTE` to make it work.

Steps:

1. Install `Shizuku` : https://github.com/RikkaApps/Shizuku
2. Install `Pixel-IMS`: https://github.com/kyujin-cho/pixel-volte-patch
3. Follow the tutorial in `Pixel-IMS` and you are fine.

## Enable 5G

Not recommended in PRC. 

Some reviews say the 5G speed depends on which city you are in, and 4G is enough in most cases.

# Reference

1. [Now you can use 32-bit apps on your Pixel 7 (unofficially)](https://www.androidgreek.com/now-you-can-use-32-bit-apps-on-your-pixel-7-unofficially/)
2. https://www.xda-developers.com/how-to-unlock-bootloader-root-magisk-google-pixel-7-pro/
3. https://forum.xda-developers.com/t/guide-root-pixel-7-pro-with-magisk-unlock-bootloader-pass-safetynet-more.4505353/
4. [让新手机发挥全部实力，在国内如何「正确」使用 Pixel 7|pixel_新浪新闻](https://k.sina.com.cn/article_1914010467_72157b6301901ozz5.html?from=tech)
