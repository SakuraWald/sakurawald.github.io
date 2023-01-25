---
title: "[Combinatorics] System of Distinct Representative"
date: 2022-04-01 10:42:00
tags:
  - combinatorics
---

# System of Distinct Representative

## Definition

设`Y是有限集合`。而$\mathcal{A} = (A_1, A_2, \cdots, A_n)$是Y的n个`子集族 `。

> `族 (Family)`是`序列`，`子集族`即`子集的序列`，只不过这个序列的每个项不是`数字`而是`集合`，因而`序列`中可以有`相同的项`。

> 可以将`集合Y`当成`资源集合`，而`子集族`$\mathcal{A}$即为`对象族`，它的每个项是一个`对象（或者说：是该对象所需要的资源的集合）`

如果`Y的元素的一个族`$(e_1,e_2,\cdots,e_n)$满足$e_1 \in A_1, e_2 \in A_2, \cdots, e_i \in A_i$，则称它为$\mathcal{A}$的一个`代表系 (System of Representative)`

在一个代表系中，若$e_i \in A_i$，则该元素$e_i$称为$A_i$的`代表`

> `代表`的英文是从`Representative`翻译而来的，但是后面我们会使用`代表元`而不是`代表`，因为`代表元`这个词可以使表达更准确。

> 也就是说，`只要能从某个集合中选出1个元素，那么这个元素就可以称为 该集合的代表元`。
>
> 进而，我们知道，`非空集合的族 必定存在 代表系， 但不一定存在SDR`

如果在一个`代表系`中，元素$e_i$都是不同的，则称$(e_1, e_2, \cdots, e_n)$为`相异代表系 (System of Distinct Representative)`

> 注意：即使$A_1$和$A_2$是`相同的集合`，他们在`SDR`中也必须要有`不同的代表元`，因为他们是`这个族的不同项`。

> 换句话说：在`代表系`中，`1个代表元 可以代表 多个集合`，而在`相异代表系`中，`1个代表元 只能代表 1个集合`

## Application

设$\mathcal{A}=(A_1,A_2,\cdots,A_n)$`有限集合Y的子集族`，则需要解决的问题是：

1. 确定$\mathcal{A}$什么时候存在`SDR` ?
2. 如果$\mathcal{A}$不存在`SDR`，`存在SDR的子族`$\mathcal{A}(i_1, i_2, \cdots, i_t) = (A_{i_1}, A_{i_2}, \cdots, A_{i_t})$`中的t最大为多少?`



### Application: Non-Attack Rooks Problem

能够将`k个非攻击型车`放置到`棋盘`上，当且仅当，`存在 有SDR的k个集合的子族 `$\mathcal{A}(i_1,i_2,\cdots,i_k) = (A_{i_1}, A_{i_2}, \cdots, A_{i_k}) \qquad(1 \le i_1 \le i_2 \cdots \le i_k \le \text{Rows of the Board})$

### Application: Checkerboard Covering Problem

能够将`k个不重叠的多米诺骨牌`放置到`棋盘`上，当且仅当，`存在 有SDR的k个集合的子族`$\mathcal{A}(i_1, i_2, \cdots, i_k) = (A_{i_1}, A_{i_2}, \cdots, A_{i_k}) \qquad (1 \le i_1 \le i_2 \cdots \le i_k \le \text{|Black Squares|})$

> 上述中的`|Black Square|`表示`棋盘上黑格的数量`，这是因为我们这里是将`黑格`视为`对象`来考虑的，所以`子集族的大小 = 黑格的数量`。
>
> 同理，也可以将`白格`视为`对象`。



### Application: Complete Marriage Problem

有`n位女士`和`n位男士`，我们希望`配对每一位男士和女士`，并`使得配对给男士的女士 是 该男士的所偏爱的`。

则`所有的男士能够结婚`对应于$(A_1, A_2, \cdots, A_n)$`存在一个SDR`$(w_1, w_2, \cdots, w_n)$



### Application: Stable Complete Marriage Problem

#### Content

在一个社区中有`n位男士`和`n位女士`。`每位女士` 按照 `其对每位男士作为配偶的偏爱程度`来`给每位男士进行排名`（不允许有并列排名），这样`每位女士`将`这些男士`排成`顺序1,2, ..., n`。类似地，`每位男士`也将`每位女士`排成`顺序1,2, ... n`。

> 也就是说：`每名男士和每名女士`对`所有的异性进行排名排名 且 不存在并列排名`

> 我们使用`优先排名矩阵 (Preferential Ranking Matrix)`来描述`男士`和`女士`对`每一个异性的偏爱程度`，
>
> 这是一张`二维表格`，每个`单元格`表示的是`第i个男士和第j个女士`之间：`第i个男士 对 第j个女士 的排名`和`第j个女士 对 第i个男士的排名` 所组成的`二元组`

---

如果存在`两位女士 A 和 B`以及`两位男士 a 和 b`，使得：

1. A和a结婚
2. B和b结婚
3. A更偏爱b（而非a）
4. b更偏爱A（而非B）

