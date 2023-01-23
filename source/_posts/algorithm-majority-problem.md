---
title: "[Algorithm] Majority Problem"
date: 2022-03-25 19:27:00
tags:
  - algorithm
---

# Majority Problem

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

## Problem

### Description

给定含有 n 个元素的多重集合 S，每个元素在 S 中出现的次数称为该元素的重数。多重

集 S 中重数最大的元素称为众数。

例如，S={1，2，2，2，3，5}。

多重集 S 的众数是 2，其重数为 3。 

### Input

输入数据由文件名为 input.txt 的文本文件提供。

文件的第 1 行多重集 S 中元素个数 n；接下来的 n 行中，每行有一个自然数。

### Output

程序运行结束时，将计算结果输出到文件 output.txt 中。输出文件有 2 行，第 1 行给

出众数，第 2 行是重数

### Sample

input.txt 

6 

1 

2 

2 

2 

3 

5 

output.txt 

2 

3 

## Solution 1 （HashMap）

### Analysis

对于给定多重集合S，可以通过一个O(n)的线性扫描，将集合的所有元素进行计次。

使用HashMap实现的解法容易编写，也容易处理答案具有多个众数的情况。

总体需要一次O(n)的线性扫描，以及在完成计数后再一次O(n)的取最大值。

### Source

```java
    public static Pair<Integer, Integer> getMajority(int[] nums, int L, int R) {

        HashMap<Integer, Integer> counter = new HashMap<>();
        for (int num : nums) {
            counter.put(num, counter.getOrDefault(num, 0) + 1);
        }

        int majorityKey = 0xdead;
        int majorityValue = -1;
        for (int key : counter.keySet()) {
            if (counter.get(key) > majorityValue) {
                majorityKey = key;
                majorityValue = counter.get(key);
            }
        }

        return new Pair<>(majorityKey, majorityValue);
    }
```

### Benchmark

```yaml
-----------------------------------------------------
Current Case: MODE1.in & MODE1.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [1, 5]
Your     Output: [1, 5]
Time Cost: 0.335700 ms (335700 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE10.in & MODE10.out
Expected  Input: [1234567, Omit the remaining 1234567 lines...]
Expected Output: [47527, 38]
Your     Output: [47527, 38]
Time Cost: 84.643900 ms (84643900 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE11.in & MODE11.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [1, 6]
Your     Output: [1, 6]
Time Cost: 0.025400 ms (25400 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE12.in & MODE12.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 5]
Your     Output: [2, 5]
Time Cost: 0.013600 ms (13600 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE13.in & MODE13.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 4]
Your     Output: [2, 4]
Time Cost: 0.011000 ms (11000 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE14.in & MODE14.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 4]
Your     Output: [2, 4]
Time Cost: 0.010100 ms (10100 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE15.in & MODE15.out
Expected  Input: [10, Omit the remaining 9 lines...]
Expected Output: [3, 4]
Your     Output: [3, 4]
Time Cost: 0.010300 ms (10300 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE2.in & MODE2.out
Expected  Input: [50, Omit the remaining 50 lines...]
Expected Output: [3, 8]
Your     Output: [3, 8]
Time Cost: 0.026100 ms (26100 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE3.in & MODE3.out
Expected  Input: [100, Omit the remaining 100 lines...]
Expected Output: [28, 9]
Your     Output: [28, 9]
Time Cost: 0.035500 ms (35500 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE4.in & MODE4.out
Expected  Input: [500, Omit the remaining 500 lines...]
Expected Output: [17, 8]
Your     Output: [17, 8]
Time Cost: 0.128000 ms (128000 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE5.in & MODE5.out
Expected  Input: [10000, Omit the remaining 10000 lines...]
Expected Output: [152, 11]
Your     Output: [152, 11]
Time Cost: 3.114500 ms (3114500 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE6.in & MODE6.out
Expected  Input: [50000, Omit the remaining 50000 lines...]
Expected Output: [1507, 11]
Your     Output: [1507, 11]
Time Cost: 9.872700 ms (9872700 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE7.in & MODE7.out
Expected  Input: [500000, Omit the remaining 500000 lines...]
Expected Output: [62872, 23]
Your     Output: [62872, 23]
Time Cost: 26.197800 ms (26197800 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE8.in & MODE8.out
Expected  Input: [1000000, Omit the remaining 1000000 lines...]
Expected Output: [15875, 34]
Your     Output: [15875, 34]
Time Cost: 47.612200 ms (47612200 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE9.in & MODE9.out
Expected  Input: [1234567, Omit the remaining 1234567 lines...]
Expected Output: [44678, 42]
Your     Output: [44678, 42]
Time Cost: 46.967400 ms (46967400 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ √ √ √ √ √ √ √ √ √ √ √ √ √ √ 
```

