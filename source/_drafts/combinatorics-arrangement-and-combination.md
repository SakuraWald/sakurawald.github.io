---
title: "[Combinatorics] Arrangement and Combination"
date: 2022-04-08 20:33:00
tags:
  - combinatorics
---

# Arrangement and Combination

## Generate Arrangements

### Example

生成$\{1,2,\cdots,n\}$的排列的方法。



#### Solution 1: Johnson and Trotter's Method

$\{1,2,\cdots,n\}$`的所有可能排列`可以从$\{1,2,\cdots, n -1\}$`的所有可能排列`中`插入元素n`而得到。


$$
Step1\\
\begin{bmatrix}
1
\end{bmatrix}
$$

$$
Step2\\
\begin{bmatrix}
1\\
1
\end{bmatrix}
\to
\begin{bmatrix}
&1 & \color{red}{2}\\
\color{red}{2} & 1
\end{bmatrix}
$$


$$
Step3\\
\begin{bmatrix}
1 & 2\\
1 & 2\\
1 & 2\\
2 & 1\\
2 & 1\\
2 & 1\\
\end{bmatrix}
\to
\begin{bmatrix}
1 & 2 & \color{red}{3}\\
1 & \color{red}{3} & 2\\
\color{red}{3} & 1 & 2\\
\color{red}{3} & 2 & 1\\
2 & \color{red}{3} & 1\\
2 & 1 & \color{red}{3}\\
\end{bmatrix}
$$ {Step2\\}

$$
Step4\\
\begin{bmatrix}
1 & 2 & 3\\
1 & 2 & 3\\
1 & 2 & 3\\
1 & 2 & 3\\
1 & 3 & 2\\
1 & 3 & 2\\
1 & 3 & 2\\
1 & 3 & 2\\
3 & 1 & 2\\
3 & 1 & 2\\
3 & 1 & 2\\
3 & 1 & 2\\
3 & 2 & 1\\
3 & 2 & 1\\
3 & 2 & 1\\
3 & 2 & 1\\
2 & 3 & 1\\
2 & 3 & 1\\
2 & 3 & 1\\
2 & 3 & 1\\
2 & 1 & 3\\
2 & 1 & 3\\
2 & 1 & 3\\
2 & 1 & 3\\
\end{bmatrix}
\to
\begin{bmatrix}
1 & 2 & 3 & \color{red}{4}\\
1 & 2 & \color{red}{4} & 3\\
1 & \color{red}{4} & 2 & 3\\
\color{red}{4}& 1 & 2 & 3\\
\color{red}{4} & 1 & 3 & 2\\
1 & \color{red}{4}& 3 & 2\\
1 & 3 & \color{red}{4}& 2\\
1 & 3 & 2 & \color{red}{4}\\
3 & 1 & 2 & \color{red}{4}\\
3 & 1 & \color{red}{4} & 2\\
3 & \color{red}{4} & 1 & 2\\
\color{red}{4} & 3 & 1 & 2\\
\color{red}{4} & 3 & 2 & 1\\
3 & \color{red}{4} & 2 & 1\\
3 & 2 & \color{red}{4} &1\\
3 & 2 & 1&\color{red}{4}\\
2 & 3 & 1&\color{red}{4}\\
2 & 3 & \color{red}{4}& 1\\
2 & \color{red}{4}&3 & 1\\
\color{red}{4}&2 & 3 & 1\\
\color{red}{4}&2 & 1 & 3\\
2 & \color{red}{4}&1 & 3\\
2 & 1 &\color{red}{4}& 3\\
2 & 1 & 3&\color{red}{4}\\
\end{bmatrix}
$$

> 该生成方法并不保证`字典序`，对于元素的插入顺序，可以`从左往右`或者`从右往左`，但最好`系统性地进行插入`以避免遗漏

> 该生成方法还存在一个问题，需要保存上一轮的所有输出结果，以便下一轮进行插入。

>算法`总共需要执行n轮，第k轮获得k!个新排列方式`

