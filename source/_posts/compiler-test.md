---
title: Compiler Test
tags:
  - test
id: '1233'
categories:
  - - uncategorized
date: 2023-1-15 11:00:00
---

> **Warning**
>
> This is a warning

```java
Hello World
```



```mermaid
graph TD;
      A-->B;
      A-->C;
      B-->D;
      C-->D;
```

>```mermaid
>graph TD;
>      A-->B;
>      A-->C;
>      B-->D;
>      C-->D;
>```



>```java
>This is the first line.
>This is the second line.
>This is the thrid line.
>```











Hi









>```mermaid
>classDiagram
>class JspContext {
>+getAttribute(String name)
>+getAttribute(String name, int scope)
>+getAttributeNames()
>+findAttribuite(String name)
>}
>
>JspContext <-- PageContext
>class PageContext{
>+APPLICATION_SCOPE
>+PAGE_SCOPE
>+REQUEST_SCOPE
>+SESSION_SCOPE
>+getRequest()
>+getServletConfig()
>+getServletContext()
>+getSession()
>}
>```





> 原理：$\lceil x/y \rceil = \lfloor(x\textcolor{blue}{+y-1})/y \rfloor$
>
> 证明
> $$
> \begin{aligned}
> &\boxed{\text{采用Biasing修复算术右移默认的向下舍入误差}} \\
> &x \dot{=} qy + r,\quad 0 \le r \lt y \\
> &\implies (x+y-1)/y = q + (r+y-1)/y \\
> &\implies \lfloor (\textcolor{red}{x}+y-1)/y \rfloor = q + \lfloor (\textcolor{red}{r}+y-1)/y\rfloor \\
> &= q + epsilon(r) =
> \begin{cases}
> 0,& r = 0 \\
> 1 ,& r \gt 0
> \end{cases}
> \end{aligned}
> $$



$\lceil x/y \rceil = \lfloor(x\textcolor{blue}{+y-1})/y \rfloor$


$$
\begin{aligned}
first \\
second
\end{aligned}
$$