## Solution 2 （Sort + Two-Way Divided）

### Analysis

从直观来看，众数是整个数组里`出现次数最多的元素`，因此众数元素应当占据原始数组的`绝大部分位置`。更重要地，如果我们对`原始数组`进行`排序`，那么所有的众数很显然应当被`连续地排列在一起`。

所以，我们可以得到众数在`已排序的原始数组`中的`存在结构`。



假设使用分治法，我们猜测，可以`已排序数组中的众数`总是可以从`前一半已排序数组中的众数`和`后一半已排序数组中的众数`来得到。换句话说，我们希望使用分治法，并且利用`前一半已排序数组的众数` 和`后一半已排序数组中的众数`这两个`子问题的解`来获得`原问题的解`



为了证明`分治法`对于`已排序数组的求众数问题`是有效的，我们尝试归纳所有可能的情况：

#### Cases

##### Case1: 最终解的众数仅从某一半已排序数组之中产生（该众数没有越过分割点）

如 (1 1 1 1 1) (2 2 2 2 3) -> majority = 1, count = 5

`最终解众数1`只分布仅仅在`前一半的已排序数组`。

对于这种情况，很显然`后一半的已排序数组`中`产生的众数`不可能`战胜``前一半已排序数组`所`产生的众数`（当然，`后一半数组`的`最优情况`至多只是和`前一半已排序数组`打成`平手`）



`前一半已排序数组`和`后一半已排序数组`打成`平手`的特殊情况：

(1 1 1 1 1) (2 2 2 2 2) 对于这种情况，我们可以`任意`取`其中一半的已排序数组`作为`胜出`（因为这题我们只要得出1个众数即可，即使输入数据存在多个众数）



> 如果 前一半已排序数组中产生的众数 = 后一半已排序数组中产生的众数，那么很明显没有任何其他数可以打败这个众数，因此这个众数就是 整个已排序数组的众数。

```java
        Pair<Integer, Integer> majority1 = getMajority(nums, L, M);
        Pair<Integer, Integer> majority2 = getMajority(nums, M, R);

        if (Objects.equals(majority1.key, majority2.key))
            return new Pair<>(majority1.key, majority1.value + majority2.value);
```



##### Case2: 最终解的众数来自某一半已排序数组（且该众数越过分割点）

如 (1 1 1 1 1) (1 2 2 2 3) -> majority = 1, count = 6

和 (1 1 1 1 2) (2 2 2 2 3) -> majority = 2, count = 5

这两种情况是`对称的`，我们这里仅从考虑第前一种情况。



在这一种情况中，由于`最终解的众数从两个已排序数组的并集`之中产生。

而且，我们知道在这种情况下，`最终解的众数的分布`必然要`越过两个已排序数组数组的边界`。

也就是说，这种情况的成立条件是：`前一半已排序数组的最后一个元素`=`后一半已排序数组的第一个元素`。对此，我们需要从`中点`开始，从`中点`统计`前后两个已排序数组`中`众数最远可以分布到多远`。

也就是说，我们`从中点开始`对`整个已排序数组`做`二分查找`，试图找出`lowerBound`和`upperBound`。

这样，即可算出`该候选数的出现的次数`=`upperBound`-`lowerBound`



> 请注意，对于这种情况，我们仅仅是通过upperBound-lowerBound来算出处于中点附近的那个数（我们称为候选数）的出现次数。但是有可能这个 候选数 并不是 整个已排序数组的众数。
>
> 你可以想象到，这个数只是恰好出现在 中点附近，被分割开。所以我们需要合并它出现的次数，已获得它在整个已排序数组中正确的出现次数。（但这不意味着这个数就是整个已排序数组的众数）



```java
            if (majority1.key == nums[M]) {
                int extra = upperBound(nums, M, R, majority1.key) - M;
                majority1.value += extra;
            } else if (majority2.key == nums[M - 1]) {
                int extra = M - lowerBound(nums, L, M, majority2.key) - 1;
                majority2.value += extra;
			}
```



##### Case3: 最终解的众数来自两个已排序数组（很显然该众数越过分割点）

如：(1 1 1 3 3) (3 3 2 2 2) -> majority = 3, count = 4