#### Solution 2: Even's Method

`方向`：我们为`排列中的每一个数字`指定`箭头向左`或`箭头向右`

`可移动的数字`：`某个数字`是`可移动的`，如果`该数字 大于它的箭头所指方向的数字`。

此外，`位于第一个位置且指向左边的数字 和 位于最后一个位置且指向右边的数字`均为`不可移动的`

- 初始化：从$\overleftarrow{1}\overleftarrow{2}\cdots\overleftarrow{n}$开始
- 若`存在可移动数字`
  1. 求出`最大的可移动数字 m`
  2. 交换`m`和`m箭头所指方向的数字`
  3. 反转`所有大于m的数字 的方向`


$$
\begin{matrix}
\color{blue}{\overleftarrow{1}\overleftarrow{2}\overleftarrow{3}\overleftarrow{4}} \\
\overleftarrow{1}\overleftarrow{2}\overleftarrow{4}\overleftarrow{3} \\
\overleftarrow{1}\overleftarrow{4}\overleftarrow{2}\overleftarrow{3} \\
\overleftarrow{4}\overleftarrow{1}\overleftarrow{2}\textcolor{red}{\overleftarrow{3}} \\
\end{matrix}
\Rightarrow
\begin{matrix}
\color{blue}{\overrightarrow{4}\overleftarrow{1}\overleftarrow{3}\overleftarrow{2}} \\
\overleftarrow{1}\overrightarrow{4}\overleftarrow{3}\overleftarrow{2} \\
\overleftarrow{1}\overleftarrow{3}\overrightarrow{4}\overleftarrow{2} \\
\overleftarrow{1}\textcolor{red}{\overleftarrow{3}}\overleftarrow{2}\overrightarrow{4} \\
\end{matrix}
\Rightarrow
\begin{matrix}
\color{blue}{\overleftarrow{3}\overleftarrow{1}\overleftarrow{2}\overleftarrow{4}} \\
\overleftarrow{3}\overleftarrow{1}\overleftarrow{4}\overleftarrow{2} \\
\overleftarrow{3}\overleftarrow{4}\overleftarrow{1}\overleftarrow{2} \\
\overleftarrow{4}\overleftarrow{3}\overleftarrow{1}\textcolor{green}{\overleftarrow{2}} \\
\end{matrix}
\Rightarrow
\begin{matrix}
\color{blue}{\overrightarrow{4}\overrightarrow{3}\overleftarrow{2}\overleftarrow{1}} \\
\overrightarrow{3}\overrightarrow{4}\overleftarrow{2}\overleftarrow{1} \\
\overrightarrow{3}\overleftarrow{2}\overrightarrow{4}\overleftarrow{1} \\
\textcolor{red}{\overrightarrow{3}}\overleftarrow{2}\overleftarrow{1}\overrightarrow{4} \\
\end{matrix}
\Rightarrow
\begin{matrix}
\color{blue}{\overleftarrow{2}\overrightarrow{3}\overleftarrow{1}\overleftarrow{4}} \\
\overleftarrow{2}\overrightarrow{3}\overleftarrow{4}\overleftarrow{1} \\
\overleftarrow{2}\overleftarrow{4}\overrightarrow{3}\overleftarrow{1} \\
\overleftarrow{4}\overleftarrow{2}\textcolor{red}{\overrightarrow{3}}\overleftarrow{1} \\
\end{matrix}
\Rightarrow
\begin{matrix}
\color{blue}{\overrightarrow{4}\overleftarrow{2}\overleftarrow{1}\overrightarrow{3}} \\
\overleftarrow{2}\overrightarrow{4}\overleftarrow{1}\overrightarrow{3} \\
\overleftarrow{2}\overleftarrow{1}\overrightarrow{4}\overrightarrow{3} \\
\overleftarrow{2}\overleftarrow{1}\overrightarrow{3}\overrightarrow{4} \\
\end{matrix}
$$

