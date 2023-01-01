---
title: Combinatorics - Graph Basics II
tags: []
id: '42686'
categories:
  - - uncategorized
date: 2022-04-16 19:36:23
---

# Advanced Graph

## Chromatic Number

### Definition

若`图`G = (V,E )。

`图`G的`k顶点着色 (k着色)`：从`含有k种颜色的集合`中选择`颜色`，对`图G`的每一个`顶点`指定一种`颜色`，使得`相邻顶点`有`不同颜色`。

> 注意：`k顶点着色`并不要求`k种颜色`都必须要使用到。

`图`G是`k可着色的`：如果图G存在一个`k顶点着色`

`图`G的`色数 (Chromatic Number)`\\mathcal{X}(G)：

*   使得`图`G是`k可着色的`中的`最小的k`称为图G​的`色数`
*   使得 `所有的顶点`可 `划分` 为 `k个子集`且 `每个子集的导出子图均为零图`的 `最小整数k`

* * *

`图`G的 `色划分 (Color Partition)`\\mathcal{V} ：若V\_i \\quad (i = 1,2,\\cdots,k)表示 `被指定为颜色i的所有顶点的子集`，则 \\mathcal{V} = \\s{V\_1, V\_2, \\cdots, V\_k}是V的 `划分`。

> `色划分的元素的导出子图`：G\_{V\_1}, G\_{V\_2}, \\cdots, G\_{V\_k} 均为 `零图`

### Theory

#### Theory 1

> `零图 (Null Graph)`N\_n：没有 `任何边`的图。(含有n个顶点)
> 
> `空图 (Empty Graph)`N\_0：没有 `任何顶点`的图。（含有0个顶点）
> 
> > `零图` 不一定是 `空图`：因为 `零图`可以仅仅包含一堆 `孤立的点`
> > 
> > `空图`是 `0阶零图`

若G = (V, E) \\quad n \\ge 1，则1 \\le \\mathcal{X}(G) \\le n

并且有：

*   \\mathcal{X}(G) = n \\iff G = K\_n
*   \\mathcal{X}(G) = 1 \\iff G = N\_n

* * *

*   若G = K\_n \\implies 所有的 `顶点`都互相 `邻接`，故所有顶点的颜色都不同，需要 `n种颜色`
    
*   若G = N\_n \\implies所有的顶点都是 `孤立的`，没有 `任何两个顶点之间存在邻接`，所以仅需要 `1种颜色` 。
    
    > 如果G \\ne N\_n \\implies `至少有2个顶点是邻接的`\\implies \\mathcal{X}(G) \\ge 2 \\ne 1
    

> 推论：若G \\ne K\_n \\implies 至少存在 `两个顶点之间不邻接` \\implies 这 `两个顶点`可以着色 `相同颜色` \\implies 1 \\le \\mathcal{X}(G \\ne K\_n) \\le n - 1

#### Theory 2

G = (V, E), H \\subseteq G \\implies \\mathcal{X}(G) \\ge \\mathcal{X}(H)

> \\if \\exists H = K\_p,\\then \\mathcal{X}(G) \\ge p
> 
> 可以利用该推论快速地确定 `图G的色数的一个不严格下界`

#### Theory 3

* * *

> 因为q是 `G中导出子图中的所有零图里，阶数最大的零图`\\implies 我们使用`任何1种颜色`可以`至多着色图G中的q个顶点`
> 
> \\implies 我们 `至少` 使用\\lceil \\frac{n}{q} \\rceil 种颜色即可 `着色图G中的所有顶点` \\implies \\mathcal{X}(G) \\ge \\lceil \\frac{n}{q} \\rceil

> \\mathcal{X}(G) \\ge \\roundup{\\frac{n}{q}}对于\\G 隐含2个信息：
> 
> *   使用 `任何一种颜色`可以 `至多着色图G中的q个顶点`
> *   `图G中每q+1个顶点之中，至少有q个顶点相互邻接`

#### Theory 4

* * *

*   E = 0 \\implies G = N\_0 \\implies \\mathcal{X}(G) = 1
*   E \\ge 1 \\implies \\mathcal{X}(G) = 2 \\implies \\mathcal{V} = \\s{V\_1, V\_2} \\t{ is a partition of } V

反之同理 \\qed

#### Theory 5: A Greedy Method to Solve the Vertex Coloring

G = (V, E), V = \\s{x\_1, x\_2, \\cdots ,x\_n}