对于这种情况，`这整个已排序数组的众数`并不是`前半个已排序数组所产生的众数` majority1，也不是`后半个已排序数组所产生的众数` majority2。

而是，我们在发现`中点两侧的元素值相同时`（很显然，如果中点两侧的元素值不同，那么这个元素就不可能通过`联合`来`打败` `majority1` 和 `majority2`），则`尝试检查`这个`元素`是否能`通过合并前后两半已排序数组中自己的出现次数`来分别`打败` `前一半已排序数组所产生的众数 majority1`和`后一半已排序数组所产生的众数 majority2`



```java
            if (nums[M - 1] == nums[M]) {
                int lower = lowerBound(nums, L, M, nums[M]);
                int upper = upperBound(nums, M, R, nums[M]);
                int amount = upper - lower - 1;
                Pair<Integer, Integer> majority3 = new Pair<>(nums[M], amount);
                if (majority3.value > majority1.value && majority3.value > majority2.value) {
                    return majority3;
                }
            }
```

### Source

Auxiliary Functions

```java
/**
 * Return the first element that greater than the bound in [L, R)
 * if not found, return array.length
 */
// (1 1 2) -> (1) (1 2) -> lower = 0, upper = 1
// 1 1 2 2 2 2 3
public static int upperBound(int[] nums, int L, int R, int bound) {
    if (nums[R - 1] == bound) return R;
    while (R - L > 1) {
        int M = L + (R - L) / 2;
        if (nums[M] <= bound) L = M;
        else if (nums[M] > bound) R = M;
    }
    return R;
}

/**
 * if not found, return -1
 */
public static int lowerBound(int[] nums, int L, int R, int bound) {
    if (nums[L] == bound) return -1;
    while (R - L > 1) {
        int M = L + (R - L) / 2;
        if (nums[M] < bound) L = M;
        else if (nums[M] >= bound) R = M;
    }
    return L;
}
```

Core

```java
    public static Pair<Integer, Integer> getMajority(int[] nums, int L, int R) {
        // Case1: (1 1 1 1 1) (2 2 2 2 3) -> majority = 1, count = 5
        // Case2: (1 1 1 1 1) (1 2 2 2 3) -> majority = 1, count = 6
        // Case3: (1 1 1 1 2) (2 2 2 2 3) -> majority = 2, count = 5
        // Case4: (1 1 1 3 3) (3 3 2 2 2) -> majority = 3, count = 4

        /* Base Case */
        if (L == R) return new Pair<>(0xdead, 0);
        if (R - L == 1) return new Pair<>(nums[L], 1);

        /* Recursive Case */
        int M = L + (R - L) / 2;
        Pair<Integer, Integer> majority1 = getMajority(nums, L, M);
        Pair<Integer, Integer> majority2 = getMajority(nums, M, R);

        /* Case1: the majority number of 2 parts are the same. */
        if (Objects.equals(majority1.key, majority2.key))
            return new Pair<>(majority1.key, majority1.value + majority2.value);
        else {
            /* Case2, Case3, Case4 */
            if (majority1.key == nums[M]) {
                // Case2
                int extra = upperBound(nums, M, R, majority1.key) - M;
                majority1.value += extra;
            } else if (majority2.key == nums[M - 1]) {
                // Case3
                int extra = M - lowerBound(nums, L, M, majority2.key) - 1;
                majority2.value += extra;
            } else if (nums[M - 1] == nums[M]) {
                // Case4
                int lower = lowerBound(nums, L, M, nums[M]);
                int upper = upperBound(nums, M, R, nums[M]);
                int amount = upper - lower - 1;
//                System.out.println("num = " + nums[M] + " amount = " + amount);
                Pair<Integer, Integer> majority3 = new Pair<>(nums[M], amount);

                // Can we just union and beat majority1 and majority2 ?
                // Be careful, if majority1 or majority2 equals to majority3, we'll choose the latter one.
                // (1 1 2 2) (2 3 3 3 3) -> majority = 3, count = 4
                // (1 1 2 2 2) (2 3 3 3 3) -> majority = 3, count = 4 (majority = 2, count = 4 is also correct)
                if (majority3.value > majority1.value && majority3.value > majority2.value) {
                    return majority3;
                }
            }
            // Just need to compare the majority1 and majority2
            return majority1.value > majority2.value ? majority1 : majority2;
        }
    }
```

### Benchmark

