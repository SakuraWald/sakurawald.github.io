---
title: "[Combinatorics] In-Exclusion Principle & Mobius Inversion"
date: 2022-03-31 21:20:00
tags:
  - combinatorics
---

{% raw %}



# Inclusion-Exclusion Principle



## Inclusion-Exclusion Principle

### Definition

设$P_1, P_2, \cdots, P_m$为`集合S`的`对象所涉及的性质`，则`集合S`中`不具有性质`$P_1, P_2, \cdots, Pm$`的对象个数`，$A_i = \{x: x\in S \quad and \quad x\ has\ property\ P_i\}$，可以由下面的交错表达式求出：
$$
|\overline{A_1}\cap \overline{A_2}\cap\cdots\cap\overline{A_m}| = \underbrace{|S| - \sum{|A_i|} + \sum{|A_i \cap A_j|} - \sum{|A_i \cap A_j \cap A_k|} + \cdots + (-1)^m |A_1 \cap A_2 \cap \cdots \cap A_m|}_{\binom{m}{0}+\binom{m}{1}+\binom{m}{2}+\cdots+\binom{m}{m} = 2^m \quad items}
$$
其中，`第1个和`对`{1,2, ... , m}的所有1子集{i}`进行求和，`第2个和`对`{1,2, ..., m}的所有2子集{i, j}`进行求和，`第3个和`对`{1,2, ..., m}的所有3子集{i, j, k}`进行求和，...，`第m个和对{1,2, ..., m}的所有m子集`进行求和。

> 注意：
>
> `上述式子所描述的对象` `恰好不包含m条性质中的任何一条性质`
>
> `m`表示的是`集合S的所有对象所涉及的性质的总数`，也就是说`总共有m条性质`。
>
> 而`k`表示的是`集合S的某个对象所具有的k条性质`，也就是说`0 ≤ k ≤ m`。
>
> 上述的`容斥原理公式`中，如果`某个对象并没有具有全部的m条性质，而仅仅具有m条性质中的k条性质`，则`左式为 该对象所具有的k条性质的交集`，`右式可以保持不变，但应清楚:` `|所有的集合S中的具有k+1条性质的集合的交集| = 0`。从而可以直接`去除这些零项`
>
> 原因是：对于`只具有k条性质的某个对象x`，则意味着`对象x 不具有 第k+1条性质`，那么$A_{k+1} = \varnothing$，则$A_{k+1}$与`任何其他集合的交集，最终都为空集`。

### Proof

`等式左侧`表示的是`不具有任何性质的对象的个数`，我们证明的思路是：

1. 证明`不具有`$P_1, P_2, \cdots, P_m$`中任何性质的对象`对于这个`等式的右边`的`净贡献 = 1`
2. 证明`至少具有`$P_1, P_2, \cdots, P_m$`中任何性质的对象`对于这个`等式的右边`的`净贡献 = 0`

---

假设`对象x` `不具有任何一条性质`，则它$对等式右边的净贡献 = 1$。

> 因为$x \in S$，所以等式右边的$|S| = 1$
>
> 而因为$x \notin A_i$，所以等式右边的其他项均  = 0

---

假设`对象y ` `恰好具有n ≥ 1条性质`，则它$对|S|的净贡献 = 1$

`对象y`对$\sum |A_i|$的`净贡献 = `$\binom{n}{1} = n$

> 因为`对象y` `恰好具有n条性质`，因此它是$A_1, A_2, \cdots, A_m$中`恰好n个集合的成员`。

`对象y`对$\sum |A_i \cap A_j|$的`净贡献 = `$\binom{n}{2}$

> 因为我们可以从`包含对象y的n个集合`中`任意地选取对象y所含的2条性质`

`对象y`对$\sum|A_i \cap A_j \cap A_k|$的`净贡献 = `$\binom{n}{3}$

> 因为我们可以从`包含对象y的n个集合`中`任意地选取对象y所含的3条性质`

依此进行，可以得出`y对等式右边的净贡献` = $\binom{n}{0} - \binom{n}{1} + \binom{n}{2} - \binom{n}{3} + \cdots + (-1)^m \binom{n}{m} = 0$

> 注：因为`n元素集合的包含奇数个元素的子集 的数量`=`n元素集合的包含偶数个元素的子集 的数量`，故该等式为0
>
> 注：实际上`有效的项`仅到$(-1)^n \binom{n}{n}$，因为当$m > n, \binom{n}{m} = 0$，这些项都可以被去除。

---

Q.E.D



### Theory

#### Inference

##### Content

`集合S`中`至少具有性质`$P_1, P_2,\cdots,P_m$`之一的对象的个数`，可以由下面的式子得出：
$$
|A_1 \cup A_2 \cup \cdots \cup A_m| = \sum|A_i| - \sum|A_i \cap A_j| + \sum|A_i \cap A_j \ \cap A_k| - \cdots + (-1)^{m+1}|A_1 \cap A_2 \cap \cdots \cap A_m|
$$

### Specialization

#### Content

如果`容斥原理`中$|A_{i_1} \cap A_{i_2} \cap \cdots \cap A_{i_k}|$`仅依赖于k`而`不依赖于交集中到底使用了哪k个集合`，则`所有的k子集的大小均相同`：
$$
\begin{aligned}
\alpha_0 &= |S|\\
\alpha_1 &= |A_1| = |A_2| = \cdots = |A_m| \\
\alpha_2 & = |A_1 \cap A_2| = \cdots = |A_{m-1} \cap A_{m}|\\
\vdots\\
\alpha_m &= |A_1 \cap A_2 \cap \cdots \cap A_m|
\end{aligned}
$$

> 也就是说，`包含任意k条性质的集合`的`大小均相同`

则得到`简化版容斥原理`：
$$
|\overline{A_1} \cap \overline{A_2} \cap \cdots \cap \overline{A_m}| = \binom{m}{0}\alpha_0 - \binom{m}{1}\alpha_1 + \binom{m}{2}\alpha_2 - \binom{m}{3}\alpha_3 + \cdots + (-1)^k \binom{m}{k}\alpha_k\textcolor{red}{ + \cdots + (-1)^m \binom{m}{m}\alpha_m}
$$

> 即：在`容斥原理`中`出现的第k个求和`包含$\binom{m}{k}$个`被加数`，而`每个被加数`均等于$\alpha_k$

> 当$k > m$时，$\binom{m}{k} = 0$

### Application

#### Application 1

##### Content

求`从1到1000之间` `不能被5，6,8整除的整数的个数`

##### Solution

通过`观察`给出`能被n整除的解释`：`从1开始的每连续的第n个整数`可以`被n整除`。则

- 求`所有的集合S中具有1条性质的所有子集`

`从1到1000之间能被5整除的整数个数`：$\lfloor\frac{1000}{5}\rfloor = 200$

`从1到1000之间能被6整除的整数个数`：$\lfloor\frac{1000}{6}\rfloor = 166$

`从1到1000之间能被8整除的整数个数`：$\lfloor\frac{1000}{8}\rfloor = 125$

- 求`所有的集合S中具有2条性质的所有子集`

`从1到1000之间能被5和6整除的整数个数`：$\lfloor\frac{1000}{30}\rfloor = 33$

`从1到1000之间能被5和8整除的整数个数`：$\lfloor\frac{1000}{40}\rfloor = 25$

`从1到1000之间能被6和8整除的整数个数`：$\lfloor\frac{1000}{24}\rfloor = 41$

- 求`所有的集合S中具有3条性质的所有子集`

`从1到1000之间能被5和6和8整除的整数个数`：$\lfloor\frac{1000}{120}\rfloor = 8$

> 注意：求能被某些数整除，应该求的是`最小公倍数`，而该值不一定是`直接将这些数相乘起来`。
>
> 如$lcm\{5,6,8\}=120 \ne 5*6*8 = 240$

综上，运用`容斥原理`得：$answer = 1000 - (200+166+125) + (33 + 25 + 41) - (8) = 600$



#### Application 2

