---
title: "[Combinatorics] Stirling Number"
date: 2022-03-27 03:15:00
tags:
  - combinatorics
---

# [Counting] Stirling Number

## Difference Sequence

### Definition

若
$$
h_0,h_1,h_2,\dots,h_n,\dots
$$
是一个序列。

则我们定义`一阶差分序列 `为
$$
\Delta h_0, \Delta h_1, \Delta h_2, \dots, \Delta h_n, \dots
$$
其中$$\Delta h_n = h_{n+1} - h_n$$

> 同理，`二阶差分序列`为$$\Delta^2 h_n = \Delta(\Delta h_n)=\Delta h_{n+1} - \Delta h_n$$
>
> 而`零阶差分序列`即为`原始序列`

## Difference Table

差分表（Difference Table)的定义是：将`每个p=0,1,2,...,阶的差分序列`排成一行而得到。

如：
$$
h_0 \quad h_1 \quad h_2 \quad h_3 \quad h_4 \dots \\
 \Delta h_0 \quad \Delta h_1 \quad \Delta h_2 \quad \Delta h_3 \\
 \Delta^2h_0 \quad \Delta^2h_1 \quad \Delta^2h_2 \\
 \Delta^3h_0 \quad \Delta^3h_2\\
 \dots
$$

### Theorem

#### Theorem 1

##### Content

设`序列的通项是n的p次多项式`，即
$$
h_n = a_pn^p + a_{p-1}n^{p-1} + \dots + a_1n + a_0 \quad (n \ge 0)
$$
则对于所有的$$n \ge 0, \Delta^{p+1}h_n = 0$$

> 换句话说，如果某个序列的通项的最高次是p，那么$$\Delta^{p+1}h_n = 0$$

##### Proof

我们不妨采用`归纳法`来证明这个结论。

已知
$$
h_n = a_pn^p + a_{p-1}n^{p-1} + \dots + a_1n + a_0 \quad (n \ge 0)
$$
对于$$p=0$$，则$$h_n = a_0$$

故$$\Delta h_n = h_{n+1} - h_n = a_0 - a_0 = 0 \quad (n \ge 0)$$满足题意

---

使用`n+1`代替`n`得到
$$
h_{n+1} = a_p(n+1)^p + a_{p-1}(n+1)^{p-1} + \dots + a_1(n+1) + a_0 \quad (n \ge -1)
$$
根据定义 $$\Delta h_n = h_{n+1} - h_n$$得
$$
\begin{aligned}
\Delta h_{n+1} &= h_{n+1} - h_n \\
&= (a_p(n+1)^p + a_{p-1}(n+1)^{p-1} + \dots + a_1(n+1) + a_0)\\
- (a_pn^p + a_{p-1}n^{p-1} + \dots + a_1n + a_0)
\end{aligned}
$$
我们考察$$a_p(n+1)^p$$和$$a_pn^p$$这两项
$$
\begin{aligned}
a_p(n+1)^p - a_pn^p \\
= a_p(n^p + \binom{p}{1}n^{p-1} + \dots + 1) - a_pn^p
\end{aligned}
$$
通过观察可以发现，$$a_pn^p$$这一项被`消掉`了。

> $$h_{n+1}$$和$$h_{n}$$中$$a_pn^p$$这一项的`系数`必定相等，因为对于 $$(n+1)^p$$的`多项式展开`，只有`所有的选择`都`取n这项`才足够达到`n次多项式`

同理，通过其他方式，比如直接考察$a_1(n+1)$和$$a_1n$$我们也可以发现，$$n$$被`消除`，从而`多项式被降次`

> 换句话说，通过$\Delta h_n = h_{n+1} - h_n$，我们`得到的多项式中的每一项都相比原来的项被降了1次`。

因此，`每升高一阶差分序列`均会对`先前的序列（的所有项）` `降低1次`。

故对于`序列的通项是n的p次多项式`，我们只需要`重复p+1`次（若重复p次，则序列的最高次为0次，为常数项序列。但不一定所有的常数都为0）即可将`序列的所有项都变为0`，满足$$\Delta^{p+1} h_n = 0$$

#### Theorem 2

##### Content

`差分表`的`第0条对角线`（即最左边的那一条对角线）等于
$$
c_0, c_1, c_2, \dots, c_p, 0, 0, 0 \quad (c_p \ne 0)
$$
`的序列的通项`是满足
$$
h_n = c_0\binom{n}{0} + c_1\binom{n}{1} + c_2\binom{n}{2} + \dots + c_p\binom{n}{p}
$$
的`n的p次多项式`

##### Proof

考察具体例子：若已知`差分表的第0条对角线`上的`元素是：0,0,0,0,1,0,0,...`