*   对x\_1指定 `颜色1`
*   对每个i = 2, 3, \\cdots, n：令p是与x\_i邻接的顶点x\_1, x\_2,\\cdots,x\_{i-1} 中 `任何顶点`都不被着色为 `p`的 `最小颜色`，并对x\_i 指定 `颜色p`

若\\G，其 `顶点的最大度`\\Delta，则该方法产生一个 `图G的`(\\Delta + 1) `着色`：\\mathcal{X}(G) \\le \\Delta +1

> \\mathcal{X}(G) = \\Delta + 1时，即 `图G`是 `星 (Star)`

> 该 `贪心算法` 并不保证产生的 `图的着色`是 `最优着色`：这取决于 `如何编号图G的顶点`
> 
> > 更具体地，如果我们按照 \\mathcal{V} = \\s{V\_1, V\_2, \\cdots V\_{\\mathcal{X}(G)}}的 `顺序`来 `编号`顶点，则该方法会 `只用颜色1来涂色` V\_1 `中的顶点`，然后 `只用颜色1和颜色2来涂色` V\_2 `中的顶点`，...，`只用颜色1，颜色2，..., 颜色`\\mathcal{X}(G) `来涂色` V\_{\\mathcal{X}(G)} 。最终可以得到 `最优的图G的着色`

#### Theory 6: Brooks Theorem

若 `图G`是 `连通图`，其 `顶点的最大度` \\Delta。如果 `图G` 既不是 `完全图` K\_n， 也不是 `奇数阶循环图` C\_n \\implies \\mathcal{X}(G) \\le \\Delta

#### Theory 7: Chromatic Polynomial

> `图G的色多项式`p\_G(k)：即`图G的k顶点着色`的`方案数`
> 
> 如果\\mathcal{X}(G) \\gt k \\iff p\_G(k) = 0
> 
> > 即`图G的色数`即为`使得图G的多项式非零的最小的非负整数`
> 
> *   p\_{K\_n}(k) = (k)(k-1)(k-2)\\cdots(k - n + 1) = \[k\]\_n
>     
> *   p\_{Nn}(k) = k^n
>     
> *   p\_{T\_n}(k) = (k)(k-1)^{n-1}
>     
>     > 任何树都可以通过 `不断加入边`来进行构造：
>     > 
>     > 首先，加入`树根`，对于树根的着色有 `k种选择`。
>     > 
>     > 之后，加入的`任何顶点`都`只需要和与之邻接的那个顶点`的颜色不同即可，所以对于`任何非树根节点`有`k-1种选择`
>     

G = (V, E) \\quad n \\ge 1 \\implies p\_G(k) \\t{ is a \\b{polynomial}}

* * *

\\r{\\alpha \\define \\s{x,y} \\in G}

*   设G\_1：删除边\\r{\\alpha}的图G

则U \\define V - x - y, G\_1 \\define G\_U

则p\_{G\_1}(k) = C(k) + D(k)

其中：C(k)表示`x和y颜色相同的着色`，D(k)表示`x和y颜色不同的着色`

则\\r{p\_G(k) = D(k)}

*   设G\_2：将x和y视为同一顶点的图G

则\\r{p\_{G\_2}(k) = C(k)}

> 因为x和y是`邻接的`，而且假设为有`相同颜色`，则我们不妨：将`连接x和y的边`\\alpha 缩短为`无穷小`，直到`顶点x`和`顶点y`等效于`重叠`。

* * *

综上，

> 直观地说：`G的k着色数` = `G中删除边{x, y}使得x和y可能被着色为相同颜色的着色数` - `G中将x和y着色为相同数量的着色数`
> 
> 我们可以通过`对图G进行` `删除边`和`合并顶点`这2个操作，直到得到`零图`，从而可以计算`图G的色多项式`
> 
> > 更具体地，`图G的色多项式`是关于k^p的多项式

* * *

##### Construct Chromatic Polynomial

> `带符号图 (Signed Graph)`：(\\pm, G)

\\G

*   \\mathcal{G} \\define \\s{(+, G)}
    
*   \\exists H \\subseteq \\mathcal{G}, H \\ne N\_{H}
    
    *   \\t{SELECT } \\t{signed graph } (\\epsilon, H) \\t{ AND an edge } \\alpha \\t{ from } H
    *   \\mathcal{G} - (\\epsilon, \\b{H}), \\mathcal{G} \\cup (\\epsilon, \\b{H\_{\\ominus\\alpha}})\\cup(\\epsilon, \\b{H\_{\\otimes\\alpha}})
