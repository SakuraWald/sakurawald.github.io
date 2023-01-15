---
title: STL -  Simple Use of STL
tags: []
id: '43663'
categories:
  - - uncategorized
date: 2022-04-18 22:44:19
---

# Code Snippet

## Standard C Libraries

### Template Header Files

```cpp
/* Template Begin */
#include <algorithm>
#include <iostream>
#include <stdio.h>
#include <time.h>
#include <cmath>
#include <string>
#include <vector>
#include <stack>
#include <queue>
#include <deque>
#include <list>
#include <map>
#include <unordered_map>
#include <set>
#include <unordered_set>
#include <bitset>
#include <numeric>
#include <functional>
#include <iterator>
#include <tuple>
#include <complex>
#include <limits.h>
#include <stack>
#include <sstream>
using namespace std;
/* Template End */
```

### ctype.h

Function

Note

\\t{isalpha()}

 

\\t{isdigit()}

 

\\t{islower()}

 

\\t{isupper()}

 

\\t{ispunct()}

 

\\t{isblank()}

`C标准库` 只为 `\t` 和 `space` 返回 `非0值`

Function

Note

\\t{tolower()}

 

\\t{toupper()}

 

### limits.h

Marco Constant

Note

\\t{INT\\\_MIN}

 

\\t{INT\\\_MAX}

 

\\t{LONG\\\_MIN}

 

\\t{LONG\\\_MAX}

 

\\t{LLONG\\\_MIN}

 

\\t{LLONG\\\_MAX}

 

\\t{UINT\\\_MIN}

 

\\t{UINT\\\_MAX}

 

\\t{ULLONG\\\_MIN}

 

\\t{ULLONG\\\_MAX}

 

### math.h

#### Trigonometric Functions

Function

Note

\\t{sin(), cos(), tan()}

 

\\t{asin(), acos(), atan()}

 

\\t{atan2()}

返回 `给定坐标`的 `角度`

> 注：这些 `三角函数` 输入均为 `浮点数`，默认使用 `弧度`作为单位。

#### Hyperbolic Functions

Function

Note

\\t{sinh(), cosh(), tanh()}

 

\\t{asinh(),acosh(),atanh()}

 

#### Exponential and Logarithmic Functions

Function

Note

\\t{exp()}

返回 `自然常数`的指定 `指数值`

\\t{log()}

返回以 `自然常数`为底的 `对数`

\\t{log10()}

返回以 `10` 为底的 `对数`

\\t{log2()}

返回以 `2`为底的 `对数`

#### Power Functions

Function

Note

\\t{pow()}

该函数底层通过 `浮点数` 进行计算，  
存在 `精度损失问题`，若确实需要使用，请配合 `round()`

\\t{sqrt()}

返回 `平方根`

\\t{bqrt()}

返回 `立方根`

\\t{hypot}()

返回 `直角三角形的斜边`

#### Rounding and Remainder Functions

Function

Note

\\t{floor()}

向下取整

\\t{ceil()}

向上取整

#### Other Functions

Function

Note

\\t{abs()}

用于 `求整数的绝对值`  
对于 `浮点数`存在 `精度问题`

\\t{fabs()}

用于 `求浮点数的绝对值`

#### Classification Macro/Functions

Macro/Functions

Note

\\t{isinf()}

判断 `浮点数`是否 `无穷大`

\\t{isnan()}

判断 `浮点数`是否为 `实数`

> 注：`除0错误`是针对 `整数`而言的。如果对 `浮点数`进行 `除0操作`，将得到一个 `特殊的浮点数值`，
> 
> 它用于表示 `无穷大`。同理，也有 `另一个特殊的浮点数值`用于表示 `非数字 (Not-A-Number)`

#### Comparison Macro/Functions

Macro/Function

Note

\\t{isgreater()}

 

\\t{isgreaterequal()}

 

### stdio.h

#### Formatted Input/Output

Function

Note

\\t{scanf()}

格式化输入

\\t{printf()}

格式化输出

\\t{sscanf()}

格式化输入到 `字符串`

\\t{sprintf()}

格式化输出到 `字符串`

\\t{getchar()}

该方法 `不会跳过` `空白字符` (回车，换行，空格)

\\t{gets()}

输入`1行 (以\n作为分隔符)字符串`

\\t{puts()}

输出 `1行字符串`  
注：该方法会在末尾自动加 `\n`

#### Macros

Macro

Note

EOF

`值为-1的整数`，作为 `文件流的末尾标识字符`  
注：`EOF`并不属于 `文件内容`的一部分。它只是一个 `流状态标识符`

NULL

`整数值为0的字符`，作为 `字符串的末尾标识字符`  
注：`NULL字符`确实属于 `C语言风格式的字符串`的 `一部分`

\\t{size\\\_t}

`无符号类型整数`。

### stdlib.h

#### String Conversion

Function

Note

\\t{atoi(), atof(), atol(), atoll()}

转换 `string`到 `int`，`double`，`long`，`longlong`

\\t{strtod(), strtoll(), strtoul(), strtoull()}

转换 `string` (解释为以 `base`为基)到 `long` `longlong` `unsigned long` `unsign long long`，所 `返回的整数` 为 `计量用的权重`

#### Pseudo-Random Sequence Generation

Function

Note

\\t{srand()}

`初始化` `随机数种子`

\\t{rand()}

`生成` `下一个随机数`

#### Dynamic Memory Management

Function

Note

\\t{malloc()}

 

\\t{calloc()}

该方法会自动进行 `填0初始化`

\\t{realloc()}

 

\\t{free()}

`释放动态申请的内存`

#### Searching and Sorting

Function

Note

\\t{qsort()}

`快速排序`

\\t{bsearch()}

`二分查找`

### string.h

#### Copying

Function

Note

\\t{memcpy()}

 

\\t{memmove()}

 

\\t{strcpy()}

 

#### Concatenation

Function

Note

\\t{strcat()}

 

#### Comparison

Function

Note

\\t{memcmp()}

 

\\t{strcmp()}

 

#### Searching

Function

Note

\\t{memchr()}

 

\\t{strchr()}

 

\\t{strrchr()}

 

\\t{strpbrk()}

 

\\t{strcspn()}

 

\\t{strspn()}

 

\\t{strstr()}

 

\\t{strtok()}

 

#### Other

Function

Note

\\t{memset()}

该方法本质是 `填充字符串`，如果要填充 `整数`，  
则下列 `整数`是可行的： `0`， `-1`

\\t{strlen()}

该方法 `不计入` `字符串末尾的结束字符`

### time.h

#### Time Manipulation

Function

Note

\\t{clock()}

 

\\t{difftime()}

 

\\t{mktime()}

 

\\t{time()}

 

#### Conversion

Function

Note

\\t{asctime()}

 

\\t{ctime()}

 

\\t{gmtime()}

 

\\t{localtime()}

 

\\t{strftime}

 

## Containers

### vector

### queue

### deque

### stack

### list

### set

### map

### unordered\_map

### unordered\_set

## Other Libraries

Library

Note

\\t{algorithm}

 

\\t{bitset}

 

\\t{chrono}

 

\\t{codecvt}

 

\\t{complex}

 

\\t{exception}

 

\\t{functional}

 

\\t{initializer\\\_list}

 

\\t{iterator}

 

\\t{limits}

 

\\t{locale}

 

\\t{memory}

 

\\t{new}

 

\\t{numeric}

 

\\t{random}

 

\\t{ratio}

 

\\t{regex}

 

\\t{stdexcept}

 

\\t{string}

 

\\t{system\\\_error}

 

\\t{tuple}

 

\\t{typeindex}

 

\\t{typeinfo}

 

\\t{type\\\_traits}

 

\\t{utility}

 

\\t{valarray}

 

## Code Snippets

### Initialize the Array with Fixed-Element

*   `定义时` 使用 `列表初始化`

```cpp
  int arr[10] = {1,2,3};
```

```cpp
1 2 3 0 0 0 0 0 0 0
```

> `列表初始化` 会 `列表的元素`填充到 `数组的前几个元素`，`数组的剩余元素`一律 `填0`

*   使用 `memset`进行 `内存字符填充`

```cpp
  int arr[10];
  memset(arr, 0, sizeof(array));
```

```cpp
0 0 0 0 0 0 0 0 0 0
```

> 注意：该种方法只能用于填充 `0`和 `-1`

*   利用 `全局变量`自动 `初始化填0`的特性

```cpp
int arr[10];
int main() {
  for (int i = 0; i < 10; ++i) {
    printf("%d ", arr[i]);
  }
  return 0;
}
```

```cpp
0 0 0 0 0 0 0 0 0 0
```

*   使用 `fill()` 填充函数

```cpp
  int arr[10];
  fill(arr, arr + 10, 2022);
```

```cpp
2022 2022 2022 2022 2022 2022 2022 2022 2022 2022
```

