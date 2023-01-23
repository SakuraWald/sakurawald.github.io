---
title: "solve linear in-homogeneous recursive relations"
date: 2022-04-07 00:00:00
tags:
  - combinatorics
---

#### Solve Linear In-homogeneous Recursive Relations





##### Example

###### Example 1: Hanoi Problem

- 有`三根柱子`，在`其中一根柱子`上`穿有大小递增的n个圆盘`，最大的圆盘放在底部。

现在，要`一次一个`地将`这些圆盘`移动到`另一根柱子`上，而且规定任何时刻都`不允许将大圆盘放在小圆片的上面`。

求：将圆盘从一根柱子转移到另一根柱子所需的`移动次数`

---

设$h_n$是将`n个圆盘从一根柱子移动到另一根柱子所需的移动次数`。

$h_n = h_{n-1} + 1 + h_{n+1} = 2h_{n-1} + 1,\quad (n \ge 1)$

> 假如说，我们有3根柱子，初始时第1根和第3根柱子都不放圆盘，第2根柱子放n个圆盘。
>
> 如果要将这n个圆盘移动到其他圆盘上（就比如说移动到第3个柱子）。
>
> 则，我们首选，要将`最上面的n-1个圆盘`移动到`第1个柱子`，然后把`第2根柱子底下最大的那个圆盘`移动到`第3根柱子`。
>
> 之后，再`从第一根柱子把n-1个圆盘`移动到`第3根柱子`
>
> > 这个子问题分解有一个好处是，可以`简单地忽略掉` `比问题规模里所有圆盘都更大的圆盘`，而这并不会`改变问题的性质`。
> >
> > 所以我们可以从`问题规模n`中分解`子问题规模n-1`，但却仍然`保持原问题的性质`

同时，易得$h_0 = 0$

---

- 求解$h_n = 2h_{n-1} + 1,\quad (n\ge1), h_0 = 0$

---

$$
\boxed{\text{Iteration Method}} \\
\begin{aligned}
h_n &= 2h_{n-1} + 1 \\
h_n &= 2(2h_{n-2} + 1) + 1 = 2^2h_{n-2} + 2 + 1 \\
h_n &= 2^2(2h_{n-3} + 1) + 2 + 1 = 2^3h_{n-3} + 2^2 + 2 + 1 \\
\vdots \\ 
h_n &= 2^{n}h_0 + 2^{n-1}h_1 + (2^{n-1} + 2^{n-2} + \cdots + 2^0) \\
h_n &= 2^{n-1} + 2^{n-2} + \cdots + 2^0 \\
&= \frac{2^n - 1}{2-1} \textcolor{blue}{= 2^n - 1} 
\end{aligned}
$$

> `Brahma/Reve Problem`指的是存在4根柱子的汉诺塔问题，这些问题尚未被解决。

---

$$
\boxed{\text{Generating Funtion Method}} \\
\begin{aligned}
& h_n = 2h_{n-1} + 1,\quad (n \ge 1), h_0 = 0 \\
& \implies h_n - 2h_{n-1} - 1 = 0 \\
& g(x) \dot{=} \sum_{n=0}^{\infty}{h_nx^n} \\
& \begin{cases}
g(x) = h_0 + h_1x^1 + h_2x^2 + \cdots \\
-2xg(x) = -2h_0x - 2h_1x^2 - 2h_2x^3 - \cdots \\
\end{cases} \\
& \implies (1-2x)g(x) = h_0 + (h_1 - 2h_0)x + (h_2 - 2h_1)x^2 + \cdots (h_n - 2h_{n-1})x^n + \cdots \\
& = (x + x^2 + \cdots + x^n + \cdots) \\
& =  \frac{1}{1-x} \\
& \implies g(x) = \frac{1}{(1-x)(1-2x)} \textcolor{red}{= \frac{c_1}{1-x} + \frac{c_2}{1-2x}} \\
& \implies c_1(1-2x) + c_2(1-x) = g(x) \\
& \because \begin{cases}
c_1 - c_2 = 0 \\
-c_1 = 1
\end{cases}
\implies \begin{cases}
c_1 = -1 \\
c_2 = 1
\end{cases} \\
& \textcolor{red}{\therefore g(x) = \frac{1}{1-2x} - \frac{1}{1-x}} \\
& = \sum_{n=0}^{\infty}{(2x)^n} - \sum_{n=0}^{\infty}{x^n} \\
& = \sum_{n=0}^{\infty}{(2^n - 1)x^n} \\
& \implies h_n = 2^n - 1
\end{aligned}
$$