*   p\_G(k) \\define \\sum\_{\\forall (\\epsilon, H) \\in \\mathcal{G}}{\\epsilon k^p}
    

#### Theory 8

* * *

若 K\_r 是 `完全图` \\implies H 的所有顶点的颜色都不同。

且对于 `H中顶点的每一种颜色选择`，都可以拓展到对`G的剩余顶点的`q(k) `种着色`：

p\_G(k) = \[k\]\_r \\r{\\times} q(k)

> 可以看作：先对 `G中的` K\_r 进行着色，然后再对 `G中的剩余顶点`进行着色。

#### Theory 9

> `关节集 (Articulation Set)`
> 
> > `完全图`没有`关节集`

* * *

首先，G\_{V-U} 依照 `关节集`U 将 `图G` `分解`为一些 `连通分量`。

然后，H\_i 表示的将 `每个连通分量的顶点集`与`关节集`U 的`并集` 来 `导出图G的子图`

> 应注意到，H\_i均包含U中的顶点，但除了这些顶点外，`其他剩余顶点`都`两两不相交`。
> 
> `关节集` U 实际上已经将 `图` G 分解为 `一些连通分量`G\_{U\_1}, \\cdots, G\_{U\_t}，这些`连通分量`之间的`顶点`都`两两互不相邻`。
> 
> 而对于H\_i来说， `关节集`U则是`这些连通分量`唯一的`中介 (在图G中这些连通分量互相连通的唯一途径)`（也是H\_i之间唯一所共同含有的 `顶点集`）

## Plane and Planar Graph

### Definition

若G = (V, E)是 `平面图`：

该图的 `平面表示` G'

*   G'也是 `平面图`
*   G'的顶点称为 `顶点点 (Vertex-Point)`：对应于 G 中的顶点
*   G'的边称为 `边曲线 (Edge-Curve)`：对应于G中的边

> `平面表示`将 `平面 (Plane)` `划分`为由一条或若干条 `边曲线`所围成的 `区域`

> `边曲线`的计数方法：类似于 `欧拉迹`，首先在 `要被计数的区域`中 `任选一个顶点`，然后将 `笔`放在该顶点上，`不让笔离开纸面地移动笔`直到`该区域所有边都被访问过`
> 
> > 与 `欧拉迹`不同的是：我们实际上，允许 `重复访问相同的边`，只需 `走回头路`即可，但请记住 `重复走的边`也一样要被 `计数`

> 对于 `无穷区域`：由于 `无穷区域` 可以向 `任意方向进行无穷拓展` ，故我们可以将 `二维平面的无穷区域`放置到 `三维空间的巨型球体`上，此时定义 `无穷远`为 `球的北极点/南极点`

### Theory

#### Theory 1: Euler's Formula

* * *

*   若 `图G`为 `树`

\\because n \\t{ vertex-point}, n-1 \\t{ edge-curve}, 1 \\t{ area}

*   若 `图G`不是 `树`

因为 `图G` 是 `连通图` \\implies `图G`有 `生成树` T \\implies 每为T添加 `一条边`，则会 `形成一个圈`：因为 `这个圈`把 `原先的无穷区域` 划分为 `两个部分`（`无穷区域`+`新增的内部区域`）\\implies (r + \\r{1}) = (e+\\r{1}) - n +2

\\qed

#### Theory 2: Extended Euler's Formula

* * *

设 G' 是 G的 `平面表示`

\\because G没有环

\\therefore G'中的 `任何区域`都无法用 `一条边曲线` 来表示边界

\\because G没有多重边

\\therefore G'中的 `任何区域`都无法用 `两条边边曲线`来表示边界 （除非 G 只有唯一的一条边）

> 若 G'是有n个 `顶点点`， e条 `边曲线`，r个 `区域`的 `平面图`。
> 
> 设f\_1, f\_2, \\cdots, f\_r 表示 `各个区域的边曲线数`，则有：
> 
> \\r{f\_1 +f\_2 + \\cdots + f\_r = 2e}

\\therefore f\_i \\ge 3 \\implies 2e \\ge 3r \\implies \\frac{2e}{3} \\ge r = \\b{e - n +2}

\\therefore e \\le 3n - 6

设 d\_1, \\cdots, d\_n为 `图G中顶点的度数`，则

d\_1 + \\cdots + d\_n = 2e

则 `图G的顶点的平均度数`为

