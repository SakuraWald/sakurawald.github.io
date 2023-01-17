---
title: Divide and Conquer - Checkerboard Covering Problem
tags: []
id: '29784'
categories:
  - - uncategorized
date: 2022-03-28 21:32:42
---

# Checkerboard Covering Problem

### Definition

在`大小为m × n的棋盘`上的`b格牌(b-ominoe)`的一个`完美覆盖`满足：

1.  没有两个b格牌存在`重叠`
2.  每一个b格牌`恰好覆盖`棋盘上的b个方格
3.  棋盘上的所有方格被覆盖

求存在多少种`完美覆盖`方案数？

> `b格牌`是指`1 × b 的条形牌`。`多米诺骨牌`是`2格牌`，而`单牌`是`1格牌`

## Theorem

### Theorem

##### Content

`m x n 的棋盘`有`b格牌`的`完美覆盖` `当且仅当` `b`是`m的因子`或`n的因子`

##### Analysis

*   为棋盘的每个方格进行涂色

我们可以把`棋盘覆盖问题`转化为`棋盘着色问题`，`一个b格牌`将会`覆盖连续的b个方格`，则我们为`这连续的b方格`涂上`b种不同的颜色`。

则我们可以知道：`棋盘覆盖问题`中存在`完美覆盖`，当且仅当，`棋盘着色问题`中的`着色`的`b种颜色的方格的数量均相同`

![image-20220328204642533](https://s2.loli.net/2022/03/28/mH5xE3gscMZviFw.png)

*   减小棋盘的规模

对于`m x n 的棋盘`的`棋盘覆盖问题`，如果我们`去掉1个b × b规模的棋盘`，不会影响`原问题`的`棋盘覆盖`的存在性。

> 但这并不意味着`随意地从棋盘中挖走方格`可以保证`两个问题的等价`。我们这里仅说明`b × b规模的棋盘`

![image-20220328210416461](https://s2.loli.net/2022/03/28/jxrsqlXEY9IBaky.png)

##### Proof

我们欲`证明` `m x n 的棋盘`有`b格牌`的`完美覆盖` `当且仅当` `b`是`m的因子`或`n的因子`。

* * *

必要性：如果`b`是`m的因子`或`n的因子`，则显然存在`完美覆盖`

* * *

充分性：

将`m × n 的棋盘`表示为下列方式

假设`存在完美覆盖`但`b`不是`m的因子`或`n的因子`，即`r ≠ 0`且`s ≠ 0`。

则，我们将`m × n的棋盘` `分割`成3个`部分`：

1.  `上方的pb × n部分`：`每一种颜色`出现`p × n 次`
2.  `左下角的r × qb部分`：`每一种颜色`出现`q × r次`
3.  `右下角的r × s部分`：我们认为`每一种颜色`出现次数`也必定要相同`。

![image-20220328210804466](https://s2.loli.net/2022/03/28/rsJEzup6Ll4ghwy.png)

对于`右下角的r × s部分`，我们根据`涂色规则`知道：`颜色1`在每一行都出现1次。

故：`颜色1`在`右下角r × s部分`共出现`r次`。

而`右下角r × s部分`总共有`rs个方格`。如果`b种颜色各出现r次`，则需要`rb个方格`

但由于`s < b`，故我们无法满足这个要求。

故`r`和`s`不能同时非零，即`b`必须是`m的因子`或`n的因子`

> 换句话说：rs = rb,\\quad s \\lt b \\Rightarrow r = 0 \\ or\\ s = 0

Q.E.D

> 该定理的另一种解释方式：
> 
> `m × n棋盘`存在`b格牌`的`完美覆盖`当且仅当`它有平凡完美覆盖` （即`只使用水平放置`或`只使用垂直放置`的`完美覆盖`。）