> `fill_n()` 只用 `指定值` 填充 `前n个元素`
> 
> ```cpp
> int arr[10];
> fill_n(arr, 3, 2020);
> ```
> 
> ```cpp
> 2020 2020 2020 0 8 0 75 0 16875376 0
> ```

### Initialize the Array with Generated-Element

*   使用 `generate()` 生成函数

```cpp
  int arr[10];
  generate(arr, arr + 10, []() { return rand() % 5; });
```

```cpp
1 2 4 0 4 4 3 3 2 4
```

> 如果需要让 `generate()` 保存 `状态`，则可以利用 `静态局部变量`来实现。
> 
> > 用 `全局变量`也可以，但 `静态局部变量`使得 `代码结构`更加 `紧凑`
> 
> ```cpp
>   int arr[10];
>   generate(arr, arr + 10, []() {
>       static int i = 1;
>       return i *= 2;
>   });
> ```
> 
> ```
> 2 4 8 16 32 64 128 256 512 1024
> ```

### Generate Lexicographical-Permutation

*   使用 `next_permutation()`

```cpp
  string words = "abc";
  do {
    cout << words << endl;
  } while (next_permutation(words.begin(), words.end()));
```

```cpp
abc
acb
bac
bca
cab
cba
```

> 同理，`prev_permutation()`则是 `生成上一个排列`

相关辅助函数：`is_permutation()`

### Hash Function

*   使用 `hash结构体模板`

```cpp
  hash<string> string_hash;
  string first_words = "abc";
  string second_words = "cba";

  printf("hash(first_words) = %lld", string_hash(first_words));
  printf("\n");
  printf("hash(second_words) = %lld", string_hash(second_words));
```

```cpp
hash(first_words) = 3663726644998027833
hash(second_words) = -4830583261295167161
```

### Find the Index of A Specific Element

*   使用 `find()`

```cpp
  int arr[] = {0, 10, 20, 30, 40, 50, 60, 70, 80, 90};
  int index = find(arr, arr + 10, 70) - arr;
  printf("index = %d", index);
```

```cpp
index = 7
```

*   使用 `find_if()`

```cpp
  int arr[] = {0, 10, 20, 30, 40, 50, 60, 70, 80, 90};
  int index = find_if(arr, arr + 10, [](const auto &obj) {
      return obj != 0 && obj % 15 == 0;
  }) - arr;
  printf("index = %d", index);
```

```cpp
index = 3
```

### Find the Index of A Subsequence

*   使用 `find_first()`

```cpp
  int arr[] = {0, 30, 40, 50, 10, 20, 30, 40, 50, 60, 70, 80, 90};
  int needle[] = {30, 40, 50};
  int index = find_first_of(arr, arr + 13, needle, needle + 3) - arr;
  printf("index = %d", index);
```

```cpp
index = 1
```

> `find_first_of()` ：返回 `第一个相等的子序列`的 `首元素下标`
> 
> `find_end()`：返回 `最后一个相等的子序列`的 `首元素下标`

*   使用 `search()`

```cpp
  int arr[] = {0, 10, 20, 30, 40, 50, 60, 70, 80, 90};
  int needle[] = {30, 40, 50};
  int index = search(arr, arr + 10, needle, needle + 3) - arr;
  printf("index = %d", index);
```

```cpp
index = 3
```

> `search`返回的是 `第一个满足条件的元素`

> 默认的 `search()`使用的是 `相等谓词`，我们也可以自定义 `二元相等谓词`
> 
> ```cpp
> int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
> int needle[] = {9, 16, 25};
> int index = search(arr, arr + 10, needle, needle + 3, [](const auto &o1, const auto &o2) {
>  return o1  * o1 == o2;
> }) - arr;
> printf("index = %d", index);
> ```
> 
> ```cpp
> index = 3
> ```

> 此外，如果我们的 `子序列`是 `相同元素组成的指定长度的子序列`，则可以直接使用 `search_n()`
> 
> ```cpp
> int arr[] = {0, 1, 2, 9, 9, 5, 6, 7, 8, 9, 10};
> int index = search_n(arr, arr + 10, 2, 9) - arr;
> printf("index = %d", index);
> ```
> 
> ```cpp
> index = 3
> ```

### Find in Two-Consecutive Elements

*   使用 `find_adjacent()`

```cpp
  int arr[] = {0, 10, 20, 20, 40, 50, 60, 70, 80, 90};
  int index = adjacent_find(arr, arr + 10, [](const auto &o1, const auto &o2){
    return o1 == o2;
  }) - arr;
  printf("index = %d", index);
```

```cpp
index = 2
```

### Count the number of elements for which predicate is true

*   使用 `count_if()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  int cnt = count_if(arr, arr + 10, [](const auto &o1) {
      return o1 % 2 == 0;
  });
  printf("cnt = %d", cnt);
```

```cpp
cnt = 5
```

### Return the First Position where Two Ranges differs

```cpp
  int arr[] = {0, 1, 2, 30, 4, 5, 6, 7, 8, 9};
  int needle[] = {0, 1, 2};
  pair<int *, int *> ret = mismatch(arr, arr + 10, needle);
  printf("ret->first = %d", ret.first - arr);
  printf("\n");
  printf("ret->second = %d", ret.second - needle);
```

```cpp
ret->first = 3
ret->second = 3
```

> `mismatch()` 默认使用的 `二元相等谓词` 就是 `operator=`。
> 
> 如果需要，可以自定义 `二元相等谓词`

> `equal()` 与 `mismatch()`类似，但它只返回 `是否相等`

### Test For-All and Exist

*   使用 `all_of()`

```cpp
  int arr[] = {0, 2, 4, 6, 8, 10};
  bool flag = all_of(arr, arr + 6, [](const auto&o1){
    return o1 % 2 == 0;
  });
  cout << flag;
```

```cpp
1
```

> `any_of()`同理，它可以测试是否有 `任何一个元素`满足 `条件`。
> 
> `none_of()` 可以用 `all_of()` 取反来实现。

### Apply function to range

*   使用 `for_each()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  for_each(arr, arr + 10, [](const auto & o1){
    cout << o1 * o1 << " ";
  });
```

```cpp
0 1 4 9 16 25 36 49 64 81
```

### Remove Duplicates

*   使用 `sort()` 配合 `unique()`

```cpp
  int arr[] = {10, 10, 20, 30, 40, 50, 10, 60, 70, 80};
  unique(arr, arr + 10);
  for (int i = 0; i < 10; ++i) {
    printf("%d ", arr[i]);
  }
```

```cpp
10 20 30 40 50 10 60 70 80 80
```

> n.b. `unique()` 的 `语义`并不是 `去除序列的重复元素`，而是 `去除序列的连续的重复元素 (只保留一个相同元素)`。
> 
> 上述例子中只有 `连续的10`被去除。
> 
> 如果确实要去除 `序列中所有的重复元素`，则应当先 `sort()`使得 `所有的相同元素`是 `连续排列的`，再使用 `unique()`

> 该函数也有 `可复制到指定输出流的版本` `unique_copy()`

### Print Range

*   使用 `for_each()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  for_each(arr, arr + 10, [](const auto &item) {
      cout << item << " ";
  });
```

*   使用 `copy()`

```cpp
  copy(arr, arr + 10, ostream_iterator<int>(cout, " "));
```

### Copy range of elements

*   使用 `copy()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  int dest[10];
  copy(arr, arr + 10, dest);
```

> 可以使用 `带谓词的版本` `copy_if()`
> 
> 如果需要 `反向遍历`，可以使用 `copy_backward()`

### Move range of elements

*   使用 `move()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  move(arr, arr + 2, arr + 3);
```

```cpp
0 1 2 0 1 5 6 7 8 9
```

> `move()`方法允许 `目标内存区域`和 `来源内存区域`发生 `重叠`。
> 
> 但是，`move()`不保证 `来源内存区域`的 `内容`仍 `保持原样`

### Transform Range

*   使用 `transform()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  transform(arr, arr + 10, arr, [](const auto & o1){
    return o1 * o1;
  });
  copy(arr, arr + 10, ostream_iterator<int>(cout, " "));
```

```cpp
0 1 4 9 16 25 36 49 64 81
```

> `transform()`可以指定 `输出目标流`，并且允许 `输出目标流`和 `输入流`发生 `重叠`。
> 
> 有点类似 `for_each()`，但 `for_each()`经常用于 `非修改性操作`，而 `transform()` 用于 `修改性操作`

### Replace Values in Range

*   使用 `replace()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  replace(arr, arr + 10, 3, 3000);
```

```cpp
0 1 2 3000 4 5 6 7 8 9
```

> 可以使用 `带谓词版本的` `replace_if()`来替代 `replace()`：只有当 `谓词` `测试通过`时，才会用 `新值` 替换 `当前元素`

*   使用 `replace_copy()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  int dest[10];
  replace_copy(arr, arr + 10, dest, 3, 3000);
  copy(arr, arr + 10, ostream_iterator<int>(cout, " "));
  printf("\n");
  copy(dest, dest + 10, ostream_iterator<int>(cout, " "));
```

