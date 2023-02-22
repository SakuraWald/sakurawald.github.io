---
title: "[Note] Android solutions for linux"
date: 2023-02-22 06:38:07
tags:
  - android
  - emulator
  - linux
  - note
  - practice
  - solution
  - virtualize
---

# Android solutions for linux

## Introduction

這篇文章主要用於討論幾種在 `Linux` 上運行 `Android` 的方案。

對於 `Windows` 用戶，可以直接選擇 `Windows Subsystem for Android` 和 `Emulator`

> 如果確定使用 `Emulator`，首選 `BlueStack`，性能表現較好。

對於 `Linux` 用戶，情況會比較複雜。針對不同的 `kernel` ，可以選擇的方案也不同。

這裡，將只討論 `物理機` 屬於 `x86` 架構的情況下，運行 `android` 系統的可能情況：

- 第一級別需求：僅支持運行 `原生的android x86`

- 第二級別需求：在前面的基礎上，通過 `arm translation layer` 支持運行部分 `編譯時帶x86選項的arm應用`

  > `android studio` 默認會啓用 `x86編譯選項 ` ，除非開發者刻意地去關閉這個選項。
  >
  > 因此，只要達到這一級別，就可以運行 `大部分的arm應用`。

- 第三級別需求：在前面的基礎上，支持運行 `編譯時去除x86選項的，僅支持arm架構的arm應用`

  > 比如：`Clash of clans` 的安裝包。
  >
  > 至今尚未發現，基於x86架構的物理機，在Linux系統上成功運行該app



## Solution

就 `解決方案` 而言，個人更傾向於使用 `emulator`，儘管會有部分性能損耗，但對於流暢運行一個 android 系統來說，PC的資源是綽綽有餘的。

使用 `emulator` 方案可以使得 `對物理機造成的污染更小`， 以及 `更少的依賴問題`。

當然，使用 `native container` 方案可以獲得最佳的性能。

> 但是 `安裝` 比較麻煩，對 `host os` 和 `guest os` 有比較嚴格的要求。



### Emulator: GenyMotion/QEMU

相比於 `AVD` 來說，更加 `穩定` 的體驗。搭配 `houdini` 可以達到 `第二級別需求`。

> 官方所宣傳的，`無法運行arm-v8a應用` 的說法是錯誤的。只要安裝了 `arm translation layer`，即可達到 第二級別需求。
>
> 見：https://support.genymotion.com/hc/en-us/articles/360010029677-How-to-run-applications-for-arm64-aarch64-armv8-
>
> > arm translation layers:
> >
> > - https://github.com/niizam/Genymotion_A11_libhoudini/
> > - https://github.com/m9rco/Genymotion_ARM_Translation



### Emulator: AVD/QEMU

`android studio` 自帶了一個 `emulator`，稱爲 `android virtual device`。

可以通過選擇 `x86_64 image` 來實現 `第二級別需求`。

> 在 `android 11.0` 之後，自帶了 `arm translation layer`。
>
> 所以我們可以通過 `挑選一個好的鏡像`，從而跳過 `手動安裝translator`
>
> 見：https://hatwars.com/now-you-can-run-arm-binaries-in-x86-android-emulators/

> 對於 `x86架構的host os`，可能無法正常啓動 `arm images`：
>
> - 高版本的arm image直接拒絕啓動
> - 低版本的arm image
>   - 啓動時立即崩潰
>   - 啓動後黑屏
>   - 啓動後卡在logo界面
>   - ......



### Emulator: VMWare/VirtualBox

最後達成的效果，取決於安裝的 `android image`

不推薦使用這種方式，運行 `性能` 會明顯差於 `QEMU Emulator ` 



### Emulator: Nested emulator

如果需要達成 `第三級別的需求`，可以嘗試在 `windows (guest os)` 上運行 `android emulator`

> 儘管實際上經過了2層的虛擬化，但是實際的性能並不是想象中的那樣差：
>
> 如果 `第一層guest os` 的運行性能良好的話，`android emulator` 的運行效果也將會非常不錯。



### Screen Projection

如果僅僅是爲了 `方便操控`，可以選擇連接 `物理Android設備`。



### SaaS

可以選擇 `雲Android` 服務，但是價格較貴。大部分應用場景下，不推薦。



### Container: Anbox

如果你是 `ubuntu` 用戶，可以嘗試一下 `anbox`。在安裝完 `houdini` 之後，可以達到 `第二級別需求`。

`anbox` 的安裝對於 `ubuntu 20.04` 和 `ubuntu 22.04` 的用戶是友好的。

如果是 `archlinux`，則不推薦使用 `anbox`。

最關鍵的原因是：`anbox` 所使用的 `android image` 所用的 `kernel` 是較舊的。如果 `host os` 的 `kernel` 較新，則會導致 `anbox` 無法正常運行。

> 如果你堅持在 `最新的kernel` 上運行 `anbox`，也是可能的。
>
> 你需要做：
>
> - 爲anbox重新編譯一個新的android image
> - 修改anbox的源碼進行響應的適配



### Container: Waydroid

如果你使用的 `DS` 是 `wayland` 的話，可以嘗試該方案。

`waydroid` 可能看作是 `anbox` 的後繼者，所使用的鏡像是 `版本更高的lineageos`

>  如果是 `x11` 用戶，也可以通過 `x11-wayland翻譯層` 來運行 `waydroid`，但是配置過程會麻煩很多。



## Conclusion

1. 應該首先考慮 `emulator` 方案，犧牲一點性能來換取 `更高的host os兼容度` 和 `更獨立的環境` 是值得的。其次才考慮 `native container` 方案。
2. 對於大部分的情況，使用 `QEMU` + `android x86` + `arm translation layer` 即可達成 `運行大部分arm-v8a應用` 的需求。
3. 對於極少數只支持 `arm-v8a` 架構的應用，可以選擇 `代價較爲昂貴的nested emulator方案` 

