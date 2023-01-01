---
title: Electron - 基于Electron开发桌面应用程序
tags: []
id: '817'
categories:
  - - uncategorized
date: 2021-08-07 21:04:00
---

# Electron 简介

Electron使用JavaScript, HTML和CSS来构建跨平台的桌面应用程序 (目前不支持移动端). 根据官网介绍，目前已经有不少著名的应用程序基于Electron开发. 如：Visual Studio Code, Atom, FaceBook Messageer, Twitch, Slack, Figma等   Electron基于B/S架构，开发模式有些类似微信小程序. Electron = Chromium + Node.js + Native API  

# 创建 Electron项目

## 开发环境: Node.js

首先安装Electron的开发环境.

1.  Node.js (根据官网推荐，请使用LTS版本)
2.  可用的文本编辑器或IDE

 

## 安装Electron

1.  将Electron安装到Node.js项目的开发依赖中.

`npm install --save-dev electron`   注意: npm的服务器位于美国, 如果安装过程出现错误可以可以尝试科学上网.  

1.  在package.json中配置如下脚本, 用于Electron程序的启动.

```json
"scripts": {
"start": "electron ."
}
}
```

 

1.  通过`npm start`来启动Electron程序

 

# 使用Electron开发简单计算器

1.  编写`index.html`作为程序界面

```html
<div>
<input id="input_expression"/>
</div>
<div>
<label id="output_expression"></label>
</div>
```

 

1.  编写`renderer.js`作为程序界面的渲染脚本

```js
/* Bind Component Events. */
function calcData() {
let expression = document.querySelector("#input_expression").value
try {
document.querySelector("#output_expression").innerHTML = eval(expression)
} catch (e) {
document.querySelector("#output_expression").innerHTML = e
}
}

document.querySelector("#input_expression").addEventListener("keyup", () => {
calcData()
})
```

注意: 如果你的Electron程序需要进行IPC通讯, 则可在Renderer使用 `const ipcRenderer = require('electron').ipcRenderer;` 注意: 对最新版本的Electron，需要额外配置`nodeIntegration`和`contextIsolation`才可以在Renderer中使用require()  

1.  编写`index.css`来作为程序界面的样式表

```css
#input_expression {
width: 100%;
height: 35px;
margin-top: 1%;
margin-bottom: 2%;
}

#output_expression {
color: blue;
}
```

 

1.  为`index.html`引入`renderer.js`来渲染界面

```html
<script>
// Include Renderer.js
require('../js/renderer.js')
</script>
```

 

1.  为`index.html`引入`index.css`来美化界面

```html
<link rel="stylesheet" type="text/css" href="../css/index.css"/>
```

 

1.  编写`main.js`作为Electron程序的入口点

```js
const { app, BrowserWindow } = require('electron')
function createWindow () {
const win = new BrowserWindow({
width: 800,
height: 130,
transparent: true,
webPreferences: {
nodeIntegration: true,
contextIsolation: false
}
})

win.loadFile('./pages/index.html')
win.setMenu(null)
}

app.whenReady().then(() => {
createWindow()
app.on('activate', () => {
if (BrowserWindow.getAllWindows().length === 0) {
createWindow()
}
})
})
app.on('window-all-closed', () => {
if (process.platform !== 'darwin') {
app.quit()
}
})
```

到此, 一个简单的计算器便完成了。 ![image-20210807203718845](https://i.loli.net/2021/08/07/RJ6pS5q3mdQ1iwo.png)  

# 打包Electron项目

Electron官网推荐使用的打包工具有3款

1.  Electron-Forge
2.  Electron-Builder
3.  Electron-React-Boilerplate

  此处，选择使用Electron-Forge进行打包.  

1.  安装Electron-Forge模块

`npm install --save-dev @electron-forge/cli`

1.  使用`import`命令设置Forge脚手架

`npx electron-forge import` 注意: 如果在运行该命令时提示`未找到Git错误`, 应在Electron项目文件夹中`Git Bash Here` 后输入该指令.

1.  运行Electron-Forge的`make`命令来编译Electron程序

`npm run make` ![image-20210807210128547](https://i.loli.net/2021/08/07/6Uh3YCc8vjkSAPN.png) 程序运行完成后，可以查看`out`目录下的文件。 ![image-20210807210248861](https://i.loli.net/2021/08/07/wuMbdKHOX52qPhc.png)