```yaml
-----------------------------------------------------
Current Case: MODE1.in & MODE1.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [1, 5]
Your     Output: [1, 5]
Time Cost: 0.290600 ms (290600 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE10.in & MODE10.out
Expected  Input: [1234567, Omit the remaining 1234567 lines...]
Expected Output: [47527, 38]
Your     Output: [49879, 38]
Time Cost: 169.661600 ms (169661600 ns)
Wrong Answer.
-----------------------------------------------------
Current Case: MODE11.in & MODE11.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [1, 6]
Your     Output: [1, 6]
Time Cost: 0.003900 ms (3900 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE12.in & MODE12.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 5]
Your     Output: [2, 5]
Time Cost: 0.003500 ms (3500 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE13.in & MODE13.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 4]
Your     Output: [2, 4]
Time Cost: 0.003400 ms (3400 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE14.in & MODE14.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 4]
Your     Output: [3, 4]
Time Cost: 0.002500 ms (2500 ns)
Wrong Answer.
-----------------------------------------------------
Current Case: MODE15.in & MODE15.out
Expected  Input: [10, Omit the remaining 9 lines...]
Expected Output: [3, 4]
Your     Output: [3, 4]
Time Cost: 0.040600 ms (40600 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE2.in & MODE2.out
Expected  Input: [50, Omit the remaining 50 lines...]
Expected Output: [3, 8]
Your     Output: [3, 8]
Time Cost: 0.021600 ms (21600 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE3.in & MODE3.out
Expected  Input: [100, Omit the remaining 100 lines...]
Expected Output: [28, 9]
Your     Output: [28, 9]
Time Cost: 0.037600 ms (37600 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE4.in & MODE4.out
Expected  Input: [500, Omit the remaining 500 lines...]
Expected Output: [17, 8]
Your     Output: [29, 8]
Time Cost: 0.329700 ms (329700 ns)
Wrong Answer.
-----------------------------------------------------
Current Case: MODE5.in & MODE5.out
Expected  Input: [10000, Omit the remaining 10000 lines...]
Expected Output: [152, 11]
Your     Output: [152, 11]
Time Cost: 1.173000 ms (1173000 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE6.in & MODE6.out
Expected  Input: [50000, Omit the remaining 50000 lines...]
Expected Output: [1507, 11]
Your     Output: [13432, 11]
Time Cost: 6.893800 ms (6893800 ns)
Wrong Answer.
-----------------------------------------------------
Current Case: MODE7.in & MODE7.out
Expected  Input: [500000, Omit the remaining 500000 lines...]
Expected Output: [62872, 23]
Your     Output: [62872, 23]
Time Cost: 46.909500 ms (46909500 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE8.in & MODE8.out
Expected  Input: [1000000, Omit the remaining 1000000 lines...]
Expected Output: [15875, 34]
Your     Output: [15875, 34]
Time Cost: 103.301900 ms (103301900 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE9.in & MODE9.out
Expected  Input: [1234567, Omit the remaining 1234567 lines...]
Expected Output: [44678, 42]
Your     Output: [44678, 42]
Time Cost: 108.699100 ms (108699100 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ × √ √ √ × √ √ √ × √ × √ √ √ 
```

> 注: 部分案例出现Wrong Answer是由于解法仅要求找出1个众数，所以对重数相同的众数的选择是任意的。

### Summary

由于该解法需要对`原始数组`进行`预处理: 排序 `后再进行`分治法`，其效率可能会比较低。（而且递归过程中创建对象所消耗的代价较大）

## Solution 3 (Sort + Three-Way Divided)

### Analysis

采用类似QuickSort的方法，但将`原始数组` 先进行`排序`，然后从`中间`进行`划分`为3个部分：

1. Part1 = {x | x < pivot}
2. Part2 = {x | x = pivot}
3. Part3 = {x | x > pivot}



首先考虑`完整的已排序数组`，取`该数组的中间元素`作为`pivot`，然后分别用`线性扫描`的方式，求出`该pivot元素`的`lowerBound`和`upperBound`，进而求得`该pivot元素的数量`（即Part2，Part2的所有元素均由`同一个元素`，即`pivot元素`组成)

很显然，如果Part2.size() > Part1.size() && Part2.size() > Part3.size()，那么`pivot的值就是整个已排序数组所产生的众数`

否则，众数有可能`产生自Part1`，也可能`产生自Part2`。因此，我们`分别都`需要`检查Part1和Part2`，即`递归地对这两部分进行处理`



