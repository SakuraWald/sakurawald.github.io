---
title: Computer Composition - Representation and Computation - Floating Point
tags: []
id: '33679'
categories:
  - - uncategorized
date: 2022-04-02 18:02:30
---

# Representation and Computation - Floating Point

## Representation

`浮点表示`对形如V = x \\times 2^y的有理数进行编码。

### Methods

#### Decimal Representation

d = d\_md\_{m-1}\\cdots d\_0.d\_{-1}d\_{-2}\\cdots d\_{-n} = \\sum\_{i = -n}^{m}{10^i \\times d\_i}

#### Binary Representation

b = b\_mb\_{m-1}\\cdots b\_0.b\_{-1}b\_{-2}\\cdots b\_{-n} = \\sum\_{i=-n}^{m}{2^i \\times b\_i}

#### IEEE 754 Floating Point Representation

##### Formula

\\textcolor{red}{V = (-1)^s \\times M \\times 2^E}

*   符号（Sign）：正数为0，负数为1。对于`数值0`，符号位另外做解释。
*   尾数（Significand）：`尾数M`是`二进制小数`。范围为`1~2-ε`或`0~1-ε`
*   阶码（Exponent）：`阶码E`的作用是`对浮点数进行加权`

##### Formats

![image-20220402161750736](https://s2.loli.net/2022/04/02/DAQOaC8PEtZXiuT.png)

该表示方法将`位模式`分为`3个字段`：

1.  符号字段 (s)：1表示正数，0表示负数
    
2.  阶码字段 (exp)：exp用于`编码` `阶码E`
    
    > 注意：这并不是说`阶码E 的数值`直接等于`exp的数值`，而是需要通过一定的编码规则。
    
3.  小数字段 (frac)：frac用于`编码` `尾数M`
    

##### Explanation

![image-20220402162120226](https://s2.loli.net/2022/04/02/UqL3ZGsMOSyFQK6.png)

* * *

*   情况1：规格化的值

`阶码字段`：E = e - Bias = e - (2^{k-1} -1)

`小数字段`：0 \\le f \\lt 1, f = \[0.f\_{n-1}f\_{n-2}\\cdots f\_0\]

> 尾数尾数 M \\dot{=} 1 + f = \\textcolor{red}{1}.f\_{n-1}f\_{n-2}\\cdots f\_0
> 
> > 它必然是以1开头的，所以我们也称这种方式为`隐含的以1开头的表示 (Implied Leading 1)`。
> > 
> > 因为我们总是可以通过`调整阶码E`使得1 \\le M \\lt 2（假设没溢出），则我们可以知道，`第一位必定是1`，
> > 
> > 因此我们不需要存储该位，从而获得`多一位的精度`。

*   情况2：非规格化的值

`阶码字段`：E = 1 - Bias = 1 - (2^{k-1} - 1)

> 通过定义`非规格化的值的E = 1 - Bias`而不是`E = -Bias`，则我们可以非常方便地进行`非规格化 → 规格化`的过程。
> 
> > 这样可以`补偿非规格化的数的尾数M 所没有的隐含的开头的1`

`小数字段`：此时M = f，此时`小数的值`等于`尾数的值`，尾数不包含开头隐含的1.

*   情况3：特殊值
    
    *   正负无穷大：当s=1时为`正无穷大`， 当s=0时为`负无穷大`。无穷大用于表示`溢出`
    *   非数字

##### Example

![image-20220402173123914](https://s2.loli.net/2022/04/02/rYVS5tHciEzM943.png)

## Rounding

由于`浮点数`只能`近似地`表示`实数`，因此，我们希望对于某个实数，可以找到`最接近的匹配值`来近似它，

并用浮点格式表示出来，这就是`舍入 (Rounding)` 。

### Strategies

#### Rount Down

\\lfloor x \\rfloor

#### Rount Up

\\lceil x \\rceil

#### Rount towards Zero

> `向零舍入`和`向下舍入`在处理`负数`时会有不同。

#### Rount to Even (Round to Nearest)

`向偶数舍入 （向最接近的值舍入）`是`默认的舍入策略`：它将`数字`进行`向上舍入`或`向下舍入`，使得`结果的最低有效位的数字`是`偶数`

> 该方法期望于`最低有效位的二进制位`在`50%的情况为0，而另外50%的情况为1`，进而使得计算结果对`统计数据`更为友好。

![image-20220402174325557](https://s2.loli.net/2022/04/02/2VWkT5acCMGZDnL.png)

## Computation

`IEEE标准`将`浮点数`视为`实数`，而`某个运算`\\odot定义在实数上，计算产生Round(x \\odot y)是对`实际运算的精确结果`的`舍入`

> 因为`舍入`和`溢出`的存在，`浮点运算`的精度会比`整数运算`更容易受影响，而且不遵守普通的算术属性（如结合性）。