\\r{\\frac{d\_1+\\cdots+d\_n}{n}} = \\frac{2e}{n} \\le \\frac{6n-12}{n} \\r{\\lt 6}

*   Example
    
    *   G = \\b{K\_n} \\implies G \\t{ is a \\b{planar graph}} \\iff \\b{e \\le 3n -6}
    *   G = \\b{K\_{p,q}} \\implies G \\t{ is a \\b{planar graph}} \\iff \\b{e \\le 2n - 4}

#### Theory 3

> *   边的细分 (Subdivision)
> 
> 对 `边`\\alpha = \\s{x, y} 的 `细分`指的是，用 \\s{x,z} 和 \\s{z, y} 代替 \\alpha
> 
> > 也可以看作，在\\alpha中 `插入新的顶点`
> 
> 我们称 `图H`是 `图G的细分`：可以通过对 `图G`进行 `细分`来得到 `图H`
> 
> *   边的收缩 (Contraction)
> 
> 对 `边`\\alpha = \\s{x, y} 将 `顶点x` 和 `顶点y` 进行`合并`。

## Five-Color Theorem

### Definition

> 事实上，`Four-Color Theorem`已被证明。

> K\_5不是 `平面图` \\implies `平面图`不能包含 `每对顶点都邻接的5个顶点`

### Proof

G \\define \\lb{& (V, E), V = n \\\\ & \\text{ is a \\b{planar graph}} }

*   n \\le 5 \\implies \\mathcal{X}(G) \\le 5
*   n \\gt 5

### Theory

#### Theory 1

#### Theory 2

#### Theory 3

* * *

*   p = 1，可以通过对 `图G的每一条边`都进行 `收缩`，最终得到 K\_1
    
*   p = 2，可以通过对 `图G的除了一条边外的所有边`都进行 `收缩`，最终得到 K\_2
    
*   p = 3，\\because \\mathcal{X}(G) = 3 \\implies `图G` 有 `一条长度为奇数的圈` 。
    
    设 \\gamma 是 `图G中的长度最小的奇数圈` \\implies 只有 `连接` \\gamma `中的顶点的边`才是 `真正属于` \\gamma `的边` \\implies 我们不断 `收缩图G中除` \\gamma `的边之外的所有边`
    
    \\implies 最终得到 K\_3
    
    > 注意，`连接`是 `图论`里的一个术语：只有 `边的2个顶点`都 `属于路径` \\gamma 才能算作 `连接`。
    > 
    > 换句话说，`该边的两个顶点`必须 `都来自路径` \\gamma
    

## Independent Number & Clique Number

### Independent Number

#### Definition

若 \\G，我们称 U \\subseteq V 为 `独立集`：U中的 `任何两个顶点` 都不 `邻接`

> *   由 `独立集`所给出的 `图G`的 `导出子图` G\_U 是 `零图`
> *   `色数` \\mathcal{X}(G)是使得 `图G的顶点`能够被分成 `k个独立集`的 `最小整数k`

`图G的独立数` \\alpha(G)：`图G`的 `所有独立集`中 `顶点的最大个数`

> *   `独立数`是 `图G的顶点着色`中，`具有相同颜色的顶点`的 `最大个数` ：\\mathcal{X}(G) \\ge \\roundup{\\frac{n}{\\alpha(G)}}
> *   ，\\alpha(N\_n) = n,\\alpha(K\_n) = 1，\\alpha(K\_{m,n}) = max\\s{m, n}

### Domination Set

#### Definition

> 若 G = (V,E)，U是 `该图的顶点的独立集` 且 `不是任何更大的独立集的子集`。
> 
> 则：U 中的 `任何两个顶点`都不 `邻接`，`不在U中的顶点`都 `至少与U中的一个顶点` `邻接`，
> 
> 我们将具有 `这种性质`的 `顶点集合`称为 `图G` 的 `控制集` W

`图G的控制集 (Domination Set)` W 是 `图G`的 `一个顶点集合`，满足：`图G中不在W中的顶点` 至少与 `W中的一个顶点`相 `邻接`。

> 任何包含 `控制集`的 `顶点集`也是 `控制集`

`图G的控制数 (Dominating Number)` dom(G)： `图G`的 `控制集的最少顶点数`

*   dom(N\_n) = n, dom(K\_n) = 1,dom(K\_{m,n})\\quad m,n \\ge 2 = 2

#### Theory

##### Theory 1

* * *

*   Proof 1

由于 `图G`是 `连通图` \\implies 图G中的 `任何顶点` 都 `存在一个顶点与之`相 `邻接`，