* 此处采用递归的基本原理是：

  * 该问题存在一个平凡问题（即基本问题）：基本问题很简单，我们可以很容易直观地解出来。也就是 子问题的整个已排序数组 仅包含1个元素，那么 该已排序数组所产生的众数 就只能是这个元素。

  * 我们可以通过合并2个子问题的解来得到原问题的解：这也很容易，我们可以简单地`检查`这`Part1, Part2, Part3 三者中哪一个部分`产生的`众数的重数`是`最大的`

    

> 注：此算法也不考虑处理存在多个重数相等的众数的情况。如果重数相等，则任取一个。

> 注：该解法和Solution2非常类似，均需要先应排序进行预处理。然后使用分治法划分子问题，区别在于对子问题的划分方式不同。Solution2总是采用固定区间大小的二分法进行划分，而Solution3的划分区间的大小则更加动态，并且是3划分的。

### Source

```java
    public static Pair<Integer, Integer> getMajority(int[] nums, int L, int R) {
        /* Base Case */
        // R - L = {0, 1}
        if (R - L <= 1) return new Pair<>(nums[L], 1);

        /* Recursive Case */
        int M = L + (R - L) / 2;
        int M_Value = nums[M];

        int lowerBound = M, upperBound = M;
        while (lowerBound >= 0 && nums[lowerBound] == M_Value) lowerBound--;
        while (upperBound < nums.length && nums[upperBound] == M_Value) upperBound++;

        int M_Count = upperBound - lowerBound - 1;
        Pair<Integer, Integer> majorityMiddle = new Pair<>(M_Value, M_Count);

        // Anyway, Part2 will always win !
        if (M_Count >= (lowerBound - L + 1) && M_Count >= (R - upperBound)) return majorityMiddle;

        // Ok, we should choose the largest one among Part1, Part2 and Part3.
        Pair<Integer, Integer> majorityLeft = getMajority(nums, L, lowerBound + 1);
        Pair<Integer, Integer> majorityRight = getMajority(nums, upperBound, R);
        if (M_Count >= majorityLeft.value && M_Count >= majorityRight.value) return majorityMiddle;
        else return majorityLeft.value > majorityRight.value ? majorityLeft : majorityRight;
    }
```

### Benchmark

```yaml
-----------------------------------------------------
Current Case: MODE1.in & MODE1.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [1, 5]
Your     Output: [1, 5]
Time Cost: 0.226700 ms (226700 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE10.in & MODE10.out
Expected  Input: [1234567, Omit the remaining 1234567 lines...]
Expected Output: [47527, 38]
Your     Output: [49879, 38]
Time Cost: 165.034000 ms (165034000 ns)
Wrong Answer.
-----------------------------------------------------
Current Case: MODE11.in & MODE11.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [1, 6]
Your     Output: [1, 6]
Time Cost: 0.003500 ms (3500 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE12.in & MODE12.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 5]
Your     Output: [2, 5]
Time Cost: 0.002500 ms (2500 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE13.in & MODE13.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 4]
Your     Output: [2, 4]
Time Cost: 0.003200 ms (3200 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE14.in & MODE14.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 4]
Your     Output: [2, 4]
Time Cost: 0.002800 ms (2800 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE15.in & MODE15.out
Expected  Input: [10, Omit the remaining 9 lines...]
Expected Output: [3, 4]
Your     Output: [3, 4]
Time Cost: 0.042700 ms (42700 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE2.in & MODE2.out
Expected  Input: [50, Omit the remaining 50 lines...]
Expected Output: [3, 8]
Your     Output: [3, 8]
Time Cost: 0.024600 ms (24600 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE3.in & MODE3.out
Expected  Input: [100, Omit the remaining 100 lines...]
Expected Output: [28, 9]
Your     Output: [28, 9]
Time Cost: 0.026300 ms (26300 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE4.in & MODE4.out
Expected  Input: [500, Omit the remaining 500 lines...]
Expected Output: [17, 8]
Your     Output: [29, 8]
Time Cost: 0.174600 ms (174600 ns)
Wrong Answer.
-----------------------------------------------------
Current Case: MODE5.in & MODE5.out
Expected  Input: [10000, Omit the remaining 10000 lines...]
Expected Output: [152, 11]
Your     Output: [152, 11]
Time Cost: 4.243100 ms (4243100 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE6.in & MODE6.out
Expected  Input: [50000, Omit the remaining 50000 lines...]
Expected Output: [1507, 11]
Your     Output: [13432, 11]
Time Cost: 6.618700 ms (6618700 ns)
Wrong Answer.
-----------------------------------------------------
Current Case: MODE7.in & MODE7.out
Expected  Input: [500000, Omit the remaining 500000 lines...]
Expected Output: [62872, 23]
Your     Output: [62872, 23]
Time Cost: 38.010200 ms (38010200 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE8.in & MODE8.out
Expected  Input: [1000000, Omit the remaining 1000000 lines...]
Expected Output: [15875, 34]
Your     Output: [15875, 34]
Time Cost: 73.012900 ms (73012900 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE9.in & MODE9.out
Expected  Input: [1234567, Omit the remaining 1234567 lines...]
Expected Output: [44678, 42]
Your     Output: [44678, 42]
Time Cost: 86.186500 ms (86186500 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ × √ √ √ √ √ √ √ × √ × √ √ √ 
```