```cpp
0 1 2 3000 4 5 6 7 8 9
```

> 相比于 `replace()`而言，`replace_copy()`可以指定 `修改结果的输出流`。
> 
> > 特别地，`replace_copy()`可以重新将 `输出流`指定为 `输入流`
> > 
> > 在这个情况下，`replace_copy()`等价于 `replace()`

> 此外，还有一个 `带谓词版本的` `repalce_copy_if()`
> 
> 我们称它是`万能的替换函数`，因为它可以取代：`repalce()`，`replace_if()`，`replace_copy()`

### Reverse Range

*   使用 `reverse()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  reverse(arr, arr + 10);
```

```cpp
9 8 7 6 5 4 3 2 1 0
```

> `可复制到指定输出流的版本` `reverse_copy()`

### Rotate left the elements in range

*   使用 `rotate()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  rotate(arr, arr + 3, arr + 10);
```

```cpp
3 4 5 6 7 8 9 0 1 2
```

### Rearrange elements in range

*   使用 `random_shuffle()` 随机生成函数

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  random_shuffle(arr, arr + 10);
```

```cpp
8 1 9 2 0 5 7 3 4 6
```

> 该方法可用于 `洗牌算法`

### Merge (Operating on Sorted Ranges)

*   使用 `set_intersection()`

```cpp
  vector<int> A = {1, 2, 3};
  vector<int> B = {3, 4, 5, 6};
  sort(A.begin(), A.end());
  sort(B.begin(), B.end());
  vector<int> result(10);
  auto it = set_intersection(A.begin(), A.end(), B.begin(), B.end(), result.begin());
  copy(result.begin(), it, ostream_iterator<int>(cout, " "));
```

```cpp
3
```

*   集合交\\implies `set_union()`
    
*   集合差 \\implies`set_difference()`
    
*   集合对称差 \\implies `set_symmetric_difference()`
    
*   归并 \\implies `merge()`：`归并操作`
    
    > 相比于 `set_union()`而言，`merge()`会 `保留多个相同的元素`
    
*   原址性归并 \\implies `inplace_merge()`：`原址性的归并操作`
    
    > ```cpp
    > vector<int> arr = {1, 1, 2, 3, 4, 2, 3, 4, 5, 6, 7};
    > inplace_merge(arr.begin(), arr.begin() + 5, arr.end());
    > ```
    > 
    > ```cpp
    > 1 1 2 2 3 3 4 4 5 6 7
    > ```
    
*   测试包含关系 \\implies`includes()`
    
    > ```cpp
    > vector<int> A = {0,1,2,3,4,5,6,7,8,9};
    > vector<int> B = {3,4,5,6};
    > cout << includes(A.begin(), A.end(), B.begin(), B.end());
    > printf("\n");
    > cout << includes(B.begin(), B.end(), A.begin(), A.end());
    > ```
    > 
    > ```cpp
    > 1
    > 0
    > ```
    

> n.b. 上述的 `所有的归并操作`在使用之前，都需要用 `sort()` 对 `集合A` 和 `集合B` 进行 `预处理`。
> 
> 否则将导致输出结果的错误。

### Min/Max

*   最小元素/最大元素 \\implies `min_element()` 和 `max_element()`
    
    > ```cpp
    > vector<int> v = {3, 5, 2, 7, 1, 9, 4};
    > int index = min_element(v.begin(), v.end()) - v.begin();
    > printf("%d ", index);
    > ```
    > 
    > ```cpp
    > 4
    > ```
    > 
    > > `minmax_element()`返回一个 `(最小值迭代器，最大值迭代器)`的 `二元组`
    

### Heap

`堆操作函数`将一个 `数组`维护 `堆结构`，但除此之外，我们还需要一个 `表示堆大小的整数`。

> n.b. `数组的大小` 不一定等于 `堆的大小`，我们有可能 `只使用数组中的一部分连续区域` 来构成 `堆`
> 
> n.b. 使用 `数组`时需要 `额外维护一个表示堆大小的整数`。但如果使用的是 `vector`，则可以 `在每次堆操作后`手动地 `维护vector`，使得 `vector的大小`始终与 `heap的大小` 相等。

> 与 `Java`的是，`C++`的 `Heap`默认是 `最大堆`，同理，`基于Heap的PriorityQueue`也默认是 `最大优先队列`

*   `make_heap()`
    
    ```cpp
      vector<int> v = {5, 6, 8, 2, 3, 9, 1, 7, 0, 4};
      make_heap(v.begin(), v.end());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    9 7 8 6 4 5 1 2 0 3
    ```
    
*   `pop_heap()`
    
    ```cpp
      vector<int> v = {5, 6, 8, 2, 3, 9, 1, 7, 0, 4};
      make_heap(v.begin(), v.end());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
      printf("\n");
    
      pop_heap(v.begin(), v.end());
      v.pop_back();
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    9 7 8 6 4 5 1 2 0 3
    8 7 5 6 4 3 1 2 0
    ```
    
*   `push_heap()`
    
    ```cpp
      vector<int> v = {5, 6, 8, 2, 3, 9, 1, 7, 0, 4};
      make_heap(v.begin(), v.end());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
      printf("\n");
    
      v.push_back(10);
      push_heap(v.begin(), v.end());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    9 7 8 6 4 5 1 2 0 3
    10 9 8 6 7 5 1 2 0 3 4
    ```
    

除此之外，还有一些 `辅助操作`。

*   `sort_heap()`
    
    ```cpp
      vector<int> v = {5, 6, 8, 2, 3, 9, 1, 7, 0, 4};
      make_heap(v.begin(), v.end());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
      printf("\n");
    
      sort_heap(v.begin(), v.end());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    9 7 8 6 4 5 1 2 0 3
    0 1 2 3 4 5 6 7 8 9
    ```
    
*   `is_heap()`
    
    ```cpp
      vector<int> v = {5, 6, 8, 2, 3, 9, 1, 7, 0, 4};
      make_heap(v.begin(), v.end());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
      printf("\n");
    
      cout << is_heap(v.begin(), v.end());
    ```
    
    ```cpp
    9 7 8 6 4 5 1 2 0 3
    1
    ```
    

大部分情况下，如果需要使用 `优先队列`可以首先考虑 `priority_queue`。

但如果需要一些更底层的操作，可以使用 `heap functions`

### Binary Search

*   下界函数/上界函数
    
    *   \\ge val \\implies \\t{lower\\\_bound()}
    *   \\gt val \\implies \\t{upper\\\_bound()}

```cpp
  vector<int> v = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  int ret1 = lower_bound(v.begin(), v.end(), 3) - v.begin();
  int ret2 = upper_bound(v.begin(), v.end(), 3) - v.begin();
  printf("lower_bound = %d ", ret1);
  printf("\n");
  printf("upper_bound = %d ", ret2);
```

```cpp
lower_bound = 3
upper_bound = 4
```

> n.b. `lower_bound()`和 `upper_bound()`的 `语义` 可能直观上和 `名称`不同。
> 
> 但实际上， `lower_bound()`指的是 `not less than`
> 
> 而 `upper_bound()` 指的是 `greater than`

*   `binary_search()`

```cpp
  vector<int> v = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  bool found = binary_search(v.begin(), v.end(), 3);
  printf("found = %d", found);