不妨设 `连接这两个顶点的边`中，`其中边的一个顶点` 属于 `控制集`， `边的另一个顶点` 不属于`控制集`。

*   Proof 2

设 T是 G的一颗 `生成树` \\r{\\implies dom(G) \\le dom(T)}

使用 `归纳法`：

1.  n = 2 \\implies T的`两个顶点`都是 `控制集`
    
2.  n = 3
    
    设 y 是 `与悬挂顶点` x `相邻接的顶点`，T^\* 是 `从T中删除顶点y和所有与y关联的边而得到的图`
    
    \\implies T^\*的 `连通分量` 是 `树`，且 `这些树`之中`至少有一颗` `阶数为1的树`（如：`顶点x`）
    
    \\implies设 \\r{T\_1,\\cdots, T\_k}是 `阶数至少为2的树`，则他们的 `阶数`为 \\r{n\_1 \\ge 2, \\cdots ,n\_k \\ge 2}
    
    \\implies 由 `归纳假设`，每个 T\_i 有一个 `大小至多为` \\rounddown{\\frac{n\_i}{2}} `的控制集`
    
    \\implies `这些控制集的并`给出 `一个T的大小至多为` \\rounddown{\\frac{n}{2}} `的控制集`
    
    > 1 + \\rounddown{\\frac{n\_1}{2}} + \\cdots + \\rounddown{\\frac{n\_k}{2}} \\le 1 +\\rounddown{\\frac{n\_1+\\cdots+n\_k}{2}} \\le 1 + \\rounddown{\\frac{\\r{n-2}}{2}} = \\rounddown{\\frac{\\r{n}}{2}}
    

### Clique Number

#### Definition

`图G的团 (Clique)`： `图G的顶点的子集` U，使得在U中的 `每一对顶点` 相互 `邻接`

*   U = n, G\_U = K\_n

`图G的团数 (Clique Number)` \\omega(G)：`图G`的 `团的顶点的最大数目`

*   \\omega(N\_n) = 1, \\omega(K\_n) = n, \\omega(K\_{m,n}) = 2
*   \\r{\\alpha(G) = \\omega(\\overline{G}), \\omega({G}) = \\alpha(G)}

`图G的团划分 (Clique Partition)`：将 `图G的顶点` 划分为 `团`的 `一个划分`

`图G的团划分数 (Clique Partition Number)` \\theta(G)：`图G的团划分`中 `最小的团数`

*   \\r{\\theta(G) = \\mathcal{X}(\\overline{G}), \\mathcal{X}(G) = \\theta(\\overline{G}) }

`图G是` \\mathcal{X} `完美的 (Perfect)`：若对于 `图` G `的所有导出子图` H ，有 \\c{hotpink}{\\mathcal{X}(H) = \\omega(H)}

`图G是` \\theta `完美的 (Perfect)`：若对于 `图` G `的所有导出子图` H ，有 \\c{hotpink}{\\theta(H) = \\alpha(H)}

#### Theory

##### Theory 1

### Chord & Chordal Graph

#### Definition

`图G的圈的弦 (Chord)`：连接 `该圈` 的 `两个非连续顶点` 的 `一条边`

> 注意：`弦`是连接 `圈上两个顶点的边`，但 `弦`本身不是 `这个圈的边`

`弦图`：任何 `长度大于3的圈`都有 `弦`的图

> `长度等于3的圈`必定 `没有弦`

#### Theory

##### Theory 1

> `实直线`上的 `闭区间` 记为：\[a, b\] = \\s{x: a \\le x \\le b}
> 
> 若设 `闭区间族`：I\_1 = \[a\_1, b\_1\], I\_2 = \[a\_2, b\_2\], \\cdots, I\_n = \[a\_n, b\_n\]
> 
> `区间图 (Interval Graph)` ：`顶点集合` 为 \\s{I\_1, \\cdots, I\_n}， `顶点` I\_i和 I\_j `邻接` 当且仅当 I\_i \\cap I\_j \\ne \\varnothing

每个 `区间图`都是 `弦图`。

：

##### Theory 2

* * *

##### Theory 3

> `极小关节集`：`真子集`不是 `关节集`的 `关节集`

* * *

*   若 G\_U不是 `完全图`，则得到矛盾：

若 `a` 和 `b` 是 `U中两个不邻接的顶点`。

则因为 `U是关节集`，所以 G\_{V-U}中至少有两个 `连通分量`： G\_1 = (U\_1, E\_1) 和 G\_2 = (U\_2, E\_2)

