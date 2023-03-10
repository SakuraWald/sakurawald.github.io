---
title: "[Combinatorics] Recursion and Generating Functions"
date: 2022-04-07 18:38:00
tags:
  - combinatorics
---
{% raw %}

# Recursion And Generate

## Sequence

### Arithmetic Sequence & Geometric Sequence

$$
\boxed{\text{Arithmetic Sequence}} \\
\begin{aligned}
h_n &= h_{n-1} + q,\quad (n \ge 1) \\
h_n &= h_0 + nq,\quad (n \ge 0) \\
s_n &= \sum_{k=0}^{n}{h_0 + kq} = (n+1)h_0 + \frac{qn(n+1)}{2}
\end{aligned}
$$

$$
\boxed{\text{Geometric Sequence}} \\
\begin{aligned}
h_n &= qh_{n-1},\quad (n \ge 1) \\
h_n &= h_0 q^n (n \ge 0) \\
s_n &= \sum_{k=0}^{n}{q^k h_0} = 
\begin{cases}
\frac{q^{n+1}-1}{q-1}h_0,& (q \ne 1), \\
(n+1)h_0,& (q = 1)
\end{cases}
\end{aligned}
$$

### Fibonacci Sequence

$$
\boxed{\text{Fibonacci Sequence}} \\
\begin{aligned}
f_0 &= 0 \\
f_1 &= 1 \\
f_n &= f_{n-1} + f_{n-2}, \quad (n \ge 3)
\end{aligned}
$$

#### Theory

##### Theory 1

$$
\boxed{\text{The Partial Sum of Fibonacci Sequence}} \\
s_n = f_0 + f_1 + \cdots + f_n = f_{n+2} - 1
$$

---

$$
\text{Proof: Mathematical Induction} \\
\begin{aligned}
f_0 + f_1 + \cdots + f_{n+1} &= (f_0 + \cdots + f_n) + f_{n+1} \\
&= (f_{n+2} - 1) + f_{n+1} \\
&= f_{n+3} - 1
\end{aligned}
$$

##### Theory 2

$$
f_n \mod 2 = 0 \iff n \mod 3 = 0
$$

##### Theory 3

$$
\boxed{\text{Solve the Fibonacci Equation}} \\
\begin{aligned}
f_n &= f_{n-1} + f_{n-2},\quad (n \ge 2)\\
f_n - f_{n-1} - f_{n-2} &= 0 \\
f_n &\dot{=} \textcolor{blue}{q^n} \\
q^n - q^{n-1} - q^{n-2} &= 0 \\
\textcolor{blue}{q^{n-2}}(q^2-q-1) &= 0, n = 2,3,\cdots \\
LHS = 0 &\iff q^2-q-1 = 0 \\
q_1 &= \frac{1 + \sqrt{5}}{2}, q_2 = \frac{1-\sqrt{5}}{2} \\
f_n &= (\frac{1+\sqrt{5}}{2})^n, f_n = (\frac{1-\sqrt{5}}{2})^n \\
f_n &= c_1f_n + c_2f_n \\
f_n &= c_1(\frac{1+\sqrt{5}}{2})^n + c_2(\frac{1-\sqrt{5}}{2})^n \\
&\because
\begin{cases}
n = 0, f_0 = c_1 + c_2 = 0\\
n = 1, f_1 = c_1\frac{1+\sqrt{5}}{2} + c_2\frac{1-\sqrt{5}}{2} = 1\\
\end{cases} \\
&\therefore c_1 = \frac{1}{\sqrt{5}}, c_2 = -\frac{1}{\sqrt{5}} \\
\implies \textcolor{blue}{f_n} &\textcolor{blue}{= \frac{1}{\sqrt{5}}(\frac{1+\sqrt{5}}{2})^{n} - \frac{1}{\sqrt{5}}(\frac{1-\sqrt{5}}{2})^{n} \quad(n \ge 0) }

\end{aligned}
$$

#####  Theory 4

在`帕斯卡三角形`的`从左下到右上的对角线上的二项式系数的和`就是`斐波那契数`：
$$
f_n = \binom{n-1}{0} + \binom{n-2}{1} + \cdots + \binom{n- \lfloor \frac{n+1}2{} \rfloor}{\lfloor \frac{n+1}{2} \rfloor -1}
$$

---

$$
\begin{aligned}
g_0 &\dot{=} 0 \\
g_n &= \binom{n-1}{0} + \binom{n-2}{1} + \binom{n-3}{2} + \cdots + \binom{n - \lfloor \frac{n+1}{2} \rfloor}{\lfloor \frac{n+2}{2} \rfloor - 1} \\
&= \binom{n-1}{0} + \binom{n-2}{1} + \binom{n-3}{2} + \cdots + \textcolor{blue}{\binom{0}{n-1}},\quad (n \ge 1)\\
&= \sum_{p=0}^{n-1}{\binom{n-1-p}{p}}
\end{aligned}
$$

故，只需证明$g_n$满足`斐波那契关系`。
$$
\text{Mathematical Induction} \\
\begin{aligned}

g_0 &= 0, \\
g_1 &= 1 \\
g_2 &= 1 + 0 = 1 \\
g_n &= g_{n-1} + g_{n-2} \\
&= \sum_{k = 0}^{n-2}{\binom{n-2-k}{k}} + \sum_{j=0}^{n-3}{\binom{n-3-j}{j}} \\
&= \textcolor{blue}{\binom{n-2}{0} + \sum_{k=1}^{n-2}{\binom{n-2-k}{k}}} + \textcolor{red}{\sum_{j=0}^{n-3}{\binom{n-3-j}{j}}} \\
&= \textcolor{blue}{\binom{n-2}{0} + \sum_{k=1}^{n-2}{\binom{n-2-k}{k}}} + \textcolor{red}{\sum_{j=1}^{n-2}{\binom{n-2-j}{j - 1}}} \\
&= \binom{n-2}{0} + \sum_{k=1}^{n-2}{\binom{n-2-k}{k} + \binom{n-2-k}{k-1}} \\
&= \textcolor{red}{\binom{n-2}{0}} + \sum_{k=1}^{n-2}{\binom{n-1-k}{k}} \\
&= \textcolor{red}{\binom{n-1}{0} + \binom{0}{n-1}} + \sum_{k=1}^{n-2}{\binom{n-1-k}{k}} \\
&= \textcolor{red}{\sum_{k=0}^{n-1}{\binom{n-1-k}{k}}} \\
&= g_n
\end{aligned}
$$