```

```cpp
found = 1
```

> 如果 `已知序列是有序的`，则可以用 `binary search`代替 `linear search`来获得更高的效率。
> 
> 但是，如果需要获取 `下标`，则需要使用 `lower_bound()`来进行 `二分查找`
> 
> > 尽管C标准库确实有一个 `bsearch()`函数，但该函数原型对于C++的很多数据结构来说，并不适合。

*   `equal_range()`
    
    ```cpp
      vector<int> v = {0, 1, 2, 3, 3, 5, 6, 7, 8, 9};
      auto ret = equal_range(v.begin(), v.end(), 3);
      printf("first = %d\n", ret.first - v.begin());
      printf("second = %d\n", ret.second - v.begin());
    ```
    
    ```cpp
    first = 3
    second = 5
    ```
    
    > 需要在 `有序序列`中查找 `一段连续的相同的元素`的 `下标范围`，则可以使用 `equal_range()`
    

### Sorting

*   `sort()`：`快速排序`，`非稳定性的`
    
*   `stable_sort()`：`稳定性的排序`
    
*   `partial_sort()`：`划分排序`，可以按照 `基准元素`将 `序列` 进行 `划分`为 `两个部分`
    
*   `is_sorted()`：判断 `序列`是否所有元素满足 `偏序关系`
    
    > 通常情况下，我们定义的 `偏序关系`也就是 `operator <`。
    > 
    > 在这个意义上，`is_sorted()` 默认是 `判断序列是否升序`，
    > 
    > 如果希望判断 `序列是否是降序的`，可以利用 `反向迭代器`来实现。
    > 
    > ```cpp
    > vector<int> increase = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    > vector<int> decrease = {9, 8, 7, 6, 5, 4, 3, 2, 1, 0};
    > cout << is_sorted(increase.begin(), increase.end()) << endl;
    > cout << is_sorted(decrease.begin(), decrease.end()) << endl;
    > cout << is_sorted(decrease.rbegin(), decrease.rend());
    > ```
    > 
    > ```cpp
    > 1
    > 0
    > 1
    > ```
    
*   `nth_element()`
    
    ```cpp
      vector<int> v = {4, 7, 6, 8, 9, 2, 1, 3, 5};
      nth_element(v.begin(), v.begin() + 1, v.end());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    1 2 4 3 5 6 7 9 8
    ```
    
    > `nth_element()`可以使得 `序列中指定位置的值`为 `排序该序列后该位置放置的元素`。
    > 
    > 但除了让 `指定位置为排序后的序列应放置的元素`之外， `其他位置的元素`可能会受到 `位置改变的副作用`
    

### Partitions

*   `partition()`
    
    ```cpp
      vector<int> v = {5, 3, 7, 4, 2, 9, 0, 8, 1};
      int ret = partition(v.begin(), v.end(), [](const auto&o1){
        return o1 < 4;
      }) - v.begin();
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
      printf("\nthe index of the first element in the second group: %d", ret);
    
    ```
    
    ```cpp
    1 3 0 2 4 9 7 8 5
    the index of the first element in the second group: 4
    ```
    
    > `partition()` 划分函数 将 `序列`按照 `一元谓词`划分为 `2个部分`：
    > 
    > *   第1部分：满足谓词的元素
    > *   第2部分：不满足谓词的元素
    > 
    > 它的返回值是 `第2部分的第一个元素的下标`
    > 
    > > n.b. 我们可以发现，STL中很多关于 `2划分` 所返回的下标，均遵循 `the index of the first element in the second group`的原则。
    > > 
    > > 同样地，类似的规律有 `取头不取尾的区间表示方法 [begin, end)`
    > 
    > > 变种版本：`partition_copy()`，`stable_partition()`
    
*   `is_partitioned()`
    
*   `partition_point()`
    
    > ```cpp
    > vector<int> v = {5, 3, 7, 4, 2, 9, 0, 8, 1};
    > int ret = partition(v.begin(), v.end(), [](const auto &o1) {
    >    return o1 < 4;
    > }) - v.begin();
    > copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    > printf("\nthe index of the first element in the second group: %d", ret);
    > // partition_point()
    > auto point = partition_point(v.begin(), v.end(), [](const auto &o1) {
    >    return o1 < 4;
    > });
    > printf("\n");
    > for (auto iter = v.begin(); iter != point; iter++) {
    >  printf("%d ", *iter);
    > }
    > ```
    > 
    > ```cpp
    > 1 3 0 2 4 9 7 8 5
    > the index of the first element in the second group: 4
    > 1 3 0 2
    > ```
    > 
    > 可用于 `反求` `划分的分割点的迭代器`
    

### Bitset

`位图 (bitset)` 是C++ 容器库之外的一个数据结构，它用 `1个二进制位`表示 `1个逻辑型变量`。

相比于 `char (8-bit)`而言，更 `节约空间`。

更重要的是，`bitset`提供了一些方便的 `数据操作函数`和 `数据查询函数`，以及对 `字符串输出`的支持。

*   数据操作函数
    
    *   `置位 (set)`：将 `指定下标的位`设置为 `1`
    *   `复位 (reset)`：将 `指定下标的位`设置为 `0`
    *   `翻转 (flip)`：将 `指定下标的位`进行 `翻转`
*   数据查询函数
    
    *   `测试 (test)`：返回 `指定下标的位`
        
    *   `计数 (count)`：返回 `被置位的位数`
        
        *   `全部已置位 (all)`：是否 `所有的位`都被 `置位`
        *   `任何已置位 (any)`：是否 `任何一个位`被 `置位`
        *   `没有已置位 (none)`：是否 `没有任何一个位`被 `置位`

```cpp
  bitset<32> bits;
  bits.set(0,true);
  cout << bits;
```

```cpp
00000000000000000000000000000001
```

> 在 `空间紧张`的情况下，`bitset<size>`可能会优于 `vector<bool>`。
> 
> > 事实上，这并不一定。因为 `vector<bool>`和 `普通的泛化vector`不同，
> > 
> > 它是 `vector模板的特例化`，具体库实现很有可能针对 `vector<bool>`做出特别的优化。
> 
> 但不同于 `vector`的 `动态伸缩`， `bitset`的大小是通过 `模板`固定的，在编译期确立和内存空间。

### Complex

STL库提供的 `复数`实现，同时重载了 `运算符`。

```cpp
  complex<int> a = {1,2};
  complex<int> b = {3,4};
  cout << a + b;
```

```cpp
(4,6)
```

### Ratio

由C++提供的 `比例 (Ratio)`库。可以直接作为 `分数`库使用。

```cpp
  typedef ratio<1, 2> one_half;
  typedef ratio<2, 3> two_thirds;
  ratio_add<one_half, two_thirds> sum;
  printf("fraction: %d/%d", sum.num, sum.den);
```

```cpp
fraction: 7/6
```

> 他们本质上是 `宏`，只能在 `编译期`确定数值。

### Tuple

当需要表示 `多种数据类型的有序序列`，则可以使用 `元组 (Tuple)`。

> 比如如果需要返回 `2个返回值`时，比起 `structure`来说，`tuple`会更加方便
> 
> > 实际上，有另一个东西叫 `make_pair()`

*   Construct Tuple and Get Elements

```cpp
  tuple<string, int> t1("hello", 100);
  cout << "get<0> = " << get<0>(t1) << endl;
  cout << "get<1> = " << get<1>(t1);
```

```cpp
get<0> = hello
get<1> = 100
```

> 实际上，比起 `构造器`而言， 我们更经常使用 `make_tuple()` 来构造元组。
> 
> ```cpp
> auto t2 = make_tuple("hello", "world", 100);
> ```

*   Use `tie()` to Unpack Tuple

```cpp
  auto tuple = make_tuple("hello", "world", 100);
  
  string str1;
  string str2;
  int num;
  tie(str1, str2, num) = tuple;

  cout << str1 << endl;
  cout << str2 << endl;
  cout << num << endl;
```

```cpp
hello
world
100
```

> 如果只需要 `unpack`其中 `某些元素`，则可以使用 `std::ignore`来进行 `占位`
> 
> ```cpp
> auto tuple = make_tuple("hello", "world", 100);
> 
> string str1;
> int num;
> tie(str1, std::ignore, num) = tuple;
> 
> cout << str1 << endl;
> cout << num << endl;
> ```

### Utility

*   `swap()`
    
*   `make_pair()`
    
    > 如果只需要 `2元组`的情况下，用 `make_pair()`会比 `make_tuple()`方便非常多。后者的 `accessor`用起来比较麻烦。
    

### Accumulate values in range

*   使用 `accumulate()`

```cpp
  vector<int> v = {0,1,2,3,4,5,6,7,8,9};
  int sum = accumulate(v.begin(), v.end(), 0);
  cout << sum;
```

```cpp
45
```

> `accumulate()` 不仅仅是用于 `累加`，它还支持 `带有二元谓词的版本`。
> 
> 可以利用 `二元谓词`来实现 `累减`，`累乘`，`累除`等
> 
> ```cpp
> vector<int> v = {1, 2, 3, 4};
> int sum = accumulate(v.begin(), v.end(), 1, [](const auto &o1, const auto &o2) {
>    return o1 * o2;
> });
> cout << sum;
> ```
> 
> ```cpp
> 24
> ```

### Compute adjacent difference of range

*   使用 `adjacent_difference()`

```cpp
  vector<int> v = {1,4,6,10};
  adjacent_difference(v.begin(), v.end(), v.begin());
  copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
```

```cpp
1 3 2 4
```

> `adjacent_difference()` 不但可以用于 `差分`，还可以进行 `和分`，`积分`，`商分`
> 
> ```cpp
> vector<int> v = {1, 4, 6, 10};
> adjacent_difference(v.begin(), v.end(), v.begin(), [](const auto &o1, const auto &o2) {
> return o1 * o2;
> });
> copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
> ```
> 
> ```cpp
> 1 4 24 60
> ```

### Compute cumulative inner product of range

*   使用 `inner_product()`

```cpp
  int init = 100;
  vector<int> a = {10, 20, 30};
  vector<int> b = {1, 2, 3};
  int ret = inner_product(a.begin(), a.end(), b.begin(), init);
  cout << ret;