## Solution 4 (Three-Way QuickSort)

### Analysis

在前面所提到的 `分治法` 中，都需要对 `原始数组` 进行 `排序` 。

但实际上，我们可以将 `排序` 和 `寻找众数` 的过程 `同时进行`。

我们之前所提的 `需要预排序的二分法` 和 `需要预排序的三分法` 之所以需要 `排序`，

是因为我们 `某个数字` 可能 `零散地分布` 在 `原始数组` 的 `各个角落`，这将使得 `我们的分治方法` 必须 `把相同的数字` 都 `聚集`在一起，否则将无法 `统计` `该数字的出现次数`。

> 实际上，如果仅仅是为了 `寻找众数`，我们并不需要使得 `原始数组` 是 `完全地有序的`。
>
> > 当我们发现，`在对某个区间的某个元素` 进行 `3向划分`之后，`该元素的出现次数` `大于` `该区间的长度的一半`，
> >
> > 那么显然，`该元素` 必定就是 `该区间` 的 `众数`。我们就没有必要再对 `该区间的其余部分` 继续进行 `划分`。

设想，如果对于 `任意给定的数组`，我们可以 `使得该数组中某个数字` 进行 `聚集`，然后求得 `该数字的出现次数`。

那么，我们可以采用 `摩尔投票法 (Moore Voting Method)` 的思想：

- 如果我们发现，`该数字的出现次数 ` `大于` `其余部分的长度`，则显然 `该数字` 就是 `众数`

  > `摩尔投票法` 将 `序列` 分成 `2部分`： `等于指定元素` 和 `不等于指定元素`

- 否则，我们可以对 `剩余的部分` 继续进行 `聚集数字的操作`

  > 由于我们使用的是 `三向快速排序 (Three-Way QuickSort)`，所以我们的 `划分函数 (Partition Function)` 会将 `给定的数组` 划分为3个部分，使得在部分中的任何元素满足：`x < pivot`，`x = pivot` 和 `x > pivot` 

在对 `指定的数字` 进行 `划分` 之后，我们可以获得以下 `信息` ：

- `该数字的出现次数`：$count = upper\_bound - lower\_bound + 1$

- 比 `该数字的出现次数` 少的 `部分`之中，不可能产生 `众数`。

  > n.b. 在 `Moore Voting Method`中，我们要求 `寻找多数`。
  >
  > > `多数`：在 `序列`中，`出现次数` `超过` `序列的长度的一半` 的 `元素`
  >
  > `摩尔投票法` 并不要求 `原始数组` 是有序的，因为根据 `多数` 的定义，`多数的出现次数` 大于 `其他所有元素出现的次数`，所以我们可以 `确定`。
  >
  > `序列中某个元素的出现次数`如果超过 `序列的长度的一半`，则 `该元素` 必定是 `多数`。
  >
  > > 其实，有另一种求 `多数` 的 `简单策略`：直接将 `原始序列` 进行 `排序`，然后 `位于序列中间的元素` 就是 `多数`
  >
  > > `Moree Voting Method` 最多需要进行 $\roundup{\frac{3n}{2}} - 2$ 次 `比较操作`。
  > >
  > > 而 `Three-Way Quicksort Method` 在处理 `相等元素` 非常多且选定 `该元素`作为 `基准元素 (pivot)` 的情况下，可以达到 `趋近于线性的复杂度`。
  > >
  > > > 可以通过 `随机化技术` 来 `透明地` 改变 `基准元素的选取`。
  > > >
  > > > ```java
  > > >          // randomize pivot
  > > >          swap(nums, left_index, random.nextInt(right_index - left_index + 1) + left_index);
  > > > ```
  > > >
  > > > 但根据实际测试，这并不会对本题 `有较好的改善`。
  > > >
  > > > 由于 `众数的出现次数较多`，相应地 `在指定位置的元素是众数的概率` 也 `自然` 应当较大。而此时 `随机化技术` 并没有 `提高` `选取到众数的概率`，反而我们还需要付出 `较为昂贵的随机数生成的代价`。
  > > >
  > > > 然而，对于 `普通的2向快速排序` 和 `普通的3向快速排序`来说，可以认为 `原始数组的元素` 是 `随机的`，但我们可以用 `随机化技术` 来避免在 `某些特殊情况下`，选取到 `坏的基准元素`。