> 也就是说：如果存在一男一女，他们都不喜欢自己现在的配偶，而且这两个人之间相互喜欢。那么该婚姻的配对就是`不稳定婚姻`

则我们称该婚姻为`不稳定婚姻 (Unstable Marriage)`，而我们定义`稳定婚姻 (Stable Marriage)`：是那些非`不稳定婚姻`的婚姻



#### Theory

##### Theorem

###### Content

对于`任何一个优先排名矩阵`，总是存在`稳定的完美婚姻`。

###### Proof

###### 延迟认可算法 (Deferred Acceptance Algorithm / Gale-Shapley Algorithm)

1. 初始化：将`每一位女士`标记为`被拒绝`
2. 持续：当`存在 被拒绝的女士 时`，执行：
   1. `每一位被标记为被拒绝的女士`在`所有尚未拒绝它的男士`之中`选择一位被她排名最高的男士`
   2. `每一位男士`在`所有选择他 并且 尚未被他拒绝的女士`之中`选择一位被他排名最高的女士`，`对她做延迟决定（即：移除该女士的拒绝状态）`并且`拒绝其他所有的女士`
3. 终止：我们得到一个`稳定的完美婚姻`

---

在算法的执行期间，`女士`向`男士`进行`求婚`，而男士可以接受女士的`订婚`（即做`延迟决定`）和`拒绝`女士。

- 一旦男士订婚，则`该男士` `始终保持 订婚状态`
- 如果男士收到`更好的女士的求婚`，则该男士可以`改变未婚妻` `拒绝` `他之前的未婚妻（如果有的话）`。
- 女士可以对不同的男士进行多次`求婚`，但``每次求婚的对象``只会`比上一次求婚的对象` `更差`

---

`证明：该算法所得的完美婚姻是稳定的完美婚姻`

`假设`： `女士A和B`以及`男士a和b`，使`A和a配对，B和b配对`，但`A更偏爱b`。

我们`证明`：不存在`b更偏爱A`

在算法过程中，`A和B` `都向所有的男士进行了` `求婚`。如果`A更偏爱b`而`最终却是 A和a配对`，则说明`A在第一轮向b求婚时 被b拒绝了`，这是因为`b也收到B的求婚，显然b更偏爱B`

> 可以直接使用`反证法`：如果`A更偏爱b`而且`b更偏爱A`，那么`没有任何其他的男士或女士`可以`阻止A和b的配对`。因为`A会在第一轮中立即向b求婚`，而`b也会立即接受A的求婚，并且，后续任何其他女士的求婚都不会动摇b的订婚`。
>
> 因此，我们可以说：`如果存在一个男士和一个女士，他们互相为最喜欢对方，则他们最终必定成为一对`

Q.E.D

---

##### Theorem

###### Content

> `对该女士最优的稳定的完美婚姻`：``该女士得到的配偶的排名`` `至少不差于` 从`其他的完美婚姻中得到的配偶的排名`
>
> `女士最优的稳定的完美婚姻`：如果`一个稳定的完美婚姻`对于`每一位女士而言，都是最优的`。

通过`延迟认可算法`，用`女士主动求婚的方式`来得到的`稳定的完美婚姻`是`女士最优的`。

###### Proof

通过`女士主动求婚的方式`，`女士`可以`在每一轮中不断地尝试  从尚未拒绝她的男士中选择她最偏爱的男士  来进行求婚`。

而`最终与该女士配对的男士`将是`该女士所能配对的男士中她最偏爱的男士`。

> 这种方式中，`每一位女士`都会获得`一位对她来说合适的男士`（尽管`这个男士可能不是该女士的排名中最高的）`。
>
> 我们无法`满足让每一位女士都获得 她的排名中的最高的男士` （如果无法通过该方法达成的话），否则`将导致得到的完美婚姻 是 不稳定的`。
>
> 回到之前的结论：`如果男士A和女士B之间互相是最偏爱的，则他们最终肯定能配对在一起`，`否则，说明 男士A 不是偏爱 女士B（如果女士B向男士A求婚，说明男士A是该女士 未拒绝该女士的男士中排名最高的男士）`，我们不妨`假设 男士A 和 女士C 配对在一起，则说明 男士A更偏爱女士C， 而男士A也是未拒绝女士C的所有男士中女士C所最偏爱的。`因此，`如果我们强行让 男士A 和 女士 B进行配对，则导致 男士A和女士C之间 不满足稳定的完美婚姻的定义 `
>
> > 注：`男士A 更偏爱 女士C`，则说明`女士C 是 向男士A求婚的所有女士中被男士排名最高的女士`。（如果`女士C`并不是`男士A对所有女士的排名中最高的女士`，则说明，`在男士A对所有女士的排名中 比  该女士C所处的排名更高的 哪些女士` `早已向其他的这些女士更偏爱的男士  进行求婚，而且，已经被接受了！（否则这些女士会来找男士A，然后男士A肯定会比偏爱女士C来说更偏爱这些女士）  `    ）