```

```cpp
240
```

> n.b. 使用 `inner_product()` 时需要保证 `矢量a`和 `矢量b`的 `长度相等`。
> 
> > 在 `两个矢量的长度不等的情况下`，STL仍然会取 `较长的矢量`进行运算， 而`较短的矢量`的 `越界值`将是 `不可预测的`

> 可以使用 `带谓词版本的 inner_product()`来模拟 `inner_product()`
> 
> ```cpp
> int init = 100;
> vector<int> a = {10, 20, 30};
> vector<int> b = {1, 2, 3};
> int ret = inner_product(a.begin(), a.end(), b.begin(), init, [](const auto &o1, const auto &o2) {
>  return o1 + o2;
> }, [](const auto &o1, const auto &o2) {
>    return o1 * o2;
> });
> ```
> 
> ```cpp
> 240
> ```

### Compute partial sums of range

*   使用 `partial_sum()`

```cpp
  vector<int> a = {1, 2, 3, 4, 5};
  partial_sum(a.begin(), a.end(), a.begin());
  copy(a.begin(), a.end(), ostream_iterator<int>(cout, " "));
```

```cpp
1 3 6 10 15
```

> 同理，使用带二元谓词的版本，我们可以实现：`部分差`，`部分乘`，`部分商`

### Store increasing sequence

*   使用 `iota()`

```cpp
  vector<int> v(10);
  iota(v.begin(), v.end(), 3);
  copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
```

```cpp
3 4 5 6 7 8 9 10 11 12
```

> `iota()`底层使用 `operator++ 运算符`来实现 `递增`

### Function Object

#### Base Classes

`函数对象`即利用 `结构体/对象`的 `operator()`运算符重载，完成类似 `普通函数`的 `函数调用`。

*   `unary_function()`

```cpp
struct IsOdd {
    bool operator() (int number) {
      return number % 2 != 0;
    }
};

int main() {
  IsOdd function_object;
  cout << function_object(3) << endl;
  cout << function_object(2);
  return 0;
}
```

```cpp
1
0
```

> 本质上来说，`函数对象`就是一个 `结构体`。
> 
> ```cpp
> struct IsOdd {
>    bool operator() (int number) {
>      return number % 2 != 0;
>    }
> } function_object;
> ```

*   `binary_function()`

```cpp
int main() {
  struct Add {
      int operator() (int o1, int o2) {
        return o1 + o2;
      }
  } function_object;
  cout << function_object(1, 2) << endl;
  return 0;
}
```

```cpp
3
```

> `函数对象`一般用于 `predicate function`和 `comparison function`。
> 
> 在大部分的场景下，可以用 `lambda表达式` 代替 `函数对象` 作为 `callable`。

#### Operator Classes

##### Arithmetic Operation

*   `plus`
    
    ```cpp
    int main() {
      plus<int> function_object;
      cout << function_object(1,2);
      return 0;
    }
    ```
    
    ```cpp
    3
    ```
    
*   `minus`
    
*   `multiplies`
    
*   `divides`
    
*   `modulus`
    
*   `negate`
    

> 上述 `算术操作函数对象`可以非常方便地用于 `transform()`

##### Comparison Operation

*   `equal_to`
*   `not_equal_to`
*   `greater`
*   `less`
*   `greater_equal`
*   `less_equal`

> `greater`和 `less`经常用于 `UDT`的 `优先队列`定义。

> `比较器函数`的 `基本用法`可以依据 `传入参数`来进行 `测试`。
> 
> 但我们也可以 `绑定某个 参数`为 `常数`。
> 
> ```cpp
> vector<int> v = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
> int cnt = count_if(v.begin(), v.end(), bind2nd(greater<int>(), 3));
> cout << cnt;
> ```
> 
> ```cpp
> 6
> ```

##### Logical Operations

*   `logical_and`
*   `logical_or`
*   `logical_not`

##### Adaptor and Conversion Functions

###### Negators

*   `not1`
    
    ```cpp
    struct IsOdd {
        bool operator()(const int &x) const { return x % 2 != 0; }
        typedef int argument_type;
    };
    
    int main() {
      vector<int> v = {0, 2, 4, 6, 5};
      int cnt = count_if(v.begin(), v.end(), not1(IsOdd()));
      cout << cnt;
      return 0;
    }
    ```
    
    ```cpp
    4
    ```
    
*   `not2`
    

> `not1` 和 `not2` 可以对 `现有的谓词`进行 `取反`。
> 
> 但他们仅支持 `函数对象`，并不适用于 `lambda表达式`
> 
> > `not1` 和 `not2` 实质上是 `基于结构体模板的`，而 `lambda`本质上属于 `函数`而不是 `结构体`

> 在用 `not1`和 `not2`进行 `取反`时还必须要求定义 `typedef int argument_type`，而且对于 `运算符函数`必须用 `const`作修饰。
> 
> 使用并不方便。

###### Parameter Binders

*   `bind1st()`
*   `bind2nd()`

> `bind1st()` 和 `bind2nd()` 适用于 `操作类的函数对象`。
> 
> 一般与 `Comparison Functions`搭配使用。

###### Conversors

*   `ptr_fun()`：\\t{function pointer} \\to \\t{function object}
    
*   `mem_fun()`：\\t{member function} \\to \\t{function object (pointer version)}
    
    ```cpp
      vector <string*> numbers;
      numbers.push_back ( new string ("one") );
      numbers.push_back ( new string ("two") );
      numbers.push_back ( new string ("three") );
      numbers.push_back ( new string ("four") );
      numbers.push_back ( new string ("five") );
      
      vector <int> lengths ( numbers.size() );
      transform (numbers.begin(), numbers.end(), lengths.begin(), mem_fun(&string::length));
    
      for (int i=0; i<5; i++) {
        cout << *numbers[i] << " has " << lengths[i] << " letters.\n";
      }
    ```
    
    ```cpp
    one has 3 letters.
    two has 3 letters.
    three has 5 letters.
    four has 4 letters.
    five has 4 letters.
    ```
    
*   `mem_fun_ref()`：\\t{member function} \\to \\t{function object (reference version)}
    
    ```cpp
      vector<string> numbers;
      numbers.push_back("one");
      numbers.push_back("two");
      numbers.push_back("three");
      numbers.push_back("four");
      numbers.push_back("five");
    
      vector<int> lengths(numbers.size());
      transform(numbers.begin(), numbers.end(), lengths.begin(), mem_fun_ref(&string::length));
    
      for (int i = 0; i < 5; i++) {
        cout << numbers[i] << " has " << lengths[i] << " letters.\n";
      }
    ```
    
    ```cpp
    one has 3 letters.
    two has 3 letters.
    three has 5 letters.
    four has 4 letters.
    five has 4 letters.
    ```
    

> `mem_fun()` 和 `mem_fun_ref()` 可以在 `流操作`时将 `成员函数` 转化为 `函数对象`，可以用于 `调用对象的getter函数`。
> 
> `mem_fun()`：适用于 `指针版本`，如 `容器的元素` 是 `指针类型`
> 
> `mem_fun_ref()`：适用于 `引用版本`，如 `容器的元素` 是 `引用类型`

#### Instrumental Types

*   `unary_negate()` 和 `binary_negate()`：和 `not1()` 和 `not2()` 一样 `鸡肋`
    
*   `binder1st()`和 `binder2nd()`：有点像 `编译版的bind1st()`和 `编译版的bind2nd()`
    
    ```cpp
      binder1st<greater<int>> greater_than_10(greater<int>(), 10);
    ```
    
*   `pointer_to_unary_function()` 和 `pointer_to_binary_function()`
    
*   `mem_fun_t()` ， `mem_fun1_t()`，`const_mem_fun_t()`，`const_mem_fun1_t()`，`mem_fun_ref_t()`，`mem_fun1_ref_t()`，`const_mem_fun_ref_t()`，`const_mem_fun1_ref_t()`
    

### Initializer List

`initializer_list` 是一种 `数据类型`，存储 `某种类型的元素`的 `列表`。

```cpp
  auto a = {10,20,30};
  copy(a.begin(),a.end(),ostream_iterator<int>(cout, " "));
```

```cpp
10 20 30
```

### Vector

数据结构 `矢量`，提供和 `数组`等效的功能。

#### Constructor & Destructor

##### Constructor

*   `empty container constructor`
*   `initializer list constructor`
*   `fill constructor`: k elements with specific value

```cpp
  vector<int> v(10, 3);
  copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
```

```cpp
3 3 3 3 3 3 3 3 3 3
```

*   `range constructor` copy from `ierator`

```cpp
  vector<int> src = {0,1,2,3};
  vector<int> v(src.begin() + 1, src.end());
  copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
```

```cpp
1 2 3
```

*   `copy constructor (and copying with allocator)`: copy from `another vector`

```cpp
  vector<int> src = {0,1,2,3};
  vector<int> v(src);
  copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
```

```cpp
0 1 2 3
```

> 以下两种写法都是调用 `拷贝构造函数`。
> 
> > `operator=` 赋值运算符 等价于 `copy constructor`
> 
> ```cpp
> vector<int> a;
> vector<int> b(a);
> vector<int> b = a;
> ```

*   `move constructor (and moving with allocator)`

```cpp
  vector<int> a = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  vector<int> b(a, a.get_allocator());
  
  cout << "a: ";
  copy(a.begin(), a.end(), ostream_iterator<int>(cout, " "));
  cout << endl;
  cout << "b: ";
  copy(b.begin(), b.end(), ostream_iterator<int>(cout, " "));
