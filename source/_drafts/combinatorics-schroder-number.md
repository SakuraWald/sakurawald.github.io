---
title: "[Combinatorics] Schroder Number"
date: 2022-03-27 21:08:00
tags:
  - combinatorics
---

# Lattice & Schroder Number

## Lattice

### Definition

考虑坐标平面上`具有整数坐标的点的` `整格 (Integral Lattice)`。

给定2个点
$$
(p,q), (r,s) \quad p \ge r, q \ge s
$$
`从(p,q)到(r,s)的矩形格路径 (Rectangular Lattice Path)`指的是这样的一条路径：`从(r,s)到(p,q)`由 `水平步(Horizontal Step) H = (1,0)`和`垂直步 (Vertical Step) V = (0, 1)`所组成。

### Theorem

#### Theorem 1

##### Content

从`(r,s)到(p,q)的矩形格路径的数目`等于`二项式系数`：
$$
\binom{(p-r)+(q-s)}{p-r} = \binom{(p-r)+(q-s)}{q-s}
$$

##### Proof

`从(r,s)到(p,q)的路径`总共包含`(p-r)+(q-s)个水平步和垂直步`，

因此我们需要在`(p-r)+(q-s)个步`中`选择` `(p-r)个水平步`或者`确定(q-s)个垂直步`。

即使用`组合数的概念`

#### Theorem 2

##### Content

设n是非负整数，则`从(0,0)到(n,n)的下对角线矩形格路径`的数目=`第n个Catalan数`
$$
C_n = \frac{1}{n+1}\binom{2n}{n}
$$

##### Proof

考虑`Catalan数的经典模型`，令`水平步为+1元素`，`垂直步为-1元素`。

则实际上我们要求的是`由n个水平步和n个垂直步所构成的2n个元素的所有序列`中`可接受序列的数量`

> 可以`接触对角线`，这并不算`越过对角线`

Q.E.D

#### Theorem 3

##### Content

设p和q是正整数，且$p \ge q$，则`从(0,0)到(p,q)的下对角线矩形格路径(Subdiagonal Rectangular Lattice Path)`的数目等于
$$
\frac{p-q+1}{p+1}\binom{p+q}{q}
$$

##### Proof

