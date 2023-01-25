---
title: "[Combinatorics] Graph Basics II"
date: 2022-04-16 19:36:00
tags:
  - combinatorics
---

# Advanced Graph

{% raw %}
$$
\boxed{MACRO}
% Color %
\newcommand\c[2]{\textcolor{#1}{#2}}
\newcommand\r[1]{\textcolor{red}{#1}}
\newcommand\g[1]{\textcolor{green}{#1}}
\newcommand\b[1]{\textcolor{blue}{#1}}
\newcommand\red[1]{\textcolor{red}{#1}}
\newcommand\blue[1]{\textcolor{blue}{#1}}
\newcommand\green[1]{\textcolor{green}{#1}}
\newcommand\black[1]{\textcolor{black}{#1}}
\newcommand\white[1]{\textcolor{white}{#1}}
\newcommand\cyan[1]{\textcolor{cyan}{#1}}
\newcommand\magenta[1]{\textcolor{magenta}{#1}}
\newcommand\yellow[1]{\textcolor{yellow}{#1}}
\newcommand\orange[1]{\textcolor{orange}{#1}}
\newcommand\lime[1]{\textcolor{lime}{#1}}
\newcommand\pink[1]{\textcolor{pink}{#1}}
\newcommand\darkgray[1]{\textcolor{darkgray}{#1}}
\newcommand\gray[1]{\textcolor{gray}{#1}}
\newcommand\lightgray[1]{\textcolor{lightgray}{#1}}
\newcommand\brown[1]{\textcolor{brown}{#1}}
\newcommand\olive[1]{\textcolor{olive}{#1}}
\newcommand\purple[1]{\textcolor{purple}{#1}}
\newcommand\teal[1]{\textcolor{teal}{#1}}
\newcommand\violet[1]{\textcolor{violet}{#1}}
\newcommand\hotpink[1]{\textcolor{hotpink}{#1}}
\newcommand\blueviolet[1]{\textcolor{blueviolet}{#1}}
\newcommand\navyblue[1]{\textcolor{navyblue}{#1}}
\newcommand\peach[1]{\textcolor{Peach}{#1}}
\newcommand\orangeRed[1]{\textcolor{OrangeRed}{#1}}
\newcommand\salmon[1]{\textcolor{Salmon}{#1}}
\newcommand\skyblue[1]{\textcolor{SkyBlue}{#1}}
\newcommand\springreen[1]{\textcolor{SpringGreen}{#1}}
\newcommand\aqua[1]{\textcolor{aqua}{#1}}
\newcommand\navy[1]{\textcolor{navy}{#1}}
\newcommand\silver[1]{\textcolor{silver}{#1}}
\newcommand\fuchsia[1]{\textcolor{fuchsia}{#1}}
\newcommand\maroon[1]{\textcolor{maroon}{#1}}
\definecolor{luo}{RGB}{102,204,255}
\definecolor{miku}{RGB}{57,197,187} 
\newcommand\luo[1]{\textcolor{luo}{#1}}
\newcommand\miku[1]{\textcolor[miku]{#1}}

% Typography %
\newcommand\a[1]{\begin{aligned}#1\end{aligned}}
\newcommand\t[1]{\text{#1}}
\newcommand\lb[1]{\left\{\begin{aligned} #1 \end{aligned}\right.}
\newcommand\rb[1]{\left.\begin{aligned} #1 \end{aligned}\right\}}
\newcommand\env[2]{\begin{#1}#2\end{#1}}

% Misc %
\newcommand\s[1]{\{#1\}}
\newcommand\qed{\quad\square}
\newcommand\define{\dot{=}}
\newcommand\then{\implies}
\newcommand\rounddown[1]{\lfloor{#1}\rfloor}
\newcommand\roundup[1]{\lceil{#1}\rceil}
\newcommand\graph[4]{#1 = (#2, #3) \quad |#2| = #4}
\newcommand\G{G = (V, E) \quad |V| = n}
\newcommand\so{\therefore}
\newcommand\comment[1]{\quad\text{(#1)}}
\newcommand\note[1]{\quad\text{(#1)}}
\newcommand\bt[1]{\boxed{\text{#1}}}
\newcommand\max[1]{\textbf{ max } \{#1\} }
\newcommand\min[1]{\textbf{ min } \{#1\} }
\newcommand\IF{\textbf{ IF }}
\newcommand\if{\textbf{ if }}
\newcommand\IS{\textbf{ IS }}
\newcommand\is{\textbf{ is }}
\newcommand\but{\textbf{ but }}
\newcommand\however{\textbf{ however }}
\newcommand\AND{\textbf{ AND }}
\newcommand\OR{\textbf{ OR }}
\newcommand\NOT{\textbf{ NOT }}
\newcommand\THEN{\textbf{ THEN }}
\newcommand\IN{\textbf{ IN }}
\newcommand\NOTIN{\textbf{ NOT-IN }}
\newcommand\assume{\textbf{ Assuming that: }}
\newcommand\contradictory{\textbf{ Thus lead to contradiction }}
\newcommand\proof{\textbf{Proof: }}
\newcommand\st{\text{ such that }}
\newcommand\hold{\text{ holds }}
\newcommand\lhs{\text{ LHS }}
\newcommand\rhs{\text{ RHS }}
\newcommand\wlg{\text{ Without loss of generality }}
\newcommand\nb{\text{ nota bene }}
\newcommand\analogously{\text{ analogously }}
\newcommand\viceversa{\textbf{ viceversa }}
\newcommand\let{\textbf{ let }}
\newcommand\as{\textbf{ as }}
\newcommand\for{\textbf{ As for }}
\newcommand\select{\textbf{ SELECT }}
\newcommand\m[1]{\mathit{#1}}
\newcommand\+[1]{\mathcal{#1}}
\newcommand\warnning[1]{\colorbox{Blue}{\textcolor{Yellow}{#1}}}
\newcommand\error[1]{\colorbox{Black}{\textcolor{White}{#1}}}
$$

{% endraw %}

## Chromatic Number

### Definition

若`图`$G = (V,E )$。

`图`$G$的`k顶点着色 (k着色)`：从`含有k种颜色的集合`中选择`颜色`，对`图G`的每一个`顶点`指定一种`颜色`，使得`相邻顶点`有`不同颜色`。

> 注意：`k顶点着色`并不要求`k种颜色`都必须要使用到。

`图`$G$是`k可着色的`：如果图$G$存在一个`k顶点着色`

`图`$G$的`色数 (Chromatic Number)`$\mathcal{X}(G)$：

- 使得`图`$G$是`k可着色的`中的`最小的k`称为图$G$​的`色数`
- 使得 `所有的顶点`可 `划分` 为 `k个子集`且 `每个子集的导出子图均为零图`的 `最小整数k`

---

`图`$G$的 `色划分 (Color Partition)`$\mathcal{V}$ ：若$V_i \quad (i = 1,2,\cdots,k)$表示 `被指定为颜色i的所有顶点的子集`，则 $\mathcal{V} = \s{V_1, V_2, \cdots, V_k}$是$V$的 `划分`。

> `色划分的元素的导出子图`：$G_{V_1}, G_{V_2}, \cdots, G_{V_k}$ 均为 `零图`

### Theory

#### Theory 1

> `零图 (Null Graph)`$N_n$：没有 `任何边`的图。(含有n个顶点)
>
> `空图 (Empty Graph)`$N_0$：没有 `任何顶点`的图。（含有0个顶点）
>
> > `零图` 不一定是 `空图`：因为 `零图`可以仅仅包含一堆 `孤立的点`
> >
> > `空图`是 `0阶零图`

若$G = (V, E) \quad n \ge 1$，则$1 \le \mathcal{X}(G) \le n$

并且有：

- $\mathcal{X}(G) = n \iff G = K_n$
- $\mathcal{X}(G) = 1 \iff G = N_n$

---

- 若$G = K_n \implies$ 所有的 `顶点`都互相 `邻接`，故所有顶点的颜色都不同，需要 `n种颜色`

- 若$G = N_n \implies$所有的顶点都是 `孤立的`，没有 `任何两个顶点之间存在邻接`，所以仅需要 `1种颜色` 。

  > 如果$G \ne N_n \implies$ `至少有2个顶点是邻接的`$\implies$ $\mathcal{X}(G) \ge 2 \ne 1$

> 推论：若$G \ne K_n \implies$ 至少存在 `两个顶点之间不邻接` $\implies$ 这 `两个顶点`可以着色 `相同颜色` $\implies$ $ 1 \le \mathcal{X}(G \ne K_n) \le n - 1$

#### Theory 2

$G = (V, E), H \subseteq G \implies \mathcal{X}(G) \ge \mathcal{X}(H)$

> $\if \exists H = K_p,\then \mathcal{X}(G) \ge p$
>
> 可以利用该推论快速地确定 `图G的色数的一个不严格下界`

#### Theory 3

$$
\lb{
&G = (V, E), \quad|V|= n \\ 
&\b{q} \t{ is the \b{max-imum integer} that meets: } N_q \t { is \b{exported} from } G 
}
\implies \mathcal{X}(G) \ge \lceil \frac{n}{q} \rceil
$$

---

> 因为$q$是 `G中导出子图中的所有零图里，阶数最大的零图`$\implies$ 我们使用`任何1种颜色`可以`至多着色图G中的q个顶点`
>
> $\implies$ 我们 `至少` 使用$\lceil \frac{n}{q} \rceil$ 种颜色即可 `着色图G中的所有顶点` $\implies$ $\mathcal{X}(G) \ge \lceil \frac{n}{q} \rceil$ 

$$
\a{
& \mathcal{X}(G) \define k, \mathcal{V} \define \s{V_1, V_2, \cdots, V_k} \\
& \implies \forall i, |V_i| \le q \\
& \implies n = |V| = \sum_{i = 1}^{k}{|V_i|} \b{\le \sum_{i=1}^{k}{q} = k \times q} \\
&&\qed
}
$$

> $\mathcal{X}(G) \ge \roundup{\frac{n}{q}}$对于$\G$ 隐含2个信息：
>
> - 使用 `任何一种颜色`可以 `至多着色图G中的q个顶点`
> - `图G中每q+1个顶点之中，至少有q个顶点相互邻接`



#### Theory 4

$$
\a {
& \G \\
& |E| \ge 1
} \implies {
\mathcal{X}(G) = \b{2} \iff G \t{ is \b{bipatite graph }} 
}
$$

---

- $E = 0 \implies G = N_0 \implies \mathcal{X}(G) = 1$
- $E \ge 1 \implies \mathcal{X}(G) = 2 \implies \mathcal{V} = \s{V_1, V_2} \t{ is a partition of } V$ 

反之同理 $\qed$

> $$
> \lb {
> & G \t { is non-null graph} \\
> & \mathcal{X}(G) = 2
> } \iff \forall \t{cycles in } G \t{ has \b{even length}}
> $$

#### Theory 5: A Greedy Method to Solve the Vertex Coloring

$G = (V, E), V = \s{x_1, x_2, \cdots ,x_n}$

- 对$x_1$指定 `颜色1`
- 对每个$i = 2, 3, \cdots, n$：令$p$是与$x_i$邻接的顶点$x_1, x_2,\cdots,x_{i-1}$ 中 `任何顶点`都不被着色为 `p`的 `最小颜色`，并对$x_i$ 指定 `颜色p`



若$\G$，其 `顶点的最大度`$\Delta$，则该方法产生一个 `图G的`$(\Delta + 1)$ `着色`：$\mathcal{X}(G) \le \Delta +1$

> $\mathcal{X}(G) = \Delta + 1$时，即 `图G`是 `星 (Star)`

> 该 `贪心算法` 并不保证产生的 `图的着色`是 `最优着色`：这取决于 `如何编号图G的顶点`
>
> > 更具体地，如果我们按照 $\mathcal{V} = \s{V_1, V_2, \cdots V_{\mathcal{X}(G)}}$的 `顺序`来 `编号`顶点，则该方法会 `只用颜色1来涂色` $V_1$ `中的顶点`，然后 `只用颜色1和颜色2来涂色` $V_2$ `中的顶点`，...，`只用颜色1，颜色2，..., 颜色`$\mathcal{X}(G)$ `来涂色` $V_{\mathcal{X}(G)}$ 。最终可以得到 `最优的图G的着色`



#### Theory 6: Brooks Theorem

若 `图G`是 `连通图`，其 `顶点的最大度` $\Delta$。如果 `图G` 既不是 `完全图` $K_n$， 也不是 `奇数阶循环图` $C_n$ $\implies \mathcal{X}(G) \le \Delta$



#### Theory 7: Chromatic Polynomial

> `图G的色多项式`$p_G(k)$：即`图G的k顶点着色`的`方案数`
>
> 如果$\mathcal{X}(G) \gt k \iff p_G(k) = 0$
>
> > 即`图G的色数`即为`使得图G的多项式非零的最小的非负整数`
>
> - $p_{K_n}(k) = (k)(k-1)(k-2)\cdots(k - n + 1) = [k]_n$
>
> - $p_{Nn}(k) = k^n$
>
> - $p_{T_n}(k) = (k)(k-1)^{n-1}$
>
>   > 任何树都可以通过 `不断加入边`来进行构造：
>   >
>   > 首先，加入`树根`，对于树根的着色有 `k种选择`。
>   >
>   > 之后，加入的`任何顶点`都`只需要和与之邻接的那个顶点`的颜色不同即可，所以对于`任何非树根节点`有`k-1种选择`

$G = (V, E) \quad n \ge 1 \implies p_G(k) \t{ is a \b{polynomial}}$

---

$\r{\alpha \define \s{x,y} \in G}$

- 设$G_1$：删除边$\r{\alpha}$的图$G$

则$U \define V - x - y, G_1 \define G_U$

则$p_{G_1}(k) = |C(k)| + |D(k)| $

其中：$|C(k)|$表示`x和y颜色相同的着色`，$|D(k)|$表示`x和y颜色不同的着色`

则$\r{p_G(k) = |D(k)|}$

- 设$G_2$：将$x$和$y$视为同一顶点的图$G$

则$\r{p_{G_2}(k) = |C(k)|}$

> 因为x和y是`邻接的`，而且假设为有`相同颜色`，则我们不妨：将`连接x和y的边`$\alpha$ 缩短为`无穷小`，直到`顶点x`和`顶点y`等效于`重叠`。

---

综上，
$$
\boxed{\t{Chromatic Polynomial}} \\
\a{
\b{p_G(k)} &\b{=p_{G_1}(k) - p_{G_2}(k)} \\
&= p_{G\ominus\alpha}(k) - p_{G\otimes\alpha}(k)
}
$$

> 直观地说：`G的k着色数` = `G中删除边{x, y}使得x和y可能被着色为相同颜色的着色数` - `G中将x和y着色为相同数量的着色数`
>
> 我们可以通过`对图G进行` `删除边`和`合并顶点`这2个操作，直到得到`零图`，从而可以计算`图G的色多项式`
>
> > 更具体地，`图G的色多项式`是关于$k^p$的多项式

---

##### Construct Chromatic Polynomial

> `带符号图 (Signed Graph)`：$(\pm, G)$

$\G$

- $\mathcal{G} \define \s{(+, G)}$
- $\exists H \subseteq \mathcal{G}, H \ne N_{|H|}$
  - $\t{SELECT } \t{signed graph } (\epsilon, H) \t{ AND an edge } \alpha \t{ from } H$
  - $\mathcal{G} - (\epsilon, \b{H}), \mathcal{G} \cup (\epsilon, \b{H_{\ominus\alpha}})\cup(\epsilon, \b{H_{\otimes\alpha}})$
- $p_G(k) \define \sum_{\forall (\epsilon, H) \in \mathcal{G}}{\epsilon k^p}$



#### Theory 8

$$
\lb {
& \G \\
& H = \b{K_r} \subseteq G
} \implies p_{K_r}(k) \b{|} p_{G}(k)
$$

---

若 $K_r$ 是 `完全图` $\implies$ $H$ 的所有顶点的颜色都不同。

且对于 `H中顶点的每一种颜色选择`，都可以拓展到对`G的剩余顶点的`$q(k)$ `种着色`：

$p_G(k) = [k]_r \r{\times} q(k)$

> 可以看作：先对 `G中的` $K_r$ 进行着色，然后再对 `G中的剩余顶点`进行着色。



#### Theory 9

> `关节集 (Articulation Set)`
> $$
> \lb {
> & G = (V, E) \t{ is connected} \\
> & U \subseteq V
> } \implies \t{the \b{exported graph }} \b{G_{V-U}} \t{ is non-connective} \iff \b{U} \t { is an \b{articulation set}}
> $$
>
> > `完全图`没有`关节集`

$$
\lb {
& \G \\
& U \t{ is an \b{articulation set} of graph } G \\
& \r{G_U = K_r} \\
& \t{the \b{connective components} of } \g{G_{V-U} \t{ is } G_{U_1}, \cdots G_{U_t}} \\
& \g{H_i = G_{U \cup U_i} \quad(i = 1, \cdots, t)} 
} \implies 
\lb {
& \r{p_{G}(k) = \frac{p_{H_1}(k)\times\cdots\times p_{H_t}(k)}{([k]_r)^{t-1}}} \\
& \mathcal{X}(G) \t{ is the \b{max-imum} } \mathcal{X}(H_i)
}
$$

---

首先，$G_{V-U}$ 依照 `关节集`$U$ 将 `图G` `分解`为一些 `连通分量`。

然后，$H_i$ 表示的将 `每个连通分量的顶点集`与`关节集`$U$ 的`并集` 来 `导出图G的子图`
$$
\a {
p_G{k} = \underbrace{\r{p_{H_1}(k)}}_{\t{I \r{can} assign the color to } G_U} \times \underbrace{\g{\frac{p_{H_2}(k)}{[k]_r} \times \frac{p_{H_3}(k)}{[k]_r} \cdots \times \frac{p_{H_t}(k)}{[k]_r}}}_{\t{we \g{have to follow} the color assignment to } G_U} 

}
$$

> 应注意到，$H_i$均包含$U$中的顶点，但除了这些顶点外，`其他剩余顶点`都`两两不相交`。
>
> `关节集` $U$ 实际上已经将 `图` $G$ 分解为 `一些连通分量`$G_{U_1}, \cdots, G_{U_t}$，这些`连通分量`之间的`顶点`都`两两互不相邻`。
>
> 而对于$H_i$来说， `关节集`$U$则是`这些连通分量`唯一的`中介 (在图G中这些连通分量互相连通的唯一途径)`（也是$H_i$之间唯一所共同含有的 `顶点集`）



## Plane and Planar Graph

### Definition

若$G = (V, E)$是 `平面图`：

该图的 `平面表示` $G'$

- $G'$也是 `平面图`
- $G'$的顶点称为 `顶点点 (Vertex-Point)`：对应于 $G$ 中的顶点
- $G'$的边称为 `边曲线 (Edge-Curve)`：对应于$G$中的边

> `平面表示`将 `平面 (Plane)` `划分`为由一条或若干条 `边曲线`所围成的 `区域`

> `边曲线`的计数方法：类似于 `欧拉迹`，首先在 `要被计数的区域`中 `任选一个顶点`，然后将 `笔`放在该顶点上，`不让笔离开纸面地移动笔`直到`该区域所有边都被访问过`
>
> > 与 `欧拉迹`不同的是：我们实际上，允许 `重复访问相同的边`，只需 `走回头路`即可，但请记住 `重复走的边`也一样要被 `计数`

> 对于 `无穷区域`：由于 `无穷区域` 可以向 `任意方向进行无穷拓展` ，故我们可以将 `二维平面的无穷区域`放置到 `三维空间的巨型球体`上，此时定义 `无穷远`为 `球的北极点/南极点`



### Theory

#### Theory 1: Euler's Formula

$$
\boxed{\t{Euler's Formula}} \\
G \lb{
& \t{ is a \b{planar graph}} \\
& \t{ is \b{connective}} \\
& \t{ has \b{n vertex-point}} \\
& \t{ has \b{e edge-curve}} 
} \implies \t{the plane is \b{divided} into } \b{r = e - n + 2 \t{ areas}}
$$

---

- 若 `图G`为 `树`

$\because n \t{ vertex-point}, n-1 \t{ edge-curve}, 1 \t{ area}$

- 若 `图G`不是 `树`

因为 `图G` 是 `连通图` $\implies$ `图G`有 `生成树` $T$ $\implies$ 每为$T$添加 `一条边`，则会 `形成一个圈`：因为 `这个圈`把 `原先的无穷区域` 划分为 `两个部分`（`无穷区域`+`新增的内部区域`）$\implies (r + \r{1}) = (e+\r{1}) - n +2$

$\qed$



#### Theory 2: Extended Euler's Formula

$$
\boxed{\t{Extended Euler's Formula}} \\
\a {
G = (V, E) \lb{
& \t{ is a \b{planar graph}} \\
& \t{ is \b{connective}} \\
& \t{ has \b{no cycles}} \\
& \t{ has \b{no multiple-edge}}
}
} \implies \r{\exists} x \in V, deg(x) \le 5
$$

---

设 $G'$ 是 $G$的 `平面表示`

$\because$ $G$没有环

$\therefore$ $G'$中的 `任何区域`都无法用 `一条边曲线` 来表示边界

$\because$ $G$没有多重边

$\therefore$ $G'$中的 `任何区域`都无法用 `两条边边曲线`来表示边界 （除非 $G$ 只有唯一的一条边）

> 若 $G'$是有$n$个 `顶点点`， $e$条 `边曲线`，$r$个 `区域`的 `平面图`。
>
> 设$f_1, f_2, \cdots, f_r$ 表示 `各个区域的边曲线数`，则有：
>
> $\r{f_1 +f_2 + \cdots + f_r = 2e}$

$\therefore f_i \ge 3 \implies 2e \ge 3r \implies \frac{2e}{3} \ge r = \b{e - n +2}$

 $\therefore e \le 3n - 6$

设 $d_1, \cdots, d_n$为 `图G中顶点的度数`，则

$d_1 + \cdots + d_n = 2e$

则 `图G的顶点的平均度数`为

$\r{\frac{d_1+\cdots+d_n}{n}} = \frac{2e}{n} \le \frac{6n-12}{n} \r{\lt 6}$



- Example
  - $G = \b{K_n} \implies G \t{ is a \b{planar graph}} \iff \b{e \le 3n -6}$
  - $G = \b{K_{p,q}} \implies G \t{ is a \b{planar graph}} \iff \b{e \le 2n - 4}$



#### Theory 3

> - 边的细分 (Subdivision)
>
> 对 `边`$\alpha = \s{x, y}$ 的 `细分`指的是，用 $\s{x,z}$ 和 $\s{z, y}$ 代替 $\alpha$
>
> > 也可以看作，在$\alpha$中 `插入新的顶点`
>
> 我们称 `图H`是 `图G的细分`：可以通过对 `图G`进行 `细分`来得到 `图H`
>
> - 边的收缩 (Contraction)
>
> 对 `边`$\alpha = \s{x, y}$ 将 `顶点x` 和 `顶点y` 进行`合并`。

$$
G \t{ is a \b{planar graph}} \iff G \t{ don't \b{contains} \r{the subdivision of } } \r{K_5, K_{3,3}} \\
G \t{ is a \b{planar graph}} \iff G \t{ don't \b{contains} \r{the contraction of } } \r{K_5, K_{3,3}}
$$



## Five-Color Theorem

### Definition 

$$
\boxed{\text{Five-Color Theorem}} \\
G \t{ is a \b{planar graph}} \implies \mathcal{X}(G) \le 5
$$

> 事实上，`Four-Color Theorem`已被证明。

> $K_5$不是 `平面图` $\implies$ `平面图`不能包含 `每对顶点都邻接的5个顶点`



### Proof

$G \define \lb{& (V, E), |V| = n \\ & \text{ is a \b{planar graph}}  }$

- $n \le 5 \implies \mathcal{X}(G) \le 5$
- $n \gt 5$

$$
\a{
& \t{draw graph G as \b{a planar graph} \r{in a plane}} \\
& \because \exists x \in V, deg(x) \le 5 \\
& z \ne x, z \in V, \r{H \define G_{V - z} \implies H \text{ has a 5-coloring}}\\
& \t{if } deg(x) \lb{
&  \le 4,\t{ we can \b{assign a color to } x} \implies \t{we get \b{a 5-coloring of} }G \\

&  = 5 , \lb{&\t{we assign \b{different colors } to } \s{x,y_1}, \s{x, y_2}, \s{x, y_3}, \s{x, y_4}, \s{x,y_5 } \implies \t{the \b{color} of } y_j \t{ is } j(j = 1,2,3,4,5) \\
&\t{take the vertexes } \b{1} \t{ and } \b{3} \t{ into consideration} \lb {
& 1 \t{ and }3 \t{ are different \b{connective components} in } H_{1,3} \implies \t{we can get a 5-coloring of } G\\
& 1 \t{ and }3 \t{ are in the \r{same} \b{connective component} in } H_{1,3}  \implies \lb{
&\t{there is \r{a path from 1 to 3}: } \gamma \\
& \implies \t{the path \b{seperate the 3 vertexes }} y_1, y_2, y_5 \t{ into \r{2 parts }} \lb{
&\t{Case 1: 1 vertex inside }\gamma \t{, 2 vertexes outside } \gamma \\
&\t{Case 2: 2 vertexes inside }\gamma \t{, 1 vertex outside } \gamma}} 
} \\

&\implies \t{For Case1: take \b{the inside vertex 2} and \b{the outside vertex 4} for example} \\
&\implies \t{\b{the inside vertex 2} and \b{the outside vertex 4} \r{must in different connective components } of } H_{\t{2,4}} \\
& \implies \t{exchange the color 2 and 4 in \b{the connective compoent which contains }} \b{y_2} \\
& \implies \t{we can get a 5-coloring of } G}}}
$$



### Theory

#### Theory 1

$$
\lb{
& H = (U, F) \\
& H \text{ has a \b{k-coloring} } \mathcal{V} = \s{V_1, \cdots, V_k} \\
& V_{red} \in \mathcal{V}, V_{blue} \in \mathcal{V} \\
& W \define V_{red} \cup V_{blue} \\
& H_W \t{ is \b{exported} from graph } H \\
& C_W \t{ is a \r{connective component} of graph } H_W \\
} \implies \t{By \b{exchanging} red and blue in } C_W \t{, we can get \b{another k-coloring}}
$$

#### Theory 2

$$
\boxed{\t{Hadwiger's Guess}} \\
G \lb{
& \t{is \b{connective}} \\
& \mathcal{X}(G) \ge p
} \implies G \t{ can be \b{shrinked} into } K_p
\\
\boxed{\t{Theorem}} \\
\t{Hadwiger's Guess is \b{right} for } \b{p = 5} \iff \forall\t{\b{planar graph} has \b{4-coloring}}
$$

####  Theory 3

$$
\lb {
& p \le 3 \\
& G \lb {
& \t{ is \b{connective}} \\
& \mathcal{X}(G)  \ge p
}
} \implies G \t{ can be shrinked into } K_p
$$

---

- $p = 1$，可以通过对 `图G的每一条边`都进行 `收缩`，最终得到 $K_1$

- $p = 2$，可以通过对 `图G的除了一条边外的所有边`都进行 `收缩`，最终得到 $K_2$

- $p = 3$，$\because \mathcal{X}(G) = 3 \implies $ `图G` 有 `一条长度为奇数的圈` 。

  设 $\gamma$ 是 `图G中的长度最小的奇数圈` $\implies$ 只有 `连接` $\gamma$  `中的顶点的边`才是 `真正属于` $\gamma$ `的边` $\implies$ 我们不断 `收缩图G中除` $\gamma$ `的边之外的所有边`

  $\implies$ 最终得到 $K_3$

  > 注意，`连接`是 `图论`里的一个术语：只有 `边的2个顶点`都 `属于路径` $\gamma$ 才能算作 `连接`。
  >
  > 换句话说，`该边的两个顶点`必须 `都来自路径` $\gamma$

## Independent Number & Clique Number

### Independent Number

#### Definition

若 $\G$，我们称 $U \subseteq V$ 为 `独立集`：$U$中的 `任何两个顶点` 都不 `邻接`

> - 由 `独立集`所给出的 `图G`的 `导出子图` $G_U$ 是 `零图`
>
> - `色数` $\mathcal{X}(G)$是使得 `图G的顶点`能够被分成 `k个独立集`的 `最小整数k`



`图G的独立数` $\alpha(G)$：`图G`的 `所有独立集`中 `顶点的最大个数`

> - `独立数`是 `图G的顶点着色`中，`具有相同颜色的顶点`的 `最大个数` ：$\mathcal{X}(G) \ge \roundup{\frac{n}{\alpha(G)}}$
> - $\alpha(N_n) = n,\alpha(K_n) = 1，\alpha(K_{m,n}) = max\s{m, n}$



### Domination Set

#### Definition

> 若 $G = (V,E)$，$U$是 `该图的顶点的独立集` 且 `不是任何更大的独立集的子集`。
>
> 则：$U$ 中的 `任何两个顶点`都不 `邻接`，`不在U中的顶点`都 `至少与U中的一个顶点` `邻接`，
>
> 我们将具有 `这种性质`的 `顶点集合`称为 `图G` 的 `控制集` $W$

`图G的控制集 (Domination Set)` $W$ 是 `图G`的 `一个顶点集合`，满足：`图G中不在W中的顶点` 至少与 `W中的一个顶点`相 `邻接`。

> 任何包含 `控制集`的 `顶点集`也是 `控制集`

`图G的控制数 (Dominating Number)` $dom(G)$： `图G`的 `控制集的最少顶点数`

- $dom(N_n) = n, dom(K_n) = 1,dom(K_{m,n})\quad m,n \ge 2 = 2$



#### Theory

##### Theory 1

$$
\lb{
& G = (V, E),\quad |V| \ge 2 \\
& G \t{ is \b{connective}}
} \implies dom(G) \le \rounddown{\frac{n}{2}}
$$

---

- Proof 1

由于 `图G`是 `连通图` $\implies$ 图G中的 `任何顶点` 都 `存在一个顶点与之`相 `邻接`，

不妨设 `连接这两个顶点的边`中，`其中边的一个顶点` 属于 `控制集`， `边的另一个顶点` 不属于`控制集`。

- Proof 2

设 $T$是 $G$的一颗 `生成树` $\r{\implies dom(G) \le dom(T)}$

使用 `归纳法`：

1. $n = 2 \implies$ $T$的`两个顶点`都是 `控制集`

2. $n = 3$

   设 $y$ 是 `与悬挂顶点`  $x$ `相邻接的顶点`，$T^*$ 是 `从T中删除顶点y和所有与y关联的边而得到的图`

    $\implies$ $T^*$的 `连通分量` 是 `树`，且 `这些树`之中`至少有一颗` `阶数为1的树`（如：`顶点x`）

   $\implies$设 $\r{T_1,\cdots, T_k}$是 `阶数至少为2的树`，则他们的 `阶数`为 $\r{n_1 \ge 2, \cdots ,n_k \ge 2}$

   $\implies$ 由 `归纳假设`，每个 $T_i$ 有一个 `大小至多为` $\rounddown{\frac{n_i}{2}}$ `的控制集`

   $\implies$ `这些控制集的并`给出 `一个T的大小至多为` $\rounddown{\frac{n}{2}}$ `的控制集`

   > $1 + \rounddown{\frac{n_1}{2}} + \cdots + \rounddown{\frac{n_k}{2}} \le 1 +\rounddown{\frac{n_1+\cdots+n_k}{2}} \le 1 + \rounddown{\frac{\r{n-2}}{2}} = \rounddown{\frac{\r{n}}{2}}$



### Clique Number

#### Definition

`图G的团 (Clique)`： `图G的顶点的子集` $U$，使得在$U$中的 `每一对顶点` 相互 `邻接`

- $|U| = n, G_U  = K_n$

`图G的团数 (Clique Number)` $\omega(G)$：`图G`的 `团的顶点的最大数目`

- $\omega(N_n) = 1, \omega(K_n) = n, \omega(K_{m,n}) = 2$

- $\r{\alpha(G) = \omega(\overline{G}), \omega({G}) = \alpha(G)}$

`图G的团划分 (Clique Partition)`：将 `图G的顶点` 划分为 `团`的 `一个划分`

`图G的团划分数 (Clique Partition Number)` $\theta(G)$：`图G的团划分`中 `最小的团数`

- $\r{\theta(G) = \mathcal{X}(\overline{G}), \mathcal{X}(G) = \theta(\overline{G}) }$



`图G是` $\mathcal{X}$ `完美的 (Perfect)`：若对于 `图` $G$ `的所有导出子图` $H$ ，有 $\c{hotpink}{\mathcal{X}(H) = \omega(H)}$

`图G是` $\theta$ `完美的 (Perfect)`：若对于 `图` $G$ `的所有导出子图` $H$ ，有 $\c{hotpink}{\theta(H) = \alpha(H)}$



#### Theory

##### Theory 1

$$
\boxed{\t{Berge's Guess}} \\
\a{
G \t{ is } \b{\mathcal{X} \t{ perfect}} &\iff G \t{ is } \b{\theta \t{ perfect}} \\
G \t{ is } \b{\mathcal{X} \t{ perfect}} &\iff \overline{G} \t{ is not } \b{\mathcal{X} \t{ perfect}}
}
$$

### Chord & Chordal Graph

#### Definition

`图G的圈的弦 (Chord)`：连接 `该圈` 的 `两个非连续顶点` 的 `一条边`

> 注意：`弦`是连接 `圈上两个顶点的边`，但 `弦`本身不是 `这个圈的边`

`弦图`：任何 `长度大于3的圈`都有 `弦`的图

> `长度等于3的圈`必定 `没有弦`



#### Theory 

##### Theory 1

> `实直线`上的 `闭区间` 记为：$[a, b] = \s{x: a \le x \le b}$ 
>
> 若设 `闭区间族`：$I_1 = [a_1, b_1], I_2 = [a_2, b_2], \cdots, I_n = [a_n, b_n]$
>
> `区间图 (Interval Graph)` ：`顶点集合` 为 $\s{I_1, \cdots, I_n}$， `顶点` $I_i$和 $I_j$ `邻接` 当且仅当 $I_i \cap I_j \ne \varnothing$

每个 `区间图`都是 `弦图`。


$$
\a{
& V \define \s{I_1, I_2, \cdots I_n} \\
& G \define (V, E) \\
& \t{we assume that: } \lb{
& k \gt 3 \\
& I_{j_1} - I_{j_2} - \cdots - I_{j_k} - I_{j_1} \t{ is \b{a cycle of length k}} \\
} \\
& \t{proof：At least \b{one interval in the cycle} has \b{a non-empty intersection } with \b{an interval two distances aprat  in the cycle} } \\
& \t{define \b{4 continuous intervals in the cycle}: } \lb{
& I_m, I_p, I_q, I_r \\
& I_m \cap I_q = \varnothing \\
& I_p \cap I_r = \varnothing
} \implies \lb{
& I_m \cap I_p \ne \varnothing \\
& I_p \cap I_q \ne \varnothing \\
& I_q \cap I_r \ne \varnothing \\
& I_m \cap I_q = \varnothing \\
& I_p \cap I_r = \varnothing
} \\
&\t{if } a_q \lt a_p , b_p \lt b_q \implies I_p \subset I_q \implies \varnothing \ne I_m \cap I_p \subset I_m \cap I_q \implies contradictory \\
& \therefore a_p \le a_q \t{ or } b_q \le b_p \implies \lb{
& a_p \le a_q \implies a_q \le a_r \\
& b_q \le b_p \implies b_r \le b_q
} \\
& \therefore \t{as for \b{3 continueos intervals}}: I_p, I_q, I_r \implies a_p \le a_q \le a_r \t{ or } b_r \le b_q \le b_p \\
& \r{p \define j_1, a_{j_1} \le a_{j_2} \implies a_{j_1} \le a_{j_2} \le \cdots \le a_{j_k} \le a_{j_1}} \\
& \r{\t{the same way: } b_{j_1} \le b_{j_2} \le \cdots \le b_{j_k} \le b_{j_1}} \\
& \implies contracditory
}
$$

##### Theory 2

$$
\lb{
& G = (V, E) \t{ is \b{connective}} \\
& U \t{ is \b{an articulation set} of } G \\
& G_U \t{ is \b{complete}} \\
& G_{V-U} \t{ has the following \b{connective components}: } G_1 = (U_1, E_1), \cdots, G_t = (U_t, E_t) \\
& \r{\mathcal{X}(G_{U_i \cup U}) = \omega(G_{U_i \cup U}) \quad(i = 1,2, \cdots ,t)} \\
} \implies \mathcal{X}(G) = \omega(G)
$$

---

$$
\a{
& \b{k \define \omega(G) \implies \omega(G_{U_i \cup U}) \le k \quad(i = 1, 2,\cdots, t)}\\
& \implies \r{\exists j} , \omega(G_{U_j \cup U}) = k \\
& \because \mathcal{X}(G) = \r{max}\s{\omega(G_{U_1 \cup U}), \cdots, \omega(G_{U_t \cup U})} \\
& \implies \mathcal{X}(G) = \omega(G)
}
$$

##### Theory 3

> `极小关节集`：`真子集`不是 `关节集`的 `关节集`

$$
\lb {
& G = (V, E) \t { is a \g{complete} \b{chordal graph}} \\
& U \t{ is a \b{local min-imum articulation set}} 
} \implies G_U \t{ is \b{complete}}
$$

---

- 若 $G_U$不是 `完全图`，则得到矛盾：

若 `a` 和 `b` 是 `U中两个不邻接的顶点`。

则因为 `U是关节集`，所以  $G_{V-U}$中至少有两个 `连通分量`： $G_1 = (U_1, E_1)$ 和 $G_2 = (U_2, E_2)$

如果 `a`不与 $G_1$ `中任何顶点邻接` $\implies$  $U - \s{a}$  也是一个 `关节集`

$\because U$ 是一个 `极小关节集`，则 `a` 必定至少与 $U_1$ `中的一个顶点` 邻接。

类似的，可证明：$a$ 至少与 $U_2$ 中的一个顶点邻接。

同理，对b也有结论：

$b$ 至少与 $U_1$中的一个顶点邻接

$b$至少与 $U_2$ 中的一个顶点邻接

$\because$  $G_1$和 $G_2$ 是连通的

$\therefore$ 存在一条 `连接a到b的路径` $\gamma_1$，该路径中 不同于a和b的所有顶点都属于 $U_1$

$\therefore $存在一条 `连接b到a的路径` $\gamma_2$，该路径中 不同于a和b的所有顶点都属于 $U_2$

$\therefore$ 我们可以选择 $\gamma_1$ 和 $\gamma_2$，使其长度最短：$\gamma = \gamma_1, \gamma_2$

故 $\gamma$ 是 G中的一个圈且长度至少等于4,

由于 $\gamma_1$和 $\gamma_2$ 具有最短的长度，所以 $\gamma$ 的弦只可能 `连接a和b的边`

$\because$ 选择的a和b是非邻接的

$\therefore \gamma = \gamma_1, \gamma_2$ 没有弦的结论 

而这与 `图G是弦图`矛盾。



##### Theory 4

每个 `弦图` 都是 `完美的 (Perfect)`

---

$$
\a{
& \because \t{the exporting graph of chordal graph is \b{also a chordal graph}} \\
& \therefore \mathcal{X}(G) = \omega(G) \\
& \t{define } \G \t{ is a \b{chordal graph} and use \b{induction on }} n \\
& G \lb{ 
& = K_n \implies \qed \quad\t{(all the \b{complete} graph is \b{perfect})} \\
& \ne K_n \implies 
\lb{
& G \t{ has a \b{local min-imum articulation set} U} \\
& \implies G_U \t{ is a \r{complete} graph} \\
& \then \t{the \b{connective components} of } G_{V-U} \t{ is } G_1 = (U_1, E_2), \cdots, G_t=(U_t, E_t) \\
& \then \r{\forall G_{U_i \cup U}, \mathcal{X}(G_{U_i \cup U}) = \omega(G_{U_i \cup U}) \implies \mathcal{X}(G) = \omega(G)
}}
}
}
$$

##### Theory 5

> $$
> \bt{Berge's Guess} \\
> \t{the graph } G \t{ is \b{perfect}} \iff G \t{ and } \overline{G} \t{\b{ don't the following exporint graph}} \lb{
> & \t{has a \b{odd-cycle} whose length is \b{grater than 3}} \\
> & \t{don't have any \b{chords}}
> }
> $$

每个 `区间图` 都是 `完美的`。


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
\newcommand\qed{\quad\square}
\newcommand\define{\dot{=}}
\newcommand\if{\text{ if }}
\newcommand\then{\implies}
\newcommand\rounddown[1]{\lfloor{#1}\rfloor}
\newcommand\roundup[1]{\lceil{#1}\rceil}
\newcommand\graph[4]{#1 = (#2, #3) \quad |#2| = #4}
\newcommand\G{G = (V, E) \quad |V| = n}
\newcommand\so{\therefore}
\newcommand\comment[1]{\quad\text{(#1)}}
\newcommand\note[1]{\quad\text{(#1)}}
\newcommand\bt[1]{\boxed{\text{#1}}}
\newcommand\max[1]{\textbf{ max } \{#1\} }
\newcommand\min[1]{\textbf{ min } \{#1\} }
\newcommand\IF{\textbf{ IF }}
\newcommand\AND{\textbf{ AND }}
\newcommand\OR{\textbf{ OR }}
\newcommand\NOT{\textbf{ NOT }}
\newcommand\THEN{\textbf{ THEN }}
\newcommand\assume{\textbf{ Assuming that: }}
\newcommand\contradictory{\textbf{ Thus lead to contradiction }}
\newcommand\proof{\textbf{Proof: }}
\newcommand\st{\text{ such that }}
\newcommand\hold{\text{ holds }}
\newcommand\lhs{\text{ LHS }}
\newcommand\rhs{\text{ RHS }}
\newcommand\wlg{\text{ Without loss of generality }}
\newcommand\nb{\text{ nota bene }}
\newcommand\analogously{\text{ analogously }}
\newcommand\viceversa{\textbf{ viceversa }}
\newcommand\let{\textbf{ let }}
\newcommand\as{\textbf{ as }}
\newcommand\for{\textbf{ As for }}
\newcommand\select{\textbf{ SELECT }}
$$



### Matching Number

#### Definition

`匹配集 (Matching Set) ` $M$：是 `图G`的一个 `边集`，使得 `没有任何两条边`有 `公共顶点`

`匹配` $M$ 与 `顶点 ` $x $  `相遇 (Encouter)`：匹配集`中的 `唯一一条边` `包含` 这个 `顶点`

`图G的完美匹配 (Perfect Matching)`：能`与图G的所有顶点相遇`的 `匹配集`

`图G的匹配数 (Matching Number)` $\rho(G)$：`图G` 的 `匹配`中的 `最大的边数`



- $n \b{\t{  is even: }}\rho(K_n) = \rounddown{\frac{n}{2}}, \rho(C_n) = \rounddown{\frac{n}{2}}, \rho(P_n) = \rounddown{\frac{n}{2}}$

- $\rho(K_{m,n}) = min\s{m, n}$



#### Theory

##### Thoery 1 

$$
\lb{
& G \t{ is a \b{bipartite graph} with 2-division } X \AND Y \\
& \mathcal{A}_G \t{ is the \b{family of subsets} of } Y \\
& \t{the \b{family }} \mathcal{A}_G = (A_{i_2}, A_{i_2}, \cdots, A_{i_t}) \t{ has \b{SDR} } (e_{i_1}, e_{i_2}, \cdots, e_{i_t})
} \implies \lb{
& \t{we can get a \r{match} M of graph G}: \r{\s{x_{i_1}, e_{i_1}}, \s{x_{i_2}, e_{i_2}} \cdots \s{x_{i_t}, e_{i_t}}} \\
& \viceversa
}
$$

##### Theory 2

> `图G的边覆盖` $W$：若 `图G的顶点集合V`的子集 $W$，满足： `图G的每一条边`至少有 `一个顶点`在 $W$中，则称 $W$是 `图G`的一个 `边覆盖`
>
> - 对于有 `二划分` $X$ 和 $Y$ 的二分图，$X$ 和 $Y$ 就是该图的 2个`覆盖`
>
> `覆盖数` $c(G)$：`图G`的 `顶点数最少的覆盖`的 `顶点数`
>
> - $c(K_n) = n - 1$

$$
\lb{
& G = (V, E) \\
& W \subseteq V \\
} \implies W \t{ is a \b{coverage} of graph } G \iff V \backslash W \t{ is an \b{independent set} of G}
$$

---

$$
\a{
& \assume W \t{ is a coverage of } G \then \forall \alpha=(x,y) \in E, \st x \in W \OR y \in W \\
& \implies \forall \alpha =(x,y) \in E, \st \nexists \lb {
& x \in V\backslash W \\
& y \in V\backslash W
} \implies V\backslash W  \t{ is an \b{independent set} of } G \\
& \viceversa
}
$$

##### Thoery 3

$$
\bt{K\"{o}nig-Egerv\'{a}ry Theorem} \\
\a {
G = (V, E) \t{ is a \b{bi-partite graph}} \implies \b{\rho(G) = c(G)}
}
$$

> 即 `图G`中：`匹配中边的最大数量` = `覆盖中顶点的最少数量`

---

$$
\a{
& \let X,Y \as \t{the \b{bi-partite} of } G \\
& \let \mathcal{A}_G \as \t{the \b{faimly of subsets} of } Y \\
& \let |M| = \rho(G) \then \g{c(G) \ge |M|} = \rho(G) \\
& \proof c(G) \le |M| \\
& \a{& \r{\because \rho(G) = \min{|A_{i_1} \cup A_{i_2} \cup \cdots \cup A_{i_k}| + n - k}} \\
&= |A_{i_1} \cup A_{i_2} \cup \cdots \cup A_{i_l}| + n - l 
} \\
& \let \s{j_1, j_2, \cdots, j_{\b{n-l}}} = \s{1,2,\cdots, \b{n}} \backslash \s{i_1, i_2, \cdots, i_\b{l}} \\
& \let X' = \s{x_{j_1}, x_{j_2}, \cdots, x_{j_{n-l}}} \\
& \let Y' = Y \backslash (A_{i_1} \cup A_{i_2} \cup \cdots \cup A_{i_\b{l}}) \\
& \implies \lb {
& W = X' \cup Y' \t{ is a \b{coverage of } graph } G \\
& |W| = |X'| + |Y'| = n - l + |A_{i_1} \cup A_{i_2} \cup \cdots \cup A_{i_l} | = \rho(G) 
} \\
& \r{\because \exists |W| = \rho(G) \therefore c(G) \le |M|} \\
& \implies \lb{
& c(G) \ge |M|=\rho(G) \\
& c(G) \le |M|=\rho(G)
} \implies c(g) = |M| = \rho(G)
}
$$

##### Theory 4

> - $G_{V\backslash U} = (V \backslash U, E)$
> - $oc = \t{the number of odd-component}, ec = \t{the number of even-component}$

$$
\a{
\lb{
& G = (V, E) \\
& G \t { has a \b{perfect matching}}
} \iff \forall U \subseteq V, \st \g{oc(G_{V\backslash U}) \le |U|}

}
$$

---

$$
\a{
& \assume U = \varnothing \then oc(G) = 0 \implies |V| \t{ is even} \\
& \assume U \ne \varnothing \then oc(G) \gt 0 \\
& \let G_{U_1}, G_{U_2}, \cdots, G_{U_k} \as \t{the \b{odd-component} of graph } G \\
& \because |U_i| \t{ is \b{odd}} \so \lb{
& \let M \as \t{the \b{perfect matching} of graph } G \\
& \exists \alpha=(x_i,y_i) \in M, \st x_i \in U, y_i \in U_i \quad(i = 1,2,\cdots k) \\
} \\
& \because M \t{ is a \b{perfect mathcing} } \then x_1, x_2, \cdots ,x_k \t{ are \b{different}} \\
& \so \g{|U| \ge k} = oc(G_{V \backslash U})

}
$$

##### Theory 5

$$
\bt{Berge-Tutte Formula} \\
\lb{
& \G \\
& U \subseteq V \\
} \implies \rho(G) = \min{n - \g{(oc(G_{V \backslash U}) - |U |)}}
$$

### Connectivity

#### Vertex-Connectivity

##### Definition

$$
\bt{Vertex-Connectivity} \lb{
& \G \\
& G \lb{
& = K_n \implies \kappa(G) = n - 1 \\
& \ne K_n \implies \kappa(G) = \min{|U|: G_{V \backslash U} \t{ is \b{not connective}}}
}
}
$$

- `非完全图的连通度` = `关节集的最少顶点数`

- $G \ne K_n \implies \kappa(G) \le \b{n - 2}$

  > $$
  > \a{
  > & \IF G= K_n \THEN \exists x,y \in V, \st \s{x, y} \notin E \\
  > & \so \t{we can \b{just} delete \b{all the vertexes except x and y}}
  > }
  > $$

- $$
  \lb {
  & G \t{ is not connective} \implies \kappa(G) = 0 \\
  & \b{G \t{ is connective} \implies \kappa(G) = n - 1} \\
  }
  $$



`图G是k连通的`：$\kappa(G) \ge k$

> 注：我们按照 $\kappa(G) = 0$来判断 `图G`是否是`连通的`。
>
> 所以 `平凡图` 是 `不连通的`！

`关节顶点 (Articulation-Vertex)`：`删除`该 `顶点`后，`图G`将失去 `连通性`



##### Theory

###### Theory 1

$$
\G \implies 0 \le \kappa(G) \le n-1
$$



#### Edge-Connectivity

##### Definition

$$
\bt{Edge-Connectivity} 
\lb{
& \G \\
& G \lb{
& = K_n \implies \lambda(G) = n-1 \\
& \ne K_n \implies \lambda(G) \le \delta(G) \note{delta is \b{the min-imum degree} in graph G}
}
}
$$

##### Thoery

###### Theory 1

$$
\kappa(G) \le \lambda(G) \le \delta(G)
$$

---

$$
\a{
&\G \\\\
&\a{
&\proof \lambda(G) \le \delta(G) \\
&\IF \t{we just delete \b{all the associated edges with a vertex}} \\
&\THEN \t{we can get a non-connective graph} \qed \\
}
\\\\
&\a{
&\proof \kappa(G) \le \lambda(G) \\
&\assume G = K_n \implies \kappa(G) = \lambda(G) = n - 1 \qed \\
&\assume G \ne K_n \implies \lb {
& G \t{ is non-connective} \implies \kappa(G) = \lambda(G) = 0 \qed \\
& G \t{ is connective} \implies \lb{
& \let F \as \t{ \b{the edge-set} consists of } \lambda(G) \t{ related edges }\\
& \implies H = (V, E\backslash F) \t{ is non-connective} \\
& \let V_1, V_2 \as \t{ \b{the vertex-set} of \b{2 connective-component} of H} \\
& \implies|V_1| + |V_2| = n \\
& \assume \forall \alpha = (x, y) \in F, x \in V_1 \AND y \in V_2 \\
& \implies |F| \ge n - \r{1} \implies \lb{& \lambda(G) \ge n - \r{1} \\ & \lambda(G) \le n - 1} \implies \lambda(G) = n-1 \\
& \contradictory \\
& \so \r{\exists a \in V_1, b \in V_2, \st \s{a, b} \notin E} \\
& \for \forall \beta = \s{a, b} \in F\rb{\lb{
& \IF a \in \beta \select b \\
& \IF b \in \beta \select a
}} \t{ join vertex-set } U \\
& \r{\implies |U| \le |F|} \\
& \because G_{V \backslash U} \t{ is non-connective } \\
& \implies \kappa(G) \le |U| \le \g{|F| = \lambda(G)}
}}}

}
$$



###### Theory 2

$$
\a{
G = (V, E), |V| \ge 3 \\
} \implies \lb{
& \IF G \t{ is 2-connective} \\
& \iff G \t{ is connective \AND \b{has no articulation-vertex}} \\
& \iff \forall a,b,c \in V, \st \exists \t{a path \b{connects a and b without c}}
}
$$

> 我们要求 $|V| \ge 3$，因为 $K_2$ 并不满足 `2连通性`



###### Theory 3

> `图G的块 (Block) `：  `连通的` 且 `没有关节顶点`的 `图G的极大导出子图` $G_U$
>
> - $K_2$ 也是 `块`，所以实际上，任何一条 `边`都是 `块`

$$
\lb{
& G = (V, E), |V| \ge 2 \\
& G \t{ is \b{connective} } \\
& \let G_{U_1} = (U_1, E_1), \cdots, G_{U_r} = (U_r, E_r) \as \t{\b{the blocks} of graph } G 
} \implies \lb{
& E_1, \cdots, E_r \t{ is \b{a partition} of } E \\
& \forall i \b{\ne} j, \st G_{U_i}, G_{U_j} \t{ has \b{at most 1 common} vertex} \\
}
$$

---

$$
\a{
&\forall i \ne j \lb{
& G_{U_i} = K_2 \OR G_{U_j} = K_2 \implies \t{a } K_2 \t{ block has \b{at most 1 common vertex with other blocks}} \qed \\
& G_{U_i} \AND G_{U_j} \t{'s \b{order ≥ 3} and \b{ are 2-connectivity}} \implies \proof \t{all the blocks have \b{at-most 1 commom veretx}} \\
} \\
& \g{\assume |U_i \cap U_j| \ge 2 \ne |\varnothing|} \\
& \implies G_{U_i \cup U_j} \t{ is connective} \\
& \let \forall x \in U_i \cup U_j \\
& \lb{
&\because G_{U_i} \AND G_{U_j} \t{ are \g{2-connectivity}} \\
&\r{\therefore G_{U_i - \s{x}} \AND G_{U_j - \s{x}} \t{ are connective}}} \\
& \because U_i \AND U_j \t{ have \g{2 commom-vertex}} \\
& \r{\therefore G_{U_i \cup U_j - \s{x}} \t{ is connective}} \\
& \implies G_{U_i \cup U_j} \t{ is 2-connectivity} \t{ and \r{larger than }} G_{U_i} \AND G_{U_j} \\
& \contradictory \implies \qed
}
$$

###### Theory 4

$$
\lb{
& G = (V,E), |V| \ge 3 \\
& G \t{ is \b{2-connectivity}}
} \iff \forall a,b \in V, \st \b{\exists} \t{\b{a cycle contains vertexes }} a \AND b
$$

---

$$
\a{
& \IF RHS \hold \THEN LHS \hold \qed \\
& \proof \IF LHS \hold \THEN RHS \hold \\
& \r{\assume G \t{ is 2-connectivity}} \\
& \let a \ne b, a \in V, b \in V \\
& U = \s{x| \r{x \ne a}, x \in V, \r{\exists \t{a cycle contains } a \AND x}} \\
& \lb{
& \proof U \ne \varnothing \\
& \let \s{a, y} \t { is \b{any edge that contains }} x \\
& \because \lambda(G) \ge \r{\kappa(G) \ge 2} \\
& \therefore G = (V, E - \s{a, y}) \t{ \b{is still connective}} \\
& \implies \t{There is \b{a path which connects a and b without using \s{a,y}}} \\
& \implies \t{There is \b{a cycle contains a and y}} \\
& \implies U \ne \varnothing
} \\
& \assume b \notin U \\
& \let z \in U, z \t{ is \b{the closest vertex to b}}, distance(z,b) = p\\
& \let \gamma \as \t{\b{the path of length p from z to b}} \\
& \implies \let \gamma_1 \as \t{\b{the cycle contains a and z}} \\
& \implies \gamma_1 \t{ has \b{2 paths } from a and z}: \gamma_1' , \gamma_2'' \\
& \because G \t{ is 2-connectivity} \\
& \therefore \exists \t{\b{a path} from a to b without z}: \gamma_2 \\
& \let u \as \t{the first vertex belongs to } \gamma_2 \t{ in } \gamma \\
& \let v \as \t{the last vertex at the same time belongs to } \gamma_1 \AND \gamma_2 \t{ in } \gamma \\
& \implies v \in \gamma_1' \OR v \in \gamma_1'' \\
& \assume v \in \gamma_1' \\
& \t{There is \b{a cycle contains a and u}: } a \overset{\gamma_1'}{\leadsto}v \overset{\gamma_2}{\leadsto} u \overset{\gamma}{\leadsto} z \overset{\gamma_1''}{\leadsto} a \\
& \implies   u \in U, \t{\r{u is closer to b than z}} \\
& \contradictory \\
& \implies b \in U \implies \t{There is \r{a cycle contains a and b}} \qed
}
$$



###### Theory 5

$$
\lb{
G = (V, E), |V| \ge 3 \\
G \t{ is 2-connectivity}
} \iff \a{
\forall a,b\in V, \st \lb {
& \b\exists \t{\b{2 paths from a to b}} \\
& \t{\r{the 2 paths} \b{only contains 2 commom-vertex}: a \AND b}
}
}
$$

###### Theory 6

$$
\bt{Menger's Theorem} \\
\lb{
G = (V, E), |V| \ge k + 1 \\
G \t{ is k-connectivity}
} \iff \a{
\forall a,b\in V, \st \lb {
& \b\exists \t{\b{k paths from a to b}} \\
& \t{\r{each 2 paths} among the k paths \b{only contains 2 commom-vertex}: a \AND b}
}
}
$$