##### Content

`字母集{M, A, T, H, I, S, F, U, N}`的`排列中`，有多少排列使得`MATH`，`IS`，`FUN`不作为`连续字符`出现在排列中？

##### Solution

在运用`容斥原理`时，首先考虑如何定义$P_i$。

由于题干需要求出`使得MATH，IS，FUN不作为连续字符出现在排列中的个数`

因此可以考虑`分别设这3个单词作为连续字符出现为性质`再`从全集S中去除满足这3个性质中任何性质的哪些元素`

故，不妨设

$P_{math}$为`排列中math作为连续字符出现的排列`

$P_{is}$为`排列中is作为连续字符出现的排列`

$P_{fun}$为`排列中fun作为连续字符出现的排列`

同时，设$A_i$为`集合S中满足性质i的集合`

---

- 求`所有的集合S中具有0条性质的所有子集`

$|S| = 9!$

> 也就是说，我们可以将`全集S`特别地看作`具有0条性质的所有子集`。
>
> 这么做的原因是为了表达式的规整统一。

- 求`所有的集合S中具有1条性质的所有子集`

$|A_{math}| = (9 - 4 + 1)! = 6!$

$|A_{is}| = (9 - 2 + 1)! = 8!$

$|A_{fun}| = (9-3+1)! = 7!$

> 因为这些`单词中的字母`需要`按一定顺序连续出现`，所以可以将他们视为一个`整体`来看待。

- 求`所有的集合S中具有2条性质的所有子集`

$|A_{math} \cap A_{is}| = (9 - 4 + 1 - 2 + 1)! = 5!$

$|A_{math} \cap A_{fun}| = (9 - 4 + 1 - 3 + 1)! = 4! $

$|A_{is} \cap A_{fun}| = (9 - 2 + 1 - 3 + 1)! = 6!$

- 求`所有的集合S中具有3条性质的所有子集`

$|A_{math} \cap A_{is} \cap A_{fun}| = (9 - 4 + 1 - 2 + 1 - 3 + 1)! = 3!$

---

综上，运用`容斥原理`得：$answer = (9!) - (6! + 8! + 7!) + (5! + 4! + 6!) - (3!) = 317658$

#### Application 3

##### Content

在`0到99999之间`有多少`含有数字2,5和8的整数`？

##### Solution

不妨设：

$P_{1}$为`不含数字2的整数的性质`

$P_{2}$为`不含数字5的整数的性质`

$P_{3}$为`不含数字8的整数的性质`

且设$A_i$为`具有性质i的所有元素的集合`



我们可以构造`多重集合`$\{5 \cdot 0, 5 \cdot 1, 5 \cdot 2, \cdots, 5 \cdot 9 \}$

按这种表示方法，则得出
$$
\begin{aligned}
\alpha_0 &= |S| = 10^5 \\
\alpha_1 &= |A_1| = |A_2| = \cdots = |A_m| =  9^5 \\
\alpha_2 &= |A_1 \cap A_2| = \cdots = |A_{m-1} \cap A_m|  = 8^5 \\
\alpha_3 &= |A_1 \cap A_2 \cap A_3| = \cdots = |A_{m-2} \cap A_{m-1} \cap A_m|  =  7^5
\end{aligned}
$$