![image-20220327183907639](https://s2.loli.net/2023/01/22/VwLM8BoRYGAcO79.png)

设`从(0,0)到(p,q)的穿过对角线的矩形格路径`$\gamma$`的数目`$l(p,q)$

设`从(0,0)到(p,q)的矩形格路径的数目`=$\binom{p+q}{p}$



$l(p,q)$的数目等于`从(0, -1)到(p, q-1)的接触到对角线y=x的矩形格路径`$\gamma^\prime$的数目相同

> 矩形格路径$\gamma^\prime$相当于是将原路径$\gamma$`整体向下平移1个单位格`所得到的。如果`在路径`$\gamma^\prime$中`恰好接触到对角线y=x`，则意味着`在原路径`$\gamma$中，`恰好已经穿过了对角线1个单位格`！所以，我们实际上建立了路径$\gamma^\prime$和路径$\gamma$之间的`一一对应关系`



故，
$$
\begin{aligned}
从(0,0)到(p,q)的下对角线矩形格路径的数目 &= 从(0,0)到(p,q)的矩形格路径的数目 - 从(0,0)到(p,q)的穿过对角线的矩形格路径的数目\\
&= \binom{p+q}{p} - l(p,q)
\end{aligned}
$$

---

我们将路径$\gamma^\prime$ `分解`为两部分：$\gamma^\prime = \gamma_1 + \gamma_2$ 

其中，

$\gamma_1$指`从(0,-1)到该路径接触到的第一个对角线点(d,d)的路径`

$\gamma_2$指`从(d,d)到(p, q-1)的路径`

>注意：路径$\gamma^\prime$是指`接触到对角线的路径`，有可能`不止接触对角线1次`

然后，我们将$\gamma_1$关于对角线$y=x$进行`反射`得到

$\gamma_1^*$是`从(-1,0)到该路径接触到的第一个对角线点(d,d)的路径`



由于$\gamma_1^*$是$\gamma_1$关于对角线$y=x$的反射，若令 $\gamma^* = \gamma_1^* + \gamma_2$，则

$\gamma*=\gamma_1^*+\gamma_2$ 与$\gamma^\prime=\gamma_1+\gamma_2$之间存在`一一对应关系`

故$l(p,q)$等于`从(-1,0)到(p,q-1)的矩形格路径的数目`，即
$$
\begin{aligned}
l(p,q) &= \binom{(p - (-1))+(q-1 - 0)}{q-1} \\
&=\binom{p+1+q-1}{q-1} \\
&=\binom{p+q}{q-1}
\end{aligned}
$$


> 注：由于$\gamma_1^*$是$\gamma_1$关于对角线$y=x$进行`反射`而得到的。路径$\gamma_1^*$的`起点(-1,0)`和`终点(p, q-1)` 分别`位于对角线y=x的两侧`。
>
> 故：`所有的从(-1,0)到(p,q-1)的矩形格路径`均会`穿过对角线`！

---

综上，`从(0,0)到(p,q)的下对角线矩形格路径`的数目等于
$$
\begin{aligned}
\binom{p+q}{q} - l(p,q)=\binom{p+q}{q}-\binom{p+q}{q-1} = \frac{p-q+1}{p+1}\binom{p+q}{q}
\end{aligned}
$$

#### Theorem 4

##### Background

`HVD格路径`指的是允许`水平步 (Horizontal Step)`，`垂直步 (Vertical Step)`和`对角步 (Diagonal Step)`的格路径。

设$K(p,q)$是`从(0,0)到(p,q)的HVD格路径的数目`

设$K(p,q:rD)$是`从(0,0)到(p,q)的恰好使用r个对角步的HVD格路径的数目`

##### Content

设$r \le min\{p, q\}$，则
$$
K(p,q:rD) = \binom{p+q-r}{p-r\qquad q-r \qquad r} = \frac{(p+q-r)!}{(p-r)!(q-r)!(r)!}
$$
以及
$$
K(p,q)=\sum_{r=0}^{min\{p,q\}}\frac{(p+q-r)!}{(p-r)!(q-r)!(r)!}
$$




##### Proof

如果`某条HVD格路径恰好使用了` `r个对角步`，则意味着`这条格路径必定恰好使用了` `p-r个水平步`和`q-r个垂直步`

于是，$K(p,q:rD)$的值 等同于 `求多重集合{(p-r) · H, (q-r) · V, r · D}的排列数` 即：
$$
K(p,q:rD) = \binom{p+q-r}{p-r \qquad q-r \qquad r}= \frac{(p+q-r)!}{(p-r)!(q-r)!(r)!}
$$
Q.E.D

#### Theorem 5

##### Background

设$R(p,q) \quad p \ge q$为`从(0,0)到(p,q)的下对角线HVD格路径的数目`



另外，设$R(p,q:rD)$ 是`从(0,0)到(p,q)的恰好使用r个对角步的HVD格路径的数目` 

则，
$$
R(p,q) = \sum_{r=0}^{min\{p,q\}}{R(p,q:rD)}
$$

##### Content

设p和q是正整数，且$p \ge q$，并设r是满足$r \le q$的非负整数。则有
$$
\begin{aligned}
R(p,q:rD) &= \frac{p-q+1}{p-r+1}\frac{(p+q-r)!}{(r)!(p-r)!(q-r)!} \\
&= \frac{p-q+1}{p-r+1} \binom{p+q-r}{r \qquad (p-r) \qquad (q-r)}
\end{aligned}
$$


##### Proof

`从(0,0)到(p,q)的恰好使用r个对角步的下对角线HVD格路径`$\gamma$ 可以在`去除了r个对角步`之后，转化为

`从(0,0)到(p-r,q-r)的下对角线HVD格路径`$\pi$

同理，相反的。我们可以对`从(0,0)到（p-r,q-r)的下对角线HVD格路径`$pi$的基础上，通过在`p-r个水平步`，`q-r个垂直平`的`共(p-r)+(q-r)+1=p+q-2r+1个位置中的任意地方`插入`r个对角步`后得到`从(0,0)到(p,q)的恰好使用r个对角步的下对角线HVD格路径`$\pi$的数量



在$\pi$中插入`r个对角步的方案数` 等于 `下述方程的非负整数解的个数`
$$
x_1 + x_2 + \cdots + x_{p+q-2r+1} = r
$$
而`解的个数`是
$$
\binom{(p+q-2r+1)+r-1}{r}=\binom{p+q-r}{r}
$$
综上，我们得到
$$
\begin{aligned}
R(p,q:rD) &= \binom{p+q-r}{r} \times R(p-r,q-r,0D) \\
&=\binom{p+q-r}{r} \times \frac{p-q+1}{p-r+1}\binom{p+q-2r}{q-r}\\
&=\frac{p-q+1}{p-r+1}\binom{p+q-r}{r \qquad (p-r) \qquad (q-r)}
\end{aligned}
$$
Q.E.D

## Schroder Number

### Large Schroder Numebr

#### Definition

假设$p = q = n$，则`从(0,0)到(n,n)的下对角线HVD格路径`即为`Schroder路径`

`大Schroder数`$R_n$表示`从(0,0)到(n,n)的Schroder路径的数目（即下对角线的HVD格路径的数目）`
$$
R_n = R(n,n) = \sum_{r=0}^n{\frac{1}{n-r-1}\frac{(2n-r)!}{(r)!((n-r)!)^2}}
$$

### Small Schroder Number

#### Definition

设$n \ge 1$ ，且$a_1,a_2,\cdots\,a_n$是`n个符号的序列`。`小Schroder数`$s_n$表示`对n个符号的序列加括号的方案数`

> 每个括号内的符号不一定只能是2个，可以任意多个。换句话说，不一定只是`二元加括号方式`

$$
(n+2)s_{n+2}-3(2n+1)s_{n+1}+(n-1)s_n = 0 \qquad (n \ge 1)
$$

给序列$a_1,a_2,\cdots,a_n$加括号的递归定义为：

1. 对于每一个符号$a_i$，它本身就是一种加括号的方案。
2. 任意`两个或多个加括号序列`被`一对括号`括起来，则也是一种加括号的方案。 

#### Theorem

##### Theorem 1

###### Content

`小Schroder数`的`生成函数`为
$$
\sum_{n=1}^\infty{s_nx^n} = \frac{1}{4}(1+x-\sqrt{x^2-6x+1})
$$

###### Proof

设$g(x) = \sum_{n=1}^{\infty}{s_nx^n}$为`小Schroder数的生成函数`。

则根据`小Schroder数的递归定义`得

$g(x) = x + g(x)^2 + g(x)^3 + g(x)^4 + \cdots = x + g(x)^2(1+ g(x) + g(x)^2 + \cdots)= x + \frac{g(x)^2}{1-g(x)}$

化简得

$2g(x)^2-(1+x)g(x)+x = 0$

使用`y`代替`g(x)`得

$2y^2 - (1+x)y + x = 0$

> 此处x被当做常数处理

解方程得出
$$
\begin{aligned}

y_1(x)&=\frac{(1+x)+\sqrt{(1+x)^2-8x}}{4}\\\\

y_2(x)&=\frac{(1+x)-\sqrt{(1+x)^2-8x}}{4}
\end{aligned}
$$
代入`递推关系的初始条件`$g(0)=0$进行`检验根`得知应舍去$y_1(x)$。故
$$
g(x) = y_2(x) = \frac{(1+x)-\sqrt{(1+x)^2-8x}}{4}
$$
Q.E.D

> 根据`小Schroder数的递推关系的生成函数`，我们可以通过`求解微分方程`来得到`小Schroder数的递推关系`。
>
> `求解生成函数的过程`不在这里详细展开。

##### Theorem 2

###### Content

`大Schroder数的生成函数`为
$$
\sum_{n=0}^\infty{R_nx^n} = \frac{1}{2x}(-(x-1)-\sqrt{x^2-6x+1})
$$

###### Proof

`从(0,0)到(n,n)的下对角线的格路径`可以被分为3类：

1. 空路径（当n=0时）
2. 该路径从一个 对角步 D 开始
3. 该路径从一个 水平步 H 开始

> `Sychroder路径`不会从一个`垂直步`开始，否则将会`立即越过对角线`，从而`违反定义`



- 对于类型1：因为根本不存在方案，故不需要计数。（或者计数为`+0个方案`）

- 对于类型2：`原问题`相当于求`从(1,1)到(n,n)的下对角线的格路径`的数目

即$R_{n-1}$ （相当于把`原问题`的规模从`n`缩小到`n-1`）

- 对于类型3：`原问题`相当于求`从（1,0)到(n,n)的下对角线的格路径` 数目。

设$\gamma$表示该路径，且$\gamma$起始于$(1,0)$，终止于$(n,n)$。

设$(k,k) \quad 1 \le k \le n$ 为路径$\gamma$`所接触的第一个对角线上的点`



考察`路径`$\gamma$（`从(1,0)到(n,n)的路径`）到达所接触的第一个对角线上的点$(k,k)$的方式：

1. 如果$\gamma$通过`1个垂直步`从$(k, k-1)$步进到$(k,k)$：则分解$\gamma=\gamma_1 +\gamma_2$，设$\gamma_1$是`从(1,0)到(k,k-1)的部分上是一条格路径`。$\gamma_1$不会`接触到对角线上的点`，所以$\gamma_1$存在$R_{k-1}$种选择。

   > 即基于`求从(1,0)到(k,k-1)的下对角线的格路径数目`中选取一个子问题规模：$(k)-(1) = (k-1) - (0) = k - 1$）。

   而$\gamma_2$是`从(k,k)到(n,n)的下对角线的格路径数目`，因而存在$R_{n-k}$个选择。

2. $\gamma$不可能通过`1个水平步`从$(k -1, k)$步进到$(k,k)$，否则这将意味着`这条路径早已越过了对角线`

---

综上
$$
R_n = R_{n-1} + \sum_{k=1}^n{R_{k-1}R_{n-k}} \quad (n \ge 1)
$$
或等价地
$$
Rn = R_{n-1} + \sum_{k=0}^{n-1}{R_kR_{n-1-k}} \quad (n \ge 1)
$$
 故
$$
x^nR_n = x(x^{n-1}R_{n-1}) + x(\sum_{k=0}^{n-1}{x^kR_kx^{n-1}R_{n-1-k}}) \quad (n \ge 1)
$$

> 整合上面两个式子

代入$R_0 = 1$得出
$$
h(x) = 1 + xh(x) + xh(x)^2
$$
同理解`一元二次方程`得出
$$
h(x) = y_2(x) = \frac{1-x-\sqrt{x^2-6x+1}}{2x}
$$

##### Inference

###### Content

`大Schroder数`和`小Schroder数`之间存在关系
$$
R_n = 2s_{n+1} \quad (n \ge 1)
$$

##### Theorem 3

###### Content

设n为正整数，`有n+1条边的凸多边形区域`的`剖分数`（即$\Pi_{n+1}$）等于 `小Schroder数`$s_n$

> 相类似的：对于`有n+1条边的凸多边形区域`的`三角剖分数` 等于`第n-1个Catalan数`
