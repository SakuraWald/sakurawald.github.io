---
title: Anbox - Install android-subsystem on Ubuntu 22.04 LTS
tags: []
id: '58127'
categories:
  - - uncategorized
date: 2022-06-09 17:41:52
---

# Install and Launch Anbox

```shell
# Install the anbox
sudo snap install --devmode --edge anbox
sudo snap refresh --edge --devmode anbox
sudo snap info anbox
```

```shell
# Debug mode
sudo snap set anbox debug.enable=true
sudo /snap/bin/anbox.collect-bug-info
```

```shell
# Start session-manager (Recommended)
# Description: https://github.com/Fuseteam/systemd-service-files#anbox-session-manager
mkdir -p ~/.config/systemd/user
wget -O ~/.config/systemd/user/anbox-session-manager.service https://raw.githubusercontent.com/Fuseteam/systemd-service-files/main/user/anbox-session-manager.service
# sudo systemctl --user enable --now anbox-session-manager
sudo systemctl --machine=teeth@.host --user enable --now anbox-session-manager
```

```shell
# A magic way to launch the anbox.appmgr
# WARNING: do not add 'sudo' for the command, or you will get error messages: [daemon.cpp:61@Run] Failed to connect to DBus
anbox launch --package=org.anbox.appmgr --component=org.anbox.appmgr.AppViewActivity
```

# Create Desktop File

```shell
# anbox-application-manager.desktop
[Desktop Entry]
Name=Anbox Application Manager
Icon=/snap/anbox/213/meta/gui/icon.png
Exec=sh -c "systemctl --machine=teeth@.host --user enable --now anbox-session-manager; anbox launch --package=org.anbox.appmgr --component=org.anbox.appmgr.AppViewActivity"
Terminal=false
Type=Application
Comment=Anbox Applicatoin Manager
```

```shell
# Create desktop file
sudo desktop-file-install '/home/teeth/Desktop/anbox-application-manager.desktop' 
```

# Additional shells for bugs

```shell
# Switch software-rendering for anbox
sudo snap set anbox software-rendering.enable=true
sudo snap restart anbox.container-manager
```

```shell
# Start session-manager
# Description: https://docs.anbox.io/userguide/advanced/software_rendering.html
EGL_PLATFORM=x11 anbox session-manager
# EGL_PLATFORM=x11 anbox session-manager --software-rendering
```

```shell
# Install google-playstore and arm-applications-support
# arm-application-support can make you able to install most of the apks that only compile for arm-architecture (not compiled for x86-64 architectur
# eg. without arm-application-support, you can't install QQ...
wget https://raw.githubusercontent.com/geeks-r-us/anbox-playstore-installer/master/install-playstore.sh
chmod +x install-playstore.sh
sudo bash ./install-playstore.sh
```

```shell
# For binder:false
# I just found that the we should not to care "binder" in the latest ubuntu (like Ubuntu 22.04 LTS)
sudo mkdir /dev/binder
sudo mount -t binder binder /dev/binder
```

```shell
# Solve google-play-store network connectivity problem
sudo /snap/anbox/current/bin/anbox-bridge.sh start
```