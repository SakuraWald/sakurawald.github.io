---
title: "[Combinatorics] Pascal's Triangle & Binomial Coefficient"
date: 2022-03-28 17:15:00
tags:
  - combinatorics
---

{% raw %}

# Binomial Coefficient

## Binomial Coefficent

### Definition

$$
\begin{aligned}
BinomialCoefficient(n, k) &= \binom{n}{k}\\
&=\frac{n!}{k!(n-k)!} \qquad (n\in Z^+,1 \le k \le n)
\end {aligned}
$$

### Diagram: Pascal's Triangle

#### Property

##### Property

$$
\binom{n}{k} = \binom{n}{n-k}
$$

##### Property: Pascal's Formula

$$
\binom{n}{k} = \binom{n-1}{k} + \binom{n-1}{k-1}
$$

###### Explanation

1. 三角形中某个数的值 = 该数正上方的数 + 该数的直接左邻项

2. 从三角形左上角到达项（n，k）的所有路径数

   > 根据该解释，可得$\binom{n}{0} = 1$和$\binom{n}{1}$

3. `从三角形左上角到项（n，k）`的路径数 = `从(n,k-1)到(n,k)`的路径数+`从(n-1, k-1)到(n,k)`的路径数





##### Property

$$
\binom{n}{0}+\binom{n}{1}+\cdots+\binom{n}{n} = 2^n
$$

###### Explanation

1. `n元素集合的k子集的个数`



##### Property

$$
\binom{n}{1} = n
$$



##### Property: Triangular Number

$$
\binom{n}{2}=\frac{n(n-1)}{2}
$$

###### Explanation

1. `以数n规模堆垒起来的三角形中的点个数`



##### Property: Tetraederzahl

$$
\binom{n}{3}=\frac{n(n-1)(n-2)}{3!}
$$

###### Explanation

1. `以数n规模堆垒起来的四面体中的点个数`



## Binomial Theorem

### Definition

#### Content

设n是正整数。对所有的x和y，有
$$
\begin{aligned}
(x+y)^n &= x^n + \binom{n}{1}x^{n-1}y + \binom{n}{2}x^{n-2}y^2 + \cdots + \binom{n}{n-1}xy^{n-1} + y^n \\
&=\sum_{k=0}^n{\binom{n}{k}x^{n-k}y^k}
\end{aligned}
$$

#### Proof

##### Proof 1

基本思路是`展开`原式后通过`组合计数`得出$2^n$项的各项表示。

对`(x+y)^n`进行`展开`得
$$
(x+y)^n = \underbrace{(x+y)(x+y)\cdots(x+y)}_{n\ items}
$$
考虑对于`n项中的每一项`，可以做出`2种选择`

1. 选择`项x`
2. 选择`项y`

从`n项中选取k个项y`，则`剩下的n-k项选取项x`。又$0 \le k \le n$，得出
$$
(x+y)^n = \sum_{k=0}^{n}{\binom{n}{k}x^{n-k}y^k}
$$
其中$\binom{n}{k}$表示项$x^{n-k}y^k$出现的次数。

Q.E.D

##### Proof 2

通过采用`数学归纳法`得出。

---

考虑n=1的情况。

左式$(x+y)^1$ 等同于 右式$\binom{1}{0}x^{1-0}y^0 + \binom{1}{1}x^{1-1}y^1$

显然成立

---

我们`假设` `该公式对于正整数n成立`，`证明` `用正整数n+1代替n时，该公式仍然成立`