### Source

```java
package Lab3;

import util.Judger;

import java.util.Scanner;

/**
 * @author Teeth
 * @date 3/12/2022 07:48
 */
public class MajoritySolver_QuickSort {

    public static class Node {

        public int majority;
        public int count;
        public int left_index;
        public int right_index;
        public int lower_bound;
        public int upper_bound;

        public Node(int majority, int count, int left_index, int right_index, int lower_bound, int upper_bound) {
            this.majority = majority;
            this.count = count;
            this.left_index = left_index;
            this.right_index = right_index;
            this.lower_bound = lower_bound;
            this.upper_bound = upper_bound;
        }

        public Node(int left_index, int right_index) {
            this.left_index = left_index;
            this.right_index = right_index;
        }

    }

    private static final Judger judger = new Judger(".\\Cases\\Lab3\\MAJORITY").disablePrettyFormat().redirectErrorToErrorFile().setMaxExpectInputLines(1);

    public static void swap(int[] nums, int i, int j) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }

    /*
    [left_index..left_bound-1] < majority
    [left_bound..right_bound] = majority
    [right_bound+1..right_index] > majority
    array = 2 2 3 5 3 5 1 2 3 4
     */
    public static Node partition(int[] nums, int left_index, int right_index) {
        int lower_bound = left_index;
        int upper_bound = right_index;
        int i = left_index + 1;

        while (i <= upper_bound) {
            // n.b. we use [lower_bound..upper_bound] to present x = majority
            if (nums[i] < nums[lower_bound]) {
                swap(nums, lower_bound++, i++);
            } else if (nums[i] > nums[lower_bound]) {
                // n.b. index i should not be incremented
                swap(nums, upper_bound--, i);
            } else i++;
        }

        /* Construct node */
        return new Node(nums[lower_bound], upper_bound - lower_bound + 1, left_index, right_index, lower_bound, upper_bound);
    }

    public static Node quickSort(int[] nums, int left_index, int right_index) {

        if (left_index < right_index) {
            Node split = partition(nums, left_index, right_index);
            int majority_nums_count = split.upper_bound - split.lower_bound + 1;
            int left_nums_count = split.lower_bound - split.left_index;
            int right_nums_count = split.right_index - split.upper_bound;

            // n.b. select strategy: non-strict partial order
            // n.b. use MOORE VOTING METHOD here!
            if ((majority_nums_count >= left_nums_count && majority_nums_count >= right_nums_count)) {
                return new Node(nums[split.lower_bound], majority_nums_count, split.left_index, split.right_index, split.lower_bound, split.upper_bound);
            } else {
                Node left_nums_node = quickSort(nums, left_index, split.lower_bound - 1);
                Node right_nums_node = quickSort(nums, split.upper_bound + 1, right_index);

                // n.b. select strategy: non-strict partial order
                Node winner = left_nums_node.count >= right_nums_node.count ? left_nums_node : right_nums_node;
                winner = winner.count >= split.count ? winner : split;
                return winner;
            }
        }

        // empty node
        return new Node(left_index, right_index);
    }

    public static Node getMajority(int[] nums, int begin, int end) {
        return quickSort(nums, begin, end - 1);
    }

    public static void main(String[] args) {
        for (Scanner scanner : judger) {
            // Skip the first line.
            int capacity = scanner.nextInt();

            // Read the numbers.
            int[] nums = new int[capacity];
            for (int i = 0; scanner.hasNextInt(); i++) {
                nums[i] = scanner.nextInt();
            }

            // call the algorithm
            judger.manuallyStartTimer();
            Node node = getMajority(nums, 0, nums.length);
            judger.manuallyStopTimer();

            // Output
            System.out.println(node.majority);
            System.out.println(node.count);
        }
    }
}
```