> 算法`总共需要执行(n-1)!轮，每轮生成n个新的排列方式` 

> `除了第一轮的第一次操作`，`每轮的第一次操作移动的都不是数字n，非第一轮的操作移动的都是数字n`
>
> `每一轮的第一次操作所形成的排列`中`包含去除最大元素后的全排序`：$123, 132, 312, 321, 231, 213$

> 该`全排列生成算法`的好处是，我们不需要存储`中间产生的排列结果`。
>
> 可以从`插入法`的角度看，`数字的左右移动`类似于`将该数字插入到不同的位置`
>
> `第一轮第一次操作 = 给每个数字插入了1次`，`移动某个数字 = 给大于等于该数字的所有数字 插入了1次`
>
> > 对于`{1,2}的排列来说：移动数字3并不会影响排列数量，因为我们可以简单地 忽略掉数字3`
> >
> > 但对于`{1,2,3}的排列来说：移动数字2会影响{1, 2}的排列数量，也会影响{1, 2, 3}的排列数量`
>
> 故：`数字3移动的次数 = 数字3被插入的次数 - 1 = 3! - 1 = 5`，`数字2移动的次数 = 2！- 1 = 1`，`数字1移动的次数 = 1! - 1 = 0`



### Inverse Ordinal Number

#### Definition

若$i_1i_2\cdots i_n$是集合$\{1,2,\cdots, n\}$的排列，若$k \lt l \and i_k \gt i_l$，则我们称`数对`$(i_k, i_l)$是一个`逆序（Inversion）`.

> 也就是说，`排列`中的`逆序`概念，对应着`不以自然数顺序出现的一对数`

> 唯一没有逆序的排列是$12\cdots n$



`j的无序程度`使用$a_j$来表示 $a_j \dot{=} |\{k: k \lt j \and i_k \gt i_j \}|$

由$a_j$组成`排列的逆序列` $a_1, a_2, \cdots, a_n$

>`按排列中的逆序个数`的`奇偶性`，我们定义`奇排列`和`偶排列`

`逆序数 (Numebr of Inversion)` 为`逆序列`的`求和`: $\sum_{i=1}^n a_i$

#### Theory

##### Theorem

###### Content