通过`第0条对角线上的元素`可以`确定整个差分表的元素`。可知：$$h_0 = 0, h_1 = 0, h_2 = 0, h_3 = 0, h_4 = 1$$

且可知$$h_n是一个4次多项式$$，这个`多项式具有根0,1,2,3`

> 可以把$$h_n$$当成是关于n的函数，则这个多项式具有根0,1,2,3，因为当n取0,1,2,3时，$$h_n = 0$$

$$
h_n = c \times (n)(n-1)(n-2)(n-3)
$$

根据初始条件$$h_4 = 1$$可确认$$c = \frac{1}{4!}$$

故
$$
h_n = \frac{1}{4!} \times (n)(n-1)(n-2)(n-3)
$$

---

##### Application

该定理可用于`求部分和 ` $$H_n$$
$$
H_n = \sum_{k=0}^n{h_k} = c_0\sum_{k=0}^n\binom{k}{0} + c_1\sum_{k=0}^n\binom{k}{1} + c_2\sum_{k=0}^n\binom{k}{2} + \dots + \sum_{k=0}^n\binom{k}{k-1}
$$
根据计算公式得出结果。
$$
\sum_{k=0}^n\binom{k}{p}=\binom{n+1}{p+1}
$$
整合得
$$
H_n = \sum_{k=1}^n{h_k} = c_0\binom{n+1}{1} + c_1\binom{n+1}{2} + c_2\binom{n+1}{3} + \dots + c_p\binom{n+1}{p+1}
$$

##### Example

###### Description

求通项为$$h_n = n^p$$的序列的前n个数的和。

###### Analysis

设$$k_n = n^p$$的差分表的`第0条对角线上的元素为`
$$
c(p,0), c(p,1), c(p, 2), \dots, c(p, p), 0, 0, \dots
$$
则可知$$h_n$$的表示为
$$
n^p = c(p,0)\binom{n}{0} + c(p,1)\binom{n}{1} + c(p,2)\binom{n}{2} + \dots + c(p,p) \binom{n}{p}
$$
根据
$$
\begin{aligned}
&\left[n\right]_k= k!\binom{n}{k}\\
&P(n, k) = k! \times C(n, k)
\end{aligned}
$$
整合得
$$
\begin{aligned}
n^p &= c(p,0)\frac{\left[n\right]_0}{0!}+c(p,1)\frac{\left[n\right]_1}{1!}+\dots+c(p,p)\frac{\left[n\right]_p}{p!}\\
&= \sum_{k=0}^p\frac{c(p,k)}{k!}\left[n\right]_k
\end{aligned}
\tag{Partial Sum Formula}
$$

---



## The Second Stirling Number

### Definition

定义`第二类Stirling数` `S(p, k)`
$$
S(p, k) = \frac{c(p, k)}{k!} \quad (0 \le k \le p)
$$

### Theorem

#### Theorem 1

##### Content

如果$$1 \le k \le p-1$$，则$$S(p, k) = k\times S(p-1,k) + S(p-1, k-1)$$

##### Proof

通过将`第二类Stirling数`代入`部分和公式`整合得到
$$
n^p = \sum_{k=0}^p S(p, k) \left[n\right]_k
$$
为了得出$n^p$和$n^{p-1}$之间的关系，我们用$p-1$代替$p$得到
$$
n^{p-1} = \sum_{k=0}^{p-1} S(p-1, k)\left[n\right]_k
$$
接着，我们构造$n^{p-1}$和$n^p$之间的联系
$$
\begin{aligned}
n^p &= n \times n^{p-1} = \sum_{k=0}^p{S(p,k)\left[n\right]_k} \\
&= n \times \sum_{k=0}^{p-1}{S(p-1,k)\left[n\right]_k} \\
&= \sum_{k=0}^{p-1} {S(p-1, k)n\left[n\right]_k} \\
&= \sum_{k=0}^{p-1} {S(p-1, k)(n - k + k)\left[n\right]_k} \\
&= \sum_{k=0}^{p-1} {k \times S(p-1, k)\left[n\right]_k} + \sum_{k=0}^{p-1}{S(p-1, k)(n-k)\left[n\right]_k} \\
&= \sum_{k=1}^{p-1} {k \times S(p-1, k)\left[n\right]_k} + \sum_{k=0}^{p-1}{S(p-1, k)\left[n\right]_{k+1}} \\
&= \sum_{k=1}^{p-1} {k \times S(p-1, k)\left[n\right]_k} + \sum_{k=1}^{p}{S(p-1, k-1)\left[n\right]_{k}} \\

\end{aligned}
$$

> 最后两步是通过用k-1代替求和中的k得到的。

