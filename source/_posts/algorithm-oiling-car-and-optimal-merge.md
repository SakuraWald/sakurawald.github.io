---
title: "[Algorithm] Oiling Car & Optimal Merge"
date: 2022-04-27 06:16:00
tags:
  - algorithm
  - greedy
---

# Greedy Problems

{% raw %}
$$
\boxed{@}
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
\newcommand\miku[1]{\textcolor{miku}{#1}}

% Typography %
\newcommand\a[1]{\begin{aligned}#1\end{aligned}}
\newcommand\t[1]{\text{#1}}
\newcommand\tb[1]{\text{\textcolor{blue}{#1}}}
\newcommand\lb[1]{\left\{\begin{aligned} #1 \end{aligned}\right.}
\newcommand\lrb[1]{\lb{\rb{#1}}}
\newcommand\rb[1]{\left.\begin{aligned} #1 \end{aligned}\right\}}
\newcommand\env[2]{\begin{#1}#2\end{#1}}
\newcommand\step[1]{\textbf{ (#1) }}

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
\newcommand\do{\textbf{ do }}
\newcommand\dowhile{\textbf{ do while }}
\newcommand\dountil{\textbf{ do until }}
\newcommand\find{\textbf{ find }}
\newcommand\until{\textbf{ until }}
\newcommand\thereisa{\textbf{ There is a }}
\newcommand\thereisan{\textbf{ There is an }}
\newcommand\hasno{\textbf{ has no }}
\newcommand\has{\textbf{ has }}
\newcommand\but{\textbf{ but }}
\newcommand\however{\textbf{ however }}
\newcommand\AND{\textbf{ AND }}
\newcommand\OR{\textbf{ OR }}
\newcommand\NOT{\textbf{ NOT }}
\newcommand\THEN{\textbf{ THEN }}
\newcommand\IN{\textbf{ in }}
\newcommand\NOTIN{\textbf{ NOT-IN }}
\newcommand\assume{\textbf{ Assuming that: }}
\newcommand\contradictory{\textbf{ Thus lead to contradiction }}
\newcommand\proof{\textbf{Proof: }}
\newcommand\st{\textbf{ such that }}
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

 ## Oiling Car Problem

### Description

一辆汽车加满油后可行驶 n 公里。旅途中有若干个加油站。设计一个有效算法，指出应

在哪些加油站停靠加油，使沿途加油次数最少。并证明算法能产生一个最优解。

### Input

由文件 input.txt 给出输入数据。第一行有 2 个正整数 n 和 k，表示汽车加满油后可行驶

n 公里，且旅途中有 k 个加油站。接下来的 1 行中，有 k+1 个整数，表示第 k 个加油站与第

k-1 个加油站之间的距离。第 0 个加油站表示出发地，汽车已加满油。第 k+1 个加油站表示

目的地。

### Output

将编程计算出的最少加油次数输出到文件 output.txt。如果无法到达目的地，则输出”No 

Solution”。

### Sample

**输入文件示例** 

input.txt 

7 7 

1 2 3 4 5 1 6 6

**输出文件示例**

output.txt 

4

### Analysis

将该题建模在`图`上，设`节点`为`加油站`，而`边`的权重表示`两个加油站之间的距离`，设`汽车`初始位置在`节点0`，

将`加油站`根据题目所给的相对距离，也建立在`数轴`上。

同时，`合并`我们的`终点`到`最后一个加油站`

> 也就是说，我们实际上将`源点`和`终点`也一般化为`加油站`。
>
> 我们将`起点`视为`第0个加油站`，`距离前一个加油站的距离 = 0`。
>
> 同时将`终点`视为`第k个加油站`。
>
> 从而，我们得到`加油站列表`$a_0,\cdots,a_k$
>
> 这样有利于算法逻辑的统一，方便算法进行初始化。



- 加油次数最少的策略绝对不会存在`往左走的路径`

设`函数`$cost(path) = \sum_{i=0}^{k}{|a_i - a_{i+1}|}$

假设有`任意一个策略为`$p_1$，

设`路径`$p_2$为`在策略`$p_1$`的基础上对路径做出如下修改的策略`：

将`路径`$a_i, a_i \quad (i \gt 0)$修改为$(a_i, a_{i-1}, \cdots, a_{i-1}, a_i)$

而由于$cost{(a_{i-1},\cdots,a_{i-1})} \ge 0$，

所以`包含这一段子路径`并不会对我们`减少加油次数`有帮助。

因而，我们得出结论：`任何包含环的路径所得出的策略的加油次数，并不会好于把环去掉后的策略`。也就是最优的策略必然是无环的路径。



- 只在无法到达下一个加油站时才在当前加油站加油可以获得最优解

由于要求达到优化目标为`加油次数最少`，但`不限制每次加油的量`，且`每个加油站都可以把油量加到指定的n值`，所以`在任何加油站进行加油是没有区别的`。

所以，只需要`尽可能地不进行加油`即可达到`最少的加油次数`。

如果`初始时的油量是无穷的`，则我们不需要进行任何加油。

但如果油量是有限的，我们除了需要满足`能使得汽车到达下一个加油站`即可。

而由于`每个加油站除了距离前一个加油站的距离可能不同外，都是相同的加油站`。

因而，我们`只需考虑当前油量是否足够让汽车从当前加油站到下一个`即可。

从而，`一旦汽车从当前加油站到达下一个加油站`，则`可以从原问题中删除掉这个加油站`，而使得`题目的性质没有发生改变`。

换句话说，`每次仅考虑前k个加油站时获得的最优步骤，可以组成原问题的最优步骤`。

因此，我们采用这种策略可以获得最优解。



### Source

```java
    /*
    *  7
    *  [0] 1 2 (3) (4) 5 (1) (6) 6
    *  */
    public static String solve(int n, ArrayList<Integer> stations) {
        int ans = 0;
        int gas = n;
        for (int i = 0; i < stations.size() - 1; i++) {
            if (n < stations.get(i+1)) {
                return "No Solution!";
            }
            gas -= stations.get(i);
            if (gas < stations.get(i + 1)) {
                ans++;
                gas = n;
            }
        }
        return Integer.toString(ans);
    }
```



### Benchmark

```yaml
-----------------------------------------------------
Current Case: OIL0.in & OIL0.out
Expected  Input: [7 7, Omit the remaining 1 line(s)...]
Expected Output: [4]
Your     Output: [4]
Time Cost: 0.138600 ms (138600 ns)
Accepted.
-----------------------------------------------------
Current Case: OIL1.in & OIL1.out
Expected  Input: [3708 6, Omit the remaining 1 line(s)...]
Expected Output: [0]
Your     Output: [0]
Time Cost: 0.111400 ms (111400 ns)
Accepted.
-----------------------------------------------------
Current Case: OIL10.in & OIL10.out
Expected  Input: [36 942, Omit the remaining 1 line(s)...]
Expected Output: [No Solution!]
Your     Output: [No Solution!]
Time Cost: 0.132500 ms (132500 ns)
Accepted.
-----------------------------------------------------
Current Case: OIL2.in & OIL2.out
Expected  Input: [630 37, Omit the remaining 1 line(s)...]
Expected Output: [3]
Your     Output: [3]
Time Cost: 0.167700 ms (167700 ns)
Accepted.
-----------------------------------------------------
Current Case: OIL3.in & OIL3.out
Expected  Input: [181 46, Omit the remaining 1 line(s)...]
Expected Output: [18]
Your     Output: [18]
Time Cost: 0.156300 ms (156300 ns)
Accepted.
-----------------------------------------------------
Current Case: OIL4.in & OIL4.out
Expected  Input: [809 638, Omit the remaining 1 line(s)...]
Expected Output: [40]
Your     Output: [40]
Time Cost: 0.312200 ms (312200 ns)
Accepted.
-----------------------------------------------------
Current Case: OIL5.in & OIL5.out
Expected  Input: [887 598, Omit the remaining 1 line(s)...]
Expected Output: [35]
Your     Output: [35]
Time Cost: 0.207000 ms (207000 ns)
Accepted.
-----------------------------------------------------
Current Case: OIL6.in & OIL6.out
Expected  Input: [532 813, Omit the remaining 1 line(s)...]
Expected Output: [79]
Your     Output: [79]
Time Cost: 0.228500 ms (228500 ns)
Accepted.
-----------------------------------------------------
Current Case: OIL7.in & OIL7.out
Expected  Input: [301 402, Omit the remaining 1 line(s)...]
Expected Output: [69]
Your     Output: [69]
Time Cost: 0.158300 ms (158300 ns)
Accepted.
-----------------------------------------------------
Current Case: OIL8.in & OIL8.out
Expected  Input: [716 950, Omit the remaining 1 line(s)...]
Expected Output: [70]
Your     Output: [70]
Time Cost: 0.243100 ms (243100 ns)
Accepted.
-----------------------------------------------------
Current Case: OIL9.in & OIL9.out
Expected  Input: [506 448, Omit the remaining 1 line(s)...]
Expected Output: [49]
Your     Output: [49]
Time Cost: 0.162700 ms (162700 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ √ √ √ √ √ √ √ √ √ √ 
```



## Optimal Merge Problem

### Description

给定*k* 个排好序的序列*s*1 ,*s*2 ,...,sk , 用 2 路合并算法将这*k* 个序列合并成一个序列。

假设所采用的 2 路合并算法合并 2 个长度分别为*m* 和 *n* 的序列需要*m* + *n* - 1次比较。试设

计一个算法确定合并这个序列的最优合并顺序，使所需的总比较次数最少。

为了进行比较，还需要确定合并这个序列的最差合并顺序，使所需的总比较次数最多。

### Input

由文件 input.txt 给出输入数据。第一行有 1 个正整数 k，表示有 k 个待合并序列。接下

来的 1 行中，有 k 个正整数，表示 k 个待合并序列的长度。

### Output

将编程计算出的最多比较次数和最少比较次数输出到文件 output.txt。

### Sample

**输入文件示例** 

input.txt 

4 

5 12 11 2

**输出文件示例**

output.txt 

78 52

### Analysis

假设共有 $k$ 个给定的 `序列` 的 `长度` 为 $s_1,s_2,\cdots, s_k$ 

设 `第i轮开始时剩余的序列的数量` 为 $k_i$

若需要使用 `k路合并` 将所有的 `序列` 都进行 `归并`，则 `每一轮归并操作` 需要进行的 `比较次数` 为 $k_i$，使得一个 `元素` 有序。

总共 $s_1 + s_2 + \cdots + s_k = s$ 个元素，共需要进行 $s$ 轮。 

则整个过程 `总共需要比较次数` 为
$$
\a {
& (k_1 - 1) + (k_2 - 1) + \cdots + (k_n - 1) \\
& = (k_1 + k_2 + \cdots + k_n) - n
}
$$
由上式可以知道，`每轮归并` 取走 `剩余序列中的其中一个序列的头部元素` 所需要进行的 `比较次数` 与 `各个序列自身的长度` 无关，仅与 `当前剩余的序列数量` 有关。

所以，可以得出结论：

- `比较次数` 最少的情况：每次 `取走元素` 时，尽可能使得 `剩余序列数目` 更少。
- `比较次数` 最多的情况：每次 `取走元素` 时，尽可能使得 `剩余序列数目` 更多。

### Source

```java
package Lab4;

import util.Judger;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.PriorityQueue;
import java.util.Scanner;

public class OptimalMergeSolver {
    public static final Judger judger = new Judger("/Cases/Lab4/OPTIMAL MERGE").redirectError().ignoreExceptCase("11").setMaxExpectedInputLines(1);
    public static Judger.Pair<Integer, Integer> solve(ArrayList<Integer> list) {

        // Calc min: Priority-Queue
        int min = 0;
        PriorityQueue<Integer> minHeap = new PriorityQueue<>(list);
        while (minHeap.size() > 1) {
            int sum = minHeap.poll() + minHeap.poll();
            min += sum - 1;
            minHeap.add(sum);
        }

        // Calc max
        int max = 0;
        PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Comparator.reverseOrder());
        maxHeap.addAll(list);
        while (maxHeap.size() > 1) {
            int sum = maxHeap.poll() + maxHeap.poll();
            max += sum - 1;
            maxHeap.add(sum);
        }
        return new Judger.Pair<>(max, min);
    }

    public static void main(String[] args) {
        for (Scanner scanner : judger) {
            int k = scanner.nextInt();
            ArrayList<Integer> list = new ArrayList<>();
            for (int i = 0; i < k; i++) {
                list.add(scanner.nextInt());
            }
            judger.manuallyStartTimer();
            Judger.Pair<Integer, Integer> result = solve(list);
            System.out.printf("%d %d\n", result.getKey(), result.getValue());
            judger.manuallyStopTimer();
        }
    }
}
```

### Benchmark

```yaml
-----------------------------------------------------
Current Case: MERGE0.in & MERGE0.out
Expected  Input: [4, Omit the remaining 1 line(s)...]
Expected Output: [78 52]
Your     Output: [78 52]
Time Cost: 3.060100 ms (3060100 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE1.in & MERGE1.out
Expected  Input: [620, Omit the remaining 1 line(s)...]
Expected Output: [13008644 285991]
Your     Output: [13008644 285991]
Time Cost: 3.215400 ms (3215400 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE10.in & MERGE10.out
Expected  Input: [813, Omit the remaining 1 line(s)...]
Expected Output: [22558660 394886]
Your     Output: [22558660 394886]
Time Cost: 1.361100 ms (1361100 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE2.in & MERGE2.out
Expected  Input: [352, Omit the remaining 1 line(s)...]
Expected Output: [4111334 142290]
Your     Output: [4111334 142290]
Time Cost: 0.580700 ms (580700 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE3.in & MERGE3.out
Expected  Input: [235, Omit the remaining 1 line(s)...]
Expected Output: [1820172 88000]
Your     Output: [1820172 88000]
Time Cost: 0.731000 ms (731000 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE4.in & MERGE4.out
Expected  Input: [222, Omit the remaining 1 line(s)...]
Expected Output: [1643475 82557]
Your     Output: [1643475 82557]
Time Cost: 0.396400 ms (396400 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE5.in & MERGE5.out
Expected  Input: [792, Omit the remaining 1 line(s)...]
Expected Output: [21235932 375348]
Your     Output: [21235932 375348]
Time Cost: 0.848700 ms (848700 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE6.in & MERGE6.out
Expected  Input: [940, Omit the remaining 1 line(s)...]
Expected Output: [30287355 470933]
Your     Output: [30287355 470933]
Time Cost: 0.966800 ms (966800 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE7.in & MERGE7.out
Expected  Input: [936, Omit the remaining 1 line(s)...]
Expected Output: [29521637 456380]
Your     Output: [29521637 456380]
Time Cost: 1.349700 ms (1349700 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE8.in & MERGE8.out
Expected  Input: [380, Omit the remaining 1 line(s)...]
Expected Output: [4837331 157940]
Your     Output: [4837331 157940]
Time Cost: 0.618000 ms (618000 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE9.in & MERGE9.out
Expected  Input: [924, Omit the remaining 1 line(s)...]
Expected Output: [28269476 436352]
Your     Output: [28269476 436352]
Time Cost: 0.808000 ms (808000 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ √ √ √ √ √ √ √ √ √ √ 
```
