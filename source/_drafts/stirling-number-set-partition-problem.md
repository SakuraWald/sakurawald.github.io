---
title: Stirling-Number-  Set Partition Problem
tags: []
id: '28684'
categories:
  - - uncategorized
date: 2022-03-27 03:01:25
---

# Set Partition Problem

## Description

n 个元素的集合{1,2, ... , _n_ }可以划分为若干个非空子集。

## Input

由文件 input.txt 提供输入数据。文件的第 1 行是元素个数 n。

## Output

程序运行结束时，将计算出的不同的非空子集数输出到文件 output.txt 中。

## Sample

**输入文件示例**

input.txt

5

**输出文件示例**

output.txt

52

## Solution

### Solution 1 (Stirling)

#### Analysis

`由n个元素组成的集合`的`划分非空子集方案数`可以被看作是：

`n个不同的小球（即n个不同的数字，或者理解为n个带不同颜色的小球）`放入`无限多个不可区分的箱子`的方案数。

> 箱子是不可区分 (Indistinguishable) 的，指箱子本身不可区分。但是箱子的内容（即箱子里所放的小球）是可区分的。

由于要求`不能有空集`（即我们可以简单地忽略掉`那些没有放入任何小球的箱子`）

因此，如果我们有`n个不同的小球`，那么`非空集合的个数 m`应满足

当m = 0时，这意味着`没有任何箱子中放有小球`，这不满足`我们要将小球划分到箱子中的要求`，故方案数为0

当m = 1时，即`所有的n个小球`全部都放入`同一个箱子`

......

当m=n时，即`所有的n个小球`都`独自占有1个箱子`

当m \\gt n时，意味着`我们要让m个箱子都非空`，但是由于`我们所拥有的小球数量n < m`，故根据`鸽巢原理`（即使我们让`n个箱子都各自只装入1个小球`，也仍然有`m-n个箱子中没有小球可以装入`），这是不可能的。所以这种情况下方案数也为0.

* * *

假设A\_n为`n个元素的集合`划分为`非空子集`的方案数。

S(n, m)为将`n个元素的集合`划分为`m个非空集合`的方案数。

故

为了得到A\_n的递推关系，我们尝试从`集合划分的最后一步` 来考虑。

即：S\_n的数值可以认为是，在S\_{n-1}的情况上，我们`额外地获得了一个小球`后所形成的方案数。

我们对于`这个新获得的小球`，有两种`选择`

1.  让这个小球`独自占有1个新的箱子`
2.  把这个小球`放入到已有的m-1个非空箱子中的任意一个`

据此得出递推关系

#### Code

```java
    public static int S(int n, int m) {
        if (m == 0  n < m) return 0;
        if (m == 1  n == m) return 1;
        return S(n - 1, m - 1) + m * S(n - 1, m);
    }

    public static int A(int n) {
        int sum = 0;
        for (int m = 1; m <= n; m++) {
            sum += S(n, m);
        }
        return sum;
    }
```

#### Benchmark

```yaml
-----------------------------------------------------
Current Case: BELL0.in & BELL0.out
Expected  Input: [5]
Expected Output: [52]
Your     Output: [52]
Time Cost: 1.643300 ms (1643300 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL1.in & BELL1.out
Expected  Input: [15]
Expected Output: [1382958545]
Your     Output: [1382958545]
Time Cost: 1.033600 ms (1033600 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL2.in & BELL2.out
Expected  Input: [16]
Expected Output: [1890207555]
Your     Output: [1890207555]
Time Cost: 0.819100 ms (819100 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL3.in & BELL3.out
Expected  Input: [17]
Expected Output: [1260491180]
Your     Output: [1260491180]
Time Cost: 0.877300 ms (877300 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL4.in & BELL4.out
Expected  Input: [14]
Expected Output: [190899322]
Your     Output: [190899322]
Time Cost: 0.726000 ms (726000 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL5.in & BELL5.out
Expected  Input: [13]
Expected Output: [27644437]
Your     Output: [27644437]
Time Cost: 0.634700 ms (634700 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL6.in & BELL6.out
Expected  Input: [6]
Expected Output: [203]
Your     Output: [203]
Time Cost: 0.676200 ms (676200 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL7.in & BELL7.out
Expected  Input: [7]
Expected Output: [877]
Your     Output: [877]
Time Cost: 0.712700 ms (712700 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ √ √ √ √ √ √ √ 
```

### Solution 2 (Simulation)

#### Analysis

这种方法通过观察n=1,2,3 \\dots等`前几个比较简单的案例`，得到从`前一种案例`中`生成` `下一种案例的方法`。

即该种方法`完全地模拟了实际的集合划分情况`，对`时间和空间`的消耗都比较大。

> 可以使用`备忘录机制`，`滚动数组`，`更优的数据结构表示`等手段来进行优化。

#### Code

```java
    public static ArrayList<Integer> M = new ArrayList<>(Arrays.asList(1, 1));

    public static ArrayList<Integer> generateSimulateList(int n) {

        /* Initialize simulate list */
        ArrayList<Integer> simulateList = new ArrayList<>(Arrays.asList(1));
        if (n == 0) return simulateList;

        /* Construct simulate list */
        for (int k = 2; k < n; k++) {
            ArrayList<Integer> tempList = new ArrayList<>();
            int sum = 0;

            for (int t : simulateList) {
                // add a (self + 1)
                tempList.add(t + 1);

                // add self amount of self
                for (int i = 0; i < t; i++) tempList.add(t);

                // calc sum
                sum += (t + 1) + (t * t);
            }

            if (k == M.size()) {
                M.add(sum);
            }

            simulateList = tempList;
        }

        return simulateList;
    }

    public static int solve(int n) {

        /* Generate M[] */
        generateSimulateList(n);

        /* Accumulate plans */
        int sum = 0;
        for (int k = 0; k < n; k++) {
            sum += M.get(k);
        }
        return sum;
    }
```

#### Benchmark

```yaml
-----------------------------------------------------
Current Case: BELL0.in & BELL0.out
Expected  Input: [5]
Expected Output: [52]
Your     Output: [52]
Time Cost: 1.638300 ms (1638300 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL1.in & BELL1.out
Expected  Input: [15]
Expected Output: [1382958545]
Your     Output: [1382958545]
Time Cost: 5871.995300 ms (5871995300 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL2.in & BELL2.out
Expected  Input: [16]
Expected Output: [1890207555]
Your     Output: []
Skipped.
-----------------------------------------------------
Current Case: BELL3.in & BELL3.out
Expected  Input: [17]
Expected Output: [1260491180]
Your     Output: []
Skipped.
-----------------------------------------------------
Current Case: BELL4.in & BELL4.out
Expected  Input: [14]
Expected Output: [190899322]
Your     Output: [190899322]
Time Cost: 5377.599300 ms (5377599300 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL5.in & BELL5.out
Expected  Input: [13]
Expected Output: [27644437]
Your     Output: [27644437]
Time Cost: 45.983500 ms (45983500 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL6.in & BELL6.out
Expected  Input: [6]
Expected Output: [203]
Your     Output: [203]
Time Cost: 0.636100 ms (636100 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL7.in & BELL7.out
Expected  Input: [7]
Expected Output: [877]
Your     Output: [877]
Time Cost: 0.658200 ms (658200 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ √ → → √ √ √ √ 
```