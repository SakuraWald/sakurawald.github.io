---
title: "[Combinatorics] Catalan Number"
date: 2022-03-26 11:40:00
tags:
  - combinatorics
---

# [Counting] Catalan Number

## Definition

Catalan数是定义如下的数列
$$
C_n = \frac{1}{n+1}\binom{2n}{n} \qquad (n = 0,1,2,\dots)
$$

其中将 $n$ 替换为 `n - 1`可得到
$$
C_{n-1} = \frac{1}{n}\binom{2n-2}{n-1}
$$
该式 $C_{n-1}$ 的含义是: `具有 n + 1 条边的凸多边形`被其`内部不相交的对角线`所`划分出的三角形区域的方法数` $h_n$ 

 其中
$$
define\quad h_1 = 1\\
\begin{aligned}
h_n &= h_1h_{n-1}+h_2h_{n-2}+h_3h_{n-3}+\dots+h_{n-1}h_1\\
&= \sum_{k=1}^{n-1}{h_kh_{n-k}} \qquad (n \ge 2)
\end{aligned}
$$

## Theorem

### Theorem 1 (The Number of Acceptable Sequence)

#### Content

考虑由`n个+1`和`n个-1`构成的`2n项序列`$$a_n$$
$$
a_1, a_2, a_3, \dots , a_2n
$$
则`该序列的部分和满足下列条件`
$$
a_1 + a_2 + a_3 + \dots + a_k \ge 0
$$
`的序列的个数`等于`第n个Catalan数`

#### Proof

定义满足下列条件的序列为`可接受序列 (Acceptable Sequence)`
$$
a_1 + a_2 + a_3 + \dots + a_k \ge 0
$$
否则，将序列称为`不可接受序列 (Unacceptable Sequence)`

---

由`n个+1`和`n个-1` `所构成的2n项序列 `$$a_n$$  的个数 $$T_n$$ 满足
$$
T_n = C_{2n}^n = \binom{2n}{n} = \frac{(2n)!}{(n)!(n)!}
$$

设：由`n个+1`和`n个-1` `所构成的2n项序列`$$a_n$$ 中的`可接受序列`的个数为$$A_n$$

同样地，设`其中的不可接受序列`的个数为$$U_n$$
$$
T_n = A_n + U_n
$$


故
$$
A_n = T_n - U_n
$$
因此，只需求出 $$U_n$$ 即可求出 $$ A_n $$

---

假设 $$a_k$$ 是`序列中第一个导致形成不可接受序列的元素`，即
$$
a_1, a_2, a_3, \dots ,a_k \lt 0 \qquad (1 \le k \le n)
$$
则我们可以知道`前k-1个元素`中，`-1元素`和`+1元素`的个数相等。即
$$
a_1,a_2,a_3,\dots,a_{k-2},a_{k-1} = 0 \qquad (1 \le k \le n) \\
a_k = -1
$$
因此，我们可以得到`不可接受序列的结构`：`前k-1个元素中有相等数量的-1元素和+1元素`，而`第k个元素是-1元素`。

---

现在，我们将`前k项中的每一项的符号进行反转`：即对 i = 1, 2, 3, ... , k 我们使用 $-a_i$ 来代替 $a_i$

得到变化后的序列
$$
a_1^\prime, a_2^\prime, a_3^\prime,\dots,a_k^\prime
$$
我们得到的`新序列`包含`n+1个+1`和`n-1个-1`共`2n项`，

该`数列`是通过对`原数列`的`前k个元素进行符号反转`而得到的，而由于`该序列`的`+1元素`比`-1元素`多`1个`（在`反转符号`之前，`原序列`的`+1元素`和`-1元素`的个数相等均为n），所以该序列必定是`不可接受序列`。

为了得到`不可接受序列`的个数，我们需要做的仅仅是`考虑如何排列`这`n+1个+1元素`和`n-1个-1元素`

因此我们得到，`不可接受序列`的个数等同于：由`n+1个+1元素`和`n-1个-1元素`所组成的`2n项的数列`的个数。即
$$
U_n = C_{2n}^{n+1} = \binom{2n}{n+1}
$$

> 注：我们并不关心k究竟取什么值，而仅仅是关心这样一个结构：前k-1个元素中+1元素和-1元素的个数相等，且第k个元素的值为-1

> 注：我们对于k的定义为：$$a_k$$ 是使得 数列的部分和$$S_k$$ ＜0的第一个元素。
>
> 在$$U_n$$ 的计算公式中，我们也并不关心k究竟在哪里。而仅仅关心如何排列 n+1个+1元素和n-1个-1元素，这是因为，我们可以通过所形成的排列，再根据k的定义，倒推出k所应处的位置。