Q.E.D



#### Example

#####  Example 1

$$
\text{Solve the equation} \\
\begin{aligned}
g_n &= g_{n-1} + g_{n-2},
g_0 = 2,
g_1 = -1
\end{aligned}
$$

##### Example 2

求使用`多米诺骨牌` `完美覆盖` `2 × n棋盘`的`方法数`$h_n$

---

尝试将`原问题`的转化为`子问题`。

可以将`所有的放置方案` `划分`为两种`类型`

1. 第一个2 × 1的棋盘放置1个`竖直多米诺骨牌`：该种类型的方案数为$h_{n-1}$
2. 第一个2 × 2的棋盘放置2个`水平多米诺骨牌`：该种类型的方案数为$h_{n-2}$

综上，$h_n = h_{n-1} + h_{n-2},\quad (n \ge 2)$

> 我们定义$h_0 = 1$，计算求得$h_1 = 1$



### General Generating Functions

#### Definition

> `生成函数`是无限可微分函数的`泰勒级数 (Taylor)` `(幂级数展开式)`

若$h_0,h_1,\cdots,h_n,\cdots$是`无穷数列`，则它的`生成函数 (Generating Function)`定义为`无穷级数`$g(x) = h_0 + h_1x + h_2x^2 + \cdots + h_nx^n + \cdots$



#### Example

##### Example 1

$$
\boxed{\text{The general generating function of infinite sequence: } {1,1,\cdots}} \\
\begin{aligned}
g(x) &= 1 + x^1 + x^2 + \cdots + x^n + \cdots \\
&= \textcolor{red}{\frac{1}{1-x}}
\end{aligned}
$$

##### Example 2

---

$$
\boxed{\text{The general generating function of finite sequence: } \binom{n}{0} + \binom{n}{1} + \cdots + \binom{n}{n}} \\
\begin{aligned}
g(x) &= \binom{n}{0} + \binom{n}{1}x^1 + \cdots + \binom{n}{n}x^m \\
&= \textcolor{red}{(1+x)^n}
\end{aligned}
$$

##### Example 3

$$
\boxed{\text{The number of non-negative integer solutions to the equation: } e_1 + e_2 + \cdots + e_n = n}\\
\begin{aligned}
h_n &= \textcolor{blue}{\binom{n+k-1}{k-1} = \binom{n+k-1}{n}},\quad (n \ge 0) \\
g(x) &= \sum_{n=0}^{\infty}{\binom{n+k-1}{k-1} x^n } \\
&= \underbrace{\textcolor{blue}{(1+x^1+x^2+\cdots)(1+x^1+x^2+\cdots)\cdots(1+x^1+x^2+\cdots)}}_{\textcolor{red}{\text{k items}}} \\
&= (\sum_{e_1=0}^{\infty}{x^{e_1}})(\sum_{e_2=0}^{\infty}{x^{e_2}})\cdots(\sum_{e_k = 0}^{\infty}{x^{e_k}}) \\
&= (\frac{1}{1-x})(\frac{1}{1-x})\cdots(\frac{1}{1-x}) \\
&= \textcolor{red}{(\frac{1}{1-x})^k}
\end{aligned}
$$

> 由于 `这k个因子中的每一个项的系数均为1`，所以$x_n$`的系数` = `方程的非负整数解的个数`

##### Example 4

确定`苹果`，`香蕉`，`橘子`和`梨`的`n组合的个数`，且要求苹果的个数是偶数，香蕉的个数是奇数，橘子的个数在0和4之间，至少要有1个梨。

---

$$
\begin{aligned}
& e_1 + e_2 + e_3 + e_4 = n \\
\implies & g(x) = (1 + x^2 + x^4 + \cdots)(x^1 + x^3 + \cdots)(x^0 + x^1 + x^2 + x^3 + x^4)(x^1 + x^2 + \cdots) \\
\implies &= (\frac{1}{1-\textcolor{red}{x^2}})(\frac{x}{1-x^2})(\textcolor{red}{\frac{1-x^5}{1-x}})(\frac{x}{1-x}) \\
\implies &= \frac{x^2(1-x^5)}{(1-x^2)^2(1-x)^2} \\
\implies &\text{Taylor Expansion}
\end{aligned}
$$

> 当$e_i$前面带有`系数`时，我们可以很容易地将`系数`变为`1`
>
> > 只需要简单的使用`变量替换`即可，则$e_i \rightarrow e_i'$

##### Example 5

$$
\boxed{\text{The general generating function: } \frac{1}{(1-x)^2}} \\
\begin{aligned}
g(x) &= \textcolor{red}{\frac{1}{(1-x)^2}} \\
&= \sum_{n=0}^{\infty}{\binom{n+1}{n}x^n} \\
&= \textcolor{red}{\sum_{n=0}^{\infty}{(n+1)x^n} = 1 + 2x + 3x^2 + 4x^3 + \cdots + nx^{n-1} + \cdots}
\end{aligned}
$$

##### Example 6

