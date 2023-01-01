---
title: Combinatorics - Pascal's Triangle & Binomial Coefficient
tags: []
id: '29606'
categories:
  - - uncategorized
date: 2022-03-28 17:15:12
---

# Binomial Coefficient

## Binomial Coefficent

### Definition

### Diagram: Pascal's Triangle

#### Property

##### Property

##### Property: Pascal's Formula

###### Explanation

1.  三角形中某个数的值 = 该数正上方的数 + 该数的直接左邻项
    
2.  从三角形左上角到达项（n，k）的所有路径数
    
    > 根据该解释，可得\\binom{n}{0} = 1和\\binom{n}{1}
    
3.  `从三角形左上角到项（n，k）`的路径数 = `从(n,k-1)到(n,k)`的路径数+`从(n-1, k-1)到(n,k)`的路径数
    

##### Property

###### Explanation

1.  `n元素集合的k子集的个数`

##### Property

##### Property: Triangular Number

###### Explanation

1.  `以数n规模堆垒起来的三角形中的点个数`

##### Property: Tetraederzahl

###### Explanation

1.  `以数n规模堆垒起来的四面体中的点个数`

## Binomial Theorem

### Definition

#### Content

设n是正整数。对所有的x和y，有

#### Proof

##### Proof 1

基本思路是`展开`原式后通过`组合计数`得出2^n项的各项表示。

对`(x+y)^n`进行`展开`得

考虑对于`n项中的每一项`，可以做出`2种选择`

1.  选择`项x`
2.  选择`项y`

从`n项中选取k个项y`，则`剩下的n-k项选取项x`。又0 \\le k \\le n，得出

其中\\binom{n}{k}表示项x^{n-k}y^k出现的次数。

Q.E.D

##### Proof 2

通过采用`数学归纳法`得出。

* * *

考虑n=1的情况。

左式(x+y)^1 等同于 右式\\binom{1}{0}x^{1-0}y^0 + \\binom{1}{1}x^{1-1}y^1

显然成立

* * *

我们`假设` `该公式对于正整数n成立`，`证明` `用正整数n+1代替n时，该公式仍然成立`

即，我们需`证明`：

将(x+y)^n用`另一种方式表示`

于是，把`n+1`替换为`n`可得

Q.E.D

### Theorem

#### Theorem 1

##### Content

设n是正整数，对于所有的x，有

#### Theorem 2: Sperner Theorem

##### Background

设S是`n元素集合`，S的一个`反链 (AntiChain)`是`集合S的一个子集的集合`\\mathcal{A}，其中\\mathcal{A}中的子集`不相互包含` （或者说对于\\mathcal{A}中`每一对子集`，`两者中没有一个包含于另一个`）

如，`集合S = {a, b, c, d}`的`1个反链`为\\mathcal{A} = \\{\\{a,b\\}, \\{b,c,d\\}, \\{a,d\\}, \\{a,c\\}\\}

* * *

设S是`n元素集合`，S的一个`链 (Chain)`是`集合S的一个子集的集合`\\mathcal{C}，其中\\mathcal{C}中的`每一对子集`，`总有一个包含在另一个`之中

如，`集合S = {1, 2, 3, 4, 5}`的`1个链`为\\mathcal{C} = \\{\\{2\\}, \\{2, 3, 5\\}, \\{1, 2, 3, 5\\}\\}

`最大链`指的是`无法再加入更多的S中的子集的链`

可以通过为集合S = \\{1,2,\\cdots,n\\}确立`1个排列`来得出`1个最大链`。从而`最大链`的数目=n!，且大小均为n。

> 比如说，如果S=\\{1,2,3,4,5\\}，则`1个排列(3,2,1,5,4)`表示的是：`第一轮`并入`元素3`，`第二轮`并入`元素2` ...这样的`1个最大链`

对于`给定某个特定的` A = k且A \\subset S，则`包含A的最大链`总共有k!\\times(n-k)!个：`k!个包含于A的集合`和`(n-k)!个包含A的集合`

##### Content

一种`构造` `反链`的方法是：首先选择一个整数k \\le n，然后取\\mathcal{A}\_k为`S的所有k子集`，那么\\mathcal{A}\_k就是一个`反链`。

通过`这种方式`构造的`反链`最多含有\\binom{n}{\\lfloor n/2\\rfloor}个集合。

而我们`无法通过让k选择多个值`来`构造一个更大的反链`

##### Proof

若\\mathcal{A}是一个`反链`，`有序对（A，C）`指：`集合A`包含于`反链`\\mathcal{A}，`最大链C`是包含`集合A`的`最大链`。令`有序对(A,C)的数量 = β`

因为`链和反链的交集最多只有1个元素（元素是集合）`，而`最大链的个数`为n!，故\\beta \\le n!