如果 `a`不与 G\_1 `中任何顶点邻接` \\implies U - \\s{a} 也是一个 `关节集`

\\because U 是一个 `极小关节集`，则 `a` 必定至少与 U\_1 `中的一个顶点` 邻接。

类似的，可证明：a 至少与 U\_2 中的一个顶点邻接。

同理，对b也有结论：

b 至少与 U\_1中的一个顶点邻接

b至少与 U\_2 中的一个顶点邻接

\\because G\_1和 G\_2 是连通的

\\therefore 存在一条 `连接a到b的路径` \\gamma\_1，该路径中 不同于a和b的所有顶点都属于 U\_1

\\therefore 存在一条 `连接b到a的路径` \\gamma\_2，该路径中 不同于a和b的所有顶点都属于 U\_2

\\therefore 我们可以选择 \\gamma\_1 和 \\gamma\_2，使其长度最短：\\gamma = \\gamma\_1, \\gamma\_2

故 \\gamma 是 G中的一个圈且长度至少等于4,

由于 \\gamma\_1和 \\gamma\_2 具有最短的长度，所以 \\gamma 的弦只可能 `连接a和b的边`

\\because 选择的a和b是非邻接的

\\therefore \\gamma = \\gamma\_1, \\gamma\_2 没有弦的结论

而这与 `图G是弦图`矛盾。

##### Theory 4

每个 `弦图` 都是 `完美的 (Perfect)`

* * *

##### Theory 5

每个 `区间图` 都是 `完美的`。

### Matching Number

#### Definition

`匹配集 (Matching Set)` M：是 `图G`的一个 `边集`，使得 `没有任何两条边`有 `公共顶点`

`匹配` M 与 `顶点` x `相遇 (Encouter)`：匹配集`中的`唯一一条边包含`这个`顶点\`

`图G的完美匹配 (Perfect Matching)`：能`与图G的所有顶点相遇`的 `匹配集`

`图G的匹配数 (Matching Number)` \\rho(G)：`图G` 的 `匹配`中的 `最大的边数`

*   n \\b{\\t{ is even: }}\\rho(K\_n) = \\rounddown{\\frac{n}{2}}, \\rho(C\_n) = \\rounddown{\\frac{n}{2}}, \\rho(P\_n) = \\rounddown{\\frac{n}{2}}
*   \\rho(K\_{m,n}) = min\\s{m, n}

#### Theory

##### Thoery 1

##### Theory 2

> `图G的边覆盖` W：若 `图G的顶点集合V`的子集 W，满足： `图G的每一条边`至少有 `一个顶点`在 W中，则称 W是 `图G`的一个 `边覆盖`
> 
> *   对于有 `二划分` X 和 Y 的二分图，X 和 Y 就是该图的 2个`覆盖`
> 
> `覆盖数` c(G)：`图G`的 `顶点数最少的覆盖`的 `顶点数`
> 
> *   c(K\_n) = n - 1

* * *

##### Thoery 3

> 即 `图G`中：`匹配中边的最大数量` = `覆盖中顶点的最少数量`

* * *

##### Theory 4

> *   G\_{V\\backslash U} = (V \\backslash U, E)
> *   oc = \\t{the number of odd-component}, ec = \\t{the number of even-component}

* * *

##### Theory 5

### Connectivity

#### Vertex-Connectivity

##### Definition

*   `非完全图的连通度` = `关节集的最少顶点数`
    
*   G \\ne K\_n \\implies \\kappa(G) \\le \\b{n - 2}
    

`图G是k连通的`：\\kappa(G) \\ge k

> 注：我们按照 \\kappa(G) = 0来判断 `图G`是否是`连通的`。
> 
> 所以 `平凡图` 是 `不连通的`！

`关节顶点 (Articulation-Vertex)`：`删除`该 `顶点`后，`图G`将失去 `连通性`

##### Theory

###### Theory 1

#### Edge-Connectivity

##### Definition

##### Thoery

###### Theory 1

* * *

###### Theory 2

> 我们要求 V \\ge 3，因为 K\_2 并不满足 `2连通性`

###### Theory 3

> `图G的块 (Block)`： `连通的` 且 `没有关节顶点`的 `图G的极大导出子图` G\_U
> 
> *   K\_2 也是 `块`，所以实际上，任何一条 `边`都是 `块`

* * *

###### Theory 4

* * *

###### Theory 5

###### Theory 6