即，我们需`证明`：
$$
(x+y)^{n+1} = \sum_{k=0}^{n+1}{\binom{n+1}{k}x^{n+1-k}y^k}
$$
将$(x+y)^{n+1}$用`另一种方式表示`
$$
\begin{aligned}
(x+y)^{n+1} &= (x+y)(x+y)^n\\
&=(x+y)(\sum_{k=0}^{n}{\binom{n}{k}x^{n-k}y^k}) &\text {(Binomial Theorem for n)}\\
&=(x\sum_{k=0}^{n}{\binom{n}{k}x^{n-k}y^k}) + (y\sum_{k=0}^n{\binom{n}{k}x^{n-k}y^k}) &\text{(Pascal's Theorem)}\\
&=(\sum_{k=0}^{n}{\binom{n}{k}x^{n-k+1}y^k}) + (\sum_{k=0}^n{\binom{n}{k}x^{n-k}y^{k+1}})   \\
&=\Bigg(\binom{n}{0}x^{n+1} + \sum_{k=1}^{n}{\binom{n}{k}x^{n-k+1}y^k}\Bigg) + \Bigg(\binom{n}{n}y^{n+1} + \textcolor{blue}{\sum_{k=0}^{n-1}{\binom{n}{k}{x^{n-k}y^{k+1}}}}\Bigg)\\
&=\Bigg(\binom{n}{0}x^{n+1} + \sum_{k=1}^{n}{\binom{n}{k}x^{n-k+1}y^k}\Bigg) + \Bigg(\binom{n}{n}y^{n+1} + \textcolor{blue}{\sum_{k=1}^{n}{\binom{n}{k-1}{x^{n-k+1}y^{k}}}}\Bigg) &\text{(Replace k with k-1)}\\
&=x^{n+1} + y^{n+1} + \Bigg(\sum_{k=1}^n{\binom{n}{k}x^{n-k+1}y^k} + \sum_{k=1}^n{\binom{n}{k-1}x^{n-k+1}y^k}\Bigg)\\
&=x^{n+1} + y^{n+1} + \sum_{k=1}^{n}{\binom{n+1}{k}x^{n-k+1}y^k} &\text{(Pascal's Theorem)}\\
&=\sum_{k=0}^{n+1}{\binom{n+1}{k}x^{n-k+1}y^k} 
\end{aligned}
$$
于是，把`n+1`替换为`n`可得
$$
(x+y)^n = \sum_{k=0}^n{\binom{n}{k}x^{n-k}y^k}
$$
Q.E.D



### Theorem

#### Theorem 1

##### Content

设n是正整数，对于所有的x，有
$$
(1+x)^n = \sum_{k=0}^{n}{\binom{n}{k}x^k} = \sum_{k=0}^n{\binom{n}{n-k}x^k}
$$



#### Theorem 2: Sperner  Theorem

##### Background

设S是`n元素集合`，S的一个`反链 (AntiChain)`是`集合S的一个子集的集合` $\mathcal{A}$，其中$\mathcal{A}$中的子集`不相互包含` （或者说对于$\mathcal{A}$中`每一对子集`，`两者中没有一个包含于另一个` ）


如，`集合S = {a, b, c, d}` 的 `1个反链` 为 $ \mathcal{A} = \{\{a,b\}, \{b,c,d\}, \{a,d\}, \{a,c\}\} $

---

设S是`n元素集合`，S的一个`链 (Chain)`是`集合S的一个子集的集合`$\mathcal{C}$，其中$\mathcal{C}$中的`每一对子集`，`总有一个包含在另一个`之中

如，`集合S = {1, 2, 3, 4, 5}`的`1个链`为$\mathcal{C} = \{\{2\}, \{2, 3, 5\}, \{1, 2, 3, 5\}\}$



`最大链`指的是`无法再加入更多的S中的子集的链`

可以通过为集合$S = \{1,2,\cdots,n\}$确立`1个排列`来得出`1个最大链`。从而`最大链`的数目=$n!$，且大小均为$n$。

> 比如说，如果$S=\{1,2,3,4,5\}$，则`1个排列(3,2,1,5,4)`表示的是：`第一轮`并入`元素3`，`第二轮`并入`元素2` ...这样的`1个最大链`

对于`给定某个特定的` $|A| = k$且$A \subset S$，则`包含A的最大链`总共有$k!\times(n-k)!$个：`k!个包含于A的集合`和`(n-k)!个包含A的集合`

##### Content

一种`构造` `反链`的方法是：首先选择一个整数$k \le n$，然后取$\mathcal{A}_k$为`S的所有k子集`，那么$\mathcal{A}_k$就是一个`反链`。

通过`这种方式`构造的`反链`最多含有$\binom{n}{\lfloor n/2\rfloor}$个集合。

而我们`无法通过让k选择多个值`来`构造一个更大的反链`

##### Proof

若$\mathcal{A}$是一个`反链`，`有序对（A，C）`指：`集合A`包含于`反链`$\mathcal{A}$，`最大链C`是包含`集合A`的`最大链`。令`有序对(A,C)的数量 = β`

因为`链和反链的交集最多只有1个元素（元素是集合）`，而`最大链的个数`为$n!$，故$\beta \le n!$

对于`反链`$\mathcal{A}$中的`子集A`，设$\alpha_k$是`反链`$A$中`大小为k的子集`的个数。则$\textcolor{blue}{|\mathcal{A}| = \sum_{k=0}^n{\alpha_k}}$

于是
$$
\begin{aligned}
\beta &= |\mathcal{A}|\times k!(n-k)!\\
&=(\sum_{k=0}^n{\alpha_k})\times (k!(n-k)!)
\end{aligned}
$$

> 对于`有序对(A, C)`的数量计算，可以视为是由`集合A`和`集合C`的`笛卡尔乘积`而得到。β的值即为两个集合大小的乘积。



根据$\beta \le n!$，得出不等式
$$
\begin{aligned}
\beta = \sum_{k=0}^n{\alpha_k} \times (k!(n-k)!) &\le n!\\
\sum_{k=0}^{n}{\alpha_k} \times \frac{k!(n-k)!}{n!} &\le 1\\
\sum_{k=0}^n{\frac{\alpha_k}{\binom{n}{k}}} &\le 1\\
\end{aligned}
$$
当$k = \lfloor n/2\rfloor $时，$\binom{n}{k}$取得最大值。故
$$
\textcolor{blue}{|\mathcal{A}| \le} \sum_{k=0}^n{\alpha_k} \le \binom{n}{\textcolor{blue}{\lfloor n/2\rfloor}}
$$

> $\alpha_k$的不等式告诉我们，在$k = \lfloor n/2\rfloor$时，可以构造出`含n个元素的集合S`的`最大的反链`

### Property

#### Property

##### Content

$$
k\binom{n}{k} = n\binom{n-1}{k-1}
$$

#### Property

##### Content

$$
(1+(-1))^n = 0
$$

##### Explanation

$$
\begin{aligned}
(1+(-1))^n &= \sum_{k=0}^n{\binom{n}{k}1^{n-k}* 1^k} \\
&= \sum_{k=0}^n{\binom{n}{k}} \\
&= \binom{n}{0} - \binom{n}{1} + \binom{n}{2} - \cdots + (-1)^n\binom{n}{n} \quad (n \ge 1) = 0
\end{aligned}
$$

> `含奇数个元素的集合` 和`含偶数个元素的集合`的数量一样多。

根据
$$
\binom{n}{0} + \binom{n}{1} + \cdots + \binom{n}{n} = 2^n \quad (n \ge 1)
$$
故
$$
\binom{n}{0}+\binom{n}{2}+\cdots = \binom{n}{1} + \binom{n}{3} + \cdots = 2^{n-1}
$$

> 假设要`从n个元素中`取出一个`大小为奇数的集合`，对于`前面的n-1个元素`都有`2种选择`，而对于`第n个元素`却`只有1种选择`：当面对`是否选取第n个元素`时，如果`当前已取的元素个数`为奇数，则`第n个元素`不能取。否则就必须要`取走第n个元素`



#### Property

##### Content

从等式$(1+x)^n=\sum_{k=0}^{n}{\binom{n}{k}x^k}$开始，通过`交替地` `关于x求导`和`乘以x`，我们可以得到$\sum_{k=1}^n{k^p\binom{n}{k}}$相对于任何正整数p的恒等式。

##### Explanation

当$p=1$时
$$
\begin{aligned}
\sum_{k=1}^n{k\binom{n}{k}} &= 1\binom{n}{1} + 2\binom{n}{2} + \cdots + \textcolor{blue}{n\binom{n}{n}} \\
&=n\binom{n-1}{0} + n\binom{n-1}{1} + \cdots + \textcolor{blue}{n\binom{n-1}{n-1}} \\

&= n \times 2^{n-1} = n2^{n-1}
\end{aligned}
$$

#### Property

##### Content

`帕斯卡三角形`上的`各行上的数字的平方和`满足
$$
\sum_{k=0}^n{\binom{n}{k}^2} = \binom{2n}{n} \quad (n \ge 0)
$$

##### Proof

假设`集合S`是`一个有2n个元素的集合`，我们将`集合S`划分为`含n个元素的集合A `和`含n个元素的集合B`。

则，对于`集合S的n子集`，可以看作是由`k个来自集合A的元素`和`n-k个来自集合B的元素`所组成。

由于$0 \le k \le n$，故可以将 `S的n子集的集合`划分为`n+1个部分`：$C_0, C_1, C_2, \cdots, C_n$ 

> $C_k$是集合的集合：$C_k$的每个元素 代表 `一个由k个来自A的元素和n-k个来自集合B的元素所构成`的`集合S的n子集`。

其中，$C_k \quad (0 \le k \le n)$表示：该`部分`中的`每个集合`的元素由`k个来自集合A的元素`和`n-k个来自集合B的元素`

故
$$
\binom{2n}{n} = |C_0| + |C_1| + |C_2| + \cdots + |C_n|
$$

---

现在考虑$C_k$的数量。
$$
|C_k| = \binom{n}{k}\binom{n}{n-k} = {\binom{n}{k}}^2 \quad (0 \le k \le n)
$$

___

综上，
$$
\begin{aligned}
\binom{2n}{n} &= |C_0| + |C_1| + |C_2| + \cdots + |C_n| \\
&= \sum_{k=0}^n{|C_k|} \\
&= \sum_{k=0}^n{{\binom{n}{k}}^2}
\end{aligned}
$$
Q.E.D

#### Property

##### Content

设n是正整数，则`二项式系数序列`$\binom{n}{0},\binom{n}{1}, \binom{n}{2}, \cdots, \binom{n}{n}$是`单峰(Unimodal)序列`

##### Proof

`证明序列的单调性`即`证明该序列的通项函数的单调性`。可采用`作商法`
$$
\begin{aligned}
\frac{\binom{n}{k}}{\binom{n}{k-1}} &=\frac{\frac{(n)!}{(k)!(n-k)!}}{\frac{(n)!}{(k-1)!(n-k+1)!}} \\
&=\frac{(k-1)!(n-k+1)!}{(k)!(n-k)!} \\
&=\frac{n-k+1}{k} \quad (1 \le k \le n)


\end{aligned}
$$
因此，`二项式系数序列`的`单调性`取决于：`n-k+1`和`k`的之间的关系。
$$
\begin{cases}
\binom{n}{k-1} < \binom{n}{k},& k<n-k+1 \\
\binom{n}{k-1} = \binom{n}{k},& k=n-k+1 \\
\binom{n}{k-1} > \binom{n}{k},& k>n-k+1
\end{cases}
$$

#### Property

##### Content

对于正整数n，`二项式系数`$\binom{n}{0}, \binom{n}{1}, \binom{n}{2}, \cdots\,\binom{n}{n}$中的最大者为$\binom{n}{\lfloor n/2\rfloor} = \binom{n}{\lceil n/2\rceil}$

##### Proof

根据`二项式系数序列的单调性`可证。



## Polynomial Coefficient

### Definition

$$
\binom{n}{n_1 \quad n_2 \quad \cdots \quad n_t} = \frac{n!}{n_1!n_2!\cdots n_t!} \qquad,n_1+n_2+\cdots+n_t = n
$$



对于`二项式系数`的`多项式系数`表示方法如下
$$
\begin{aligned}
\binom{n}{k} &= \textcolor{blue}{\binom{n}{k \quad n-k}}\\
&=\frac{n!}{k!(n-k)!}
\end{aligned}
$$

> 注意，`二项式系数的符号`的定义和`多项式系数的符号`的定义不同。
>
> `二项式系数`中是选择是`逻辑型的`，`只有2种选择`，所以如果选中`k个A集合元素`，则`必定选择n-k个B集合元素`

### Theorem

#### Theorem 1

##### Content

设n是正整数。对于所有的$x_1,x_2,\cdots,x_t$ 。有
$$
(x_1+x_2+\cdots+x_t)^n = \sum{\binom{n}{n_1 \quad n_2 \quad \cdots \quad n_t}} x_1^{n_1}x_2^{n_2}\cdots x_n^{n_n}
$$

##### Proof

证明思路同`二项式系数`，将`多项式`进行`展开`。得到`n个因子`，`每个因子含有t项`。

最终所得的结果含有$t_n$项。

> 同理，`二项式系数`和`多项式系数`的含义都表明`与之相对应的项`所`出现的次数`。`每1次出现`都使得`系数+1`

这里给出从`二项式系数`推导出`多项式系数`的方式
$$
\binom{n}{n_1}\binom{n-n_1}{n_2}\binom{n-n_1-n_2}{n_3}\cdots\binom{n-n_1-n_2-\cdots-n_{t-1}}{n_t}=\binom{n}{n_1 \quad n_2 \quad \cdots \quad n_t}
$$


## Newton's Binomial Coefficient

### Definition

设$\alpha$是`实数`。则对于所有满足$0 \le |x| \lt |y|$的x和y，有
$$
(x+y)^\alpha = \sum_{k=0}^\infty{\binom{\alpha}{k}x^ky^{\alpha-k}}
$$
其中
$$
\binom{\alpha}{k} = \frac{\alpha(\alpha-1)\cdots(\alpha-k-1)}{k!}
$$
对于`牛顿二项式定理`，当$\alpha$是正整数时，即为`二项式定理`。



### Application

1. 导出无穷级数$\frac{1}{(1-z)^n}$
2. 求任意精度的平方根: 见`高等数学`中关于`无穷级数`的章节。



{% endraw %}
