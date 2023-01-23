---
title: "[Combinatorics] Partition Number"
date: 2022-03-27 16:39:00
tags:
  - combinatorics
---

# [Counting] Partition Number

## Partition Number

### Definition

`正整数n的一个分拆`是`把n表示成称为部分 (Part) 的一个或多个正整数的无序和`的一种表示。



例如，`5的分拆`可以有
$$
\begin{aligned}
5&=4+1\\
&=3+2\\
&=3+1+1\\
&=2+2+1\\
&=2+1+1+1\\
&=1+1+1+1+1
\end{aligned}
$$


### Partition Diagram (Ferrers Diagram)

#### Definition

例如`数字10的一个分拆 10 = 4 + 2 + 2 + 1 +1 的Ferrers图`
$$
\begin{aligned}
&\bullet \bullet \bullet \bullet \\
&\bullet \bullet \\
&\bullet \bullet \\
&\bullet \\
&\bullet \\
\end{aligned}
$$

### Partition Sequence

#### Definition

令$p_n$表示`正整数n的不同分拆的数目`，则`分拆序列 (Partition Sequence)`的为
$$
p_0,p_1,\dots,p_n,\dots
$$
其中，$p_n$的值=`下列方程解的个数`
$$
1a_1 + 2a_2 + 3a_3 + \cdots + na_n = n
$$

#### Theorem

##### Theorem 1

###### Content

设n和r是正整数且$r\le n$。设$p_n(r)$是`最大部分为r的n的分拆数量`，并设$q_n(r)$是`满足分拆各部分不大于r的n-r的分拆数量。则`
$$
p_n(r) = q_n(r)
$$

###### Proof

我们证明`该等式`的思路是，为`等式的两边`建立起`一一对应关系`。

也就是说，对于`每一个 最大部分为r的n的分拆`，我们要建立`与之唯一对应的` `各部分不大于r的n-r的分拆`



我们可以从`Ferrers图`来理解，举例 `10的一个分拆 10 = 4 + 2 + 2 + 1 +`。

故每一个 `最大部分为4的10分拆`与每一个`各部分不大于4的6分拆`之间`一一对应`

对此，我们可以简单地通过`删除掉Ferrers图中最大部分为4的那些行`来得到`删除后的Ferrers图`。

而`这个删除后的Ferrers图`就是与`原Ferrers图`相对应的`唯一的一个分拆`

Q.E.D

##### Theorem 2

###### Background

`数字n的共轭分拆 (Conjugate Partition)`为$\lambda^*$，它的`Ferrers图`是通过把$\lambda$的Ferrers图的行和列进行交换而得到。

> 共轭分拆类似于矩阵转置

###### Content

设n是正整数。设$p_n^s$等于`n的自共轭分拆数`，而$p_n^t$等于`n的分拆成互不相同的奇数个部分的分拆数`，则
$$
p_n^s = p_n^t
$$

###### Proof

证明该`等式成立`的思路是，为`等式两边`建立起`一一对应关系`

即考虑：如何为`每一个n的自共轭分拆`建立起`唯一对应的` `n的分拆成互不相同的奇数个部分的分拆数`



考虑一个具体实例：
$$
\begin{aligned}
&\bullet\bullet \bullet \bullet  \\ 
&\bullet \bullet \bullet \bullet \\ 
&\bullet \bullet \\
&\bullet \bullet \\
\end{aligned}
$$
可以将`该Ferrers图的第一行和第一列弯曲起来`，形成`新Ferrers图的第一行`。

同理，将`该Ferrers图的第二行和第二列（在去除第一行和第一列的基础上）弯曲起来`，形成`新Ferrers图的第二行`。

即：
$$
\begin{aligned}
&\bullet \bullet \bullet \bullet \bullet \bullet \bullet \\
&\bullet \bullet \bullet \bullet \bullet \\
\end{aligned}
$$
Q.E.D

##### Theorem 3 (Euler's Identity)

###### Content

设n是正整数。设$p_n^{odd}$ 是`把n分成奇数个部分的分拆个数`，设$p_n^{distinct}$ `把n分成不同部分的分拆个数`，则：
$$
p_n^{odd} = p_n^{distinct}
$$

###### Proof

我们的证明思路仍然是`建立等式两边的一一对应关系`

考虑一个`数字10的一个分拆实例`
$$
\begin{aligned}
&\bullet \bullet \bullet \bullet\\
&\bullet \bullet \bullet \bullet\\
&\bullet \bullet
\end{aligned}
$$
请注意，如果`某个 把n分成奇数个部分的分拆`它`本身不存在相同部分`，那么`该分拆所对应的` `把n分成不同部分的分拆实例` 就是`它本身` （也就是`直接映射`）

