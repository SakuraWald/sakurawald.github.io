---
title: Iterative & Recursive - Expression Evaluation
tags: []
id: '850'
categories:
  - - oj
    - NOJ
    - SOJ
  - - OJ
date: 2021-09-13 08:53:52
---

# Expression Evaluation

## Problem

1.  给定输入表达式字符串：包含 + - \* / ^ ()
2.  表达式的运算使用整数运算, 小数部分向下取整.

eg: `2*((11+3)*(2+3)^2)+2` = `702`

## Analysis

表达式求值问题: 需要处理好 `操作数栈` 和 `操作符栈`, 其中 `操作数栈`只需要按照字符串的高位优先顺序逐个扫描入栈即可，而 `操作符栈` 需要正确处理 `操作符的优先级`，未来扫描到的 `操作符` 有可能对之前的 `操作符` 产生影响。（因此，递归解法思路是清晰的。）

逆波兰表达式的递归解法: 利用 `隐含的函数调用栈` 来处理 `操作符优先级` ，将表达式的各个部分均视为大大小小的 `token` , 如 `(3+6/2)` 和 `100` 均可以视为1个 `token` .

关于 `操作符的优先级` , 在处理 `4*3^2` 时, 我们仍按照 `字符串的高位优先` 规则来进行扫描。

每一个 `token_value()函数调用栈` 包含 `1个 操作符或操作数`

在 `递归的自顶向下过程完成时` , 我们扫描读入了 `整个表达式`

![image-20210913083454343](https://i.loli.net/2021/09/13/THBhFCmW4A71xPn.png)

![image-20210913083434355](https://i.loli.net/2021/09/13/FdPWAXRiE2uL1Cz.png)

![image-20210913083422195](https://i.loli.net/2021/09/13/6sl2WQHaRnGP15U.png)

![image-20210913083413587](https://i.loli.net/2021/09/13/8NS5EViyFOWm1B4.png)

紧接着, 在 `递归的自低向上过程中`, 我们会逐个计算 `表达式的各个部分`, 并且把 `表达式部分的计算结果` 重新代入 `表达式中`

![image-20210913084005455](https://i.loli.net/2021/09/13/YGOD9oj5P7bmdqg.png)

根据 `递归时隐含的函数调用栈 所对应的 运算符优先级`, 我们成功让 `操作数3` 正确地与 `操作数2` 进行 `^运算`,

而不是错误地与 `操作数4` 进行 `*运算` (尽管我们先扫描到 `操作数4` 和 `运算符*`)

接下来，只需要逐步地完成 `递归的自底向上过程`即可完成 `整个表达式的计算`

![image-20210913084252456](https://i.loli.net/2021/09/13/KlFJ5nTN9WGojUi.png)

![image-20210913084327047](https://i.loli.net/2021/09/13/Fy4JgoXcjQY39Sd.png)

![image-20210913084336970](https://i.loli.net/2021/09/13/N1QEUAYj9FJVcgR.png)

![image-20210913084349590](https://i.loli.net/2021/09/13/1qQDaogbGJ9pUzt.png)

![image-20210913084412029](https://i.loli.net/2021/09/13/CMZlIF1ye5KhAJo.png)

![image-20210913084506107](https://i.loli.net/2021/09/13/YVxtuRySEjDakMK.png)

最终完成 `整个表达式的计算`

![image-20210913084552868](https://i.loli.net/2021/09/13/5LAwqlvFEMGtZpd.png)

## Solution: Recursive

```cpp
#include <iostream>
#include <math.h>
using namespace std;

typedef int number;
number token_value(int priority) {
    number res;
    if (priority == 0) {
        res = 0;
        char c = cin.peek();
        if (c == '(') {
            cin.get(); // get (
            res = token_value(3); // as a new expression
            cin.get();  // get )
        } 
        while (isdigit(c)) { // read a num
            res = (10 * res) + (c % 48); // Nice Try.
            cin.get(); // get digit
            c = cin.peek();
        }
    } else {
        res = token_value(priority - 1);
        while (true) {
            char op = cin.peek();
            if (priority == 1 && op == '^') {
                cin.get(); // get ^
                number val = token_value(priority - 1);
                res = round(pow(res, val));
            } else if (priority == 2 && (op == '*'  op == '/')) {
                cin.get(); // get * or /
                number val = token_value(priority - 1);
                op == '*' ? res *= val : res /= val;
            } else if (priority == 3 && (op == '+'  op == '-')) {
                cin.get(); // get + or -
                number val = token_value(priority - 1);
                op == '+' ? res += val : res -= val;
            } else break;
       }
   }
    return res;
}

int main() {
    cout << token_value(3);
    return 0;
}
```

## Solution: Iterative

```cpp
#include <stack>
#include <map>
#include <iostream>
#include <cmath>

using namespace std;

map<char, int> priority_map{{'+', 1},
                            {'-', 1},
                            {'*', 2},
                            {'/', 2},
                            {'^', 3}};
typedef int number;
stack<number> nums;
stack<char> ops;

void eval() {
  number num2 = nums.top(); nums.pop();
  number num1 = nums.top(); nums.pop();
  char op = ops.top(); ops.pop();

  if (op == '+') nums.push(num1 + num2);
  if (op == '-') nums.push(num1 - num2);
  if (op == '*') nums.push(num1 * num2);
  if (op == '/') nums.push(num1 / num2);
  if (op == '^') nums.push(round(pow(num1, num2)));
}

int main() {
  /* Trans InOrderExpr to PostOrderExpr */
  while (cin.peek() != '\n') {
    // get digit.
    if (isdigit(cin.peek())) {
      number num = 0;
      while (isdigit(cin.peek())) {
        num = (num * 10) + cin.peek() % 48;
        cin.get();
      }
      nums.push(num);
    } else {
      // get operators.
      if (cin.peek() == '(') {
        ops.push(cin.peek()); // push (
        cin.get(); // get (
      } else if (cin.peek() == ')') {
        while (ops.top() != '(') eval();
        ops.pop(); // pop (
        cin.get(); // get )
      } else {
        while (!ops.empty() && priority_map[ops.top()] >= priority_map[cin.peek()]) eval();
        ops.push(cin.peek());
        cin.get(); // get operator
      }
    }
  }

  /* Calc PostorderExpr */
  while (!ops.empty()) eval();

  /* Output */
  cout << nums.top();
}
```