### Benchmark

```yaml
-----------------------------------------------------
Current Case: MODE1.in & MODE1.out
Expected  Input: [10, Omit the remaining 10 line(s)...]
Expected Output: [1, 5]
Your     Output: [1, 5]
Time Cost: 0.045200 ms (45200 ns)
Accepted
-----------------------------------------------------
Current Case: MODE10.in & MODE10.out
Expected  Input: [1234567, Omit the remaining 1234567 line(s)...]
Expected Output: [47527, 38]
Your     Output: [47527, 38]
Time Cost: 104.330000 ms (104330000 ns)
Accepted
-----------------------------------------------------
Current Case: MODE11.in & MODE11.out
Expected  Input: [10, Omit the remaining 10 line(s)...]
Expected Output: [1, 6]
Your     Output: [1, 6]
Time Cost: 0.001100 ms (1100 ns)
Accepted
-----------------------------------------------------
Current Case: MODE12.in & MODE12.out
Expected  Input: [10, Omit the remaining 10 line(s)...]
Expected Output: [2, 5]
Your     Output: [2, 5]
Time Cost: 0.001000 ms (1000 ns)
Accepted
-----------------------------------------------------
Current Case: MODE13.in & MODE13.out
Expected  Input: [10, Omit the remaining 10 line(s)...]
Expected Output: [2, 4]
Your     Output: [2, 4]
Time Cost: 0.000901 ms (901 ns)
Accepted
-----------------------------------------------------
Current Case: MODE14.in & MODE14.out
Expected  Input: [10, Omit the remaining 10 line(s)...]
Expected Output: [2, 4]
Your     Output: [2, 4]
Time Cost: 0.001200 ms (1200 ns)
Accepted
-----------------------------------------------------
Current Case: MODE15.in & MODE15.out
Expected  Input: [10, Omit the remaining 9 line(s)...]
Expected Output: [3, 4]
Your     Output: [3, 4]
Time Cost: 0.001101 ms (1101 ns)
Accepted
-----------------------------------------------------
Current Case: MODE2.in & MODE2.out
Expected  Input: [50, Omit the remaining 50 line(s)...]
Expected Output: [3, 8]
Your     Output: [3, 8]
Time Cost: 0.002099 ms (2099 ns)
Accepted
-----------------------------------------------------
Current Case: MODE3.in & MODE3.out
Expected  Input: [100, Omit the remaining 100 line(s)...]
Expected Output: [28, 9]
Your     Output: [28, 9]
Time Cost: 0.004400 ms (4400 ns)
Accepted
-----------------------------------------------------
Current Case: MODE4.in & MODE4.out
Expected  Input: [500, Omit the remaining 500 line(s)...]
Expected Output: [17, 8]
Your     Output: [29, 8]
Time Cost: 0.029600 ms (29600 ns)
Wrong Answer.
-----------------------------------------------------
Current Case: MODE5.in & MODE5.out
Expected  Input: [10000, Omit the remaining 10000 line(s)...]
Expected Output: [152, 11]
Your     Output: [152, 11]
Time Cost: 0.564300 ms (564300 ns)
Accepted
-----------------------------------------------------
Current Case: MODE6.in & MODE6.out
Expected  Input: [50000, Omit the remaining 50000 line(s)...]
Expected Output: [1507, 11]
Your     Output: [1507, 11]
Time Cost: 3.741200 ms (3741200 ns)
Accepted
-----------------------------------------------------
Current Case: MODE7.in & MODE7.out
Expected  Input: [500000, Omit the remaining 500000 line(s)...]
Expected Output: [62872, 23]
Your     Output: [62872, 23]
Time Cost: 37.026301 ms (37026301 ns)
Accepted
-----------------------------------------------------
Current Case: MODE8.in & MODE8.out
Expected  Input: [1000000, Omit the remaining 1000000 line(s)...]
Expected Output: [15875, 34]
Your     Output: [15875, 34]
Time Cost: 71.459100 ms (71459100 ns)
Accepted
-----------------------------------------------------
Current Case: MODE9.in & MODE9.out
Expected  Input: [1234567, Omit the remaining 1234567 line(s)...]
Expected Output: [44678, 42]
Your     Output: [44678, 42]
Time Cost: 83.852201 ms (83852201 ns)
Accepted
-----------------------------------------------------
Result Statistics: √ √ √ √ √ √ √ √ √ × √ √ √ √ √ 
```