$$
\boxed{\text{Background}} \\
\left\{
\begin{aligned}
& \pi \dot{=} i_1i_2\cdots i_n \text{ is the arrangement of } S = \{1,2,\cdots, n\}\\ 
& 0 \le inv(\pi)\le \frac{n(n-1)}{2} \\
& h(n,t) \dot{=} |\{\pi | S = \{1,2\cdots,n\}, inv(\pi) = t\}| \\
\end{aligned}
\right.
\implies
\begin{aligned}
& h(n,t) = 
\begin{cases}
1,& 0 \le t \le \frac{n(n-1)}{2} \\
0,& t \gt \frac{n(n-1)}{2}
\end{cases}
\end{aligned}
\\

\boxed{\text{Request for proof}} \\
\begin{aligned}
\textcolor{green}{g_n(x) = h(n,0) + h(n,1)x + h(n,2)x^2 + \cdots + h(n, n(n-1)/2)x^{n(n-1)/2} }\\

\end{aligned}
$$

---

$$
\boxed{\text{Theory}} \\
\begin{aligned}
g_n(x) &= 1(1+x^1)(1+x^1+x^2)\cdots(1+x^1+x^2+x^3\cdots+x^{n-1}) \\
&= (\frac{1-x^1}{1-x})(\frac{1-x^2}{1-x})\cdots(\frac{1-x^n}{1-x})\\
&=\textcolor{red}{\frac{\prod_{j=1}^{n}{(1-x^j)}}{(1-x)^n}} \\
\end{aligned}
$$

> `多项式`$g_n(x)$`的次数 = `  $0+1+2+\cdots+(n-1) = \frac{n(n-1)}{2}$

对于所有的$p = 0,1,\cdots,n(n-1)/2$，有g(x)$中$$x^p$的系数 = $h(n,p)(x)$

Q.E.D



### Exponential Generating Functions

#### Definition

$$
\boxed{\text{Taylor Series}} \\
e^x = \sum_{n=0}^{\infty}{\frac{x^n}{n!}} = 1 + \frac{x}{1!} + \frac{x^2}{2!} + \cdots + \frac{x^n}{n!} + \cdots
$$

$$
\boxed{\text{Exponential Generating Functions}} \\
g^{(e)}(x) = \sum_{n=0}^{\infty}{h_n\frac{x^n}{n!}}
$$

#### Example

##### Example 1

$$
\boxed{\text{The generating function of infinite sequence: } P(n,0), P(n,1), \cdots, P(n,n)} \\
\begin{aligned}
g^{(e)}(x) &= P(n,0) + P(n,1)\frac{x^1}{1!} + P(n,2)\frac{x^2}{2!} + \cdots + P(n,n)\frac{x^n}{n!} \\
&= 1 + \frac{n!}{(n-1)!}\frac{x^1}{1!} + \frac{n!}{(n-2)!}\frac{x^2}{2!} + \cdots + \frac{n!}{0!}\frac{x^n}{n!} \\
&= \textcolor{red}{1 + nx + \frac{n!}{2!(n-2)!}x^2} + \cdots + \frac{n!}{n!0!}x^n \\
&= \textcolor{red}{(1+x)^n}
\end{aligned}
$$

##### Example 2

$$
\boxed{\text{The exponential generating function of infinite sequence: }1, a^1, a^2 \cdots} \\
\begin{aligned}
g^{(e)}(x) &= a^0 \times \frac{x^0}{0!} + a^1 \times \frac{x^1}{1!} + a^2 \times \frac{x^2}{2!} + \cdots \\
&= \sum_{n=0}^{\infty}{a^n \times \frac{x^n}{n!}} \\
&= \sum_{n=0}^{\infty}{\frac{(ax)^n}{n!}} \\
&= e^{ax}
\end{aligned}
$$

##### Example 3

$$
\boxed{\text{The exponential generating function of permutations}} \\
\left\{
\begin{aligned}
& S = \{n_1 \cdot a_1, n_2 \cdot, a_2, \cdots, n_k \cdot a_k \}, n_i \ge 0 \\
& h_n \text{ is the number of permutations of S}
\end{aligned}
\right.
\\ \implies
\left\{
\begin{aligned}
& \textcolor{red}{f_{n_i}(x) = 1 + \frac{x^1}{1!} + \frac{x^2}{2!} + \cdots \frac{x^{n_i}}{{n_i}!}} \\
& g^{(e)}(x) = f_{n_1}(x) f_{n_2}(x) \cdots f_{n_k}(x) \\
\end{aligned}
\right.
$$

---

$$
\begin{aligned}
g^{(e)}(x) &= f_{n_1}(x)f_{n_2}(x)\cdots f_{n_k}(x) \\
&= \textcolor{green}{(1 + \frac{x^1}{1!})(1 + \frac{x^2}{2!})\cdots(1 + \frac{x^1}{1!} + \cdots + \frac{x^k}{k!})} \\
&= \textcolor{green}{\frac{x^{m_1}}{m_1!} \frac{x^{m_2}}{m_2!}\cdots\frac{x^{m_k}}{m_k!}, \quad (0 \le m_1 \le n_1, 0 \le m_2, \le n_2,\cdots, 0 \le m_k \le n_k)} \\
&= \frac{x^{m_1+m_2+\cdots+m_k}}{m_1!m_2!\cdots m_k!} \\
&let\ n = m_1 + m_2 + \cdots + m_k\\
\implies &\frac{x^n}{m_1!m_2!\cdots m_k!} = \textcolor{blue}{\frac{n!}{m_1!m_2!\cdots m_k!}}\frac{x^n}{n!} \\
& \text{the coefficient of}\frac{x^n}{n!}\text{ in the }g^{(e)}(x)\text{ is } 
\left\{
\begin{aligned}
& \textcolor{blue}{\sum{\frac{n!}{m_1!m_2!\cdots m_k!}}} \textcolor{red}{= h_n}  \\
& 0 \le m_1 \le n_1, 0 \le m_2 \le n_2, \cdots, 0 \le m_k \le n_k \\
& m_1 + m_2 + \cdots + m_k = n
\end{aligned}
\right. \\
\implies & g^{(e)}(x) = h_0 + h_1 \frac{x^1}{1!} + h_2 \frac{x^2}{2!} + \cdots + h_k \frac{x^k}{k!} + \cdots \\


\end{aligned}
$$

Q.E.D

##### Example 4

设$h_n$表示`由数字1,2,3构造的n位数的个数`，其中在`这个n位数`中：1的个数为偶数，2的个数至少为3，3的个数至多为4。

确定数列$h_0, h_1, \cdots, h_n, \cdots$的`指数生成函数`

---

$$
\begin{aligned}
g^{(e)}(x) &= h_1(x)h_2(x)h_3(x) \\
&= (1 + \frac{x^2}{2!} + \frac{x^4}{4!} + \cdots)(\frac{x^3}{3!} + \frac{x^4}{4!} + \dots)(\frac{x^0}{0!} + \frac{x^1}{1!} +
\frac{x^2}{2!} + \frac{x^3}{3!} + \frac{x^4}{4!}) \\
\end{aligned}
$$

##### Example 5

用`红色`，`白色`和`蓝色`三种颜色给`1 × n的棋盘`进行着色，求`被着色成红色的方格数是偶数的方案数`。

---

- Generating Functions

$$
\begin{aligned}
& h_n \dot{=} 0 \\
g^{(e)}(x) &= (1 + \frac{x^1}{1!} + \frac{x^2}{2!} + \cdots)(1 + \frac{x^1}{1!} + \frac{x^2}{2!} + \cdots)(1 + \frac{x^2}{2!} + \frac{x^4}{4!} + \cdots) \\
& = \textcolor{blue}{\frac{1}{2}(e^x + e^{-x})}e^xe^x \\
&= \frac{1}{2}(e^{3x}+e^x) \\
&= \frac{1}{2}(\sum_{n=0}^{\infty}{3^n \frac{x^n}{n!}} + \sum_{n=0}^{\infty}{\frac{x^n}{n!}}) \\
&\textcolor{blue}{= \frac{1}{2}\sum_{n=0}^{\infty}{(3^n + 1)\frac{x^n}{n!}}} 
\end{aligned}
$$

- Recursion

考虑`1 × n的棋盘`，我们可以`划分`为`两个部分`：`第1格`和`剩下的所有格子`：

1. 如果`第一格涂非红色`
   1. 第一格涂白色：$h_{n-1}$
   2. 第一格涂蓝色：$h_{n-1}$
2. 如果`第一格涂红色`：则由于`奇偶性`可知，`剩下的格子中红色的方格数是奇数 = 所有方案 - 红色方格是偶数的方案`。$3^{n-1} - h_{n-1}$

综上，$h_n = (2h_{n-1}) + (3^{n-1} - h_{n-1}) = h_{n-1} + 3^{n-1} \implies h_n = \frac{3^n + 1}{2}$

##### Example 6

确定满足下列条件的`n位数的个数`：每个数字都是`奇数`，`数字1`和`数字3`出现偶数次。

---

$$
\begin{aligned}
g^{(e)}(x) &= (1 + \frac{x^1}{1!} + \frac{x^2}{2!} + \cdots)(1 + \frac{x^1}{1!} + \frac{x^2}{2!} + \cdots)(1 + \frac{x^1}{1!} + \frac{x^2}{2!} + \cdots)(1 + \frac{x^2}{2!} + \frac{x^4}{4!} + \cdots)(1 + \frac{x^2}{2!} + \frac{x^4}{4!} + \cdots) \\
&= (e^x)^3 (\frac{1}{2}({e^x + e^{-x}}))^2 \\

&= \frac{1}{4}(e^{5x} + 2e^{3x} + e^x) \\
&= \frac{1}{4}(\sum_{n=0}^{\infty}{\frac{(5x)^n}{n!}} + 2\sum_{n=0}^{\infty}{\frac{(3x)^n}{n!}} + \sum_{n=0}^{\infty}{\frac{(x)^n}{n!}}) \\
&= \frac{1}{4}(\sum_{n=0}^{\infty}{\frac{(5x)^n +(3x)^n + x^n}{n!}}) \\
&= \frac{1}{4}(\sum_{n=0}^{\infty}{(5^n + 2\times3^n + 1^n)\frac{x^n}{n!}}) \\
&= \sum_{n=0}^{\infty}{\frac{5^n + 2\times 3^n + 1}{4} \frac{x^n}{n!} } \\
\implies &\textcolor{blue}{h_n = \frac{5^n + 2 \times 3^n + 1}{4} \quad(n \ge 0)}
\end{aligned}
$$

#####  Example 7

确定使用`红色`，`白色`和`蓝色`三种颜色给`1 × n棋盘`的着色中：红格数量为`偶数`，蓝格`至少有一个` 的着色方法数。

---

$$
\begin{aligned}
g^{(e)}(x) &= \textcolor{green}{(1 + \frac{x^2}{2!} + \frac{x^4}{4!} + \cdots)(\frac{x^1}{1!} + \frac{x^2}{2!} + \cdots)(1 + \frac{x^1}{1} + \frac{x^2}{2!} + \cdots)} \\
&= (\frac{e^x + e^{-x}}{2})(e^x - 1)(e^x) \\
&= \frac{(e^x - 1)(e^{2x}+e^0)}{2} \\
&= \frac{e^{3x} + e^x - e^{2x} - 1}{2} \\
&= \frac{1}{2} (\sum_{n = 0}^{\infty}{\frac{(3x)^n}{n!}} + \sum_{n=0}^{\infty}{\frac{(e)^x}{n!}} - \sum_{n = 0}^{\infty}{\frac{(2x)^n}{n!}} - 1) \\
&= -\frac{1}{2} + \sum_{n=0}^{\infty}{ \frac{3^n + 1 - 2^n}{2} \frac{x^n}{n!}} \\
\implies
&
\left\{
\begin{aligned}
h_0 &= 0 \\
h_n &= \frac{3^n - 2^n + 1}{2} \quad(n = 1,2,\cdots)
\end{aligned}
\right.
\end{aligned}
$$



### Fractional Generating Functions

#### Definition

`分式生成函数`可以用于求解`k阶常系数线性齐次递推关系`：
$$
\frac{p(x)}{q(x)} = \frac{c}{(1-rx)^t}\quad(t \in Z^+, r \in \real, c \text{ is constant})
$$
$p(x)$是`次数小于k的多项式`，$q(x)$是`常数项等于1的k阶多项式`



#### Theory

##### Theory 1

设$h_0,h_1,h_2,\cdots,h_n$是满足$h_n + c_1h_{n-1} + \cdots + c_kh_{n-k} = 0,\quad c_k \ne 0 \quad(n \ge k)$的`k阶常系数齐次递推关系的数列`，则它的`生成函数` $g(x)$是

形如下列形式的函数$g(x) = \frac{p(x)}{q(x)}$，其中$p(x)$是`次数小于k的多项式`，$q(x)$是`常数项不等有0的k次多项式`。

反之，给定这样的`多项式`$p(x)$和$q(x)$，则存在`序列`$h_0,h_1,h_2,\cdots, $ 满足上述给出的类型的`k阶常系数齐次递推关系`，且`生成函数`为$g(x) = \frac{p(x)}{q(x)}$

---

$$
\boxed{\text{1}}\\
\begin{aligned}
& h_n + a_1h_{n-1} + \cdots + a_kh_{n-k} \dot{=} 0 \quad(n \ge k) \\
& \text{we assume that } a_k \ne 0 \\
& \therefore g(x) \dot{=} \frac{p(x)}{q(x)} = \frac{h_0 + (h_1 + a_1h_0)x + (h_2+a_1h_1+a_2h_0)x^3 + \cdots + (h_{k-1} + a_1h_{k-2} + \cdots + a_{k-1}h_0)x^{k-1}}{1+a_1x + a_2x^2 + \cdots + a_kx^k} \\
& \therefore r(x) = x^k + a_1x^{k-1} + a_2x^{k-2} \cdots + a_k = 0\\
& \implies q(x) = x^kr(\frac{1}{x})\\
& \therefore r(x)=(x-q_1)(x-q_2)\cdots(x-q_k) \\
& \therefore q(x) = (1-q_1x)(1-q_2x)\cdots(1-q_kx)\\
\end{aligned}\\

\boxed{\text{2}} \\
\begin{aligned}
& \begin{cases}
q(x) = b_0 + b_1x + \cdots + b_kx^k,\quad b_0 \ne 0 \\
p(x) = d_0 + d_1x + \cdots + d_{k-1}x^{k-1}
\end{cases}
\implies 
\frac{p(x)}{q(x)} = h_0 + h_1x + \cdots + h_nx^n + \cdots \\
& \because p(x) = d_0 + d_1x + \cdots + d_{k-1}x^{k-1} = (b_0 + b_1x  + \cdots + b_kx^k) \times (h_0 + h_1x + \cdots + h_nx^n + \cdots) \\
& \implies \begin{cases}
b_0h_0 = d_0 \\
b_0h_1 + b_1h_0 = d_1 \\
\vdots \\
b_0h_{k-1} + b_1h_{k-2} + \cdots + b_{k-1}h_0 = d_{k-1} \\
\end{cases} \\
& \because b_0h_n + b_1h_{n-1} + \cdots + b_kh_{n-k} = 0 \quad(n \ge k) \\
& \implies h_n + \frac{b_1}{b_0}h_{n-1} + \cdots + \frac{b_k}{b_0}h_{n-k} = 0 \quad(n \ge k)
\end{aligned}
$$



#### Example

##### Example 1

求解$h_n + h_{n-1} - 16h_{n-2} + 20h_{n-3} = 0 \quad(n \ge 3), h_0 = 0, h_1 = 1, h_2 = -1$

---

$$
\begin{aligned}
& g(x) = h_0 + h_1x + h_2x^2 + \cdots + h_nx^n + \cdots \\
& xg(x) = h_0x + h_1x^2 + h_2x^3 + \cdots + h_{n-1}x^{n} + \cdots \\
& -16x^2g(x) = -16h_0x^2 -16h_1x^3 -16h_2x^4 + \cdots + -16h_{n-2}x^n  + \cdots \\
& 20x^3g(x) = 20h_0x^3 + 20h_1x^4 + 20h_2x^5 + \cdots + 20h_{n-3}x^n + \cdots \\

& \because (1 + x -16x^2 + 20x^3)g(x) = h_0 + (h_0+h_1)x + (-16h_0 + h_1 + h_2)x^2 + \textcolor{red}{(h_3 + h_2 -16h_1+20h_0)x^3 + \cdots } \\
& \therefore g(x) = \frac{x}{(1+x-16x^2+20x^3)} \textcolor{red}{= \frac{x}{(1-2x)^2(1+5x)} = \frac{c_1}{1-2x} + \frac{c_2}{(1-2x)^2} = \frac{c_3}{1+5x}} \\
& \implies {x = (1-2x)(1+5x)c_1 + (1+5x)c_2 + (1-2x)^2 c_3} \\
& \implies \begin{cases}
c_1 + c_2 + c_3 = 0 \\
3c_1 + 5c_2 - 4c_3 = 1 \\
-10c_1 + 4c_3 = 0
\end{cases}
\implies c_1 = -\frac{2}{49}, c_2 = \frac{7}{49}, c_3 = -\frac{5}{49} \\
& \implies g(x) = -\frac{2/49}{1-2x} + \frac{7/49}{(1-2x)^2} - \frac{5/49}{1+5x} \\
& \implies g(x) = -\frac{2}{49} \sum_{k=0}^{\infty}{2^kx^k} + \frac{7}{49} \sum_{k=0}^{\infty}{(k+1)2^kx^k} 
- \frac{5}{49}\sum_{k=0}^{\infty}{(-5)^kx^k} \\
& \implies g(x) = \sum_{k=0}^{\infty}{\Big[-\frac{2}{49}2^k+\frac{7}{49}(k+1)2^k -\frac{5}{49}(-5)^k}\Big]x^k \\
& \implies h_n = -\frac{2}{49}2^n+\frac{7}{49}(k+1)2^n -\frac{5}{49}(-5)^n,\quad(n=0,1,\cdots)
\end{aligned}
$$

> $$
> \begin{aligned}
> & \because h_n + h_{n-1} - 16h_{n-2} + 20h_{n-3} = 0 \quad(n=3,4,\cdots) \\
> & \therefore q(x) = 1 + x - 16x^2 + 20x^3 \\
> & \therefore r(x) = x^3 + x^2 - 16x + 20 = 0 \\
> & \implies r(\frac{1}{x})= \frac{1}{x^3}+\frac{1}{x^2} - 16\frac{1}{x} + 20 \\
> & \implies x^3r(\frac{1}{x}) = 1 + x - 16x^2 + 20x^3 \textcolor{red}{= q(x)}\\ 
> & \because r(x) = (x-2)^2(x+5) \implies r_1=r_2=2, r_3 = 5 \\
> & \textcolor{red}{\therefore q(x) = x^3(\frac{1}{x} - 2)^2(\frac{1}{x}+5) = (1-2x)^2(x+5)} \\
> \end{aligned}
> $$



### Solve Recursive Relations

#### Solve Linear Homogeneous Recursive Relations

##### Definition

若$h_0,h_1,\cdots,h_n,\cdots$是一个`数列`。我们称该`数列`满足`k阶线性递推关系`是指：存在`量`$a_1,a_2,\cdots,a_k \quad(a_k \ne 0)$和`量`$b_n$，使得

$\textcolor{blue}{h_n = a_1h_{n-1} + a_2h_{n-2} + \cdots + a_kh_{n-k} + b_n \quad(a_k \ne 0, n \ge k)}$

> $a_1,a_2,\cdots a_k ,b_n$有可能是`常数`，也有可能依赖于$n$

> 如果$a_1,a_2,\cdots, a_k$是`常数`，则我们称这个`线性递推关系`是`常系数的 (Constant Coefficient)`
>
> 如果$b_n = 0$，则我们称这个`线性递推关系` 是`齐次的 (Homogenous)`

`初始值`指的是$h_0,h_1,\cdots,h_{k-1}$的值，一旦初始值被指定后，`递推关系`就`唯一确定`，而`递推关系`将从`n=k`开始`生效`。



##### Theory

###### Theory 1

设`q`是一个`非零的数`，则$h_n = q^n$是下面`常系数线性齐次递推关系`$h_n - a_1h_{n-1} - a_2h_{n-2} - \cdots - a_kh_{n-k} = 0 \quad(a_k \ne 0, n \ge k)$的`解` `当且仅当` `q`是下面`多项式方程`$x^k - a_1x^{k-1} - a_2x^{k-2} - \cdots - a_k = 0$的`根`。

如果`多项式方程`有`k个不同的根`$q_1, q_2, \cdots, q_k$则 $h_n = c_1q_1^n + c_2q_2^n + \cdots + c_kq_k^n$是`常系数线性齐次递推关系`的`通解`

> 注意：$h_n$是通解的前提是，这k个根是`不同的`，也就是这k个根中不能有`重根`！

---

$$
\boxed{\text{Proof}} \\
\begin{aligned}

&\begin{aligned}
&h_n - a_1h_{n-1} + a_2h_{n-2} - \cdots - a_kh_{n-k} = 0 \quad(a_k \ne 0, n \ge k) \qquad\text{(Equation 1)}\\
&\textcolor{blue}{x^k - a_1x^{k-1} - a_2x^{k-2} - \cdots - a_k = 0 \qquad\text{(Equation 2 | Characteristic Equation)}} \\
\end{aligned}
\\\\

&\begin{aligned}
& h_n = q^n \text{ is the root of (Equation 1) } \iff q^n - a_1q^{n-1} - a_2q^{n-2} - \cdots a_k\textcolor{red}{q^{n-k}} = 0 \quad(n \ge k) \\
& \because q \ne 0 \implies \textcolor{blue}{q^k - a_1q^{k-1} - a_2q^{k-2} - \cdots - a_k = 0 \quad(n \ge k)} \\
& \implies h_n = q^n \text{ is the root of (Equation 1) } \iff q \text{ is the root of (Equation 2)} \\
& \because a_k \ne 0 \implies 0 \text{ is not the root of (Equation 2)} \implies \text{(Equation 2) has k non-zero roots } q_1, q_2, \cdots, q_k \quad\text{(Characteristic Root)}\\
& \implies h_n = q_1^n, h_n = q_2^n, \cdots, h_n = q_k^n \text{ is k roots of (Equation 1)} \\
& \textcolor{red}{\text{We assume that: } q_1 \ne q_2 \ne \cdots \ne q_k }
\end{aligned}
\\\\

&\begin{aligned}
& \text{Besides, we can prove that: } \textcolor{blue}{h_n = c_1q_1^n + c_2q_2^n + \cdots + c_kq_k^n} \text{ is also the root of (Equation 1)} \\
& h_0 \dot{=} b_0, h_1 \dot{=} b_1, \cdots, h_{k-1} \dot{=} b_{k-1} \\
& \implies 
(\text{Equation Set 1})
\begin{cases}
(n=0) & c_1 + c_2 + \cdots + c_k = b_0 \\
(n=1) & c_1q_1 + c_2q_2 + \cdots + c_kq_k = b_1 \\
(n=2) & c_1q_1^2 + c_2q_2^2 + \cdots + c_kq_k^2 = b_2 \\
&\vdots \\
\textcolor{blue}{(n = k-1)} & \textcolor{blue}{c_1q_1^{k-1} + c_2q_2^{k-1} + \cdots + c_kq_k^{k-1} = b_{k-1}}
\end{cases} \\
& \implies \text{The coefficient matrix is } 
\begin{bmatrix}
1 & 1 & \cdots & 1\\
q_1 & q_2 & \cdots & q_k \\
q_1^2 & q_2^2 & \cdots & q_k^2 \\
\vdots & \vdots & \ddots & \vdots \\
q_1^{k-1} & q_2^{k-1} & \cdots & q_k^{k-1}
\end{bmatrix} \\

& \because |\text{Vandermonde Matrix}| = \prod_{1 \le i \lt j\ \le k}{q_j - q_i} \\
& \therefore \prod_{1 \le i \lt j \le k}{q_j - q_i} \textcolor{red}{\ne 0} \implies \forall b_0,b_1,\cdots,b_{k-1}, \text{(The Equation 1) \textcolor{red}{has roots}}
\end{aligned}

\end{aligned}
$$

###### Theory 2

设$q_1, q_2, \cdots, q_t$是`常系数线性齐次递推关系`$h_n = a_1h_{n-1} + a_2h_{n-2} + \cdots + a_kh_{n-k},\quad (n \ge k)$`的特征方程`的`互不相同的根`。

如果$q_i$是`特征方程的`$s_i$`重根`，则这个`递推关系的通解`中`对应于`$q_i$`的部分`是$\textcolor{blue}{H_n^{(i)} = c_1q_i^n + c_2nq_i^n + \cdots + c_{s_i}n^{s_i - 1}q_i^n = (c_1 + c_2n + c_3n^2 + \cdots + c_{s_i}n^{s_i - 1}) q_i^n}$

这个`递推关系的通解`是$h_n = H_n^{(1)} + H_n^{(2)} + \cdots + H_n^{(t)}$

> 当求解递推关系遇到`重根`时，可以使用该方法`构造` `剩余的解`



##### Example

###### Example 1

$$
\boxed{\text{二阶常系数线性齐次微分方程}} \\
\begin{aligned}
&y'' - 5y' + 6y = 0 \\
& y \dot{=} e^{qx} \implies y' = qe^{qx}, y'' = q^2e^{qx} \\
& \implies \text{y is the root of the equation} \iff q^2e^{qx} - 5qe^{qx} + 6e^{qx} = 0 \iff  q^2 - 5q + 6 = 0 \\
& \implies q_1 = 2, q_2 = 3 \implies y_1 = e^{2x}, y_2 = e^{3x} \\
& \implies \textcolor{red}{y = c_1y_1 + c_2y_2 = c_1 e^{2x} + c_2 e^{3x}} \\
\end{aligned}
$$

###### Example 2

已知`初始值`$h_0 = 1, h_1 = 2, h_2 = 0$，求解`递推关系`$h_n = 2h_{n-1} + h_{n-2} - 2h_{n-3} \quad(n \ge 3)$

---

$$
\begin{aligned}
& \because h_n = 2h_{n-1} + h_{n-2} - 2h_{n-3} \quad(n \ge 3) \quad\text{(Recursive Equation)} \\
& \textcolor{blue}{\therefore h_n \dot{=} q^n \implies q^3 - 2q^2 - q + 2 = 0 \quad\text{(Characteristic Equation)}} \\
& \text{Solve the characteristic: } \\
& \implies q(q^2-2q-1)+2=0 \\
& \implies q_1 = 1, q_2 = -1, q_3 = 2\\
& \text {Construct the general solution: } \\
& \textcolor{blue}{q^n = h_n = c_1(1)^n + c_2(-1)^n + c_3(2)^n} \\
& \text{Solve the euqation set: } \\
& \text{Equation Set} 
\begin{cases}
(n = 0) & c_1 + c_2 + c_3 =  \textcolor{blue}{h_0} \\
(n = 1) & c_1(1)^1 + c_2(-1)^1 + c_3(2)^1 =  \textcolor{blue}{h_1} \\
(n = 2) & c_1(1)^2 + c_2(-1)^2 + c_3(2)^2 =  \textcolor{blue}{h_2} 
\end{cases} \\

& \implies c_1 = 2, c_2 = -\frac{2}{3}, c_3 = -\frac{1}{3} \\
& \implies h_n = 2 - \frac{2}{3}(-1)^n - \frac{1}{3}2^n 
\end{aligned}
$$

###### Example 3

只由三个`字母a, b, c`组成的`长度为n的一些单词`在`通信信道`上传输，满足条件：传输中不得有`两个连续的a`出现在`任一单词`。

确定`通信信道`中`允许传输的单词个数`

---

> Method 1: Solve the recursive equation

设$h_n$表示`允许传输的长度为n的单词个数`：

- $h_0$ = 1

  > $h_0$实际表示含义是`空单词`，这里我们是`定义`$h_0 = 1$以便符合$h_2$的递推关系。

- $h_1$ = 3

- $h_2 = 2 \times h_1 + 2 \times h_{0}$

- ...

- $h_n = 2 \times h_{n-1} + 2 \times h_{n-2} \quad(n \ge 2)$

根据`初始值`$h_0 = 1, h_1 = 3$求出`递推关系的解`

$h_n = \frac{2 + \sqrt{3}}{2\sqrt{3}}(1+\sqrt{3})^n + \frac{-2+\sqrt{3}}{2\sqrt{3}}(1-\sqrt{3})^n \quad(n \ge 0)$



> Method 2: Generating functions

$$
\boxed{\text{Newton's Binomial Theorm}} \\
\begin{aligned}
& \textcolor{red}{n \in Z^+, r \in \real , r\gt 0, (1-rx)^{-n} = \sum_{k=0}^{\infty}{\binom{-n}{k}}(-rx)^k} \\
&\implies \frac{1}{(1-rx)^n} = \sum_{k=0}^{\infty}{ (-1)^k \binom{-n}{k} r^kx^k } \quad(|x| \lt \frac{1}{|r|}) \\
& \textcolor{red}{\because \binom{-n}{k} = (-1)^k \binom{n+k-1}{k}} \\
& \therefore \frac{1}{(1-rx)^n} = \sum_{k=0}^{\infty}{\binom{n+k-1}{k} r^kx^k} \quad(|x| \lt \frac{1}{|r|})

\end{aligned}
$$

###### Example 4

确定下面`数列` 的`生成函数`：$0,1,4,\cdots,n^2,\cdots$

---

$$
\begin{aligned}
& \textcolor{blue}{\because \frac{1}{(1-x)^2} = 1 + 2x^1 + 3x^2 + \cdots + nx^{n-1} + \cdots} \\
& \therefore \frac{x}{(1-x)^2} = x + 2x^2 + 3x^3 + \cdots + nx^n + \cdots  \\
& \textcolor{red}{\implies \frac{1+x}{(1-x)^3} = 1 + 2^2x + 3^2x^2 + \cdots + n^2x^{n-1} + \cdots} \\
& \frac{x(1+x)}{(1-x)^3} = x + 2^2x^2 + 3^2x^3 + \cdots + n^2x^n \\
& \implies g^{(e)}(x) = \frac{x(1+x)}{(1-x)^3}  \\
\end{aligned}
$$

###### Example 5

使用`生成函数`求解`递归关系`。

$h_n = 5h_{n-1} - 6h_{n-2} \quad(n \ge 2), h_0 = 1, h_1 = 2$

---

$$
\begin{aligned}
&h_n \textcolor{blue}{- 5}h_{n-1} + \textcolor{blue}{6}h_{n-2} = 0 \quad(n \ge 2) \\
g(x) &\dot{=} h_0 + h_1x^1 + h_2x^2 + \cdots +\textcolor{blue}{h_nx^n} + \cdots \\
\implies \textcolor{blue}{-5x}g(x) &= -5h_0x -5h_1x^2 - 5h_2x^3 - \cdots \textcolor{blue}{-5h_{n-1}x^{n}} + \cdots \\
\implies \textcolor{blue}{6x^2}g(x) &= 6h_0x^2 + 6h_1x^3 + 6h_2x^4 + \cdots + \textcolor{blue}{6h_{n-2}x^{n}} + \cdots \\
\therefore (1-5x+6x^2) &= h_0 + (h_1 - 5h_0)x^1 + (h_2-5h_1+6h_0)x^2 + \cdots + (h_nx^n - 5h_{n-1}x^n + 6h_{n-2}x^n) \\
& \textcolor{red}{\because h_n - 5h_{n-1} + 6h_{n-2} = 0 \quad(n \ge 2)} \\
& \therefore \textcolor{green}{(1-5x+6x^2)g(x)} = h_0 + (h_1 - 5h_0)x^1 \textcolor{green}{= 1 - 7x} \\
& \implies g(x) = \frac{1-7x}{1-5x+6x^2} = \textcolor{red}{\frac{1-7x}{(1-2x)(1-3x)} = \frac{c_1}{(1-2x)} + \frac{c_2}{(1-3x)}} \quad\text{(Multipled by } 1-5x+6x^2 \text{)}\\

& \implies (1-3x)c_1+(1-2x)c_2 = 1-7x \\
&\implies \begin{cases}
c_1 - c_2 = 1 \\
-3c_1 - 2c_2 = -7
\end{cases} \implies \begin{cases}
c_1 = 5 \\
c_2 = -4
\end{cases} \\
&\textcolor{red}{\implies g(x) = \frac{5}{1-2x} - \frac{4}{1-3x}} \quad\text{(Newton's Binomial Theorem)} \\
&\textcolor{red}{= 5(1 + 2x + 2^2x^2 + \cdots + 2^nx^n + \cdots) - 4(1 + 3x + 3^2x^2 + \cdots + 3^nx^n + \cdots)} \\
&= 1 + (-2)x + (-15)x^2 + \cdots + (5 \times 2^n -4 \times 3^n) x^n + \cdots \\
&\implies h_n = 5 \times 2^n - 4 \times 3^n \quad(n = 0, 1, 2,\cdots)

\end{aligned}
$$

###### Example 6

当`特征方程`存在`重根`时，必须`寻找与该根相关的其他解法`。
$$
\begin{aligned}
&h_n = 4h_{n-1} - 4h_{n-2}, h_0 = 1, h_1 = 3 \quad(n \ge 2) \\
&\implies x^2 - 4x +4 = (x-2)^2 = 0 \\
&\implies \textcolor{red}{x_1 = x_2 = 2} \\
&\implies \textcolor{red}{h_n = c_12^n + c_22^n = c2^n} \\
&\implies \begin{cases}
(n = 0) & c = 1 \\
(n = 1) & 2c = 3
\end{cases} \\
&\implies \cdots
\end{aligned}
$$

###### Example 7

求解$y'' - 4y' + 4y = 0$

---

$$
\begin{aligned}
& \because y'' - 4y' + 4y = 0 \\
& \therefore y \dot{=} e^{qx} \implies y' = qe^{qx}, y'' = q^2e^{qx}\\ 
& \implies q^2e^{qx} - 4qe^{qx} + 4e^{qx} = 0 \\
& q^2 - 4q + 4 = 0 \implies \textcolor{red}{q_1 = q_2 = 2 \implies y = e^{2x}} \\
& \textcolor{red}{\text{we can prove that } y = xe^{2x} \text{ is another root.}} \\
& \begin{cases}
y'= 2xe^{2x} + e^{2x} \\
y'' = 4xe^{2x} + 2e^{2x} + 2e^{2x}= 4xe^{2x} + 4e^{2x} \\
y'' - 4y' + 4y = 0 = (4xe^{2x} + 4e^{2x}) - 4(2xe^{2x}+e^{2x}) + 4xe^{2x} = 0
\end{cases}
\therefore y = c_1e^{2x} + c_2 xe^{2x}
\end{aligned}
$$

###### Example 8

求解$h_n - 4h_{n-1} + 4h_{n-2} = 0 \quad(n \ge 2)$

---

$$
\begin{aligned}
& \because h_n - 4h_{n-1} + 4h_{n-2} = 0 \quad(n \ge 2) \\
& \therefore h_n \dot{=} q^n \implies q^n - 4q^{n-1} + 4q^{n-2} = 0 \\
& \implies q^{n-2}(q^2-4q+4) = 0 \\
& \textcolor{red}{\implies q_1 = q_2 = 2} \\
& \textcolor{red}{\text{we can prove that } h_n = n2^n \text{ is another root.}} \\
& \begin{cases}
h_n = n2^n \\
h_{n-1} = (n-1)2^{n-1} \\
h_{n-2} = (n-2)2^{n-2} 
\end{cases} 
\implies h_n -4h_{n-1}+4h_{n-2} = n2^n -4(n-1)2^{n-1} + 4(n-2)2^{n-2} = 2^{n-2}(0) = 0 \\
& \therefore h_n = c_12^n + c_2n2^n\\


\end{aligned}
$$

###### Example 9

求解$h_n = -h_{n-1} + 3h_{n-2} + 5h_{n-3} + 2h_{n-4} \quad(n \ge 4)$

---

$$
\begin{aligned}
& \because h_n = -h_{n-1} + 3h_{n-2} + 5h_{n-3} + 2h_{n-4} \quad(n \ge 4) \\
& \therefore h_n \dot{=} q^n \implies q^n + q^{n-1} - 3q^{n-2} - 5q^{n-3} -2q^{n-4} \\
& \textcolor{green}{\therefore q_1=q_2=q_3 = -1, q_4 = 2} \\
& H_n^{(1)} = c_1(-1)^n + c_2\textcolor{red}{n}(-1)^n + c_3\textcolor{red}{n^2}(-1)^n\\
& H_n^{(2)} = c_4 2^n \\
& H_n = H_n^{(1)} + H_n^{(2)} = c_1(-1)^n + c_2n(-1)^n + c_2n^2(-1)^n + c_4 2^n\\
& \cdots \\
& h_n = \frac{7}{9}(-1)^n - \frac{3}{9}n(-1)^n + \frac{2}{9}2^n
\end{aligned}
$$

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
> 1. 求`齐次线性微分方程的通解`：难点在于求解`特征方程`
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
& \boxed{\text{齐次方程的通解}} \\
& h_n \dot{=} 2h_{n-1} \implies h_n - 2h_{n-1} = 0 \\
& \implies q - 2=  0 \implies q = 2 \\
& \textcolor{magenta}{h_n = c2^n}
\end{aligned} \\

% 2
& \begin{aligned}
& \boxed{\text{非齐次方程的特解}} \\
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

{% endraw %}