$$
\left\{
\begin{aligned}
& b_1,b_2,\cdots,b_n \in Z \\
& 0 \le b_1 \le n - 1, 0 \le b_2 \le n-2, \cdots, \textcolor{blue}{0 \le b_{n-1} \le 1, b_n = 0}
\end{aligned}
\right.
\implies
存在唯一的逆序列为b_1,b_2,\cdots,b_n的\{1,2,\cdots,n\}的排列
$$

> 也就是说：`排列`和`逆序列`之间是`双射`的

###### Proof

如果我们可以根据`逆序列`来`构建` `唯一的排列`，则该`满射`关系成立。

> 注：下列构建方式所使用的`位置`均从0开始。

---

通过逆序列构建排列：从最大的数开始

- n

  直接写出n

  > $b_n \equiv 0$，我们无法得出n的更多信息。
  >
  > 但好在我们可以直接写出n，后续的其他数字可以相对于n的基础上进行`插入`即可。

- n - 1
  $$
  n
  \begin{cases}
  插入到左侧,& b_{n-1} = 0\\
  插入到右侧,& b_{n-1} = 1
  \end{cases}
  $$

- n - 2
  $$
  n-1
  \begin{cases}
  插入到左侧,& b_{n-2} = 0\\
  插入到位置k , & b_{n-2} = k \quad(1 \le k \lt n)\\
  插入到右侧,& b_{n-2} = 2\\
  \end{cases}
  $$

- ...
- n - k

$$
n - k  \implies 插入到位置k, (0 \le k \le n) \quad\text{(位置0表示插入到最左侧，位置n表示插入到最右侧)}
$$

Q.E.D

> 该算法的通过`按元素的降序顺序插入元素`，`逐个确定相对位置`。
>
> 缺点是直到算法运行结束之前，我们无法知道`某个元素在排列中究竟处于哪一个位置`。
>
> > 这取决于我们对`元素的逆序程度`$a_j$的定义

---

通过逆序列构建排列：从最小的数开始

- 1

将1插入到位置$b_1$

> 请注意，这意味着，我们之后的操作，将`保证` `新插入的在位置`$b_1$`左侧的元素`必须`大于1`

- 2

将2插入到`从0开始的第`$b_2$`个空位置`

> 假如说，我们直接把`元素1`从我们的`逆序`概念中去除。
>
> 那么对于`元素2`，它就是`最小的数`，这时我们只需要把`元素2`插入到`位置`$b_2$即可
>
> 但由于`从位置0到位置`$b_2$之间，有可能`某些位置已经被元素1`所`占据`，我们很清楚`这个位置不会使逆序数+1`
>
> > 因为我们是`按从小到大的顺序插入元素的`，而`1 < 2`。
>
> 所以，我们需要`跳过这个已经被占据的位置。`
>
> > 换句话说，我们要找的是`空位置`并`保证每个空位置要为数字2贡献1个逆序`，`已经被占据的位置`根据我们的推论，`对数字2贡献的逆序必定为0`

- ...
- n

将n插入到`从0开始的第`$b_n$`个空位置`

Q.E.D

> 该算法有一个好处是：一旦`某个元素的位置`被`确定`，那么之后`它的绝对位置`就不会发生改变



#### Example

##### Example 1

通过`交换相邻的元素`来将`排列361245`转变成`排列123456`所需`操作次数`就是`该排列的逆序数`。

---

`该排列的逆序数 = 0 + 0 + 2 + 2 + 1 + 1 = 6`



首先，`如果对于所有数字，都能与相邻元素满足自然顺序`，那么`这个排列必须没有逆序数`，即该`排列`为$12\cdots n$ 

因此，我们可以得知，`如果排列存在逆序数，则必定有` `某个元素与相邻元素形成逆序对`

我们可以考虑将`该元素 和 与之相邻的与该元素构成逆序对的那个元素`视为一个`整体`，

之后，我们`在这个整体中，交换 这两个元素`，我们就可以使得`逆序数 -1`，

更重要地，`我们交换这个整体中的元素，并不会对其他元素的逆序数造成影响！`

综上，我们得出结论：`对于存在逆序的排列，可以通过1次交换相邻元素 来使得 逆序数-1`

Q.E.D



## Generate Combinations

### Definition

若`集合`$S = \{x_{n-1}, x_{n-2}, \cdots x_0\}$，我们寻找一种`生成所有的`$2^n$`个组合(子集)的方法`



### Methods

#### Continuous Binary Method

我们可以把`每个子集`视为一个`n元组`。

该`n元组`表示的是`二进制位模式`，则`所有子集的n元组的二进制位模式`所对应的`整数范围`是$[0, 2^n - 1]$

故，只需`遍历这个整数范围，然后输出所对应的子集`即可。

> 根据这种生成方法，知道`第0个子集`为`空集`

> 该方法的好处是，可以很容易地生成`指定编号的子集`，因为`每个编码`等于`某个子集的二进制数的表示`



#### Dictionary Binary Method

- 初始化：从$a_{n-1}\cdots a_1a_0 = 0\cdots00$开始
- 持续：当$a_{n-1}\cdots a_1a_0 \ne 1\cdots 1$时
  1. 求出`使得`$a_j = 0$`的最小整数j` 
  2. $用1代替a_j$ 且 $用0代替a_{j-1},\cdots,a_0中的每一个$
- 终止：我们得到`按字典序排列的所有的子集`

> 也就是说：
>
> 该算法`每一轮`中`仅考虑生成前k个元素的子集`，在`在每一轮的每一步`中`按字典序顺序加入一个新元素`，
>
> 直到`生成完前k个元素的所有子集`，然后`再考虑仅生成前k+1个元素的子集`，如此进行完成`生成前n个元素的所有子集`
>
> > 根据这个生成特点，我们将这个`子集的生成序列`称为是`子集的压缩序`：`所有不包含4的子集`出现在`所有包含4的子集`的`前面`
>
> 因此，这个算法所得到的子集的生成顺序，是`字典序的`。
>
> > 可以将`二进制位0和1`视为`字母a和b`



#### Reflective Gray Code

> - Background
>
> `基于字典序的生成方法`可能使得`连续生成的两个子集`存在较大`差异 (Difference) `，
>
> 而我们希望有一种`使得连续生成的子集之间的差异较小的方法`
>
> > 差异指的是`相差的元素个数`，我们定义`差异小`为`每次增加1个元素`或`每次减少1个元素`。
> >
> > 但这两个操作每次`不能同时进行`
>
> > 请注意这其中隐含的模型，由于`我们每次操作`都要`生成一个新的子集`，
> >
> > 而且这个子集不能与`之前已生成的子集`发生`重复`。
> >
> > 我们可以用`图`来建模，将`每个特定的子集`作为`顶点`，而将`每一步转变`作为`边`。
> >
> > > 如果两个顶点之间存在边，则说明 这两个顶点所对应的子集 之间`可以互相转换 (Transform) ` 
> >
> > 这样，我们只需要`合适地构建这些顶点之间的顺序`，则问题转化为：`寻找该图的哈密顿路径`。
> >
> > ---
> >
> > 对于`寻找哈密顿路径`来说是简单的，如果`确实存在这种生成方法`，`那么我们总是能找到哈密顿路径`。
> >
> > > 实际上，我们并不会真正地去运行`寻找哈密顿路径的算法`。而是通过`反射Gray码`方式来`确定这样一条路径`。反射Gary码一种很巧妙的方式，不但可以构建更高阶的n方体，而且还能同时确定路径。
> > >
> > > 这里有一些相关的资料：https://www.zhihu.com/question/34629230/answer/88012219
> >
> > 这里最大的问题在于，`如何将n元素的所有的`$2^n$`个子集所对应的顶点`在`题目所给的约束规则下`构造到`图`中。
> >
> > - n = 1：图为一条`线段`，这显然满足题意。
> >
> > - n = 2：图为一个`正方形`
> >
> >   > 我们有4个顶点，我们从`空集所对应的顶点 (00)` 出发，则由于任意顶点的`出度`均为`2`，
> >   >
> >   > 所以，我们可以给`顶点00`的`所有出边`均`进行添加元素操作`，即`将(00)连接到(01), (10)`
> >   >
> >   > 现在，我们`以顶点(01)为例`，它也有`2条出边`，对于`已经存在的每一条与顶点(01)相连的边`，
> >   >
> >   > 它的含义是`顶点(01)的集合中 某个元素的变换方式：增加该元素 或 删除该元素。这取决于 路径中该边的方向是如何确定的`。
> >   >
> >   > 由于`顶点(01)已经和顶点(00)相连，故我们知道`$x_0$`的转变方式 已经体现了处理`。
> >   >
> >   > 接下来`仅需要考虑为`$x_1$`这个对象建立 转变方式`：于是我们`连接 顶点(01) 和 顶点(11)`。
> >   >
> >   > ---
> >   >
> >   > 同理，对`顶点 (10)`也做如此考虑，最终我们得到的图是一个`正方形` 
> >
> > - n = 3：图为一个`正方体`。
> >
> >   > 关于`最终构造的图的形状`，我们进行分析。
> >   >
> >   > 首先，$图的顶点数 V = 2^n$，而且，我们`猜测最终形成的图的形状，具有比较好的对称性`。
> >   >
> >   > 不妨仍从`空集所对应的顶点`$(x_{n-1},x_{n-2}, \cdots, x_0)$考虑，由于`空集不包含任何元素`，所以我们只能进行`添加元素操作`。
> >   >
> >   > 如果我们`要从空集所对应的顶点`$(x_{n-1},x_{n-2}, \cdots, x_0)$`开始，生成 所有元素的单元素集合`，则`空集所对应的顶点`的出度应该为`n`
> >   >
> >   > 那么，出于`对称性`考虑，我们`希望每个顶点的出度都为n`。
> >   >
> >   > `对于每一个顶点`，如果`n增加1，则意味着 多一个对象`，那么`每个顶点都需要多引出1条出边 （这也意味着多1个顶点）`
> >   >
> >   > > 这种`从n方体生成n+1方体`的方法，实际等效于 `反射Gray码`：拷贝一份当前的n方体，并连接相对应的角点。
> >   > >
> >   > > 如果`同时拷贝了路径的走向 并将它反向`，则我们将可以得到`n+1方体`中的`哈密顿路径`。
> >   >
> >   > 所以`增加的顶点数量 = n * 1 = n`，符合$图的顶点数 V = 2^n$的式子。
> >   >
> >   > 更重要的是，`对于每一个顶点所新多出的那条边，它的操作对象必须是 新增的那一个对象，并且必须是 添加元素操作`
> >   >
> >   > > 因为在`低阶情况下，这个新增的对象根本不存在（相当于它的二进制值为0`），同时要`避免重复的生成子集`，
> >   > >
> >   > > 所以我们能做的，只有`在当前顶点所表示的集合的二进制模式`中`添加前缀1`
> >   > >
> >   > > > 而且，如果你对`n = 4的情况下，忽略掉 超立方体 中的第0位二进制位`，则可以`重新得到` `n=3时的正方体的一个同构` 
> >   > > >
> >   > > > ![image-20220403104604545](https://s2.loli.net/2023/01/22/EflkK8G5m7Rd6ux.png)
> >
> > -   n = 4：图为一个`超立方体`
> >
> >   > 根据公式我们知道`总共有16个顶点`。
> >
> >   ![image-20220403104630619](https://s2.loli.net/2023/01/22/Vk6WSLZqyJnIQDU.png)
> >
> > - ...
> >
> > 综上，我们可以拓展到`单位n方体`的情况。



生成`只在1个二进制位上与n元组不同的其后继n元素`，对应着`沿着n方体的边，访问该n方体的每个顶点恰好一次`。

`任何一个这样的遍历`称为`n阶Gray码`

> `n阶Gray码`即`哈密顿路径`，而`循环的n阶Gray码`即`哈密顿圈`

- 初始化：从$a_{n-1}a_{n-2}\cdots a_0 = 00\cdots0$开始
- 持续：当$a_{n-1}a_{n-2}\cdots a_0 \ne 11\cdots1$时
  1. 计算$\sigma(a_{n-1}a_{n-2}\cdots a_0) = a_{n-1} + a_{n-2} + \cdots + a_0$
     1. 如果$\sigma$是偶数，则`翻转`$a_0$
     2. 否则，确定j使得：$a_j = 1 \and (\forall i \lt j, a_i = 0)$，`翻转`$a_{j+1}$
- 终止：我们得到`n阶反射Gray码`

> $$
> \left\{
> \begin{aligned}
> &i \in \{0,1,\cdots,n-1\} \\
> &b_i = 
> \begin{cases}
> 0,& a_{n-1} + \cdots + a_i \\
> 1,& a_{n-1} + \cdots + a_i 
> \end{cases}
> \end{aligned}
> \right.
> \implies
> a_{n-1}\cdots a_1 a_0在Gray码序表的位置 = b_{n-1}\cdots b_1b_0在字典序表的位置 \\
> \implies k = b_{n-1} \times 2^{n-1} + \cdots + b_1 \times 2^1 + b_0 \times 2^0
> $$

## Generate R-Element Subsets

### Definition

> 注： `集合中的元素`是`无序的`，但我们约定，按`严格递增顺序排列集合中的元素`，并将`集合中的元素`视为`字母`，使得`一个集合`形成`一个单词`

$$
\left\{
\begin{aligned}
& a_1a_2\cdots a_r \subseteq \{1,2,\cdots,n\} \\
& a_1a_2\cdots a_r \ne (n-r+1)(n-r+2)\cdots (n) \\
& \text{k is the largest integer that meets: } (a_k \lt n) \and (a_k + 1 \notin \{a_{k+1}, \cdots, a_r\})
\end{aligned}
\right.
\implies
\begin{aligned}
& \text{the successor of }\textcolor{blue}{a_1a_2\cdots a_r}\text{ is } \\ 
& \textcolor{blue}{a_1\cdots a_{k-1}(a_k + 1)(a_k + 2)\cdots(a_k + r - k + 1)}
\end{aligned}
$$

---

已知`第一个r子集`是$12\cdots r$，而`最后一个r子集`是$(n-r+1)(n-r+2)\cdots n$
$$
\begin{aligned}
&\left\{
\begin{aligned}
& a_1a_2\cdots a_r \ne (n-k+1)(n-k+2)\cdots(n) \\
& a_1a_2\cdots a_r = a_1\cdots a_{k-1} a_k (\textcolor{red}{n-r+k}+1)(\textcolor{red}{n-r+k}+2)\cdots(n) \\
& a_k + 1 \lt \textcolor{blue}{n-r+k}+1
\end{aligned}
\right. \\

&\implies 
\left\{
\begin{aligned}
&a_1a_2\cdots a_r是以a_1\cdots a_{k-1}a_k开始的最后r子集 \\
&a_1\cdots a_{k-1}(a_k + 1)(a_k + 2)\cdots(a_k + r - k + 1)是以a_1\cdots a_{k-1}a_k + 1开始的第一个r子集
\end{aligned}
\right.
\end{aligned}
$$

> $\textcolor{red}{(n - r + k + 1) = (n - (r -  k)) + 1}$
>
> 这因为如果`生成的r子集`$a_1a_2\cdots a_r$我们`已经确定以`$a_1\cdots a_{k-1}a_{k}$`开始的话`，则意味着`前k个字母已经确定`。
>
> 于是问题从`生成r子集`变为`生成r-k子集`

### Methods

#### Dictionary Generate Method

- 初始化：从`r子集`$a_1a_2\cdots a_r = 12\cdots r$开始

- 持续：当$a_1a_2\cdots a_r \ne (n-r+1)(n-r+2)\cdots(n)$时
  1. 确定`最大的整数k`，使得$\textcolor{blue}{a_k + 1 \le n}$且$\textcolor{blue}{a_k + 1 \notin \{a_1, a_2,\cdots,a_r\}}$
  
  2. 使用`r子集`$a_1\cdots a_{k-1}\textcolor{red}{\underbrace{(a_k + 1)(a_k + 2)\cdots(a_k + r - k + 1)}_{r-k+1 \ items}}$替换$a_1a_2\cdots a_r$
  
     > 对于`生成r子集`，如果`已经确定以某k个元素作为开头`，则`剩下的元素的个数` 就是 $\textcolor{red}{r - k + 1}$
     >
     > 即$(k) + (r-k) = r$

---

$$
\boxed{\text{Generate the 4-element subset of \{1, 2, 3, 4, 5, 6\}}} \\
\begin{aligned}
& 123\textcolor{blue}{4} \\
& 123\textcolor{blue}{5} \\
& 123\textcolor{blue}{6} \\
& 12\textcolor{blue}{45}\\
& 124\textcolor{blue}{6} \\
& 1256 \\
& 1345 \\
& 1346 \\
& 1356 \\
& 1456 \\
& 2345 \\
& 2346 \\
& 2356 \\
& 2456 \\
& 3456 \\
\end{aligned}
$$

> 再次强调我们的约定：`集合的元素`是`无序的`，但我们`按严格递增顺序`来`排列由集合的元素组成的单词`
>
> 因此，`1256`和`1265`实际上是`同一个集合`，但我们仅选取`遵守严格升序的表示 1256`



### Extension

$$
\boxed{\{1,2, \cdots, n\}的r子集 a_1a_2\cdots a_r出现在所有的r子集的字典序中的位置下标} \\
\textcolor{blue}{\binom{n}{r}} - \binom{n-a_1}{r} - \binom{n-a_2}{r-1} - \cdots - \binom{n-a_{r-1}}{2} - \binom{n - a_r}{1}
$$

---

$$
\begin{aligned}
&计算出现在a_1a_2\cdots a_r后面的r子集的数目 \\
&(1) 在a_1a_2\cdots a_r的后面且以\varnothing开始,但第1个元素比a_1大的r子集数目 = \binom{n-a_1}{r} \\
&(2) 在a_1a_2\cdots a_r的后面且以a_1开始,但第2个元素比a_2大的r子集数目 = \binom{n - a_2}{r - 1} \\
&...\\
&(r) 在a_1a_2\cdots a_r的后面且以a_1\cdots a_{r-1}开始,但第r个元素比a_r大的r子集数目=\binom{n-a_r}{1}
\end{aligned}
$$

## Partial Ordering Relation and Equivalence Relation

### Relation

`集合X`上的`关系R`可能具有的一些特性的定义：

- 自反性（Reflexive）：$\forall x \in X, x R x$

- 反自反性（Irreflexive）：$\forall x \in X, x \cancel{R} x$

- 对称性（Symmetric）：$\forall x,y \in X, x R y \implies y R x$

- 反对称性（Anti-symmetric）：$\forall x,y, x \ne y, xRy \implies y \cancel{R} x$

  > 注意：`反对称性`并不考虑`对角线上的取值情况`

- 传递性（Transitive）：$\forall x,y,z, x R y, y R z \implies x R z$



#### Partial Ordering Relation

##### Diagram: Hasse Disgram

`偏序集`中`a被b覆盖`是指：$a \lt_c b \iff \left\{\begin{aligned}&a,b,c \in X \\ &a \lt b \\ &\nexists c, a \lt c \lt b   \end{aligned}\right.$



##### Theory

###### Theory 1

> - Background
>
> 如果`偏序集`$(X, \le)$的`集合X`中的每一对元素都是`可比的`，那么在集合X上的偏序R是`全序的`
>
> >  `全序集` 也称为`线性有序集`，因为我们可以把全序集进行`线性展开`

设`集合X`是有n个元素的有限集。则`集合X上的全序`与`X的排列`之间存在一一对应。

而且，集合X上的全序的个数为`n!`

---

- Proof

使用`归纳法`证明$a_1,a_2\cdots,a_n$是`X的元素的一个排列`，且$a_1 \lt a_2 \lt a_3 \cdots a_n$

> 通过证明去除极小元$a_1$后仍满足假设，完成归纳。



###### Theory 2

> $$
> (X, \le_2)\text{ is the expansion of }(X, \le_1) 
> \iff 
> \left\{
> \begin{aligned}
> & (X, \le_1) \\
> & (X, \le_2) \\
> & \forall a \le_1 b, a \le_2 b
> \end{aligned}
> \right.
> $$

设$(X, \le)$是`有限偏序集`，则它有`线性拓展`。

---

- Proof

使用归纳法：每次从`偏序集`中`取出1个极小元`，将这些极小元按顺序排列即可得到一个线性拓展。



#### Equivalence Relation

##### Diagram: Set Partition Chart

##### Theory

设`~`是`集合X`上的`等价关系`。不同的`等价类`把`集合X`划分成`若干非空的部分`。

反之，对于`任意把X分割成非空部分的划分`，存在`X上的等价关系`，它的`等价类`就是`这个划分的部分`

---

- Proof

1. 证明`所有等价类的并集为X`：`X的每个元素都包含在一个等价类中`，Q.E.D
2. 证明`两个不同的等价类之间不存在交集`：利用`等价关系的传递性`，Q.E.D