综上，
$$
S(p,k) = S(p-1,k-1) + k \times S(p-1, k)
$$

##### Stirling Triangle

![image-20220327074734056](https://s2.loli.net/2023/01/22/j5ABLTc7MHaGvRw.png)

性质
$$
\begin{aligned}
&S(p, k) = S(p - 1, k - 1) + k \times S(p - 1, k) \\
&S(0,0) = 1 \\
&S(p,0) = 0 \quad (p \ne 0) \\
&S(p,1) = 1 \quad(p \ge 1) \\
&S(p,2) = 2^{p-1} - 1 \quad(p \ge 2) \\
&S(p, p - 1) = \binom{p}{2} \quad (p \ge 1) \\
&S(p, p) = 1 \\
\end{aligned}
$$

#### Theorem 2

##### Content

`第二类Stirling数`计数的是`把p元素集合划分到k个不可区分的盒子中且没有空盒子的划分个数`

##### Proof

考虑将`前p个正整数1,2,3,...,p`划分到`k个不可区分的盒子`中。

对于`元素p`而言，有`两种划分方式`

1. 让元素p`单独占据`一个`盒子`
2. 让元素p`不单独占据`一个`盒子`



在第1种情况下，如果我们从`包含元素p的盒子`中拿走`元素p`，那么`非空集合的数量`应当从`k个`减少到`k-1个`。

即：S(p - 1, k - 1)种方案

在第2种情况下，如果我们从`包含元素p的盒子`中拿走`元素p`，由于`元素p`可能存在于`k个盒子中的任何一个`，而我们无法确认`这个盒子`到底是哪一个，故`这k个盒子的每一个都可以构成一种方案`。即： k * S(p - 1, k)

综上，在`p-1个元素的基础上`所能产生的划分个数为
$$
S(p, k) = S(p - 1, k - 1) + k * S(p - 1, k)
$$

> 注：上述解释是基于`从p个元素中取走1个元素`来进行的。解释也可以基于`从p-1个元素中加入1个新元素`来进行。解释方式是对称的。

#### Theorem 3

##### Content

求将`p个元素集合划分到k个可区分的盒子中且没有空盒子的划分个数` $$S^\#(p, k)$$。

对此而言，可以理解为`这k个可区分的盒子`是由`k种颜色涂色的盒子`。

而$$ S^\#(p, k) = k! \times S(p, k) = c(p, k)$$

> 见前面对第二类Stirling数的定义

#### Theorem 4

##### Background

求将`p个元素集合划分到k个可区分的盒子中，且可能存在空盒子的划分个数`



##### Content

对每一个满足$0 \le k \le p$的整数k，都有
$$
S^\#(p,k) = \sum_{t=0}^k{(-1)^t\binom{k}{t}(k-t)^p}
$$
因而
$$
S(p,k) = \frac{1}{k!}\sum_{t=0}^k{(-1)^t\binom{k}{t}(k-t)^p}
$$

##### Proof

运用`容斥原理`，设$U$表示`将p个元素集合划分到k个可区分的盒子中的划分个数` = $k^p$

定义`k个性质`$P_1, P_2, \dots, P_k$，其中$P_i$是第i个盒子$B_i$是空盒的性质

设$A_i$表示盒子$B_i$是空盒的那些划分组成的子集。

故
$$
S^\#(p,k) = |\overline{A_1}\cap \overline{A_2}\cap\overline{A_3}\cap\dots\cap \overline{A_k}|
$$
且
$$
|U|=k^p
$$
设t是一个满足$1 \le t \le k$的整数，使得$B_1, B_2, \dots, B_t$中`共t个盒子`是`空盒子`，而`剩下的k-t个盒子可空可不空`：$B_{t+1}, B_{t+2}, \dots, B_k$

故$|\overline{A_1} \cap \overline{A_2} \cap \dots \cap \overline{A_t}|$计数的是`将p个元素结合划分到k-t个可区分盒子的个数（这些k-t个盒子可空可不空）`=$(k-t)^p$

无论假设的是哪t个盒子是空的，所得的结果都相同。

即：对于$\{1,2,3,\dots,k\}$的每个t子集$\{i_1,i_2,i_3,\dots,i_t\}$而言
$$
|A_{i_1} + A_{i_2} + A_{i_3} + \dots + A_{i_t}| = (k-t)^p
$$
综上，
$$
S^\#(p,k) = \sum_{t=0}^k{(-1)^t\binom{k}{t}(k-t)^p}
$$

> t满足$1 \le t \le k$时会将`箱子`分成`两部分不同性质的箱子且两部分箱子均至少有1个箱子`。而当$t = 0$时，即为 全集$U$，此时`两部分箱子中的一部分没有分到任何的箱子`



#### Theorem 5

##### Background

`Bell数`指的是`将p个元素集合`划分到`非空且不可区分的集合的划分个数`。即
$$
B_p = S(p, 0) + S(p, 1) + S(p, 2) + S(p, 3) + \dots + S(p, p)
$$

> 注意这里将 S(p, 0)即没有任何盒子的这一种特殊情况也算入

##### Content

若$p \ge 1$，则
$$
\begin{aligned}
B_p &= \binom{p-1}{0}B_0 + \binom{p-1}{1}B_1 + \binom{p-1}{2}B_2 + \dots + \binom{p-1}{p-1}B_{p-1} \\
&= \sum_{t=0}^{p-1}{\binom{p-1}{t}B_{p-1-t}}
\end{aligned}
$$

##### Proof

考虑`包含p元素的这个盒子`，`该盒子除了包含p元素之外`，还包含$\{1, 2, ,3, \dots, p-1\}$中的子集$X$。

所以对于`包含p元素的这个盒子`，它的元素由`2部分构成`

1. p元素
2. 包含$\{1,2,3,\dots,p-1\}$中的子集X （子集X可能是空集，也就是说此时p元素独自占有这个盒子）

为了`确定这个盒子的元素`，我们需要从$\{1,2,3,\dots,p-1\}$中选择子集X。

设t满足$0 \le t \le p-1$，则我们可以从$\{1,2,3,\dots,p-1\}$中选出`t个元素`来和`p元素`作伴，同时将`剩余的p - 1 - t个元素划分到非空且不可区分的集合`中

即
$$
B_p = \sum_{t=0}^{p-1}{\binom{p-1}{t}B_{p-1-t}}
$$
Q.E.D



## The First Stirling Number

### Definition

将$\left[n\right]_p$完全展开后得到形如下式的含有n的幂的多项式：
$$
\begin{aligned}
\left[n\right]_p &= s(p,p)*n^p - s(p, p-1)*n^{p-1} + \dots + (-1)^{p-1}s(p,1)*n^1 + (-1)^ps(p,0)*n^0\\
&=\sum_{k=0}^p{(-1)^{p-k}s(p,k)n^k}
\end{aligned}
$$
其中，定义`第一类Stirling数`即为上列多项式的`系数`$s(p,k) \quad (0 \le k \le p)$

其中$s(p,0) = 0 \quad (p \ge 1)$ 和 $s(p,p) = 1 \quad (p \ge 0)$

### Theorem

#### Theorem 1

##### Content

如果$1 \le k \le p-1$，则
$$
s(p,k)=(p-1)s(p-1,k) + s(p-1,k-1)
$$

##### Proof

尝试采用`数学归纳法`证明结论。

对$s(p,k)$使用`p-1`代替`p`得
$$
\left[n\right]_{p-1} = \sum_{k=0}^{p-1}{(-1)^{p-1-k}s(p-1,k)n^k}
$$
观察得出
$$
\begin{aligned}
\left[n\right]_p&=\left[n\right]_{p-1}(n-(p-1))\\
&= (n-(p-1))\left[n\right]_{p-1}\\
&= (n-(p-1))\sum_{k=0}^{p-1}{(-1)^{p-1-k}s(p-1,k)n^k}\\
&= \sum_{k=0}^{p-1}{(-1)^{p-1-k}s(p-1,k)n^{k+1}} + \sum_{k=0}^{p-1}{(-1)^{p-k}(p-1)s(p-1,k)n^k}\\
&= \sum_{k=1}^{p-1}{(-1)^{p-k}s(p-1,k-1)n^{k}} + \sum_{k=0}^{p-1}{(-1)^{p-k}(p-1)s(p-1,k)n^k}\\
\end{aligned}
$$

> 这个观察并不会简单

通过`比较`$n^k$`的相应系数可得出`
$$
s(p,k) = s(p-1, k-1) + (p-1)\ s(p-1, k)
$$
Q.E.D

#### Theorem 2

##### Content

`第一类Stirling数`$s(p,k)$计数的是把`p个对象`排列成`k个非空循环排列`的方案数。

##### Proof

考虑`第p个对象的选择方案`

1. 让`第p个对象`独自成为1个队列
2. 让`第p个对象`插入到`已存在队列`的`总共p-1个人`的`前面`（或者说`后面`也行）

故
$$
s(p,k) = s(p-1,k-1) + (p-1)s(p-1,k)
$$

>在这个递推分析中，我们只关注`第p个对象`和`前面p-1个对象`之间的关系，而不关注具体的循环排列是如何计算的。通过考虑`第p个对象的处置方案数`从而得出递推关系。

Q.E.D