对于`反链`\\mathcal{A}中的`子集A`，设\\alpha\_k是`反链`A中`大小为k的子集`的个数。则\\textcolor{blue}{\\mathcal{A} = \\sum\_{k=0}^n{\\alpha\_k}}

于是

> 对于`有序对(A, C)`的数量计算，可以视为是由`集合A`和`集合C`的`笛卡尔乘积`而得到。β的值即为两个集合大小的乘积。

根据\\beta \\le n!，得出不等式

当k = \\lfloor n/2\\rfloor 时，\\binom{n}{k}取得最大值。故

> \\alpha\_k的不等式告诉我们，在k = \\lfloor n/2\\rfloor时，可以构造出`含n个元素的集合S`的`最大的反链`

### Property

#### Property

##### Content

#### Property

##### Content

##### Explanation

> `含奇数个元素的集合` 和`含偶数个元素的集合`的数量一样多。

根据

故

> 假设要`从n个元素中`取出一个`大小为奇数的集合`，对于`前面的n-1个元素`都有`2种选择`，而对于`第n个元素`却`只有1种选择`：当面对`是否选取第n个元素`时，如果`当前已取的元素个数`为奇数，则`第n个元素`不能取。否则就必须要`取走第n个元素`

#### Property

##### Content

从等式(1+x)^n=\\sum\_{k=0}^{n}{\\binom{n}{k}x^k}开始，通过`交替地` `关于x求导`和`乘以x`，我们可以得到\\sum\_{k=1}^n{k^p\\binom{n}{k}}相对于任何正整数p的恒等式。

##### Explanation

当p=1时

#### Property

##### Content

`帕斯卡三角形`上的`各行上的数字的平方和`满足

##### Proof

假设`集合S`是`一个有2n个元素的集合`，我们将`集合S`划分为`含n个元素的集合A`和`含n个元素的集合B`。

则，对于`集合S的n子集`，可以看作是由`k个来自集合A的元素`和`n-k个来自集合B的元素`所组成。

由于0 \\le k \\le n，故可以将 `S的n子集的集合`划分为`n+1个部分`：C\_0, C\_1, C\_2, \\cdots, C\_n

> C\_k是集合的集合：C\_k的每个元素 代表 `一个由k个来自A的元素和n-k个来自集合B的元素所构成`的`集合S的n子集`。

其中，C\_k \\quad (0 \\le k \\le n)表示：该`部分`中的`每个集合`的元素由`k个来自集合A的元素`和`n-k个来自集合B的元素`

故

* * *

现在考虑C\_k的数量。

* * *

综上，

Q.E.D

#### Property

##### Content

设n是正整数，则`二项式系数序列`\\binom{n}{0},\\binom{n}{1}, \\binom{n}{2}, \\cdots, \\binom{n}{n}是`单峰(Unimodal)序列`

##### Proof

`证明序列的单调性`即`证明该序列的通项函数的单调性`。可采用`作商法`

因此，`二项式系数序列`的`单调性`取决于：`n-k+1`和`k`的之间的关系。

#### Property

##### Content

对于正整数n，`二项式系数`\\binom{n}{0}, \\binom{n}{1}, \\binom{n}{2}, \\cdots\\,\\binom{n}{n}中的最大者为\\binom{n}{\\lfloor n/2\\rfloor} = \\binom{n}{\\lceil n/2\\rceil}

##### Proof

根据`二项式系数序列的单调性`可证。

## Polynomial Coefficient

### Definition

对于`二项式系数`的`多项式系数`表示方法如下

> 注意，`二项式系数的符号`的定义和`多项式系数的符号`的定义不同。
> 
> `二项式系数`中是选择是`逻辑型的`，`只有2种选择`，所以如果选中`k个A集合元素`，则`必定选择n-k个B集合元素`

### Theorem

#### Theorem 1

##### Content

设n是正整数。对于所有的x\_1,x\_2,\\cdots,x\_t 。有

##### Proof

证明思路同`二项式系数`，将`多项式`进行`展开`。得到`n个因子`，`每个因子含有t项`。

最终所得的结果含有t\_n项。

> 同理，`二项式系数`和`多项式系数`的含义都表明`与之相对应的项`所`出现的次数`。`每1次出现`都使得`系数+1`

这里给出从`二项式系数`推导出`多项式系数`的方式

## Newton's Binomial Coefficient

### Definition

设\\alpha是`实数`。则对于所有满足0 \\le x \\lt y的x和y，有

其中

对于`牛顿二项式定理`，当\\alpha是正整数时，即为`二项式定理`。

### Application

1.  导出无穷级数\\frac{1}{(1-z)^n}
2.  求任意精度的平方根: 见`高等数学`中关于`无穷级数`的章节。