---

综上，
$$
\begin{aligned}

A_n &= T_n - U_n \\
&= \binom{2n}{n} - \binom{2n}{n+1} \\
&= \frac{(2n)!}{(n)!(n)!} - \frac{(2n)!}{(n+1)!(n-1)!} \\
&= \frac{(2n)!}{(n)!(n-1)!}(\frac{1}{n}-\frac{1}{n+1}) \\
&= \frac{(2n)!}{(n)!(n-1)!}(\frac{1}{n(n+1)}) \\
&= \frac{(2n)!}{(n)!(n+1)!} \\
&= \frac{1}{n+1}\binom{2n}{n} \\
&= Catanlan(n)
\end{aligned}
$$
Q.E.D

#### Example

##### Example 1

###### Description

一位律师在他所`居住`的所有`以北n个街区`和`以东n个街区`的地方`工作`。每天他要走`2n个街区`去`工作`。

如果他从来`不穿越（但可以接触）` `从家到工作场所的对角线`，则`有多少条可能的路线`？

![image-20220326163649380](https://s2.loli.net/2023/01/22/nFqsPzNBkSRlXID.png)

> 注：上图中n=4，律师从src到dst总共走2n个街区

###### Analysis

`律师`从`起点`出发到达`终点`总共需要走`n个水平步`和`n个垂直步`。

所以，`从src到dst的总路线数量` $$T_n$$ 应为
$$
T_n = \binom{2n}{n}
$$
但是，这并不是该问题的最终解。因为该问题还需要满足约束：不能`越过对角线`。

---

我们设`向北走为+1元素`，`向东走为-1元素`。于是`每一条路线`都可以构成`一个序列` $$a_n$$

`一条合法的路线`应满足
$$
\sum_{i=1}^{k} {a_i \ge 0} \quad (k = 1, 2, 3, \dots, 2n)
$$
该模型符合`Catanlan数`，即`合法路线的数量`=`可接受序列的数量`

因此，`位于对角线上方的路线的数量` = `位于对角线下方的路线的数量` = Catalan(n)

综上，`所有合法的路线的数量` = 2 * Catalan(n)

## Extension

### Pseudo-Catalan Number

#### Definiton

在Catalan数的基础上，我们定义Pseudo-Catalan如下：
$$
\begin{aligned}
C_n^* &= n!\ C_{n-1} \\
&= (n-1)!\binom{2n-2}{n-1} \\
&= (4n-6)C_{n-1}^*
\end{aligned}
$$

#### Example

##### Example 1

###### Description

设$$a_1, a_2, \dots, a_n$$为n个数。`运算方案`是指按照$$a_1, a_2, \dots, a_n$$的顺序进行`抽象运算`的方案。

设 $$h_n$$ 表示`n个数的抽象运算方案的数目`。

> 注：该抽象运算为二元运算，且不支持交换律。

例：$$h_2 = 2$$即$(a_1 * a_2) 或 (a_2 * a_1)$

###### Analysis

尝试对$$h_n$$采用归纳法得出递推关系。

首先考虑简单情况，$$h_1=1$$，$$h_2 = 2$$。

接下来，考虑$$h_3$$

$$h_3$$的情况可以`视为`在$$h_2$$的基础上，`再将一个元素插入到合适的位置进行抽象运算`

可知：$$h_2的所有抽象运算方案: (a_1 * a_2) 和 (a_2 * a_1)$$

不妨考虑在`h_2的其中1个抽象运算方案` $$(a_1 * a_2)$$的基础上，`插入元素`$$a_3$$

$$a_3$$可以`与a1括起来`或者`与a2括起来`，所以$$a_3$$可以`选择与2个元素中的其中1个先进行运算`。

而在`选定好先进行运算的元素后`，$$a_3$$还可以`选择是与该元素左运算或右运算`。

因此，我们可以列出总共的2 * 2 = 4 种抽象运算方案：

$$((a_3 * a_1) * a_2)$$

$$((a_1 * a_3) * a_2)$$

$$(a_1 * (a_3 * a_2))$$

$$(a_1 * (a_2 * a_3))$$

但以上的方案并没有考虑完全，$$a_3$$也可以`选择独自参与运算`，即还有2种方案应当被考虑：

$$a_3 * (a_1 * a_2)$$

$$(a_1 * a_2) * a_3$$

综上，$$h_3 = 2*2 * (3-2) + 2 = 6$$ 

> 注：因为我们计算的是$$a_3$$，而$$a_3$$是基于$$a_2$$的基础的。对于$$a_2$$来说，总共2个元素，共有2-1=1次抽象运算（同理2-1=1个括号）

> 对于$$h_n$$，可以理解为先选择n个数的排列方式，然后再插入(n-1)对括号。

综上
$$
\begin{aligned}
2*2*(n-1-1)+2 \\
= 4*(n-2)+2
= 4n - 6
\end{aligned}
$$
由于$$h_{n-1}$$的`每一种乘法方案`均可以给出$$4n-6$$个`新的方案`

故，我们将$$h_n$$拓展为
$$
h_n = (4n-6) h_{n-1} = C_n^*
$$
Q.E.D



##### Example 2

###### Description

如果在Example 2的例子中，我们只计数按照$$a_1, a_2, a_3, ..., a_n$$的顺序排列的`抽象运算方案数` $$g_n$$ 

###### Analysis

也就是说，对于比Example 1中`计数所有的排列顺序的抽象运算方案数`，在这里我们`仅计算这1种排列顺序的抽象运算方案数`。

xxxxxxxxxx -----------------------------------------------------Current Case: BELL0.in & BELL0.outExpected  Input: [5]Expected Output: [52]Your     Output: [52]Time Cost: 1.638300 ms (1638300 ns)Accepted.-----------------------------------------------------Current Case: BELL1.in & BELL1.outExpected  Input: [15]Expected Output: [1382958545]Your     Output: [1382958545]Time Cost: 5871.995300 ms (5871995300 ns)Accepted.-----------------------------------------------------Current Case: BELL2.in & BELL2.outExpected  Input: [16]Expected Output: [1890207555]Your     Output: []Skipped.-----------------------------------------------------Current Case: BELL3.in & BELL3.outExpected  Input: [17]Expected Output: [1260491180]Your     Output: []Skipped.-----------------------------------------------------Current Case: BELL4.in & BELL4.outExpected  Input: [14]Expected Output: [190899322]Your     Output: [190899322]Time Cost: 5377.599300 ms (5377599300 ns)Accepted.-----------------------------------------------------Current Case: BELL5.in & BELL5.outExpected  Input: [13]Expected Output: [27644437]Your     Output: [27644437]Time Cost: 45.983500 ms (45983500 ns)Accepted.-----------------------------------------------------Current Case: BELL6.in & BELL6.outExpected  Input: [6]Expected Output: [203]Your     Output: [203]Time Cost: 0.636100 ms (636100 ns)Accepted.-----------------------------------------------------Current Case: BELL7.in & BELL7.outExpected  Input: [7]Expected Output: [877]Your     Output: [877]Time Cost: 0.658200 ms (658200 ns)Accepted.-----------------------------------------------------Result Statistics: √ √ → → √ √ √ √ yaml
$$
\begin{aligned}
g_n &= \frac{h_n}{n!} \\
&= \frac{C_n^*}{n!} \\
&= \frac{n!\ C_{n-1}}{n!} \\
&= C_{n-1}
\end{aligned}
$$
也就是说：`n个元素按固定顺序排列的抽象运算的方案数`$$g_n = C_{n-1}$$

Q.E.D

---

此外，我们也可以根据$$g_n$$的`定义`来导出它的`递推关系`。

在$a_1,a_2,a_3,\dots,a_n$的`每一个抽象运算方案中`，总是存在`最后一次的抽象运算运算`，它`对应着最外面的括号`。

即：
$$
g_n=(a_1,a_2,\dots, a_k的抽象运算方案)\times(a_{k+1}, a_{k+2},\dots,a_n的抽象运算方案) \quad(1 \le k \le n-1)
$$
故，我们有$$g_k$$种方案来选择$$a_1,a_2,\dots,a_k$$的抽象运算方案，有$$g_{n-k}$$种方案来选择$$a_{k+1}, a_{k+2},\dots,a_n$$的抽象运算方案。并且，我们有$$1 \le k \le n-1$$

综上：
$$
g_n = g_1g_{n-1} + g_2g_{n-2} + \dots + g_{n-1}g_1 \quad (n \ge 2)
$$
又有
$$
g_n = C_{n-1}
$$
即
$$
C_{n-1} = C_0C_{n-2} + C_1C{n-3} + \dots + C_{n-2}C_0 \quad (n \ge 2)
$$
我们使用$$n+1$$来代替$$n$$
$$
\begin{aligned}
Cn &= C_0C_{n-1} + C_1C_{n-2} + \dots + C_{n-1}C_0 \quad (n \ge 1) \\
&= \sum_{k=0}^{n-1}{C_kC_{n-1-k}} \quad (n \ge 1)
\end{aligned}
$$
结论：

$$g_n$$的含义：

1. 将`有n+1条边的凸多边形`利用`插入在不相交的对角线`来`划分为三角形区域`的`方案数`
2. 给定`某个顺序的抽象运算的方案数`