>也就是说，这里运用了`简化版的容斥原理：`所有的包含k条性质的集合`的`大小都相同`
>
>$\alpha_0$表示：`不包含任何性质`，也就是本题中`不限制对数字的使用`。则大小为`0~99999之间有多少个数字 = 10^5 = 100000`
>
>$\alpha_1$表示：`具有性质`$P_1$，也就是`不含数字2的整数的性质`。等价地，我们要从`多重集合`里`去除掉`$5 \cdot 2$`这个多重元素`。所以`合法整数的数量 = 9^5`

综上，
$$
\begin{aligned}
answer &= \binom{m}{0}\alpha_0 - \binom{m}{1}\alpha_1 + \binom{m}{2}\alpha_2 - \binom{m}{3}\alpha_3 \\
&= 10^5 - 3 * 9^5 + 3 * 8^5 - 1 * 7^5 \\

\end{aligned}
$$

#### Application 4

##### Content

确定`多重集合`$T = \{3 \cdot a, 4 \cdot b, 5 \cdot c\}$的`10组合的数目`

##### Solution

设`多重集合`$T^* = \{\infty \cdot a, \infty \cdot b, \infty \cdot c\}$的所有10组合的`集合S`。

设$P_1$是$T^*$`的10组合中a出现多于3次的性质`

设$P_2$是$T^*$`的10组合中b出现多于4次的性质`

设$P_3$是$T^*$`的10组合中c出现多于5次的性质`

且设$A_i$是$T^*$`的10组合中不具有性质i的哪些10组合的集合`

---

- 求`所有的集合S中具有0条性质的所有子集`

$|S| = \binom{10 + 3 - 1}{10} = 66$

> 根据`每个元素的重数为无限的多重集合`的`r组合公式`：$\binom{r+k-1}{r}$

- 求`所有的集合S中具有1条性质的所有子集`

$A_1 = \binom{(10-4) + 3 - 1}{6} = 28$

> 由于$P_1$是$T^*的10组合中a出现多于3次的性质$，故$A_1$是$T^*的10组合中a至少出现4次$。
>
> 所以，等价地，我们可以从$T_*$中`取走4个a`。这样即可将问题转化为$求取走4个a后的T^*的6组合$ （也就是说，相当于这4个a先`固定地取走了`）

> 这类似于`处理仅有2个集合的情况`，但我们用`容斥原理`将这个问题拓展到了`3个集合的情况`

$A_2 = \binom{(10-5) + 3 - 1}{5} = 21$

$A_3 = \binom{(10-6)+3-1}{4} = 15$

- 求`所有的集合S中具有2条性质的所有子集`

$|A_1 \cap A_2| = \binom{(10- 4 - 5) + 3 - 1}{1} = 3$

$|A_1 \cap A_3| = \binom{(10-4-6)+3-1}{0} = 1$

$|A_2 \cap A_3| = \binom{(10-5-6)+3-1}{1} = \binom{1}{-1} = 0$

- 求`所有的集合S中具有3条性质的所有子集`

$|A_1 \cap A_2 \cap A_3| = \binom{(10-4-5-6)+3-1}{-5} = \binom{-3}{-5}= 0$

---

综上，$answer = (66) - (28+21+15) + (3+1+0) - (0) = 6$ 

#### Application 5

##### Content

 求该方程的` 非负整数解`个数？
$$
\begin{aligned}
x_1 + x_2 + x_3 + x_4 &= 18\\
1 \le x_1 \le 5\\
-2 \le x_2 \le 4\\
0 \le x_3 \le 5\\
3 \le x_4 \le 9
\end{aligned}
$$


##### Solution

首先使用`变量替换`，以便将`变量的下界提升到0`。则
$$
\begin{aligned}
y_1 + y_2 + y_3 + y_4 &= 16 \\
0 \le y_1 &= x_1 - 1 \le 4 \\
0 \le y_2 &= x_2 + 2 \le 6 \\
0 \le y_3 &= x_3 \le 5\\
0 \le y_4 &= x_4 - 3 \le 6
\end{aligned}
$$
设`集合S`是`新方程的所有非负整数解的集合`，则
$$
|S| = \binom{16 + 4 - 1}{16} = 969
$$
设

$P_1$是$y_1 \ge 5$`的性质`

$P_2$是$y_2 \ge 7$`的性质`

$P_3$是$y_3 \ge 6$`的性质`

$P_4$是$y_4 \ge 7$`的性质`

并设$A_i$是`集合S中满足性质`$P_i$`的解 组成的子集`

---

- 求`所有的集合S中具有0条性质的子集`

$|S| = 969$

- 求`所有的集合S中具有1条性质的子集`

假设欲求$A_1$：也就是$y_1 \ge 5$，那也就是等价地，我们`提前固定地从`$y_1$`中选取5个`。即

$|A_1| = \binom{(16 - 5) + 4 - 1}{11} = 364$

> 对于`要求至少选取集合中某个元素k个`的`约束条件`，我们可以`等价地转化为：事前提前取走这k个元素`，从而`规约为一个新的等价问题`

同理地，可求得：

$|A_2| = \binom{(16 - 7) + 4 - 1}{9}$

$|A_3| = \binom{(16-6)+4-1}{10}$

$|A_4| = \binom{(16-7)+4-1}{9}$

- 求`所有的集合S中具有2条性质的子集`

$|A_1 \cap A_2| = \binom{(16-5-7)+4-1}{4}$

$|A_1 \cap A_3| = \binom{(16-5-6)+4-1}{5}$

$|A_1 \cap A_4| = \binom{(16-5-7)+4-1}{4}$

$|A_2 \cap A_3| = \binom{(16-7-6)+4-1}{3}$

$|A_2 \cap A_4| = \binom{(16-7-7)+4-1}{2}$

$|A_3 \cap A_4| = \binom{(16-6-7)+4-1}{3}$

- 求`所有的集合S中具有3条性质的子集`

这些`子集`均为空集

- 求`所有的集合S中具有4条性质的子集`

这些`子集`均为空集

---

综上，运用`容斥原理`得出$answer = 55$



## Derangement Formula

### Background

若`集合`$S = \{1, 2, \cdots, n\}$，其中`每个整数的位置`由`一个排列`$i_1i_2\cdots i_n$ `$$所确定`。

则`集合S`的`一个错位排列`是这样的`一个排列`，满足：$i_1 \ne 1, i_2 \ne 2, \cdots, i_n \ne n$

> 换句话说，`错位排列`中`没有任何一个整数`位于`自然位置`

---

### Definition

$$
D_n = n!(1 - \frac{1}{1!} + \frac{1}{2!} - \frac{1}{3!} + \cdots + (-1)^n \frac{1}{n!})  \qquad(n \ge 1)
$$

### Proof

设`集合S`为`n个整数的所有排列方案组成的集合`：$|S| = n!$

设$P_i$为`整数i位于自然位置的性质`

设$A_i$为`集合S中的具有性质`$P_i$`的子集`

我们需要求出`这样的一些排列`：`没有任何整数位于自然位置`

---

- 求`所有的集合S中的具有0条性质的子集`

$|S| = n!$

- 求`所有的集合S中的具有1条性质的子集`

$|A_1| = (n-1)!$

$|A_2| = (n-1)!$

$\vdots$

$|A_n| = (n-1)!$

-  求`所有的集合S中的具有2条性质的子集`

$|A_1 \cap A_2| = (n-2)!$

$\vdots$

$|A_{n-1} \cap A_n = (n-2)!$ 

......

- 求`所有的集合S中的具有n条性质的子集`

$|A_1 \cap A_2 \cap \cdots \cap A_n| = 1$

---

根据`容斥原理`得出：
$$
\begin{aligned}
Dn &= n! - \binom{n}{1}(n-1)! + \binom{n}{2}(n-2)! - \binom{n}{3}(n-3)! + \cdots + (-1)^n\binom{n}{n}0! \\
&= n! - \frac{n!}{1!} + \frac{n!}{2!} - \frac{n!}{3!} + \cdots + (-1)^n\binom{n!}{n!} \\
&= n!(1- \frac{1}{1!} + \frac{1}{2!} - \frac{1}{3!} + \cdots + (-1)^n \frac{1}{n!})
\end{aligned}
$$
Q.E.D

### Theory

#### Theory: Approximation

我们有$e^{-1} = 1 - \frac{1}{1!} + \frac{1}{2!} - \frac{1}{3!} + \frac{1}{4!} - \dots$

则$e^{-1} = \frac{D_n}{n!} \textcolor{red}{ + (-1)^{n+1}\frac{1}{(n+1)!} + (-1)^{n+2}\frac{1}{(n+2)!} + \dots}$

所以，我们得出结论：$|e^{-1} - \frac{D_n}{n!}| \le \frac{1}{(n+1)!}$

> 这个近似提供了一个非常简单的求$D_n$的方法：$D_n = \frac{n!}{e} = \frac{n!}{2.7182818284\dots}$

#### Theory: Recurrence Formula

$D_n = (n-1)(D_{n-2} + D_{n-1}) \quad (n = 3, 4,5,\dots)$

---

考虑$\{1,2,\dots,n\}$的$D_n$个错位排列。

可以按照`将2,3,...,n中的哪一个数字放置到第一位`而将$D_n$个错位排列`划分`为`n-1 个部分`

> 显然，这`n-1个部分`都包含`相同的错位排列个数`

这样，$D_n = (n-1)d_n$，其中$d_n$是`数字2位于排列第一个位置上的错位排列的数目` 



在这$d_n$个错位排列中，可继续按照`数字1是否位于第二个位置`来`划分为2个部分`：

设$d_n^\prime$表示`数字1位于第二个位置的错位排列个数`

设$d_n^{\prime\prime}$表示`数字1不位于第二个位置的错位排列个数`

故$d_n = d_n^{\prime} + d_n^{\prime\prime}$

> $d_n$是形式为$2i_2i_3\dotsi_n,\quad i_2 \ne 2, i_3 \ne 3,\dots, i_n \ne n$的错位排列的数量
>
> $d_n^\prime$是形式为$21i_3i_4\dotsi_n, \quad  i_3 \ne 3,\dots, i_n \ne n$的错位排列的数量
>
> $d_n^{\prime\prime}$是形式为$2i_2i_3\dotsi_n,\quad i_2 \ne 1, i_3 \ne 3,\dots, i_n \ne n$的错位排列的数量

所以 $D_n = (n-1)d_n = (n-1)(d_n^{\prime} + d_n^{\prime\prime})$

我们`观察`到，$d_n^{\prime} = D_{n-2}$和$d_n^{\prime\prime} = D_{n-1}$

> 实际上，我们`并不关心` `数字是多少`和`位置是多少`。
>
> 我们`关心的仅仅是` `数字和位置所构成的二元组 的个数`。
>
> 换句话说，我们可以设`（数字num，位置pos）二元组` `表示当数字num不位于位置pos时，【视为】满足【错位排序】`
>
> 正常情况下，我们称`错位排序`需要满足`形式如这样的二元组约束条件`：`(1,1)`，`(2,2)`，...，`(n,n)` 。
>
> 这样的`n个整数的错位排列的数量 = `$D_n$
>
> 但是，我们如果将`数字num`和`位置pos`进行重新映射，比如说`映射为如下的约束条件: (1,2), (2,1), (3,3), (4,4), ..., (n,n)`
>
> 或者说，`映射为如下的约束条件：(1, 2), (2, 3), (3, 4), ..., (n - 1, n), (n, 1)`。
>
> 那么上述的`两个对约束条件的重新映射`，`并不会改变错位排列的数量`，`错位排列的数量仍然是`$D_n$
>
> ---
>
> 总而言之，`错位排序问题的规模`并不是`数字是什么`或者`位置是什么`。而是`(数字，位置)的二元组约束条件的数量`

> $d_n^\prime$实际上`等价于`$\{3,4,...,n\}的排列i_3i_4\dotsi_n中，\textcolor{blue}{i_3 \ne 3, i_4 \ne 4,\dots, i_n \ne n \quad(共n-2个约束条件)}$的排列个数，`等价地，我们的问题规模就从`$D_n$减少到了$D_{n-2}$
>
> $d_n^{\prime\prime}$实际上`等价于`$\{1, 3,4,\dots,n\}的排列i_1i_3i_4\dots i_n中，\textcolor{blue}{i_1\ne 1, i_3 \ne 2, i_4 \ne 3, \dots, i_n \ne n-1 \quad (共n-1个约束条件)}$，`等价地，我们的问题规模就从`$D_n$减少到了$D_{n-1}$

综上，$D_n = (n-1)(D_{n-1} + D_{n-2})$

Q.E.D

#### Theory

通过不断对$Dn = (n-1)(D_{n-1}+D_{n-2})$运用`递推公式`，可以`降解得到`

$D_n = nD_{n-1} + (-1)^n, \quad(n = 2,3,4,...)$



## Arrangement Problems with Prohibited Positions

### Definition

我们设$P(X_1, X_2, \cdots, X_n)$表示$\{1,2,\cdots,n\}$的`所有排列`$i_1i_2\dots i_n$的集合，使得$i_1 \notin X_1, i_2 \notin X_2, \cdots, i_n \notin X_n$

> `错位排列`是一种`特化的带禁止位置的排列`：$X_1=\{1\}, X_2=\{2\}, \cdots, X_n\{n\} \implies P(X_1, X_2, \cdots, X_n) = D_n$

> `带禁止方格的非攻击型车棋盘问题`是一种`特化的带禁止位置的排列`：`按逐行顺序放置车`，则`放置方案`即为一个`排列`$i_1i_2\cdots i_n$

### Application 

#### Application 1: Non-Attack Rook Problem with Prohibited Positions

##### Theorem

将`n个攻击型不可区分的车`放到`带有禁止位置的n行n列棋盘`上的`放置方法数`等于
$$
n! - r_!(n-1)! + r_2(n-2)! - \cdots + (-r)^k r_k(n-k)! + \cdots + (-1)^n r_n
$$

##### Proof

设`集合S`表示`n个非攻击型车在n行n列的棋盘上的所有n!种放置方案的集合`。

设$P_j$表示$在j行i列的车， i \in X_j \ 的性质$

> 也就是说，`逐行放置非攻击型车，且必须放置在当前行的禁止位置上的性质`

设$A_i$表示`满足`$P_j \quad(j = 1,2,\cdots,n)$`的车的放置方案的集合`

设$P(X_1, X_2, \cdots, X_n)$是`n个非攻击型车的所有放置方案`中`不满足性质`$P_1, P_2, \cdots, P_n$`的放置方案所组成的集合`

---

则$P(X_1, X_2, \cdots, X_n) = |\overline{A_1} \cap \overline{A_2} \cap \cdots \cap \overline{A_n}|$

则$|A_i| = |X_i| (n-1)!,\quad(i = 1,2,\cdots, n)$

则$\sum{A_i} = (X_1 + X_2 + \cdots + X_n)(n-1)!$

设$r_k$等于`把k个非攻击型车放到棋盘上的禁止位置的方法数`

则对于`所有的集合S中的具有k条性质的子集`有$\textcolor{blue}{\sum|A_{i_1}\cap A_{i_2} \cap \cdots \cap A_{i_k}| = r_k(n-k)!,\quad(k=1,2,\cdots,n)}$

$\sum{|A_i|} = r_1(n-1)!$

$\sum{|A_i \cap A_j|} = r_2(n-2)!$

$\sum{|A_i \cap A_j \cap A_k|} = r_3(n-3)!$

运用`容斥原理`，得出结论。

Q.E.D

##### Content

求`将2个非攻击型车放置到下列的6×6的带禁止位置的棋盘上的方案数`

![image-20220330173743577](https://s2.loli.net/2022/04/03/78Bds6FNvDUTYbq.png)

##### Solution

$r_1 =7$

> 因为`在该棋盘上放置1个非攻击型车的方案数有7种`

$r_2 = (1) + (2) + (3 × 4) = 15$

> 2个非攻击型车都放在左上角区域有1种方案。
>
> 2个非攻击型车都放在右下角区域有2种方案。
>
> 2个非攻击型车分别位于两个区域有3×4=12种方案。

> 这里可以直接使用`乘法`来计算方案数，是因为`这两个红色区域`是`独立的`：
>
> 也就是说，`两个区域是独立的，则无论如何放置车`，`一个区域内的车`不会攻击到`另一个区域内的车`！

$r_3 = (1 \times 4) + (3 \times 2) = 10$

$r_4 = (1 \times 2) = 2$

---

综上，$answer = (6!) - 7\times(5)! + 15\times(4)! - 10\times(3)! + 2\times(2)! = 184$

#### Application 2: Boys Queuing Problem

##### Content

若有`5个男孩`每天练习走步。这些男孩站成`一队纵列`前行，`除了第一个男孩外的每个男孩的前面都有另一个男孩`。

为了让`每个男孩不总是看到他前面的同一个人`，`第二天`，`他们决定交换位置`，`使得没有男孩的前面的男孩与他第一天在他前面的男孩是同一个人`

##### Theorem

设$Q_n$表示$\{1,2,\cdots,8\}$的排列中，`不出现模式12,23,34，..., (n-1)n 的那些排列的个数`

对于$n \ge 1$
$$
Q_n = n! - \binom{n-1}{1}(n-1)! + \binom{n-1}{2}(n-2)! - \binom{n-1}{3}(n-3)! + \cdots + (-1)^{n-1}\binom{n-1}{n-1}1!
$$

> $Q_n = D_n + D_{n-1}, \quad (n \ge 2)$

##### Solution

设$S$是$\{1,2,\cdots,n\}$的全部n!个排列所组成的集合

设$P_j$是`在一个排列中模式j(j+1)出现的性质 (j = 1, 2, ..., n-1)`

设$A_j$是$\{1,2,\cdots,n\}$的满足$P_j$的排列所组成的集合。

> 注：由于$P_j$共n-1个，故$A_j$的数量也为n-1个

---

- 求`所有的集合S中的具有0条性质的子集`

$|S| = 5!$

- 求`所有的集合S中的具有1条性质的子集`

$|A_j| = (n-1)!, \quad(j = 1,2,\cdots,n-1)$

- 求`所有的集合S中的具有2条性质的子集`

考虑$|A_i \cap A_j|$

那么需要考虑$A_i$和$A_j$的`模式`之间是否存在`共享元素`

不存在：如`12`和`34`，则可视为`n-2个符号的集合{12, 34, 5, 6, ..., n}的一个排列`

> 元素个数差 = -4 + 2 = -2

1. 存在：如`12`和`23`，则可视为`个符号的集合{12, 23, 4, 5, 6, ..., n}的一个排列`

   > 元素个数差 = -3 + 1 = -2

也就是说，无论是`不同模式`之间`是否存在共享的元素`，都不会影响`参与排列的符号的个数`

即$|A_i \cap A_j| = (n-2)!$

- 求`所有的集合S中的具有k条性质的子集`

$|A_{i_1} \cap A_{i_2} \cap \cdots \cap A_{i_{k}}| = (n-k)!  \qquad(k = 1,2,\cdots,n-1)$

---

综上，根据`容斥原理`：$answer = 5! - \binom{4}{1}|A_{i_1}| + \binom{4}{2}|A_{i_1} \cap A_{i_2}| - \binom{4}{3}|A_{i_1} \cap A_{i_2} \cap A_{i_3} \cap A_{i_4}| + \binom{4}{4} |A_{i_1} \cap A_{i_2} \cap A_{i_3} \cap A_{i_4}|$





## Mobius Inversion

### Background

设`n为正整数`，考虑`n元素集合`$X_n = \{1,2,\cdots,n\}$，以及`由包含关系所定义的`$X_n$`的所有子集的集合上的偏序集`$(\mathcal{P}, \subseteq)$

设`函数`$F:\mathcal{P}(X_n) \rightarrow \real$ 是`定义在`$\mathcal{P}(X_n)$`上的实值函数`

设`函数`$G: \mathcal{P}(X_n) \rightarrow \real$，使得$\textcolor{blue}{G(K) = \sum_{L \subseteq K}{F(L)},\quad(K \subseteq X_n)}$

则，`莫比乌斯反解`可从`函数G`恢复`函数F`

> 也就是说，给定$G(K)$可以得出$F(K)$

我们有$\textcolor{blue}{F(K) = \sum_{L\subseteq K}{\textcolor{green}{(-1)^{|K|-|L|}}G(L)}, \quad (K \subseteq X_n)}$

设`有限集S的子集`为 $A_1, A_2,\cdots,A_n$

对于`集合`$K \subseteq \{1,2,\cdots,n\}$，`定义`$F(K)$为`集合S中正好` `属于所有满足`$i \notin K$`的集合`$A_i$`的元素个数`

> 也就是说，对于`给定的F(K)中的K`：
>
> `对于`$s \in S, F(K)$`计数s` `当且仅当` $s \notin A_i, \forall i \in K$和$s \in A_j, \forall j \notin K$
>
> ---
>
> 用`容斥原理`的角度看，`集合K`相当于是`1个给定的一些性质的集合`（只不过我们对`性质`做了`编号`，而`所有性质的编号组成了 集合`$X_n$）,
>
> 而`集合A`相当于`集合S中的 具有指定某个性质的所有元素 所组成的集合`
>
> ---
>
> 再换句话说，如果我们`给定了 1个包含了特定的某些性质的集合K`，并`将这个 集合K 作为参数 传递给函数F`，即`F(K)`，
>
> 则`函数F 的作用类似于` `过滤器`和`计数器`：`函数F(K)`会`循环检查 集合S的每一个元素`（假如我们设`循环变量 `为`s`），并`对该元素（即临时的循环变量s）循环检查K中的每一条性质` ：如果`这个元素不具有K中的任何一条性质`或者`这个元素具有K中没有的性质`。那么我们`计数该元素`
>
> ---
>
> 实际上，$(-1)^{|K| -|L|}$就是`偏序集`$(\mathcal{P}(X_n), \le)$`的莫比乌斯函数`
>
> ---
>
> 从`编程`的角度看，如果实现一个`容斥原理`解法：`F(tempPropertySet)和G(tempPropertySet)`是`2个存在递归的函数`（`函数F`通过调用`函数G`来再次调用`函数F`自身，但`每次对函数F的调用  所传入的参数并不同，也就是 所传入的特定的某些性质的集合 不同`）我们可以从$F(K)$开始运行，`刚开始（也就是第一次）传递给G(tempPropertySet)的参数是 所有的给定的某些性质`，`但G(K)并没有立即开始计算，而是继续递归下降直到 递归的基本情况`（注意我们的`约束条件`：$K \subseteq X_n$），我们可以`编程`使得`G(tempPropertySet)在 所输入的参数为空集后，不再继续调用F(tempPropertySet)进行递归`（如果`如果输入参数为空集`，`意味着 给定的一些性质的集合大小为0，也就是 没有给定任何性质，即具有0条性质`，而这也就是`容斥原理里右式的第一项：|S|`）。
>
> 从`整个程序的实际计数顺序（递归下降过程仅保留帧栈，但不进行实际的计数）来看`，它与我们在`计算容斥原理时从左到右 计算的顺序一样：先计算具有0条性质的情形，再计算具有1条性质的情形...`
>
> TODO

故$\textcolor{blue}{G(K) = \sum_{L \subseteq K}{F(L)}} \textcolor{red}{= |\bigcap_{i \notin K}A_i| }$

计数`S中属于  j不在K中的所有`$A_j$`的元素` 以及 `属于其他一些集合的元素` `的个数`。

> `G(K)`等价于`对所有的 具有我们K中没有指定的其他性质中的某条性质的元素所组成集合  进行交集运算`

则$F(K) = \sum_{L \subseteq K}{(-1)^{|K| - |L|}G(L)}$

取`集合K`为`集合`$X_n$，得$\textcolor{red}{F(X_n)}=\sum_{L \subseteq \textcolor{blue}{X_n}}{(-1)^{\textcolor{blue}{n}-|L|}G(L)} = \textcolor{red}{|\overline{A_1} \cap \overline{A_2} \cap \cdots \cap \overline{A_n}|}$，则此$F(X_n)$`计数的是` `S中    仅属于满足`$i \notin X_n$`的那些集合`$A_i$`的元素`。

> 这也就是说，$F(X_n)$是`集合S中  不属于集合`$A_1,A_2,\cdots,A_n$`中任何一个集合的元素    的个数`。
>
> ---
>
> 也就是说，我们将`所有性质的集合`$X_n$传参给$F(tempPropertySet)$，我们`计数` `不含`$X_n$`中的性质的对象个数`

因此，我们得到

$F(X_n) = |\overline{A_1} \cap \overline{A_2} \cap \cdots \cap \overline{A_n}| = \sum_{L \subseteq X_n}{(-1)^{n - |L|} \textcolor{blue}{\Big|\bigcap_{i\notin L}A_i\Big|}}$

>  等价地，使用`L在`$X_n$`中的补集J`代替`L`得到
>
> $|\overline{A_1} \cap \overline{A_2} \cap \cdots \cap \overline{A_n}| = \sum_{\textcolor{blue}{J} \subseteq X_n}{(-1)^{\textcolor{blue}{|J|}} \Big| \bigcap_{i \textcolor{blue}{\in J}}{A_i} \Big|  }$
>
> 根据该式子，`容斥原理`是`莫比乌斯反演`在`有限偏序集`上的一个实例。

---

我们在上面的基础上，使用`任意的有限偏序集`$(X, \le)$ 代替`偏序集` $(\mathcal{P}(X_n), \subseteq)$

> 对于`有限偏序集`，可以用`更弱的性质`来代替`有限的性质`，即`局部有限`：对于`所有`$a \le b$`的a和b`而言`区间`$\{x: a \le x \le b\}$是`局部有限`

首先考虑`二变量函数`：

设$\mathcal{F}(X)$是`满足只要`$x \not{\le} y$`就有`$f(x,y) = 0$`的所有实值函数`$f: X \times X\rightarrow \real$`的集合`

于是，$f(x,y)$`只在`$x \le y$`时有可能不等于0`，而一旦$x \gt y$`则必定等于0`。



我们`定义`$\mathcal{F}(X)$`中的两个函数f和g的卷积`$h = f * g$如下
$$
\textcolor{blue}{h(x,y)} = 
\begin{cases}
\sum_{\textcolor{blue}{\{z: x \le z \le y\}}{f(x,z) g(z,y)}},& x \le y\\
0, &else
\end{cases}
$$

> 也就是说，我们通过`关于z求积`$f(x,z)g(z,y)$`的和`，来计算$x \le y$`的h(x,y)`

---

我们考虑$\textcolor{green}{\mathcal{F}(X)}$`中的三种特殊的函数`：

- 克罗内克Delta函数（Kronecker Delta Function） $\delta(x, y) =\begin{cases}1,& x= y \\ 0,&else\end{cases}$

> 注：对所有的`函数`$f \in \mathcal{F}(X), \delta * f = f * \delta = f$
>
> 因此，对于`卷积`来说，$\delta$就是一个`恒等函数`

> `函数`$δ$其实就是一个`相等谓词`。



- $\zeta$函数（Zeta Function） $\zeta = \begin{cases}1, & x \le y\\0 ,& else\end{cases}$

>  $\zeta$`函数`是`偏序集`$(X, \le )$的一种`表示`，该函数`包含了所有满足`$x \le y$`的元素`对`x，y的全部信息`

> `函数`$\zeta$其实就是一个`偏序谓词`。



- 莫比乌斯函数（Mobius Function）$\mu$

设$f \in \mathcal{F}$ 对`X中的所有y满足`$f(y,y) \ne 0$，则我们可以`递归地`定义$\mathcal{F}(X)$`中的函数g`：

设$\textcolor{blue}{g(y,y) = \frac{1}{f(y,y)} \qquad, (y \in X, f(y,y) \ne 0)}$

然后`令`
$$
g(x,y) = -\frac{1}{f(y,y)} \textcolor{blue}{\sum_{\{z: x \le z \le y\}}{{g(x,z)f(z,y)}}} \qquad,(x \lt y)
$$
于是，我们可以得到
$$
\begin{aligned}
\textcolor{blue}{\sum_{\{z: x \le z \le y\}}{g(x,z)f(z,y)}} &= \textcolor{red}{-}g(x,y)f(y,y)\\
 &= \textcolor{blue}{\delta(x,y) \quad,(x \le y) }
\end{aligned}
$$
因此，$g * f = \delta$

> 即：g是`f关于卷积*的左逆函数`

我们得出结论：

`每个对X中的所有y满足`$f(y,y) \ne 0$`的函数`$f \in \mathcal{F}$，都有`函数f的逆函数g`满足$\textcolor{green}{g * f = f * g = \delta}$

> 证明方式如上，设出$g(y,y)$和$g(x,y)$

---

`因为`$\zeta(y,y) = 1, \forall y \in X$ 

`故`$\zeta$存在`逆函数`$\mu$满足
$$
\textcolor{green}{\mu * \zeta = \delta}
$$
> 也就是说：`莫比乌斯函数`$\mu$是$\zeta$`函数`的`逆函数`
>
> 同理可得：$\textcolor{green}{\mu * \zeta = \zeta * \mu = \delta}$

所以，我们令$\textcolor{blue}{f = \zeta, g = \mu}$得到
$$
\begin{aligned}
\sum_{\{z: x \le z \le y\}}{\mu(x,z)\textcolor{blue}{\zeta(z,y)}} = \delta(x,y) \quad, (x \le y) \\
\textcolor{green}{\sum_{\{z: x \le z \le y\}}{\mu(x,z)} = \delta(x,y) \quad, (x \le y)}

\end{aligned}
$$

> 由于`函数`$\zeta$是一个`偏序谓词`，而显然$z \le y \implies \zeta(z,y) = 1$，故可直接消去$\zeta(z,y)$

> 注意：上式中我们所做的`代换`$f = \zeta, g = \mu$需要指定`约束条件`$x \le y$，否则，`作为f函数的`$\zeta$`函数无法保证 非0`

上述式子表明2个事实：

1. $\textcolor{green}{\mu(x,x) = 1, \forall x}$

   > 这意味着`求和的上界和下界相等，故 求和值 =   `$\mu(x,x) = \delta(x,x) = 1$ 

2. $\textcolor{green}{\mu(x,y) = -\sum_{\{z: x \le z \lt y\}}{\mu(x,z)} \quad,(x \lt y)}$

   > TODO

### Definition

设$(X, \le)$是`偏序集`且`有最小元 0`，设`它的莫比乌斯函数`为$\mu$

设`函数`$F: X \rightarrow \real$是`定义在X上的实值函数`

设`函数`$G: X \rightarrow \real$定义为$\textcolor{blue}{G(x) = \sum_{\{z: z \le x\}}{F(z)}, \quad(x \in X)}$



则$\textcolor{blue}{F(x) = \sum_{\{y: y \le x\}} {G(y)\textcolor{green}{\mu(y,x)}}, \quad (x \in X)}$

### Proof

设$\zeta$为$(X, \le)$ 的$\zeta$`函数`，对于$x \in X$，有
$$
\begin{aligned}
\sum_{\{y: y \le x\}}{\textcolor{blue}{G(y)} \mu(y,x)} &= \sum_{\{y: y \le x\}}{\textcolor{blue}{\sum_{\{z: z \le y\}}{F(z)}}\mu(y,x)}\\
&=\sum_{\{y: y \le x\}}{\mu(y,x)} \Bigg(\sum_{\textcolor{blue}{\{z:z \in X\}}}{\textcolor{blue}{\zeta(z,y)}F(z)}\Bigg) \qquad\text{(Filtered by ζ)}\\
&=\sum_{\textcolor{blue}{\{z: z \in X\}}} \sum_{\textcolor{blue}{\{y: y \le x\}}}{\zeta(z,y)\textcolor{blue}{\mu(y,x)}F(z)} \\
&=\sum_{\{z: z \in X\}}{\Big(\sum_{\textcolor{blue}{\{y: z \le y \le x\}}}{\zeta(z,y)\mu(y,x)} \Big)F(z)}\\
&=\sum_{\{z: z \in X\}}{\textcolor{blue}{\delta(z,x)}F(z)} \qquad\text{(Filtered by δ)}\\
&= F(x)
\end{aligned}
$$

> 注意：对于上式而言，`元素x`并不是`变量`，而应当被视为`常量`

> $\sum_{\{z: z \le y\}}{F(z)} = \sum_{\{z: z \in X\}}{\zeta(z, y) F(z)}$ 
>
> 对于`左式`：直接`求和z <= y的范围`
>
> 而对于`右式`：我们是通过引入$\zeta$函数（它是一个`偏序过滤器`），进而我们可以转变`求和范围`为`集合X中的任何元素z`。
>
> 这是因为，对于`对于不满足条件的元素`，会被$\zeta$函数所`过滤掉`（也就是说，这个`项`的值为`0`）
>
> 这类似于我们在前面`容斥原理中第k条性质之后的零项`的情况。

> 同理，$\delta(z,x)$作为`相等过滤器`，故
>
> $\sum_{\{z: z \in X\}}{\delta(z, x)F(z)} = F(x)$



### Example

#### Example 1

计算`偏序集`$(\mathcal{P}(X_n), \subseteq)$`的莫比乌斯函数`，其中$X_n = \{1,2,\cdots,n\}$

设$A \subseteq B \subseteq X_n$，然后，我们对$|B| - |A|$作`归纳法`，以`证明`$\mu(A,B) = (-1)^{|B| - |A|}$

---

如果$A = B$

我们注意到$\mu(x,x) = 1, \forall x$

则`证明完成`

---

如果$A \ne B$

设$\textcolor{blue}{p = |B \backslash A| = |B| - |A|}$

我们有
$$
\begin{aligned}
\mu(A, B) &= \textcolor{green}{-\sum_{\{C: A \le C \lt B\}}{\mu(A,C)}} \\
&= -\sum_{\{C: A \le C \lt B\}}{(-1)^{|C|-|A|}} \\
&= \textcolor{blue}{-\sum_{k=0}^{p-1}{(-1)^k \binom{p}{k}}}
\end{aligned}
$$

---

对于`满足`$0 \le k \le p-1$`的每个整数k`，`满足`$A \subseteq C \subset B$`且`$|C| - |A| = k$`的集合C` 的个数 等于 `包含在基数为p的集合`$B \backslash A$`中且基数为k的子集` 的个数

根据`二项式定理`有 $\textcolor{blue}{0 = (1-1)^p = \sum_{k=0}^{p}{(-1)^k \binom{p}{k}}}$

因此$\textcolor{blue}{\sum_{k=0}^{p-1}{(-1)^k \binom{p}{k}} = -(-1)^p \binom{p}{p} = -(-1)^p\binom{p}{p}}$

因而，我们可以得到
$$
\mu(A, B) = \textcolor{blue}{(-1)^p \binom{p}{p}} = (-1)^p = (-1)^{|B| - |A|}
$$
Q.E.D

#### Example 2

计算`线性有序集的莫比乌斯函数`。

---

设$X_n = \{1,2,\cdots, n\}$, 考虑`线性有序集`$(X_n, \le) \quad, (1 \lt 2 \lt \cdots \lt n)$

因为$\mu(k,k) = 1, \forall k \in \{1,2,\cdots,n\}$ 且 $\textcolor{blue}{\mu(k,l) = 0,\quad(1 \le l \lt k \le n)}$

假设$l = k + 1, \quad (1 \le k \le n - 1)$，则$\sum_{\{j: k \le j \le k+1\}}{\mu(k,j)} = 0$

因此$\mu(k,k) + \mu(k,k+1) = 0$

而这意味着$\textcolor{blue}{\mu(k, k+1) = -\mu(k, k) = -1}$

若假设$1 \le k \le n-2$，则$\mu(k,k) + \mu(k,k+1) + \mu(k, k+2) = 0$

故$\mu(k,k+2) = -(\mu(k,k) + \mu(k, k+1)) = -(1+(-1)) = 0$

继续如此，我们可以`归纳法`得出
$$
\mu(k,l) =
\begin{cases}
1,&l = k\\
-1,& l = k+1\\
0,& else
\end{cases}
$$
Q.E.D

#### Example 3

设n为正整数，$X_n = \{1,2,\cdots,n\}$，考虑`偏序集`$D_n = (X_n, |)$，计算`偏序集的`$\mu(1,n)$

> 整除性：a | b 当且仅当 a 是 b的因子

---

`整数n`有`唯一素数因数分解`，设为 $\textcolor{blue}{n = p_1^{\alpha_1}p_2^{\alpha_2}\cdots p_k^{\alpha_k}}$

则$\mu(1,n)$可递归定义为$\textcolor{blue}{\mu(1,n) = -\sum_{\{m \ge 1: m|n, m \ne n\}}{\mu(1,m)}}$

> 即令$1 \le m \le n$，这里$m \le n$`的信息 被隐藏在`$m | n$`中`。
>
> 之后利用`莫比乌斯函数的公式`求和即可。

因此，只需要考虑$(X_n^*, |)$，其中$\textcolor{blue}{X_n^*}$`是`$X_n$`中所有满足的正整k | n数k组成的子集`

设$\textcolor{blue}{r, s \in X_n^*}$，我们有 $r = p_1^{\beta_1}p_2^{\beta_2}\cdots p_k^{\beta_k}$和$s = p_1^{\gamma_1}p_2^{\gamma_2}\cdots p_k^{\gamma_k}$

其中$\textcolor{blue}{0 \le \beta_i,\gamma_i \le \alpha_i (i=1,2,\cdots,k)}$

则$r|s \iff \beta_i \le \gamma_i(i=1,2,\cdots,k)$

> 因为我们对`整数r` 和`整数s`做了`素数因子分解`，从`形式上来看`，应该如此。
>
> 如：r = 8 = $2^3, s = 32 = 2^5 \implies r | s$

因此，`偏序集`$(X_n^*, |)$正是`大小分别为`$\alpha_1 + 1, \alpha_2 + 2, \cdots, \alpha_k + 1$`的k个线性序的直积`

则$\textcolor{blue}{\mu(1,n) = \prod_{i=1}^{k}{\mu(1,p_i^{\alpha_i})}}$

> 我们首先是对`整数n`进行`素数因子分解`，然后对于$r,s \in X_n^*$，我们再`逐个对应地比较`$p_i$`的大小`，
>
> 从而来确定`是否有`$r | s$
>
> 因此，此处`乘积`含义为：对`所有的k个的`$p_i$`所相关的偏序关系`$\mu(1,p_i)$`进行了 直积运算`

则
$$
\mu(1,p_i^{\alpha_n}) = 
\begin{cases}
1,& \alpha_i = 0 \\
-1,& \alpha_i = 1 \\
0,& \alpha_i \ge 2
\end{cases}
$$
因此
$$
\mu(1,n) = 
\begin{cases}
1,& n = 1\\
(-1)^k, & 若n是互不相同的素数的乘积\\
0, &else
\end{cases}
$$
Q.E.D



#### Example 4

`欧拉φ函数`的定义是：$\phi(n) = |S_n|$

其中，$Sn = \{k: 1\le k\le n, GCD(k,n) = 1\}$

> 即$\phi(n)$为`不超过n且与n互素的正整数个数`

> 提示：可以对$X_n$`中的任何整数a和b`计算出$\mu(a,b)$：$\textcolor{green}{a|b \implies \mu(a,b) = \mu(1, \frac{b}{a})}$

求$\phi(n)$的`莫比乌斯函数`

---

设$\textcolor{blue}{S_n^d} = \{k: 1\le k \le n, \textcolor{blue}{GCD(k,n) = d}\}, \quad \text{(d是n的正因子)}$

任何满足$GCD(k,n) = 1$的 `整数k`都有$\textcolor{blue}{k = dk', \quad 1\le k' \le n/d且GCD(k', n/d) = 1}$的形式

因此$|S_n^d| = \phi(n/d)$

设$F(X)$为$\phi(n)$

并设$G(n) = \sum_{\{d: d| n\}}{\phi(d)}$

> $\phi(d)$等于满足GCD(k,n)=1的1和n之间的整数k的个数。
>
> 而对于`每个这样的k`，对`某个满足d|n的整数d`，`GCD(k,n) = d`成立。
>
> 则我们得到$G(n) = n$

故$\textcolor{blue}{G(n) = n = \sum_{\{d:d|n\}}{\phi(d)}}$

则通过`莫比乌斯反解`得
$$
\phi(n) = \sum_{\{d: d|n\}}{\mu(1, n/d)d} = \sum_{\{d:d|n\}}{\mu(1, d)n/d}
$$

> $$
> \begin{aligned}
> F(x) &= \sum_{\{y: y \le x\}}{G(y)\mu(y,x)}, \quad(x \in X) \\
> &= \phi(n) \\
> &= \sum_{\{d:d|n\}}{\mu(1,n/d)d}
> \end{aligned}
> $$



> $\mu(d)$非0 当且仅当：
>
> 1. d = 1
> 2. d是`互不相同的素数`的乘积
>
> > 则$\mu(d) = (-1)^r$，其中`r 是d中互不相同的素数的个数`。设`这些互异素数除以n为`$p_1,p_2,\cdots,p_r$则
> > $$
> > \begin{aligned}
> > \phi(n) &= n - (\frac{n}{p_1} + \frac{n}{p_2} + \cdots)+(\frac{n}{p_1p_2}+\frac{n}{p_1p_3}+\cdots)+\cdots+(-1)^r\frac{n}{p_1p_2\cdots p_r} \\
> > &= n\prod_{i=1}^r{\Big(1-\frac{1}{p_i}\Big)} \\
> > &= n\prod_{p|n}\Big(1-\frac{1}{p}\Big)
> > \end{aligned}
> > $$
> >
> > > 其中的`乘积`对`所有整除n的互不相同的素数p`进行求积



#### Example 5

计算`k个不同符号`$a_1,a_2,\cdots,a_k$`的循环n排列`的个数，其中的`每个符号`可以使用`任意多次`。

> 即`计数多重集合`$\{\infty \cdot a_1, \infty \cdot a_2, \cdots, \infty \cdot a_k\}$`的循环n排列的个数`

定义`周期`：`移动后使得留下的循环字不变`的`顺时针循环移位`的最小整数d，且$1 \le d \le n$和$d | n$

设$h(n)$是`可能使用符号`$a_1,a_2,\cdots,a_k$`的串`的个数

> 注：$h(n)$依赖于k，但这里没有表示出来。
>
> 可以将`一个循环排列`一一对应到为`线性的字`

设$f(m)$是`长度为m且可能用到符号`$a_1,a_2,\cdots,a_k$`的串的个数`



因为`每个串`有`1个周期d`，其中`d | n`

则$\textcolor{blue}{h(n) = \sum_{\{d: d|n\}}{\frac{f(d)}{d}}}$

若能够计算`周期为d长度为n的串的个数`，则`能够计算h(n)`

`设`$\textcolor{blue}{g(m) = \sum_{\{e:e|m\}}{f(e)}}$

`g(m)长度为m的串的总数`，故$\textcolor{blue}{g(m) = k^m}$，因而
$$
f(m) = \sum_{\{e: e|m\}}{\textcolor{green}{\mu(1, m/e)}\textcolor{blue}{g(e))}} = \sum_{\{e:e|m\}}{\textcolor{green}{\mu(1, m/e)}\textcolor{blue}{k^e}}
$$
则
$$
\begin{aligned}
h(n) &= \sum_{\{d: d|n\}}{\frac{f(d)}{d}} \\
&=\sum_{\{d:d|n\}}{\frac{1}{d}\sum_{\{e:e|d\}}{\mu(d/e)k^e}}\\
&=\sum_{\{e:e|n\}}{\Big(\sum_{\{m:m|n/e\}}{\frac{1}{me}\mu(m)} \Big)k^e} \\
&=\sum_{\{e:e|n\}}{\Big(\frac{r}{n}\mu((n/e)/r) \Big)k^e} \\
&=\sum_{\{e:e|n\}}{\frac{\phi(n/e)}{n}k^e} \\
&= \frac{1}{n}\sum_{\{e:e|n\}}{\phi(n/e)k^e}
\end{aligned}
$$

> $\because e|d 和 d|n \therefore d = me$
>
> 其中$me | n \implies m | n/e$



### Theory

#### Inference

##### Content

设$X_n = \{1,2,\cdots, n\}$，且设$F: \mathcal{P} \rightarrow \real$为`定义在`$X_n$`的子集上的函数`

设$G: \mathcal{P} \rightarrow \real$是`由定义如下的函数`$G(K) = \sum_{L \subseteq K}{F(L)}, \quad(K \subseteq X_n)$

则$F(K) = \sum_{L \subseteq K}{(-1)^{|K| -|L|} G(L)}, \quad (K \subseteq X_n)$

##### Proof

由之前的例子可知， `偏序集`$(\mathcal{P}(X_n),\le)$`的莫比乌斯函数`为$(-1)^{|K| - |L|}$

Q.E.D

#### Theorem

##### Background

 若$(X, \le_1)$和$(Y, \le_2)$是两个`有限偏序集`，则在`X和Y的笛卡尔乘积`上`定义的偏序关系`$\le_3$为
$$
(x, y) \le_3 (x', y')\iff \begin{cases} x \le_1 x'  \\ y \le_2 y' \end{cases}
$$
而我们将$(X \times Y, \le_3)$叫做$(X, \le_1)$和$(Y, \le_2)$的`直积`

> 这类似于`编程语言`中`对于UDT的boolean compare(another object)`的定义。
>
> 比如说，我们有`Person {String name, int age}`，则对`String类型的属性name`和`int类型的属性age`所`调用的比较函数`是`不同的`，
>
> 而且，我们可以用这种方式`组合任意多的不同类型的属性的比较函数`。

##### Content

设$(X, \le_1)$和$(Y, \le_2)$为`两个有限偏序集`，且` 他们的莫比乌斯函数`分别为$\mu_1$和$\mu_2$，

设$\mu$为$(X, \le_1)$和$(Y, \mu_2)$`的直积的莫比乌斯函数`。则：
$$
\mu((x,y),(x',y')) = \mu_1(x,x')\mu_2(y,y'),\qquad (x,y),(x',y')\in X\times Y
$$

##### Proof

$$
\begin{aligned}
\mu((x,y), (x',y')) &= -\sum_{\{(u,v):(x,y)\le(u,v)\lt(x',y')\}}{u((u,v),(x',y'))}\\
&=-\sum_{\{(u,v):(x,y)\le(u,v)\lt(x',y')\}}{u_1(u,x')u_2(v,y')}\\
&=\textcolor{blue}{-\Bigg(\sum_{\{u:x\le_1u\le_1x'\}}{u_1(u,x')}\Bigg)\Bigg(\sum_{\{v:y\le_2v\le_2y'\}}{u_2(v,y')}\Bigg)} + u_1(x,x')u_2(y,y')\\
&=\textcolor{blue}{-(0)(0)}+u_1(x,x')u_2(y,y')
\end{aligned}
$$

> 换句话说，`有限个有限偏序集的直积的莫比乌斯函数`是`他们的莫比乌斯函数的乘积`



#### Theorem 

##### Conent

设`F为定义在正整数集上的实值函数`，则定义`正整数集上的实值函数`$\textcolor{blue}{G(n) = \sum_{k: k|n}F(k)}$

则，对于`每一个正整数n`，我们有$F(n) = \sum_{k:k|n}{\textcolor{green}{\mu(1, n/k)}G(k)}$

##### Proof

> `G(n)的定义` 仅依赖于`F在集合`$X_n=\{1,2,\cdots,n\}$`的值`

$$
F(n) = \sum_{\{k:k|n\}}{\textcolor{green}{\mu(k,n)}G(k)} = \sum_{\{k:k|n\}}{\textcolor{green}{\mu(1,n/k)}G(k)}
$$

Q.E.D



### Application

#### Application 1

##### Content

求`将n个非攻击型车`放置到`n × n棋盘`$A = [a_{ij}: 1 \le i, j \le n]$的`方案数`：
$$
A = 
\begin{bmatrix}
0 & 1 & 0 & 1\\
1 & 1 & 1 & 0\\
1 & 0 & 1 & 1\\
1 & 1 & 0 & 1
\end{bmatrix}
$$

##### Solution

设$X_n = \{1,2,\cdots,n\}$，设$\mathcal{P}_n$表示`全部n!个双射`$f: X_n \rightarrow X_n$ 

> 1个$f$ 就是 1个排列方案

则，`将n个非攻击型车`放置到`n × n矩阵`$A=[a_{ij}]$`的棋盘的方法数`为
$$
plans = \sum_{f \in \mathcal{P}_n} \prod_{i=1}^n{a_{i\textcolor{blue}{f(i)}}}
$$

> $a_{if(i)}$表示`第i行第f(i)列的值`
>
> 上述式子的`乘积`用于`验证某个特定的放置方案`是否`合法`，若合法为1，否则为0
>
> 而`累加`用于`对所有可能的放置方案进行验证，并统计有几个合法方案`

---

考虑`偏序集`$(\mathcal{P}(X_n), \le)$，$X_n$`的每个基数为k的子集S 从A挑选k个列的集合`，我们将`这些列组成的n × k的子矩阵 记为`$\textcolor{blue}{A[S]}$

设$\mathcal{F}_n(S)$表示`所有的函数`$f: \{1,2,\cdots,n\} \rightarrow S$`的集合`

设$\mathcal{G}_n(S)$表示`满射函数的子集`

则有$\textcolor{blue}{\mathcal{F}_n(S) = \cup_{T \subseteq S}{\mathcal{G}(T)}}$

`定义` `函数`$F: \mathcal{P}(X_n) \rightarrow \real$为$\textcolor{blue}{F(S) = \sum_{f \in \mathcal{G}(S)}{\prod_{i=1}{a_{if(i)}}}, \quad (S \subseteq X_n)}$

> $F(X_n)$即为plans：因为`函数f`不但是`满射函数`，而且是`双射函数`

设$G(S) = \sum_{T \subseteq S}{F(T)}, \quad (S \subseteq X_n)$

则$\textcolor{blue}{G(S) = \sum_{g \in \mathcal{F}_n(S)}{\prod_{i=1}{a_{ig(i)}}},\quad (S \subseteq X_n)}$

根据`偏序集`$(\mathcal{P}(X_n), \le)$的`莫比乌斯函数`，得$F(X_n) = \sum_{S \subseteq X_n}{\textcolor{green}{(-1)^{n-|S|}}G(S)} $

又$G(S)$`是关于所有的函数`$g: X_n \rightarrow S$`对`$a_{1g(1)}, a_{2g(2), \cdots, a_{ng(n)}}$`的求和`,故它的值为：

$G(S) = \prod_{i=1}^n{(\sum_{j \in S}}{a_{ij})}$

> 也就是说，$G(S)$是对$A[S]$的`每行上的元素先求和，再乘积`

则
$$
F(X_n) = \sum_{S \subseteq X_n}{(-1)^{n-|S|} \textcolor{blue}{\prod_{i=1}^n{(\sum_{j \in S}{a_{ij}})}}}
$$

> 上式表明了一种`把n个非攻击型车放置到n × n的棋盘上的方案数`的计算方法：
>
> 选出`列的一个子集`，计算`这些列上的所有元素的和`，`再把这些和相乘起来`，加上`适当的符号`，并对`所有列的选择求和`。（`被加数`的个数 = `大小为n的集合的子集的个数`）

> 我们`常规的解法是：将棋盘矩阵A的每一行视为一个对象`，而`该解法是：将棋盘矩阵A的每一列视为一个对象`



{% endraw %}