###### Example 2

> - Background
>   $$
>   \boxed{\text{A quick solution}} \\
>   \begin{aligned}
>   h_n &\dot{=} ah_{n-1} + b_n \quad(n \ge 1) \\
>   \textcolor{blue}{\text{if } a = 1, h_n }&\textcolor{blue}{= h_{n-1} + b_n} \\
>   &\textcolor{blue}{=h_0 + (b_1 + b_2 + \cdots + b_n)}
>   \end{aligned}
>   $$

求解$h_n = 3h_{n-1} - 4n \quad(n \ge 1), h_0 = 2$

---

> Method 1: Differential Equation Method

> 首先，这是一个`非齐次线性微分方程`，因为$b_n = -4n \ne 0$
>
> 所以，`非通 = 齐通 + 非特`

- 齐次线性微分方程的通解

$$
\boxed{\text{Differential Equation Method}}
\left\{
\begin{aligned}

% 1
&\begin{aligned}
&\boxed{\text{齐次线性微分方程的通解}} \\
& \begin{aligned}
& h_n - 3h_{n-1} \dot{=} 0 \quad(n \ge 1) \\
& \implies q - 3 = 0 \implies q = 3  \\
& \textcolor{magenta}{\implies h_n = c3^n \quad(n \ge 1)}
\end{aligned} 
\end{aligned} \\

% 2
&\begin{aligned}
&\boxed{\text{非齐次线性微分方程的特解}} \\
& \begin{aligned}
& h_n = 3h_{n-3} - 4n \quad(n \ge 1) \\
& \textcolor{red}{h_n \dot{=} rn + s} \textcolor{blue}{= 3(r(n-1) + s) - 4n} \\
& \implies \begin{cases}
r = 3r - 4 \\
s = -3r + 3s
\end{cases} \implies \begin{cases}
r = 2 \\
s = 3
\end{cases} \\
& \textcolor{magenta}{\implies h_n = 2n + 3}
\end{aligned}
\end{aligned} \\

% 3
&\begin{aligned}
&\boxed{\text{非齐次线性微分方程的通解}} \\
&\begin{aligned}
&\textcolor{magenta}{h_n = c3^n + 2n + 3} \\
&=-3^n+2n+3
\end{aligned}
\end{aligned}



\end{aligned}
\right.
$$

> - 求解`非齐次线性微分方程`的策略
>
> 1. 求`齐次线性微分方程的通解`：难点在于求解`特征方法`
>
> 2. 求`非齐次线性微分方程的特解`：难点在于`如何尝试特定类型的特殊解`
>
>    > - 若$b_n$是`n的k次多项式`，则寻找也是`n的k次多项式`的特殊解
>    >   - $b_n = d(constant) \implies h_n = r $
>    >   - $b_n = dn + e \implies h_n = rn + s$
>    >   - $b_n = dn^2 + en + f \implies h_n = rn^2 + sn + t$
>    > - 若$b_n$是`指数形式`，则寻找也是`指数形式`的特殊解
>    >   - $b_n = d^n \implies h_n = pd^n$
>
> 3. 将`通解`和`特解`做线性组合，并确定其中的`常数`

---

> Method 2: Generating Function Method

> 利用`生成函数法`可以避免`微分方程法`中的`求解非齐次线性微分方程的特解`问题。

$$
\begin{aligned}
& h_n = 3h_{n-1} - 4n \quad(n \ge 1), h_0 = 2 \\
& \implies h_n - 3h_{n-3} = -4n \\
& g(x) \dot{=} \sum_{n=0}^{\infty}{h_nx^n} \\
& \implies \begin{cases}
g(x) = h_0 + h_1x^1 + h_2x^2 + \cdots h_nx^n + \cdots \\
-3xg(x) = -3h_0x -3h_1x^2 -3h_2x^3 - \cdots - 3h_{n-1}x^n - \cdots \\
\end{cases} \\
& \begin{aligned}
\implies (1-3x)g(x) &= h_0 + (h_1 - 3h_0)x^1 + (h_2 - 3h_1)x^2 + \cdots + (h_n - 3h_{n-1})x^n + \cdots \\
&= h_0 + ((-4\times 1)x^1 + (-4 \times 2)x^2 + \cdots + (-4 \times n)x^n + \cdots) \\
&= 2 - 4n(\frac{1}{1-x})
\end{aligned} \\
& \implies \cdots
\end{aligned}
$$

###### Example 3

求解$h_n = 2h_{n-1} + 3^n \quad(n \ge 1), h_0 = 2$

---

$$
\boxed{\text{Differential Equation Method}} \left\{
\begin{aligned}

% 1
& \begin{aligned}
& \boxed{\text{齐次方程的特解}} \\
& h_n \dot{=} 2h_{n-1} \implies h_n - 2h_{n-1} = 0 \\
& \implies q - 2=  0 \implies q = 2 \\
& \textcolor{magenta}{h_n = c2^n}
\end{aligned} \\

% 2
& \begin{aligned}
& \boxed{\text{非齐次方程的通解}} \\
& h_n = 2h_{n-1} + 3^n \quad(n \ge 1), h_0 = 2\\
&\begin{aligned}
h_n \dot{=} p3^n &= 2(p3^{n-1}) + 3^n \\
\implies (p-1)3^n &= (2p)3^{n-1} \\
3 &= \frac{2p}{p-1} \\
\end{aligned} \\
& \textcolor{magenta}{\implies p = 3 \implies h_n = 3^{n+1}} \\
\end{aligned} \\

% 3
& \begin{aligned}
& \boxed{\text{非齐次方程的通解}} \\
& h_n = c2^n + 3^{n+1} \\
& \textcolor{magenta}{\implies h_n = -2^n + 3^{n+1} \quad(n \ge 0)}
\end{aligned}
\end{aligned}
\right.
$$

---

$$
\boxed{\text{Generating Function Method}}
\left\{
\begin{aligned}

& h_n = 2h_{n-1} + 3^n \quad(n \ge 1), h_0 = 2\\
& \implies h_n - 2h_{n-1} = 3^n \\
& g(x) \dot{=} \sum_{n=0}^{\infty}{h_nx^n} \\
& \implies \begin{cases}
g(x) = h_0 + h_1x^1 + h_2x^2 + \cdots + h_nx^n + \cdots \\
-2xg(x) = -2h_0x -2h_1x^2 - 2h_2x^3 + \cdots - 2h_{n-1}x^n + \cdots \\
\end{cases} \\
& \begin{aligned}
\implies \textcolor{red}{(1-2x)g(x)} &= h_0 + (h_1 - 2h_0)x^1 + (h_2 - 2h_1)x^2 + \cdots + (h_n - 2h_{n-1})x^n + \cdots \\
& = h_0 + (3^1x^1 + 3^2x^2 + \cdots + 3^nx^n + \cdots) \\
& = h_0 + (\frac{1}{1-3x} - 1) \\
&\textcolor{red}{= 1 + \frac{1}{1-3x}}
\end{aligned} \\
& \begin{aligned}
&\left.
\begin{aligned}
\implies g(x) &= \frac{1}{1-2x} + \frac{1}{(1-3x)(1-2x)} \\
&= \frac{1}{1-2x} + \textcolor{red}{(\frac{c_1}{1-3x} + \frac{c_2}{1-2x})} \\
\end{aligned}
\right\} \text{ Multiplied by } (1-2x)(1-3x)\\

& \implies (1-3x) + c_1(1-2x) + c_2(1-3x) = g(x)\textcolor{red}{(1-2x)(1-3x)} = (1-3x) + 1 \\
& \implies c_1(1-2x) + c_2(1-3x) = 1 \\
& \implies \begin{cases}
(n =0) & c_1 + c_2 = 1 \\
(n = 1) & -c_1 -2c_2 = -1
\end{cases} \implies
\begin{cases}
c_1 = 3 \\
c_2 = -2
\end{cases} \\
& \begin{aligned}
\implies g(x) &= \textcolor{red}{\frac{1}{1-2x} + \frac{3}{1-3x} - \frac{2}{1-2x} \quad\text{(Newton's Binomial Theorem)}} \\
&= \sum_{n=0}^{\infty}{(2^n + 3^{n+1} - 2^{n+1})x^n} \\
&= \sum_{n=0}^{\infty}{(-2^n + 3^{n+1} )x^n}
\end{aligned} \\
& \textcolor{magenta}{\implies h_n = -2^n + 3^{n+1} \quad(n \ge 0)}
\end{aligned}

\end{aligned}
\right.
$$
