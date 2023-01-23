---
title: "[Combinatorics] Graph Basics"
date: 2022-04-10 18:40:00
tags:
  - combinatorics
---

# Graph Basics

{% raw %}
$$
\boxed{Macro}
% Color %
\newcommand\c[2]{\textcolor{#1}{#2}}
\newcommand\r[1]{\textcolor{red}{#1}}
\newcommand\g[1]{\textcolor{green}{#1}}
\newcommand\b[1]{\textcolor{blue}{#1}}

% Typography %
\newcommand\a[1]{\begin{aligned}#1\end{aligned}}
\newcommand\t[1]{\text{#1}}
\newcommand\lb[1]{\left\{\begin{aligned} #1 \end{aligned}\right.}
\newcommand\rb[1]{\left.\begin{aligned} #1 \end{aligned}\right\}}
\newcommand\env[2]{\begin{#1}#2\end{#1}}

% Misc %
\newcommand\s[1]{\{#1\}}
\newcommand\qed{\square}
\newcommand\define{\dot{=}}
$$

{% endraw %}

## Graph

### Definition

$$
\lb{\a{
V = \{a,b,c,\cdots\} \\
E = \{\alpha, \beta, \cdots\} \\
}} \implies G = (V, E)
$$

### Concepts

`图的阶` =$|V|$

---

若存在`边`$\alpha = \{x, y\} = \{y,x\}$ ，则：

- $\alpha$`连接 (join)` `顶点`$x$和`顶点`$y$
- `顶点`$x$和`顶点`$y$是`邻接 (adjacent) `的。
- `顶点`$x$和`边`$\alpha$是`关联的`。

---

`顶点点`$x$：我们给`每一个顶点x`取一个`不同的点`（用该`顶点`来标记`顶点点`）

`边曲线`$\alpha$：两个`顶点点`之间能通过`一条简单曲线`连接起来，当且仅当，`所对应的顶点对`确定`G的一条边`$\alpha$

> 一条`边曲线`$\alpha$通过一个`顶点点`$x$，当且仅当，`顶点`$x$是`边`$\alpha$的一个`顶点`

---

`多重图`：允许`顶点`之间形成`多条边`

> 换句话说，图的`边集`$E$是`多重集合`

`一般图`：允许`图`中存在`环`

> 我们说的`图`通常就是指`一般图`

> 可以将`环`视为`一个顶点重复两次而构成的多重集合`

`简单图`：所有`边`的`重数`均为`1`的图

`完全图`$K_n$：`每一对不同的顶点之间`都有`边`

> 一个`n阶完全图`存在$\frac{n(n-1)}{2}$条`边`

`平面图`：如果`一般图`可以在`平面`上画出它的图形，使得`任意两条边`仅在`顶点点`处`相交`，则称为`平面图`

`同构图`：给定`图`$G = (V, E)$和`图`$G' = (V', E')$，如果$\theta: V \rightarrow V'$和$\delta: E \rightarrow E'$是`双射`，则称这两个图是`同构的`

`连通图`：如果`一般图`中的`任何一对顶点`$x$`和`$y$，都存在`连接x和y的路径`，则称该图是`连通的 (Connected)`，否则该图即为`非连通的 (Disconnected)`

`二分图`：可以将`图`$G$的`顶点集`$V$`划分`为`X和Y两个部分`，且`图`$G$的`边集`$E$中的任何一条边满足：`一个端点在X部分`，`另一个端点在Y部分`

---

`顶点的度数 (次数)`$deg(x)$：与`顶点`相`关联`的`边`的数目。

> 一个`环`对度数的贡献为`2`

`图的度序列`：以`递减顺序给出的图G的所有顶点的度数的数列` $(d_1,d_2,\cdots,d_n), \quad d_1 \ge d_2 \ge \cdots d_n \ge 0$

---

$$
\a{

\t{walk} \lb {
&\t{trail} \\
&\t{path} \rightarrow{\t{cycle}}
}

}
$$

`途径 (Walk)`：形如$\s{x_0, x_1},\s{x_1,x_2}, \cdots, \s{x_{m-1}, x_{m}}$的m条`边的序列`

> 上述是一种`以边表示法`，也可以用`以顶点表示法`：$x_0 - x_1 - x_2 - \cdots - x_m$

> `途径`中可以有`重复边`：
>
> > `重复边`：如果`一条边`在`一条途径`中`出现的次数`不超过`边的重数`，则`该边`不能算作`重复边`
> >
> > > 一种观点：可以考虑`图的图形`，如果我们`没有用尽顶点对之间的所有边曲线`，则不能称为`重复边`
> >
> > > 推而广之：如果`图中所有的边都只出现1次`，那么我们认为`当图中任何一条边达到2次`就可以算作`重复边`，否则不算重复边。
> >
> > > 注意：在某些情况下，我们说`图有重边`指的含义是`只要图中任何两个顶点对之间`存在`1条以上的边`。
> > >
> > > 这和我们此处所说的概念不同。这里的`重复边`是对`途径`而言的，而不是对`图`而言的。

`迹 (Trail)`：不含`重复边`的`途径`

> 另一种说法：边的`出现次数`不超过`重数`的`途径`

`路径 (Path)`：除了`起点`和`终点`外的`所有的顶点`都不相同的`途径`

`圈 (Cycle)`：`封闭的路径`

---

`距离 (Distance)`$d(x,y)$：在`连通图`中，表示`连接` `顶点`$x$和`顶点`$y$的`途径`的`最短长度`

> 容易知道$d(x,x) = 0 $，而且显然`距离为`$d(x,y)$`的途径`必定是`一条路径`
>
> > 不要考虑`零权重`边！

---

若有`图`$G = (V, E)$

`子图`：若$V' \subseteq V, E' \subseteq E$，则`图`$G' = (V', E')$称为`图G的子图`

`导出子图 (Induced Subgraph)`：若$\b{V' \subseteq V}, E' = \s{(x,y)| x, y \in V' ,  (x, y) \in E}$，则`图`$G' = (V', E')$称为`图G的导出子图`

`生成子图 (Spanning Subgraph)`：若$\b{V' = V}, E' = \s{(x,y)|x,y\in V', (x,y) \in E}$，则`图`$G' = (V', E')$称为`图G的生成子图`

---

`连通分量 (Connected Component)`：`最大的连通的导出子图`
$$
\lb {
& \t{the partition of } V \t{ is } \mathcal{V} = \s{V_1, V_2, \cdots V_k} \\
&\t{the induced subgraphs from }\mathcal{V} \t { are } G_1, G_2,\cdots G_k \\
} & \implies G_1, G_2, \cdots, G_k \t{ are the connected components of }G \\
&\implies \forall i \ne j, x \in V_i, y \in V_j \implies \text{there is no \b{walk} between } x \t{ and } y
$$

---

`悬挂顶点 (Pendent Vertex)`：图G中`度数为1`的`顶点`

`悬挂边 (Pendent Edge)`：与`悬挂顶点`相`邻接`的`边`



### Theory

#### Theory 1: Handshake Theorem

$$
\a{
d_1 + d_2 + \cdots + d_n \mod 2 = 0 \quad (d_i\text{ is the degree of the vertex})
}
$$

> 这个结论隐含着推论：所有的`奇度数顶点`的个数必定是`偶数`

---

1条`边`必定`连接` `2个顶点`，而1个`环`对`度数`的贡献为`2`。

Q.E.D



#### Theory 2

两个`同构的一般图`具有相同的`度序列`，但具有`相同的度序列`的`图`不一定是`同构`的。



#### Theory 3

若`图`$G = (V,E)$是`一般图`，则`顶点集`$V$可以被`唯一地划分`为`非空子集`$V_1, V_2, \cdots V_k$满足：

1. 分别`由`$V_1, V_2, \cdots, V_k$`所给的导出子图`$G_1=(V_1, E_1), G_2 = (V_2, E_2), \cdots, G_k=(V_k, E_k)$都是`连通的`

2. $$
   \a{
   \forall i \ne j, x \in V_i, y \in V_j \implies \t{there is no a walk between } x \t{ and } y
   }
   $$

---

#### Theory 4

`同构图`本质上是`相同的图`



## Euler Trails: Bridges of Koenigsberg

### Definition

如果`图`$G$中的一条`闭迹 (Closed Trail)`  包含了`G中所有的边` `有且仅有1次`，则称之为`欧拉迹 (Euler Trail)`

> 注意我们之前对`重复边`的定义。



### Theory

#### Theory 1

设`图`$G = (V,E)$是`一般图`，如果它的`每个顶点的度数`都是`偶数`，则`G的每条边`都属于`一条欧拉闭迹`，因而也属于一个`圈`
$$
\lb {
& G = (V, E) \\
& \forall x \in V, deg(x) \mod 2 = 0
} \implies \t{Each edge of graph G belongs to an \b{euler closed trail}}
$$

---

- 必要条件：每个顶点的度数均为偶数

我们考虑`欧拉迹`中的`某个顶点`，我们需要`进入这个顶点`，然后`离开这个顶点`。

> 如果是`欧拉圈`，则`刚开始离开起点`，`最终进入起点`。
>
> 如果是`欧拉迹`，则`刚开始离开起点`，`最终进入终点但不再离开终点`

则意味着，我们需要`一条进入该顶点的边`和`一条离开该顶点的边`。

换句话说，`每个顶点的度数`均为`偶数`。



- 寻找包含初始边的一条`欧拉闭迹`的方法

1. 令 $i = 1$
2. 令 $W = \s{x_0, x_1}$
3. 令 $F = \s{\alpha_1 =  \s{x_0, x_1}}$
4. 当$x_i \ne x_0$时，执行：
   1. 找出一条`不在F中的边`$\alpha_{i+1} = \s{x_i, x_{i+1}}$
   2. 将$x_{i+1}$放入$W$中（有可能$x_{i+1}$已经在W中）
   3. 将$\alpha_{i+1}$放入$F$中
   4. 令$i = i + 1$

---

- 初始化：算法将`初始边`$\alpha_1$加入到$F$中，同时将`与该边关联的2个顶点`加入到$W$中

- 持续：如果$x_i \ne x_0$，则我们`必定`可以找到一条边$\alpha_{i+1} = \s{x_i, x_{i+1}}$

  > 如果`i的最终值为k`，则`所产生的顶点集`$W = \s{x_0, x_1, \cdots, x_k}$，`所产生的边集`$F = \s{\alpha_1, \cdots, \alpha_k}$，则$\alpha_1,\cdots,\alpha_k$就是`包含初始边`$\alpha_1$`的一条闭迹`。
  >
  > > $\alpha_1 = \alpha_ k$
  >
  > ---
  >
  > 只需证明：若$x_i \ne x_0$，则必有`一条不在F中的边`与$x_i$`关联`。
  >
  > > 利用`握手定理`：在整个算法过程中，只有`顶点`$x_0$和`最新加入的顶点`$x_i$是`奇度数`。
  > >
  > > 如果$x_0$和$x_i$ 是`偶度数`，则必定是$x_0 = x_i$
  > >
  > > 如果$x_0 \ne x_i$，则$x_i$是`奇度数`，那么`必定` `还有另一个顶点与`$x_i$`相邻接`

- 终止：所得到的$F = \s{\alpha_1, \cdots, \alpha_k}$即为一条`包含初始边`的`闭迹`



#### Theory 2: Euler's One-Stroke Theorem

$$
\boxed{\t{Euler's One-Stroke Theorem}} \\
\lb{
& G = \s{V, E} \t{ is connected} \\
&\t{There is an \b{euler closed trail} in the graph}
} \iff \forall x \in V,deg(x) \mod 2  =0
$$

---

- 必要性：根据前面的分析。如果`图G`中存在`欧拉闭迹`，则`图G`的`每个顶点`的度数都是偶数。Q.E.D
- 充分性：
  1. 设$G_1 = (V, E_1) = G$，选定$G_1$中的`任意一条边`$\alpha_1$作为`求包含初始边的欧拉闭迹的算法`的`初始边`，得到`包含边`$\alpha_1$`的闭迹`$\gamma_1$。
  2. 设$G_2 = (V, E_1 - \gamma_1)$，则$G_2$`中的所有顶点`的度数`仍然是偶数！`，`由于`$G$`是连通的`，所以$G_2$如果存在边，则`至少有一条边`$\alpha_2$与`闭迹`$\gamma_1$`中的某个顶点`$z_1$`相邻接`，则我们可以对$G_2$`中的边`$\alpha_2$运行`求包含初始边的欧拉闭迹的算法`，得到`包含边`$\alpha_2$`的闭迹`$\gamma_2$。然后，我们可以将$\gamma_1$和$\gamma_2$在`顶点`$z_1$处进行`拼接`：得到`包含`$\gamma_1$和$\gamma_2$的`欧拉闭迹`$\gamma_1 \overset{z_1}{*} \gamma_2$
  
     > - 如果图G的所有顶点的度数都是偶数的话，去掉1个欧拉闭迹，则所有顶点的度数仍为偶数。
     > - 如果图G不是连通的，则根本不存在`欧拉闭迹`；如果图G是连通的，则我们可以找到`欧拉闭迹中的某个顶点`作为`拼接点`（如果找不到该顶点说明剩余的图的边集为空）
  3. ...
  4. 最终，我们可以得到`包含图G中所有边的欧拉闭迹`：$\gamma_1 \overset{z_1}{*} \gamma_2 \overset{z_2}{*} \cdots \overset{k-1}{*} \gamma_k$

Q.E.D



#### Theory 3

$$
\boxed{\t{Construct Euler Open Trail}} \\
\lb {
& G = (V, E) \t{ is connected} \\ 
& \t{There is an \b{euler open trail}}
} \iff \t{There are \b{exactly} two \b{odd-degree vertexes} } u \t{ and } v
$$

---

> `欧拉闭迹`要求`起始顶点`和`终止顶点`相同，而`欧拉开迹`则没有这个限制。
>
> 如果`起始顶点`和`终止顶点`不相同，则`除了这两个顶点是奇度数`之外，`其他所有的顶点`都应该是`偶度数`。
>
> 因此，可以在`欧拉闭迹`的基础上，修改`起点`和`终点`得到`欧拉开迹`

已知定理：如果`图G中所有的顶点的度数都是偶数`，则我们可以得到`一条包含图G中所有边的欧拉闭迹`

现在，如果`图G中除了顶点u和顶点v这两个顶点是奇度数外，其余顶点都是偶度数顶点`，则我们可以添加`辅助边`$\s{u,v}$来`连接`这两个`奇度数顶点`，使得他们成为`偶度数顶点`，我们称该图为$G'$，则我们可以得到$G'$中`包含所有边的欧拉闭迹`，但由于`欧拉开迹不要求起点和终点相同`，则我们在这条`欧拉闭迹`的基础上`去除`这条`辅助边`，即可得到`欧拉开迹`

Q.E.D



#### Theory 4: Euler's N-Stroke Theorem

设`图G`是一般连通图，设`G中奇度数顶点的个数 > 0`，则`G的边`可以被划分为`m/2个开迹`，但不能被划分为`少于m/2个开迹`

---

归纳法：

- 如果`奇度数顶点 = 1`：则根本不满足`握手定理`，不存在这样的图。满足$\lfloor \frac{1}{2} \rfloor = 0$

- 如果`奇度数顶点 = 2`：则$\frac{2}{2} = 1$，可以通过`加入`一条`连接这两个奇度数顶点的边`来得到`欧拉闭迹`，然后`去除该边`即为`欧拉开迹`
- 如果`奇度数顶点 = 3`：同`奇度数顶点 = 1`
- 如果`奇度数顶点 = 4`：重复`奇度数顶点 = 2`的步骤，得到`2条欧拉开迹`。

...

> 能完成`n笔画`的`充要条件`是：存在`n条`的`欧拉闭迹`或`欧拉开迹`
>
> >  注：某些表述方法把`欧拉开迹`称为`欧拉路径`，将`欧拉闭迹`称为`欧拉回路`。他们是一样的概念



#### Theory 5

设`图G`是有`K条边`的一般`连通图`，则G中存在`一条长度为2K的闭途径`：该途径中，`每条边的使用次数`是`它的重数`的`2倍`

---

- Proof 1

对`任何一个顶点`使用`dfs遍历方法`，则`连通图G`中的`每一条边`均会被`dfs访问1次`，以及`回溯1次`。

这等价于`先走过这条边`，然后再`走回这条边`

- Proof 2

构造$G'$为将$G$中的`每条边`的`重数`增加`1倍`所得的图。则$G'$是有2K条边的连通图，且$G'$中存在`欧拉闭迹`，该`欧拉闭迹`就是$G$中的`一条闭路径`



### Example

#### Example 1: Bridges of Koenigsberg

#### Example 2: Chinese Postman Problem

若`图G`是一般连通图，求使用图G的`每一条边` `至少1次`的`一条最短路径`。



## Hamiltonian Path and Hamiltonian Circuit

### Definition

若`图G`是简单图，能否`沿着G的边`确定一条路线：使得它从`G的某一顶点`出发，在访问`其他每一个顶点` `正好1次`之后，又`返回起点`？

> `边的重复`并不会影响`哈密顿路径`或`哈密顿圈`的存在性，因为他们是针对`顶点`而定义的。

> `欧拉闭迹`：包含图G的每一条边恰好1次的`闭迹`
>
> `哈密顿圈`：包含图G的每一条边恰好1次的`闭路径`



### Theory

#### Theory 1

$K_n$中存在$n!$条`哈密顿路径`，也存在$n!$个`哈密顿圈`

---

 因为n个顶点中，可以从任何一个顶点到达任何一个其他顶点：`n个顶点的排列`一一对应于$n!$个`哈密顿路径`和`哈密顿圈`



#### Theory 2

带有`桥`的`阶 `$n \ge 3$的`连通图`不存在`哈密顿圈`

---

归纳法：

设该`桥`$\alpha = \s{x, y}$，则如果将`桥`删除，可以得到`2个连通分量`:$G_1, G_2$

不妨假设，我们的`哈密顿回路`的`起始顶点`在$G_1$，则我们需要通过`桥`$\alpha$到达$G_2$。

然后，我们`还必须重新返回位于`$G_1$`的起始顶点`，而这意味着，我们`必须再次经过桥`（因为`桥`$\alpha$是$G_1$和$G_2$之间穿越的唯一方法）

而这将不满足`哈密顿圈`的定义。

> 实际上，它甚至也没有`欧拉闭迹`

Q.E.D



#### Theory 3: Ore Property

`Ore Propetry`：`图`$G$对所有`不邻接的不同顶点x，y的对`，有：$deg(x) + deg(y) \ge n$

若`图`$G$是满足`Ore Property`且`阶数`$n \ge 3$的简单图，则`图`$G$中存在`哈密顿圈`

---

- 满足`Ore Property`的`图`$G$是`连通的`

假设`图G`是不连通的，则图$G$不可能满足`Ore Property`。

若将图$G$的`所有顶点`划分为两个子集$U$和$W$，使得图G中不存在`任何一条连接U中一个顶点和W中一个顶点的边`，

设$|U| = r, |W| =s \implies r + s = n$

则$deg(U) = r - 1, deg(W) = s - 1 \implies deg(G) = r + s - 2 = n - 2$

与假设前提矛盾，故图G是连通的。

Q.E.D

---

- 寻找`哈密顿圈`的算法

  - Step 1: 从`任意一个顶点`出发，在它的任意一端`邻接一个顶点`，构造一条越来越长的路径，直到该路径无法再加长为止：$\gamma: y_1-y_2-\cdots-y_m$

  - Step 2: 检查$y_1$和$y_m$是否`邻接`

    - Step 2-1 如果不邻接，跳转到Step3；否则，跳转到Step 2-2
    - Step 2-2 如果$m=n$，则停止构造并输出`哈密顿圈`$\b{y_1-y_2-\cdots-y_m-y_1}$，否则，$y_1$和$y_m$是邻接的且$m \lt n$，转到Step 2-3
    - Step 2-3 找出一个`不在`$\gamma$`上的顶点`$z$和`在`$\gamma$`上的顶点`$y_k$，使得$z$和$y_k$邻接。将$\gamma$用下面的`长度为m+1的路径`来代替：$\r{z}-\b{y_k}-\cdots-y_m-y_1-\cdots-\b{y_{k-1}}$ 并转回到Step 2-2

  - Step 3: 找出一个`顶点`$y_k (1 \lt k \lt m)$，使得$y_1$和$y_k$邻接，且$y_{k-1}$和$y_m$邻接，将$\gamma$用下面的`路径`代替：$\b{y_1} - \cdots - \b{y_{k-1} - b{y_m}} - \cdots -\b{y_k}$

    这条路径的两个端点$y_1$和$y_k$是邻接的，转回到Step 2-2



- 证明：Step 2-3 必定能找到一个特定的顶点$z$

 因为有$m \lt n$且图是连通的，所以必定存在一个`不在路径`$\gamma$`上的顶点`$z$，它与$y_1,\cdots,y_m$中的某个顶点邻接。



- 证明：Step3 必定能找到特定的顶点$y_k$

已知$y_1$和$y_m$不邻接，设$deg(y_1) = r,deg(y_m) = s \implies r + s \ge n$

因为$\gamma$是`一条最长的路径`，所以$y_1$只能与$\gamma$`上的顶点`相邻接，即与$\b{y_2,\cdots,y_{m-1}}$中的r个顶点相邻接。

同理，$y_m$与$\b{y_2,\cdots,y_{m-1}}$中的s个顶点相邻接。

`与`$y_1$`邻接的r个顶点中的每个顶点`都位于`路径`$\gamma$`上某个顶点的前面`，且在`这些顶点`中，`必定有一个`与$y_m$邻接。否则，$y_m$最多与$(m-1)-r$个顶点邻接，则$s \le m - 1- r \implies \b{r + s \le m - 1 \le n - 1}$ 与Ore性质矛盾。

因此，`存在一个顶点`$y_k$：使得$y_1$与$y_k$邻接，且$y_m$与$y_{m-1}$邻接。

因此，算法在G中构造出一条哈密顿圈会后会停止。



#### Theory 4

在`阶数`$n \ge 3$的简单图中，如果`每个顶点的度数`至少为$n/2$，则图中必定存在`哈密顿圈`



#### Theory 5

在一个n阶简单图中，如果`每对不邻接的顶点`的`度数之和`至少为`n-1`，则图中存在`哈密顿路径`



## Bipartite Graph

### Definition

若$G=(V,E)$是一个`多重图`，如果`顶点集V`可以被`划分`为两个子集`X`和`Y`，使得`G中的每一条边`都有`一个顶点在X`，`另一个顶点在Y`，

则我们称`图G`是`二分图`。

`完全二分图`$K_{m,n}$：`二分图`的`X中的每个顶点`都与`Y中的每个顶点`相连。



### Theory

#### Theory 1

一个`多重图`是`二分的`，当且仅当，`多重图的每一个圈的长度`均为`偶数`

---

若图G是有2划分X，Y的二分图，则`G中的一条途径上的顶点` 必`交替地`取自`X`和`Y`。



我们`假设`：`G中的每一个圈的长度均为偶数`，`G是连通的`，` x是G的任意一个顶点，X是由那些到x的距离为偶数的顶点构成的集合，Y是由那些到x的距离为奇数的顶点构成的集合`

- 假设：`图G是连通的`。则我们有`X + Y = V`

现在`证明：X，Y是一个2划分（即X中的任意两个顶点不邻接，Y中的任意两个顶点不邻接）`

我们`反证假设：存在一条边{a, b}使得`$a \in X, b \in X$

我们设`从x到a的最短路径`$\alpha: x-\cdots-a$和`从x到b的最短路径`$\beta:x-\cdots-b$

由于$\alpha$和$\beta$拥有相同的起始顶点$x$，则我们不妨设`这两条途径中最后一个相同的顶点`$z$

从而，我们得到：$\alpha: \b{x-\cdots-z}-\cdots-a$和$\beta:\b{x-\cdots-z}-\cdots-b$

`分解途径`得到：$\alpha_1 = \beta_1:x-\cdots-z$

$\alpha_2: z - \cdots-a$和$\beta_2: z- \cdots-b$

所以，我们得到：$\alpha_2$和$\beta_2$的长度`要么都是奇数`，`要么都是偶数 `。

而`边{a, b}的存在`意味着：图G中有`一个长度为奇数的圈`$z-\cdots-\b{a-b}-\cdots-z$

与假设矛盾。故：图G中不可能存在`连接X中顶点a和b的边{a, b}`。

同理，可证图G中不可能存在`连接Y中顶点a和b的边{a, b}`

- 假设：图G是不连通的。则只需用上述方式证明图G的每一个`连通分量`都是`二分的`，即可证明`图G`是`二分的`



#### Theory 2

设G是有二划分的X，Y的二分图：

- 若$|X| \ne |Y|$，则G中不存在`哈密顿圈`。
- 若$|X|=|Y|$，则G中不存在`起始于X中的顶点 又 终止于X中的顶点的哈密顿路径`
- 若$\Big||X| - |Y|\Big| \ge 2$，则G中不存在`哈密顿路径`
- 若$|X| = |Y| + 1$，则G中不存在`起始于X又终止于Y的哈密顿路径`



### Example

#### Example 1: Reflective Gray Code

`格雷码` $\implies$ `哈密顿路径`

`反射格雷码` $\implies$ `哈密顿圈`

#### Example 2: Board Coloring Problem 

#### Example 3: The vaulting horse problem

`跳马路线`：能够让`马`落在`棋盘上的所有格子`恰好1次的路线。$\implies$ `哈密顿路径`

`重复路线 (Reentrant)`：可以`循环的` `跳马路线` $\implies$ `哈密顿圈`



## Tree

### Definitions

#### Definition 1

n阶连通图`至少有n-1条边`。此外，对于每一个正整数n，存在`恰好n-1条边的连通图`。

从`恰好有n-1条边的n阶连通图`中去掉`任意一条边`，都会得到一个`非连通图`。

连通图G是树$\iff$所有边都是`桥`



#### Definition 2

连通图G是树$\iff$恰好有$n-1 \quad(n \ge 1)$条`边`

---

首先，我们先`去除连通图中的所有边，得到n个孤立的顶点，每个顶点对应着1个连同分量`。

于是，我们得到`n个连通分量`，接下来，我们`每加入1条边，就可以连接2个连同分量，使得图的连同分量数-1`

因此，我们只需要加入`n-1条边`即可使得`图的连同分量数量减少至1`。Q.E.D



#### Definition 3

> - Background
>
> 设G是连通图，$\alpha = \s{x, y}$是G的`桥`，当且仅当，`图G的任何圈`都不包含$\alpha$
>
> ---
>
> - 充分性：若$\alpha$是桥，则图G被划分为两个连通分量，故图G的任何圈都不包含$alpha$
> - 必要性：若$\alpha$不是桥，则图G中存在`包含`$\alpha$`的圈`

连通图G是树$\iff$G中不包含`圈`。



#### Definition 4

连通图G是树$\iff$`每一对不同的顶点`$x$和$y$之间都有`唯一的一条路径`



## Spanning Tree

### Theory

#### Theory 1

设G是阶$n \ge 2$的树，则G中`至少有2个悬挂顶点`

---

设图G中的`度序列`为：$d_1, d_2, \cdots, d_n$

则：$d_1 + d_2 + \cdots + d_n = 2(n-1)$

如果其中`最多有一个`$d_i$`等于1`，则：$d_1 + d_2 + \cdots + d_n = 1 + 2(n-1)$

矛盾，故`树中至少有2个悬挂顶点`



#### Theory 2

每个`连通图`都有`生成树`

---

- 求连通图的生成树的算法

去除`连通图`中的所有`非桥边`



#### Theory 3

设`图T`是`连通图G`的一颗生成树。设$\alpha = \s{a,b}$是G的一条边，但不是T的边，则T中存在一条边$\beta$，满足：

通过向T中加入`边`$\alpha$，并去掉`边`$\beta$，得到的`图T`仍然是`图G的生成树`。

---

如果`边`$\alpha = \s{a,b}$是`悬挂边`，则`图G的生成树`中必须要`加入`这条边，因为这是`唯一`连接`顶点a`和`顶点b`的边。

如果`图G的生成树`中没有`加入边`$\alpha$，说明`边`$\alpha$并不是`悬边`，我们有`其他的边`$\beta$来`连接` `顶点a`和`顶点b`，则我们可以用`其他的边`来`替代` `边`$\alpha$，反之亦然。

> 实际上，`边`$\alpha$和`边`$\beta$应当属于 `同一个圈之中`，这意味着我们选择`边`$\alpha$或者`边`$\beta$都可以满足生成树的连通性。$\square$



#### Theory 4

设$T_1$和$T_2$是连通图G的两颗`生成树`，设$\beta$是$T_1$的一条边，则$T_2$中必有一条边$\alpha$，使得在$T_1$中加入$\alpha$而去掉$\beta$后，`得到的图`仍然是`图G的生成树`。

---

- 假设`极端情况`，如果`图G`本身就是`树`，那么`图G的所有生成树都相同 （实际上也就1种）`，即$T_1 = T_2$，同时$\alpha = \beta$

- 如果对于$\beta = \s{a,b}$，$T_1$中存在$\beta$但$T_2$中不存在$\beta$，则说明$\beta$并不是`悬挂边`。

对于$T_2$来说，它如果不选择加入$\beta$，则必须要选择`其他的边`$\alpha$来保证`顶点a`和`顶点b`之间的`连通性`。

而根据我们上面的推论，我们知道，`边`$\alpha$和`边`$\beta$实际上属于`同一个圈之中`

> 更直白的说法是：$T_1$和$T_2$同样都作为`生成树`，在$T_1$中加入$\alpha$而去除$\beta$的含义是：让`生成树`$T_1$ `照着模仿做 (do as others do)` `生成树`$T_2$是`如何满足顶点a和顶点b之间的连通性的`。



#### Theory 5

`n阶图`的`生成树`数量为`该图的n-1阶拉普拉斯矩阵的任意子矩阵的行列式的绝对值`



### Models

#### Model 1: Construct Spanning-Tree

若$G = (V, E)$ 是`n阶图`，$u \in V$

- Step 1：$U \dot{=} \s{u}, F \dot{=} \varnothing$
- Step 2：当$\b{\exists x \in U \and  y \notin U}, \alpha=\s{x,y} \in E$时
  - $\b{y \cup U}$
  - $\alpha \cup F$
  - Goto Step 2
- Step 3：$T \dot{=} (\b{U = V}, F)$

---

- 证明：`正在构建的生成树`$T$`永远不会存在环` （环的定义）

该算法维护的`顶点集`$U$表示的是`正在构建的生成树的顶点集`。

我们是通过一个简单的`事实`来`避免正在构建的生成树`中`存在环`：在由顶点表示的途径中存在环，当且仅当，存在某个顶点出现重复。

所以，我们`的确可以始终保持正在构建的生成树`$T$中`不存在环`。

- 证明：不断增加`顶点`，最终该算法会停止 （树的定义）

我们注意到，我们每一次仅仅是`检查是否存在环的条件`，然后简单地`新增顶点，以及和该顶点相关联的边`。

由于`每次新增顶点时，必定新增1条边`，而当$|F| = |E| - 1$时，$T$将是一颗` 最终的生成树`。

> 这取决于`树`的定义：`n个顶点的树`含有`n-1条边`



#### Model 2: Construct BFS Spanning-Tree

> `广度优先生成树 (BFS Spanning-Tree)`：该树以`初始顶点`$u$作为`根`，对于`每一个顶点`$x$来说：`x与u在G中的距离` = `x与u在T中的距离`
>
> >`bf(x)`：表示`顶点`$x$加入到`BFS树`中的`次序`
> >
> >`D(x)`：表示`顶点x`和`顶点y`在`T`中的`距离`

$G \dot{=} (V,E), |V| = n, u \in V$

- Step 1：$\b{i \dot{=}1, U \dot{=} \s{u}, F \dot{=} \varnothing, T \dot{=} (U, F) }, \r{D(u) \dot{=} 0, bf(u) \dot{=} 1 }$
- Step 2：当$\b{\exists x \in U \and y \notin U, \alpha=\s{x,y} \in E}$ 时
  - 寻找$\b{\alpha = \s{x, y}}, \r{x \t{ has the min-imum } bf(x)}$
  - $\r{bf(y) = i + 1}$
  - $\r{D(y) = D(x) + 1}$
  - $y \cup U$
  - $\alpha = \s{x,y} \cup F$
  - $\r{i = i + 1}$
  - Goto Step 2
- Step 3：$T \dot{=} (\b{U = V}, F)$

> 首先，我们这里所讨论的`BFS树的顶点之间的距离`指的是`两个顶点之间的边的条数`，而并没有额外地定义`边的权重`

> 可以将`Construct BFS Spanning-Tree`看作是`一种不重复地搜索G的所有顶点的BFS方法`



#### Model 3: Construct DFS Spanning-Tree

$G \define \s{V, E}, |V| = n, u \in V$

- Step 1：$\b{i \dot{=}1, U \dot{=} \s{u}, F \dot{=} \varnothing, T \dot{=} (U, F) }, \r{df(u) \dot{=} 1 }$
- Step 2：当$\b{\exists x \in U \and y \notin U, \alpha=\s{x,y} \in E}$ 时
  - 寻找$\b{\alpha = \s{x, y}}, \r{x \t{ has the max-imum } df(x)}$
  - $\r{df(y) = i + 1}$
  - $y \cup U$
  - $\alpha = \s{x,y} \cup F$
  - $\r{i = i + 1}$
  - Goto Step 2
- Step 3：$T \dot{=} (\b{U = V}, F)$



#### Model 4: Construct Distance Spanning-Tree (Dijkstra)

> `权重函数 (Weighted Function) `$c$：是定义在$\alpha \rightarrow \real$的函数。
>
> > 若`边`$\alpha = \s{x, y}$，则`该边的权重`$c(\alpha) = c\s{x,y}$
> >
> > > 平时我们将`两个顶点之间的距离`定义为`两个顶点之间的边的条数`，可以视为是`每条边的权重均为1的权重函数`
> >
> > 若`途径`$\gamma: \s{x_0,x_1},\s{x_1,x_2},\cdots \s{x_{k-1},x_k}$，则`该途径的权重`$c(\gamma) = c\s{x_0,x_1} + c\s{x_1,x_2} + \cdots + c\s{x_{k-1},x_k}$
>
> `距离 (Distance)`$d_c\s{x,y}$：指的是在`权重函数`$c$之上，`顶点x`和`顶点y`的`所有途径中的权重最小的途径的权重`

$G \define (V, E), |V| = n, u \in V$

- Step 1：$\b{U \define \s{u}, F \define \varnothing, T \define (U,F) },\r{D(u) \define 0}$
- Step 2：当$\b{\exists x \in U \and y \notin U, \alpha = \s{x, y} \in E}$时
  - 寻找$\b{\alpha = \s{x,y},} \r{x,y \t{ has the min-imum } D(x) + c\s{x,y}}$
  - $y \cup U$
  - $\alpha = \s{x,y}\ cup F$
  - $\r{D(y) = D(x) + c\s{x,y}}$
  - Goto Step 2
- Step 3：$T \dot{=} (\b{U = V}, F)$

---

`反证假设: 结论不成立`$\implies$$\b{\exists y \in V, D(y) \gt d\s{u,y}}$

则`假设: y是第一个被放入U中的具有这样的性质的顶点`，则$G$中存在$\gamma: \r{u = x_0}-x_1-\cdots-\r{x_k = y}$ 且$D(y) \gt d\s{u,y}$

设$x_j$是在$y$之前放入$U$中的`路径`$\gamma$`的最后一个顶点`，则$D(x_j) = d\s{u, x_j}$

故$\gamma' \subset \gamma,\gamma': \r{u = x_0} - x_1 - \cdots - \r{x_{j}} - \c{hotpink}{x_{j+1}}$

> $$
> \gamma:\r{u=x_0}-x_1-\cdots - \underbrace{\c{hotpink}{x_j} \leadsto \r{x_k = y}}_{x_{j+1} \t { may be } y}
> $$

故`得出`
$$
\underbrace{D(x_j) + \c{hotpink}{c\s{x_j, x_{j+1}}} \le d\s{u,y}}_{

\t{inequation}\ \begin{cases}
=,& \t{if } x_{j+1} = y \\
<,& \t{if } x_{j+1} \ne y
\end{cases}

} \lt D(y)
$$
但是，根据算法，$x_{j+1}$是在$y$`之前`被放入U中的，这与我们对$x_j$的选择矛盾。

而这意味着：$\b{\forall y \in V, D(y) = d\s{u, y}}$ 与`假设`发生`矛盾`



#### Model 5: Construct Minimum Spanning-Tree (Kruskal)

> $\boxed{\t{图的权重函数}} \lb{
> \a{
> &G \define (V, E) \\
> &c(G) = \sum_{\alpha \in E}{c(\alpha)}
> }
> }$

$G \define (V, E), |V| = n, u \in V$

- Step 1：$\b{G \define (V, E), F \define \varnothing}$
- Step 2：当$\b{\exists \alpha \in E \and \alpha \notin F, F \cup \s{\alpha} \t{ don't have \r{cycles}}}$时
  - 寻找$\b{\alpha \t{ has the min-imum } c(\alpha)}$
  - $\alpha \cup F$
  - Goto Step 2
- Step 3：$T \dot{=} (\b{V}, F)$

---

使用 `归纳法` 证明 `Kruskal`的正确性。

- 证明：$Kruskal$将产生一颗 `生成树`

我们从 $F = \varnothing$开始，每次选择一条 `不产生圈的边`来连接 `两个连通分量`。

每次将 `一条边` 加入到 $F$ 中会使得 `初始的n个连通分量`减少 `1个`

所以总共需要加入 $n-1$条边，即可得到一个 `生成树` $T$

 

- 证明：$Kruskal$产生的 $生成树$ 是 `最小生成树`

我们假设 `Kruskal`产生的 `生成树` $T$ 由 `边集` $E = \s{\alpha_1, \alpha_2, \cdots, \alpha_{n-1}}$ 组成。

如果我们通过 `加入边` $\beta$而 `去除边` $\alpha_k$ 来得到 `另一颗生成树 ` $T^*$

则 $c(T^* )= c(T) + c(\beta) - c(\alpha_k) $

由于 $\alpha_k$ 是 `整个图中的全局最小边`，则有 $\alpha_k \le \beta$

于是我们有
$$
\a{
c(T*) &= c(T) + c(\beta) - c(\alpha_k) \\
&\ge c(T)
}
$$
于是，$T$ 是 `图` $G$ 的 `最小生成树`

 

#### Model 6: Construct Minimum Spanning-Tree (Prim)

$G \define (V, E), u \in V$

- Step 1：$\b{i \dot{=}1, U_\r{1} \dot{=} \s{u}, F_\r{1} \dot{=} \varnothing, T_\r{1} \dot{=} (U_\r{1}, F_\r{1}) }$
- Step 2：当$\r{i = 1,2,\cdots, n-1}$
  - Step 2-1：寻找$\r{\alpha_i = \s{x,y} \t{ has the min-imum } c(\alpha_i)}, \r{x \in U_i \and y \notin U_i}$
  - Step 2-2：$\r{U_{i+1} \define U_i \cup \s{y}}, F_{i+1} \define F_i \cup \s{\alpha_{i}}, T_{i+1} \define (U_{i+1}, F_{i+1})$
  - Step 2-3：$i = i + 1$
- Step 3：$T_{n - 1} = (\b{U_{n-1} = V}, F_{n-1})$

---

- 证明：$Prim$将产生一颗 `生成树`

初始时，我们有 `顶点集` $F = \varnothing$ 

由于每次从 ``顶点集` $F$ 中的 `顶点`  `拓展`到  `与之相邻接的顶点`，并且保证 `不包含重复顶点 `

所以，实际上我们可以得到 `图G的一条路径`。

根据树的定义，当 $|F| = n$时，我们将得到 `图G的一颗生成树`



- 证明：$Prim$产生的 `生成树` 是 `最小生成树`

不妨假设 $Prim$ 产生的生成树 $T$的 `边集` $F = \s{\alpha_1, \alpha_2, \cdots, \alpha_{n-1}}$

则 $\forall i = 1,2,\cdots, n-1, \t{such that } \alpha_i = \s{x, y}, x \in U_i \and y \notin U_i$

我们假设选取 `另一条边`来 `连通` $顶点y$

则有 $ \beta_i = \s{z, y}$ 

如果 `删除边` $\alpha_i$ 而 `加入边` $\beta_i$ 得到 $T^*$

则由于 $\alpha_i \le \beta_i$

我们有 
$$
\a{
c(T*) &= c(T) - \alpha_i + \beta_i \\
& \ge c(T) 
}
$$
故 $T$是 `最小生成树`



### Shannon Switching Games

#### Definition

设`图`$G = (V,E)$是一个多重图，`起始顶点u`和`终止顶点v`是两个指定的顶点。

`Shannon Games`需要2名`选手 (Player)`参与，轮流进行`建造 (Build)`和`破环 (Destroy)`：

`正方选手 (Positive Player -> Build)`

> 获胜条件是，`建立`起`顶点u和顶点v之间的一条路径。`
>
> `建造`：在两个顶点之间`连接`一条边，任何被`建造`的边将`无法被破坏`

`反方选手 (Negative Player -> Destroy)`

> 获胜条件是，`破坏`掉`顶点u和顶点v之间的所有路径`，一旦`所有的路径`都被破坏，则`反方选手`可以`立即取得胜利`
>
> > `Shannon Switching Games`不存在`平局`的情况，如果游戏一开始时，`顶点u`和`顶点v`就不连通，则`反方选择` `立即取得胜利`！
>
> `破坏`：破坏两个顶点之间的一条边。



我们考虑是否存在下面几种策略：

- 是否存在`先方游戏`：即`先手必胜`
- 是否存在`后方游戏`：即`后手必胜`
- 是否存在`正方游戏`：即无论`正方选手`是`先手`还是`后手`，都必定`获胜`
- 是否存在`反方游戏`：即无论`反方选手`是`先手`还是`后手`，都必定`获胜`



> 对于`Shannon Switching Games`：
>
> 如果`正方选手/反方选手`可以`后手必胜`，则它也可以`先手必胜`。
>
> > 因为它只需要在`第一手`做`自由运动`即可。



#### Theory

##### Theory 1

对于`Shannon Switching Games`，如果在`先方游戏`的`多重图`$G$中，加入`连接顶点u和顶点v的边`形成$G'$，则该游戏将变成`正方游戏`

---

- 如果`正方选手`是`先手`，则它可以：
  - 不使用`边{u, v}`，而按照`图`$G$所定义的`先方游戏`的策略来`获胜`
  - 使用`边 {u, v}`，直接`获胜`
- 如果`正方选手`是`反手`，则我们为`反方选手`做考虑：
  - `反方选手`必须`首先破坏` `边 {u, v}`，否则`正方选手`可以利用该边立即`获胜`。但如果`反方选手` `第一步用来破坏 边{u, v}`，则它将边为$图G$中的`后方`，使得`正方选手`可以遵循`先方游戏`的策略来`获胜`。



##### Theory 2

`Shannon Switching Games`是一个`正方游戏`，当且仅当，存在`包含u和v的顶点集`$V$的`子集`$U$，使得`导出子图`$G_U$中存在2个`没有共同边的生成树`

---

不妨假设这两颗生成树为$T_1$和$T_2$

而`生成树`$T_1 = (V_1, E_1)$和$T_2 = (V_2, E_2)$拥有`相同的顶点集`，却`不存在共同边`，则说明如果我们对于`图`$G = (V = V_1 = V_2, G = \b{E_1 + E_2})$来说，`所有的顶点`都属于`某个圈`之中。则根据我们前面讨论的`生成树`相关的结论，可以知道对于$V_1 + V_2$`之中的任何两个邻接的顶点 都属于 同一个圈中`，也就是说，`连接任何两个邻接顶点的边 都不是 悬挂边`，所以，`反方选手如果破坏 任何两个邻接顶点所属的圈中的1条边，并不会影响这两个邻接顶点之间的连通性`！

> 必须要求`图G的生成树`中`任何两个邻接的顶点`都要`属于同一个圈`。
>
> 如果有`任何两个邻接的顶点 被 悬挂边 所连接`，则一旦`反方选手`破坏该条`悬挂边`，则`图G`将被`分割`为2个`连通分量`





   
