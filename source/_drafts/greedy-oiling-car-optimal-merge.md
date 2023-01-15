---
title: Greedy - Oiling Car & Optimal Merge
tags: []
id: '49281'
categories:
  - - uncategorized
date: 2022-04-27 06:16:01
---

# Greedy Problems

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
> 从而，我们得到`加油站列表`a\_0,\\cdots,a\_k
> 
> 这样有利于算法逻辑的统一，方便算法进行初始化。

*   加油次数最少的策略绝对不会存在`往左走的路径`

设`函数`cost(path) = \\sum\_{i=0}^{k}{a\_i - a\_{i+1}}

假设有`任意一个策略为`p\_1，

设`路径`p\_2为`在策略`p\_1`的基础上对路径做出如下修改的策略`：

将`路径`a\_i, a\_i \\quad (i \\gt 0)修改为(a\_i, a\_{i-1}, \\cdots, a\_{i-1}, a\_i)

而由于cost{(a\_{i-1},\\cdots,a\_{i-1})} \\ge 0，

所以`包含这一段子路径`并不会对我们`减少加油次数`有帮助。

因而，我们得出结论：`任何包含环的路径所得出的策略的加油次数，并不会好于把环去掉后的策略`。也就是最优的策略必然是无环的路径。

*   只在无法到达下一个加油站时才在当前加油站加油可以获得最优解

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

给定_k_ 个排好序的序列_s_1 ,_s_2 ,...,sk , 用 2 路合并算法将这_k_ 个序列合并成一个序列。

假设所采用的 2 路合并算法合并 2 个长度分别为_m_ 和 _n_ 的序列需要_m_ + _n_ - 1次比较。试设

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

对于`归并操作`，如果我们仅使用`k路归并`，且输入规模为`n个序列`。

则我们可以观察发现，`对于每一轮步骤，我们从n个序列中的一个序列中取出头部元素，放入到结果序列中`，而这需要`比较所有的n个序列的头部元素`，总共花费`n-1次比较`

因此，`这n个序列的长度是多少`是无关紧要的，我们在意的是`有几个序列`。

换句话说，如果`t`是当前剩余的序列的总数，则每次取出1个元素，需要`比较t-1次`。

*   比较次数最多的情况：让将每个序列取到只剩1个元素后换其他序列，直到所有序列均只剩1个元素
*   比较次数最少的情况：尽可能地减少序列的数量，也就是尽可能地把长度较小的序列先取完，如此反复，直到所有序列都取完。

* * *

假设共有 k 个给定的 `序列` 的 `长度` 为 s\_1,s\_2,\\cdots, s\_k

设 `第i轮开始时剩余的序列的数量` 为 k\_i

若需要使用 `k路合并` 将所有的 `序列` 都进行 `归并`，则 `每一轮归并操作` 需要进行的 `比较次数` 为 k\_i，使得一个 `元素` 有序。

总共 s\_1 + s\_2 + \\cdots + s\_k = s 个元素，共需要进行 s 轮。

则整个过程 `总共需要比较次数` 为

由上式可以知道，`每轮归并` 取走 `剩余序列中的其中一个序列的头部元素` 所需要进行的 `比较次数` 与 `各个序列自身的长度` 无关，仅与 `当前剩余的序列数量` 有关。

所以，可以得出结论：

*   `比较次数` 最少的情况：每次 `取走元素` 时，尽可能使得 `剩余序列数目` 更少。
*   `比较次数` 最多的情况：每次 `取走元素` 时，尽可能使得 `剩余序列数目` 更多。

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