所以，我们重点需要处理的是，`那些 把n分成奇数个部分，但存在相同部分的分拆`中的`那些相同部分`



对此，由于`第1行表示的部分=4`与`第二行表示的部分=4`有重复，故`将这两部分进行合并`，得
$$
\begin{aligned}
&\bullet \bullet \bullet \bullet\bullet \bullet \bullet \bullet\\
&\bullet \bullet
\end{aligned}
$$
若仍存在`重复部分`，则继续重复进行处理。最终得
$$
\begin{aligned}
&\bullet \bullet \bullet \bullet\bullet \bullet \bullet \bullet\\
&\bullet \bullet
\end{aligned}
$$

> 对于存在重复的两部分，为什么选择用合并两部分而不是分解其中一部分：如果选择分解其中一部分，则在某些重复比较严重的情况下，会出现不够继续分解的情况。（即存在多于1个`大小为1的部分`，这个部分无法再继续分解，因而无法避免重复）

> 为什么必须要求为`n的奇数个部分`：对于`n的偶数个部分的情况`，举一个实例。如4+4的情况，它最终合并后的结果为8.
>
> 但我们并不知道`最终得到的8`是`由4+4合并而得来的`还是`由本来的8直接映射得来的`。换句话说，如果`n的偶数个部分`，则我们无法保证`一一对应（双射）`

Q.E.D



##### Theorem 4

###### Content

证明`无限积形式的分拆序列`的`生成函数的表达式`
$$
\sum_{n=0}^{\infty}{p_nx^n}=\prod_{k=1}^{\infty}{(1-x^k)^{-1}}
$$

###### Proof

将`右边等式展开得到`
$$
\prod_{k=1}^{\infty}{(1-x^k)^{-1}}=(1+x+\cdots+x^{1a_1}+\cdots)(1+x+\cdots+x^{2a_2}+\cdots)(1+x+\cdots+x^{3a_3}+\cdots)\cdots
$$
上述式子的`x^n项的产生方式`：

1. 从`第一个因子`中选择$x^{1a_1}$项
2. 从`第二个因子`中选择$x^{2a_2}$项
3. 从`第三个因子`中选择$x^{3a_3}$项
4. ...

其中，$1a_1 + 2a_2 + 3a_3 + \cdots = n$

> 除了`有限数目的`$a_i$之外，其他的$a_i=0$  （即我们对除了有限因子外的其他因子，选择`常数项1`）。
>
> 因此，`n的每一个分拆`使得$x^n$的系数+1，而$x^n$的系数$p_n$是`n的分拆个数p` 

Q.E.D

##### Theorem 5

###### Background

设$\mathcal{P}_n$表示`正整数n的所有分拆的集合`。若有

`分拆`$\lambda:n = n_1 + n_2 + \cdots + n_k \quad (n_1 \ge n_2 \ge \cdots \ge n_k \ge 0)$ 和

`分拆`$\mu: m = m_1 + m_2 + \cdots + m_k \quad (m_1 \ge m_2 \ge \cdots \ge m_k \ge 0)$

是`n的两个分拆`。

我们称$\mu$优越(majorize)$\lambda$即 $\lambda \le \mu$ 当$n_1 + n_2 + \cdots + n_i \le m_1 + m_2 + \cdots + m_i \quad (i = 1,2,\cdots,k)$

> 因为优越关系是自反的，反对称的，传递的。故优越关系 是$\mathcal{P}_n$上的偏序关系

###### Content

`字典序`是`正整数n的分拆集`$\mathcal{P}_n$上`优越偏序的线性拓展`

###### Proof

令$\lambda$和$\mu$是`n的两个不同分拆`，且假设$\mu \ge \lambda$，则`选取` `第一个整数i`使得对于$j \lt i, n_j = m_j, n_i \ne m_i$

即$n_i \le m_i$，因此，`在字典序之下`$\lambda$先于$\mu$

##### Theorem 6 (Euler's Pentagonal Number Theorem)

###### Content

设n是正整数。设$p_n^{\prime} $是`把n分成偶数个不同部分的分拆数量`，而$p_n^{\prime\prime}$是`把n分成奇数个不同部分的分拆数量`。则有
$$
p_n^{\prime} = p_n^{\prime\prime} + e_n
$$
其中，$e_n$是`误差项`：
$$
e_n = 
\begin{cases}
(-1)^j, &n=j(3j\pm1)/2 \\
0, &else
\end{cases}
$$
