---
title: Go - Socket编程 - 简单的TCP通讯工具
tags:
  - Go
  - Socket
id: '773'
categories:
  - - uncategorized
date: 2021-07-25 23:03:30
---

# 前言

通过Go语言强大的net库和协程能力来构建TCP通讯实例。

# TCP Server

```go
package main

import (
    "bufio"
    "fmt"
    "net"
)

func process(conn net.Conn) {
    defer conn.Close()

    for {
        reader := bufio.NewReader(conn)
        var buf [128]byte

        // 读取数据
        n, err := reader.Read(buf[:])
        if err != nil {
            fmt.Println("read from client failed, err:", err)
            break
        }

        recvStr := string(buf[:n])
        fmt.Println("收到来自Client的数据:", recvStr)

        // 发送数据
        conn.Write([]byte(recvStr))
    }

}

func main() {

    listen, err := net.Listen("tcp", "127.0.0.1:20000")
    if err != nil {
        fmt.Println("listen failed, err:", err)
        return
    }

    fmt.Println("listen successfully.")
    for {

        // 接受连接
        conn, err := listen.Accept()
        if err != nil {
            fmt.Println("server accept failed, err:", err)
            continue
        }

        // 启动1个goroutine来处理TCP连接
        go process(conn)
    }

}

```

# TCP Client

```go
package main

import (
   "bufio"
   "fmt"
   "net"
   "os"
   "strings"
)

func main() {

   // 建立TCP连接
   conn, err := net.Dial("tcp", "127.0.0.1:20000")
   if err != nil {
      fmt.Println("dial failed, err:", err)
      return
   }

   // 关闭连接资源
   defer conn.Close()

   inputReader := bufio.NewReader(os.Stdin)
   for {

      // 读取用户输入
      input, _ := inputReader.ReadString('\n')
      inputInfo := strings.Trim(input, "\r\n")

      // 输入Q退出
      if strings.ToUpper(inputInfo) == "Q" {
         return
      }

      // Client向Server发送数据
      _, err = conn.Write([]byte(inputInfo))
      if err != nil {
         fmt.Println("client send data failed, err:", err)
         return
      }

      buf := [512]byte{}
      n, err := conn.Read(buf[:])
      if err != nil {
         fmt.Println("recv failed, err:", err)
         return
      }

      fmt.Println(string(buf[:n]))
   }

}
```