##### Inference

###### Content

在`女士最优的稳定的完美婚姻`中，`每一位男士`与`一位他在稳定的完美婚姻中所有对他合适的伴侣`中`排名最低的女士`进行`结合`

###### Proof

如果在`该女士最优的稳定的完美婚姻`中，`男士A 和 女士B 配对`，`男士C 和 女士D 配对`

则说明`男士A 是对女士B来说最合适的（也就是：男士A是 所有的没有拒绝女士B的男士中的被女性B排名最高的男士）`

则说明`男士C 是对女士D来说最合适的`

如果我们让`男士A 和 女士D 进行配对`，则`该稳定的完美婚姻 不是对 女士D 最优的，因而这个稳定的完美婚姻 根本就不是 女士最优的`





## Theory

#### Lemma

`族`$\mathcal{A} = {A_1, A_2,\cdots,A_n}$`存在SDR的必要条件是` `婚姻条件 (Marrige Condition) `：对于`每一个 k = 1, 2, ..., n`和`取自于{1,2, ..., n}的下标`$i_1, i_2, \cdots, i_k$的`每一种选择`，应满足
$$
|A_{i_1} \cup A_{i_2} \cup \cdots \cup A_{i_k}| \ge k
$$

> 换句话说：这个`族`的`每k个子集的并集`都`至少包含k个元素x`
>
> 也就是说：任意`k位男士的合意列表`中`至少含有k位女士`。
>
> 证明：`族的每k个子集的并集的数量`含义为`这个族内的所选取的这k个对象的所需求的不同的资源的数量`，即`我们目前拥有的不同的资源的数量`，而`数字k`表示`总共有k个人`。根据`鸽巢原理`可以证明上述结论。
>
> 当然，如果直接令`k = n`即表示为`整个族的所有对象`的情形。但是，很显然如果当`k < n`时的`子问题`中不存在`SDR`，则将`问题规模`扩大到`整个族的所有对象`后，仍然不存在SDR。



#### Theorem

##### Content

`集合Y的子集族`$\mathcal{A} = (A_1, A_2, \cdots, A_n)$ `存在SDR` $\iff$满足`婚姻条件 (Marriage Condition)`。



##### Proof

- 族$\mathcal{A}$存在SDR的必要条件是满足婚姻条件：已证
- 族$\mathcal{A}$存在SDR的充分条件是满足婚姻条件：

我们`假设：满足婚姻条件`，然后`对族`$\mathcal{A}$`的集合个数n`进行`归纳法`

1. 如果n = 1：则$\mathcal{A}$中仅包含`唯一的非空集合`，从该集合中`任选一个元素`即可。
2. 如果n = 2：现在$\mathcal{A}$中包含`两个非空集合`$A_1, A_2$。则接下来，我们考虑`2个集合之间的关系`：
   - 如果$A_1$和$A_2$没有`交集`：则存在$e_1 \in A_1, e_2 \in A_2$且$e_1 \ne e_2$。则为$A_1$选取$e_1$，为$A_2$选取$e_2$
   - 如果$A_1$和$A_2$存在`部分相交`：则存在$e_1 \in A_1 -A_2, e_2 \in A_2 - A_1$且$e_1 \ne e_2$。则为$A_1$选取$e_1$，为$A_2$选取$e_2$
   - ~~如果$A_1$和$A_2$存在`包含`~~：根本不存在这种情况，否则$|A_1 \cup A_2| \lt 2$，不满足我们的假设`婚姻条件`
3. 如果n = 3：...

Q.E.D



#### Theorem

##### Content

设$\mathcal{A}=(A_1, A_2,\cdots,A_n)$`是有限集合Y的子集族`。设$t \in Z,0 \le t \le n$

则`存在`$\mathcal{A}$`的有SDR的t集合的子族` `当且仅当`：$\textcolor{blue}{|A_{i_1} \cup	A_{i_2} \cup \dots \cup A_{i_t}| \ge k - (n - t)}$对于`所有的k ≥ n - t 的k`和`取自{1,2, ..., n}的k个不同的下标`$i_1, i_2, \cdots, i_k$的`所有选择`都成立。



#### Inference

##### Content

设$\mathcal{A}=(A_1,A_2,\cdots,A_n)$是`有限集合Y的子集族`。则`拥有SDR的子族 中集合的最大数目`为：$|A_{i_1} \cup  A_{i_2} \cup \cdots \cup A_{i_k}| + n - k$ 对`所有的k=1,2, ..., n`和`满足`$1 \le i_1 \le i_2\ \lt \cdots \le n$`的k个下标`$i_1, i_2, \cdots, i_k$的`所有选择`的`最小值`

##### Proof

$$
\begin{aligned}
|A_{i_1} \cup A_{i_2} \cup \cdots \cup A_{i_k}| &\ge k - (n-t) \\
|A_{i_1} \cup A_{i_2} \cup \cdots \cup A_{i_k}|  + (n-k)  &\ge t\\
\end{aligned}
$$

Q.E.D