```

```cpp
a: 0 1 2 3 4 5 6 7 8 9
b: 0 1 2 3 4 5 6 7 8 9
```

##### Destructor

`vector`会 `自动地` 释放 `元素所使用的内存`

#### Iterators

*   `begin()` and `end()`
*   `rbegin()` and `rend()`
*   `cbegin()` and `cend()`
*   `crbegin()` and `crend()`

#### Capacity

*   `size()`
    
    > `size`信息是作为 `vector的属性`而存在的。
    > 
    > 可在 `常数时间`内获取到。
    > 
    > > 但 `strlen()`不是，对于 `大字符串`，不要频繁地调用 `strlen()`
    
*   `resize()`
    
    ```cpp
      vector<int> v = {0,1,2};
      v.resize(5);
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    0 1 2 0 0
    ```
    
*   `empty()`
    
*   `capacity()`：获取 `vector的底层数组`的 `大小`
    
*   `reserve()`
    
    ```cpp
      vector<int> v = {0,1,2};
      printf("before reserve: capacity = %d\n", v.capacity());
      v.reserve(10);
      printf("after reserve: capacity = %d\n", v.capacity());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    before reserve: 3
    after reserve: 10
    0 1 2
    ```
    
    > 如果 `事先知道`需要添加的 `元素的数量`，则可以先用 `reserve()`来 `一次性`完成 `预分配`。
    > 
    > > `reserve(int n)` 只 `保证` `vector的底层数组`的 `大小`足够满足 `n元素`，如果 `vector的底层数组`已经大于n，则该语句会被简单地忽略。
    > 
    > 如果没有使用 `reserve()`，则在插入 `大量元素`时，`vector的底层数组`可能会经历 `多次的动态扩容`，浪费不必要的资源。
    
*   `shrink_to_fit()`：`动态缩容`使得 `capacity = size`
    

#### Element Access

*   Return `reference`
    
    *   `operator []`，`at()`
    *   `front()` ，`back()`
    
    > 尽管这些 `access function`返回的确实是 `引用`，
    > 
    > 但还需要注意 `隐含的值拷贝`。
    > 
    > 如果真的希望 `取到vector的元素的引用`，并且让 `数据修改`反映到 `vector内部的元素`中，需要设置 `refenence LHS`以避免 `值拷贝`
    > 
    > *   `value copy`
    > 
    > ```cpp
    >   vector<int> v = {0,1,2};
    >   int num = v[0];
    >   num = 43;
    >   copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    > ```
    > 
    > ```cpp
    > 0 1 2
    > ```
    > 
    > *   `reference copy`
    > 
    > ```cpp
    >   vector<int> v = {0,1,2};
    >   int & num = v[0];
    >   num = 43;
    >   copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    > ```
    > 
    > ```cpp
    > 43 1 2
    > ```
    
*   Return `reference`
    
    ```cpp
      vector<int> v = {0, 1, 2};
      int *num = v.data();
      copy(num, num + 3, ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    0 1 2
    ```
    
    > `data()`返回的是 `vector的底层数组`
    

#### Modifiers

*   `assign`：assign n elements with specific values

```cpp
  vector<int> v(10);
  v.assign(3, 5);
  copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
```

```cpp
5 5 5
```

> n.b. `assign` 相当于 `重新初始化`vector，`vector中旧的数据`会被 `删除`！

*   `push_back()` and `pop_back()`
    
*   `insert()` and `erase()`
    
    *   `insert()`
    
    ```cpp
      vector<int> v = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
      v.insert(v.begin() + 1, 3, 9999);
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    0 9999 9999 9999 1 2 3 4 5 6 7 8 9
    ```
    
    > n.b. `insert`的 `position`的 `语义`是：`欲插入元素` 将插入在 `该position的元素之前`。
    > 
    > 或者等价地说：`欲插入元素`在 `插入后` 应该 `位于position的位置`
    
    *   `erase()`
        
        ```cpp
          vector<int> v = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
          v.erase(v.begin() + 1);
          copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
        ```
        
        ```cpp
        0 2 3 4 5 6 7 8 9
        ```
        
*   `clear()`
    
*   `swap()`
    
    ```cpp
      vector<int> a(3, 100);
      vector<int> b(5, 200);
    
      a.swap(b);
      int & the_value_from_a = a[0];
      the_value_from_a = 9999;
    
      copy(a.begin(), a.end(), ostream_iterator<int>(cout, " "));
      cout << endl;
      copy(b.begin(), b.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    9999 200 200 200 200
    100 100 100
    ```
    
    > `swap()`原理是直接 `交换` 两个 `vector的底层数组的指针`
    
*   `emplace()`
    
    ```cpp
      vector<int> v = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
      v.emplace(v.begin() + 1, 9999);
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    0 9999 1 2 3 4 5 6 7 8 9
    ```
    
    > 相比于 `insert()`，`push_front()` 和 `push_back()` 将 `构造好的元素` 传递给 `Modifier`。
    > 
    > `emplace()`并不传递 `已经构造好的元素`，而是传递 `用于构造这个元素的参数列表`：这样做有利于 `减少不必要的元素值拷贝`，而 `直接在vector的底层数组`上 `构造元素`。
    
    > `emplace_back()` 同理。
    > 
    > ```cpp
    > vector<int> v = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    > v.emplace_back(9999);
    > copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    > ```
    > 
    > ```cpp
    > 0 1 2 3 4 5 6 7 8 9 9999
    > ```
    

#### vector<bool>

`vector<bool>` 是 `vector`的 `模板特例化`，它和 `generic vector template`相比，有以下特点：

*   `vector<bool>`的 `底层存储`并不一定是用 `bool[]`的。`library`可能选择 `其他底层存储方式`，并且尽可能地保证 `仅使用1位来表示真值`
*   不同于 `常规的vector`使用 `allocator` `分配对象`， `vector<bool>`的 `位数据`可以被 `直接地设置`在 `内部存储`
*   多出一个 `flip()` 翻转函数
*   `vector<bool>` 的 `accesstor`返回的是 用于指向单个为的 `reference类型` 而不是 `bool类型`

> 也就是说，使用 `vector<bool>` 并不会比 `bitset<>` 占用 `更多空间`或 `更多时间`。
> 
> 在正常情况下，无法创建 `真正的泛化的 vector<bool>`，而取而代之的是 `特例化的 vector<bool>`

### list

STL中的 `list` 是 `doubly_linked_list`

如果需要 `singly_linked_list` 则需要使用 `forward_list`。

> n.b. `forward_list`的 `性能` 几乎和 `Handwritten C-style singly-linked-list`没有差别！
> 
> > `forward_list`为了 `性能`甚至没有 `size()`。

#### Operations

*   `splice()`
    
    ```cpp
      list<int> list1 = {0, 1, 2};
      list<int> list2 = {100, 200, 300};
      list1.splice(list1.begin(), list2);
    
      cout << "list1: ";
      copy(list1.begin(), list1.end(), ostream_iterator<int>(cout, " "));
      cout << endl << "list2: ";
      copy(list2.begin(), list2.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    list1: 100 200 300 0 1 2
    list2:
    ```
    
    > `splice()` 可以 `非常方便`地对 `2个链表`进行 `衔接操作`。
    
*   `remove()`
    
    ```cpp
      list<int> list1 = {0, 1, 2, 3, 4, 2, 2, 2};
      list1.remove(2);
      copy(list1.begin(), list1.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    0 1 3 4
    ```
    
    > n.b. `remove()`的 `语义`是 `移除所有的符合条件的相等元素`，而不是 `移除第一个符合条件的相等元素`
    > 
    > > 带谓词的版本 `remove_if()`
    
*   `unique()` and `merge()`
    
    > n.b. `unique()`的 `语义` 和之前所提到的 `std::unique()`是相同的，都是指 `remove consecutive equivalent elements`，如果需要确保 `移除整个容器中的相等元素`，需要进行预处理 `sort()`
    

### Array

STL的`array`数据结构仅仅是 `ordinary array` 的 `包装类`。

```cpp
  array<int, 10> num = {0,1,2,3};
  copy(num.begin(), num.end(), ostream_iterator<int>(cout, " "));
```

```cpp
0 1 2 3 0 0 0 0 0 0
```

> `array`提供了比 `ordinal array`更加方便的 `辅助函数`，但又没有 `vector`的 `复杂性`。
> 
> 如果你期望保持 `ordinal array`的众多 `特性`，同时不期望使用 `auto extendend/extracted`
> 
> ```cpp
> array<int, 10> num = {0, 1, 2, 3};
> num.fill(100);
> printf("size = %d\n", num.size());
> copy(num.begin(), num.end(), ostream_iterator<int>(cout, " "));
> ```
> 
> ```cpp
> size = 10
> 100 100 100 100 100 100 100 100 100 100
> ```
> 
> *   `size()`
> 
> 传统的`C-Style数组`在 `参数传递`时比较麻烦，但使用 `array`可以避免这个问题。
> 
> *   `iterator`
> 
> `array`可以使用 `iterator对象`，与其他STL函数的配合编码更加方便。
> 
> > 另外，`array`继承了 `ordinary`的 `传统特性`：允许 `下标越界`。
> > 
> > ```cpp
> > array<int, 10> arr;
> > 
> > for (int i = -10; i < 20; ++i) {
> >  cout << arr[i] << " ";
> > }
> > ```
> > 
> > ```cpp
> > 4199804 0 6422000 0 -6 -1 0 0 0 0 8 0 4199705 0 8 0 75 0 8224624 0 16 11 8224592 0 4199367 0 0 0 75 0
> > ```
> 
> *   `fill()`
> 
> `array`在 `完全兼容` `ordinal array`的所有 `初始化方法`之外，
> 
> 还提供了一个非常有用的函数：`fill()`
> 
> > 对于 `ordinal array`，我们可以使用 `memset()`。
> > 
> > 但遗憾的是，该函数只适用于填充 `0`和 `-1`
> 
> ```cpp
>   array<array<int, 10>, 3> num;
>   num.fill(array<int, 10>{100,200,300});
>   for (int i = 0; i < num.size(); ++i) {
>     for (int j = 0; j < num[i].size(); ++j) {
>       cout << num[i][j] << " ";
>     }
>     cout << endl;
>   }
> ```
> 
> ```cpp[
> 100 200 300 0 0 0 0 0 0 0
> 100 200 300 0 0 0 0 0 0 0
> 100 200 300 0 0 0 0 0 0 0
> ```

### deque

STL的 `deque` 即 `doubly linked list`。

此外，STL的 `stack`和 `queue` 均是基于 `deque`实现的

### priority\_queue

不同于Java的 `PriorityQueue`，C++的STL的 `priority_queue`默认是 `大顶堆`。

```cpp
template <class T, class Container = vector<T>,
  class Compare = less<typename Container::value_type> > class priority_queue;
```

> `priority_queue` 底层使用的是 `heap functions`。
> 
> `data source`可以来自 `多种类型的容器`，只需要通过 `range constructor`来构造 `priority_queue`即可。

*   `max-imum heap`
    
    ```cpp
      vector<int> a = {1, 5, 2, 8, 3, 6, 4};
      priority_queue<int> PQ(a.begin(), a.end());
    
      while (!PQ.empty()) {
        cout << PQ.top() << " ";
        PQ.pop();
      }
    ```
    
    ```cpp
    8 6 5 4 3 2 1
    ```
    
*   `min-imum heap`
    
    ```cpp
      vector<int> a = {1, 5, 2, 8, 3, 6, 4};
      priority_queue<int, vector<int>, greater<int>> PQ(a.begin(), a.end());
    
      while (!PQ.empty()) {
        cout << PQ.top() << " ";
        PQ.pop();
      }
    ```
    
    ```cpp
    1 2 3 4 5 6 8
    ```
    
    > 同理，也可以使用 `custom comparison function`
    > 
    > ```cpp
    > vector<int> a = {1, 5, 2, 8, 3, 6, 4};
    > struct comp {
    >    bool operator()(const int &o1, const int &o2) {
    >      return o1 > o2;
    >    }
    > };
    > priority_queue<int, vector<int>, comp> PQ(a.begin(), a.end());
    > 
    > while (!PQ.empty()) {
    >  cout << PQ.top() << " ";
    >  PQ.pop();
    > }
    > ```
    > 
    > ```cpp
    > 1 2 3 4 5 6 8
    > ```
    

### Map

`map`中的 `条目 (entry)`类型为

```cpp
typedef pair<const Key, T> value_type;
```

#### map

STL中的 `map`底层数据结构是基于 `Red-Black Tree` 的，通过 `operator <`来完成 `比较`。

而且，可以直接对 `map`进行 `迭代`来得出 `已排序的key序列`

*   `operator[]`
    
    > *   如果key已存在，则返回 map\[key\]
    > *   如果key不存在，则等价于：(\*((this->insert(make\_pair(k,mapped\_type()))).first)).second
    > 
    > > 如果使用 `at()`，则会在 `key不存在时`，抛出 `异常`
    > 
    > > ```cpp
    > > map<int, string> m;
    > > m[1] = "first";
    > > m[2] = "second";
    > > m[3] = "third";
    > > m[4] = "four";
    > > printf("size = %d\n", m.size());
    > > m[5];
    > > printf("size = %d, value = %s\n", m.size(), m[5].c_str());
    > > m[100000000];
    > > printf("size = %d, value = %s\n", m.size(), m[100000000].c_str());
    > > ```
    > > 
    > > ```cpp
    > > size = 4
    > > size = 5, value =
    > > size = 6, value =
    > > ```
    > > 
    > > n.b. 无论何时，对 `map`使用 `operator[]` 至多只会使得 `size` `增1`
    > > 
    > > n.b. 当 `访问map中不存在的key时`，会自动 `创建并插入pair (按默认值创建value)`
    > > 
    > > > 如果 `value的类型`是 `UDT`，则需要提供 `no parameter constructor`，否则无法通过编译。
    > > > 
    > > > 如下面的例子，将 `编译失败`：
    > > > 
    > > > ```cpp
    > > > class Person {
    > > > public:
    > > >  string name;
    > > > 
    > > > public:
    > > >  Person(const string &name) : name(name) {}
    > > > };
    > > > 
    > > > 
    > > > int main() {
    > > > 
    > > > map<int, Person> m;
    > > > m[0];
    > > > printf("size = %d, value = %s\n", m.size(), m[0].name.c_str());
    > > > 
    > > > return 0;
    > > > }
    > > > ```
    > > > 
    > > > ```cpp
    > > > main.cpp:42:7: note: candidate: 'Person::Person(Person&&)'
    > > > main.cpp:42:7: note:   candidate expects 1 argument, 0 provided
    > > > ```
    

*   iterator

```cpp
  map<int, string> m;
  m[2] = "second";
  m[1] = "first";
  m[3] = "third";
  m[4] = "four";

  for (auto iter = m.begin(); iter != m.end(); iter++) {
    cout << iter->first << ", " << iter->second << endl;
  }
  return 0;
```

```cpp
1, first
2, second
3, third
4, four
```

> 由于 `map`底层使用的是 `red black tree`，所以可以利用 `map`来进行 `排序`

*   `insert()`：通常来说可以使用 `operator[]` 代替
*   `erase()`

```cpp
  map<int, string> m;
  m[2] = "second";
  m[1] = "first";
  m[3] = "third";
  m[4] = "four";

  m.erase(2);
  m.erase(5);

  for (auto iter = m.begin(); iter != m.end(); iter++) {
    cout << iter->first << ", " << iter->second << endl;
  }
```

```cpp
1, first
3, third
4, four
```

> n.b. 如果 `欲删除的key`不存在，则 `无事发生`

*   `find()`：get `iterator` to element

```cpp
  map<int, string> m;
  m[2] = "second";
  m[1] = "first";
  m[3] = "third";
  m[4] = "four";

  auto iter = m.find(5);
  printf(iter == m.end() ? "not found" : "found");
  printf("\nsize = %d", m.size());
```

```cpp
not found
size = 4
```

> 相比于 `operator[]`在 `未找到元素时`会 `自动插入默认对`而言，使用 `find()`来 `判断元素是否存在`可以避免 `浪费空间`。
> 
> 而且更重要的，`find()`是 `幂等的`

*   `count()`：count elements with a specific key
    
    > n.b. 如果仅仅是为了判断 `是否存在某个key`，那么相比于 `find()`写法的麻烦，我们可以用 `count() == 0`来代替 `find()`
    

#### miltimap

与 `map` 的区别在于， `miltimap`支持 `不同pair有重复的key`。

*   `erase()`
    
    > 对于 `传值的erase()`，将 `删除所有符合条件的元素`。
    

### Set

#### set

STL的 `set` 是基于 `red-black tree`的，此外，它的 `元素`必须是 `const`的，只能 `插入元素`或 `删除元素`，而不能 `修改元素`。

```cpp
  set<int> S;
  S.insert(1);
  S.insert(2);
  S.insert(2);
  S.insert(3);
  S.insert(4);

  printf("size = %d\n", S.size());
  printf("count(2) = %d\n", S.count(2));
```

```cpp
size = 4
count(2) = 1
```

> n.b. 对于 `set`来说，如果 `欲插入的元素`已存在，则会忽略后续的插入（而不是 `覆盖插入`）。

#### multiset

\\cdots

### unordered\_map

#### unordered\_map

`unordered_map` 基于 `bucket`而非 `red-black tree`，通过 `hash function`来 `索引` 指定的 `key`。

> 因此，`unordered_map` 中的 `key` 是 `无序的`

> 因此，通常比 `map` 更快

*   `Bucket Functions`

Function

Note

\\t{bucket\\\_count()}

\\t{Return number of buckets}

\\t{max\\\_bucket\\\_count()}

\\t{Return maximum number of buckets}

\\t{bucket\\\_size()}

\\t{Return bucket size}

\\t{bucket()}

\\t{Locate element's bucket}

*   `Hash Policy Functions`

Function

Node

\\t{load\\\_factor()}

\\t{Return load factor}

\\t{max\\\_load\\\_factor()}

\\t{Get or set maximum load factor}

\\t{rehash()}

\\t{Set number of buckets}

\\t{reserve()}

\\t{Request a capacity change}

#### unordered\_multimap

\\cdots

### unordered\_set

#### unordered\_set

与 `unordered_map`类似，均是基于 `bucket`的。

#### unordered\_multiset

\\cdots

### Compute Remainder and Quotient

*   `remainder()`

### Branch

*   `setjmp()` and `longjmp()`

```cpp
  jmp_buf  env;
  printf("before set jump\n");
  int val = setjmp(env);
  printf("after set jump\n");

  printf("val = %d\n", val);

  printf("before longjmp()\n");
  if (!val) longjmp(env, 1);
  printf("after longjmp()\n");
```

```cpp
before set jump
after set jump
val = 0
before longjmp()
after set jump
val = 1
before longjmp()
after longjmp()
```

> `goto`只支持 `函数内跳转`，但 `setjmp() and longjmp()`可以支持 `跨函数跳转`

> 使用 `setjmp()`保存 `过程调用环境`，然后用 `longjmp()`进行 `jump`。

> 一个跨函数的例子。
> 
> ```cpp
> int foo();
> int bar();
> jmp_buf env;
> int val;
> 
> int foo() {
>   printf("enter foo()\n");
> 
>   val = setjmp(env);
> 
>   printf("before call bar()\n");
>   bar();
>   printf("after call bar()\n");
> 
>   printf("leave foo()\n");
>   return 100;
> }
> 
> int bar() {
>   printf("enter bar()\n");
> 
> 
>   printf("before longjmp()\n");
>   if (val != 1) longjmp(env, 1);
>   printf("before longjmp()\n");
> 
>   printf("leave bar()\n");
>   return 200;
> }
> 
> 
> int main() {
>   foo();
>   return 0;
> }
> ```
> 
> ```cpp
> enter foo()
> before call bar()
> enter bar()
> before longjmp()
> before call bar()
> enter bar()
> before longjmp()
> before longjmp()
> leave bar()
> after call bar()
> leave foo()
> ```

*   `goto`

```cpp
int main() {

  for (int i = 0; i < 100; ++i) {
    for (int j = 0; j < 100; ++j) {

      if (i == 10 && j == 20) {
        goto ok;
      }

    }
  }

  ok: 0xdead;

  printf("bye\n");
  return 0;
}
```

```
bye
```

> 关于 `跳出外层循环`，更推荐的写法是给 `外层循环`加 `控制标记`
> 
> ```cpp
> int main() {
> 
>   bool flag = true;
>   for (int i = 0; flag && i < 100; ++i) {
>     for (int j = 0; j < 100; ++j) {
> 
>       // break the outer loop
>       if (i == 10 && j == 20) {
>         flag = false;
>         break;
>       }
> 
>     }
>   }
> 
>   printf("bye\n");
>   return 0;
> }
> ```

### The incremental of size\_t and size\_type

```cpp
  char c_str[] = "china";
  string cpp_str = "china";

  printf("strlen(c_str) = %d\n", strlen(c_str));
  printf("cpp_str.size() = %d\n", cpp_str.size());

  //
  int c_str_size = strlen(c_str) + 1;
  printf("c_str_size = %d\n", c_str_size);

  int cpp_str_size = cpp_str.size() + 1;
  printf("cpp_str_size = %d\n", cpp_str_size);
```

```cpp
strlen(c_str) = 5
cpp_str.size() = 5
c_str_size = 6
cpp_str_size = 6
```

> `size_t`和 `size_type` 本质上是 `unsigned long long`
> 
> 在 `强制转化` 为 `int` 时属于 `narrowing conversion`。
> 
> 对他们执行 `递增操作`时应使用 `递增操作符` 而不是直接 `+1`。
> 
> > 直接 `+1`的含义为 `将unsigned long long 窄化为int，然后加上int型的1`。该操作是 `未定义的`，取决于具体实现。
> > 
> > ```cpp
> > Clang-Tidy: Narrowing conversion from 'unsigned long long' to signed type 'int' is implementation-defined
> > ```

### Exit the program

*   Terminate
    
    *   `abort()`：abnormal termination, raises the `SIGABRT signal`, do not cleanup
    
    *   `exit()`：normal termination, do cleanup
    *   `quick_exit()`：normal termination, do not cleanup
    *   `_Exit()`
*   Terminate
    
    *   `atexit()`
        
        ```cpp
          auto post = [](){
            printf("bye\n");
          };
          atexit(post);
        
          printf("before return\n");
        ```
        
        ```cpp
        before return
        bye
        ```
        
    
    *   `at_quick_exit()`
*   Get system environment
    
    *   `getenv()`
        
        ```cpp
          char * java_home = getenv("JAVA_HOME");
          printf("%s", java_home);
        ```
        
        ```cpp
        D:\Program Files (x86)\Java\jdk1.8.0_291
        ```
        
*   Execute commands
    
    *   `system()`

### Time

#### Time Manipulation

*   `clock()`

```cpp
int main() {

  for (int i = 0; i < 1000000; ++i) {}

  clock_t t = clock();
  printf("clock ticks since the program launched = %d", t);

  return 0;
}
```

```cpp
clock ticks since the program launched = 10
```

> `clock()` 计数的是 `从程序启动以来所经历的时间刻`。

> ```cpp
>   typedef long clock_t;
> ```

> 如果需要获取 `秒数`则要除以 `CLOCKS_PER_SECOND`

*   `time()`

```cpp
int main() {

  time_t timer;
  time(&timer);

  printf("timer = %d\n", timer);
  return 0;
}
```

```cpp
timer = 1650518640
```

> ```cpp
> __MINGW_EXTENSION typedef __int64 __time64_t;
> typedef __time64_t time_t;
> ```
> 
> `time_t`本质上是 `__int64`。
> 
> 直接使用 `__int64` 或者 `long long`也可以被接受。

*   `mktime()`

```cpp
int main() {

  /* Get current timestamp & use localtime() to get related struct tm */
  time_t raw_time;
  time(&raw_time);
  struct tm * timeinfo = localtime(&raw_time);

  /* Modify the struct tm & use mktime() to get related timestamp */
  timeinfo->tm_year = 2022 - 1900;
  timeinfo->tm_mon = 4 - 1;
  timeinfo->tm_mday = 21;

  time_t timestamp = mktime(timeinfo);
  printf("timestamp = %d\n", timestamp);
  return 0;
}
```

```cpp
timestamp = 1650519507
```

> `localtime()`：\\t{timestamp} \\to \\t{tm}
> 
> `mktime()` ：\\t{tm} \\to\\t{timestamp}
> 
> 对于 `struct tm`实例，我们不是直接构造，而是通过获取 `当前时间戳`，然后转化得到 `当前时间戳所对应的tm`，再修改 `tm的属性字段`，最后通过 `mktime()`来获得 `修改后的tm对应的时间戳`

> `tm_wday` 和 `tm_yday`字段被 `忽略`

> `year`从 `1900`开始，`month`从 `0`开始

*   `difftime()`

#### Conversion

*   `asctime()`：\\t{tm}\\to\\t{string}
*   `ctime()`：\\t{timestamp} \\to \\t{string}
*   `gmtime()`：\\t{timestamp}\\to \\t{tm (UTC)}
*   `localtime()`：\\t{timestamp} \\to \\t{tm (local)}
*   `strftime()`：\\t{format tm} \\to \\t{string}

> `strftime()`虽然提供了 `格式化tm结构`的功能，但 `struct tm`本身已经包含了足够的信息，可以非常方便地 `自定义格式化函数`

### Code Pointer

除了常规的类型指针外，传统C语言还有一种指针称作 `代码指针`。

通过对 `代码片段`运用 `地址运算符`可以得到 `该代码片段的地址`。

```cpp
int main() {

  s1:
  printf("hi\n");

  printf("address of s1 = %d\n", && s1);

  void (*foo) (void) = reinterpret_cast<void (*)(void)>(4199857);
  foo();

  return 0;
}
```

```cpp
hi
address of s1 = 4199857
hi
address of s1 = 4199857
hi
address of s1 = 4199857
hi
address of s1 = 4199857
hi
address of s1 = 4199857
hi
......
```

### Remove Const-Qualified

*   `const_cast<>()`

```cpp
  string str = "abc";
  char *str_data = const_cast<char *>(str.data());
  str_data[0] = 'A';
  cout << str;
```

```cpp
Abc
```