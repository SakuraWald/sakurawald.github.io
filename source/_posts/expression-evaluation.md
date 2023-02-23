---
title: "Expression Evaluation"
date: 2021-09-13 08:53:00
tags:
  - algorithm
---

# Expression Evaluation

## Problem

1. 给定输入表达式字符串：包含 + - * / ^ ()
2. 表达式的运算使用整数运算, 小数部分向下取整.

eg: `2*((11+3)*(2+3)^2)+2` = `702`

## Analysis

表达式求值问题: 需要处理好 `操作数栈` 和 `操作符栈`, 其中 `操作数栈`只需要按照字符串的高位优先顺序逐个扫描入栈即可，而 `操作符栈` 需要正确处理 `操作符的优先级`，未来扫描到的 `操作符` 有可能对之前的 `操作符` 产生影响。（因此，递归解法思路是清晰的。）

逆波兰表达式的递归解法: 利用 `隐含的函数调用栈` 来处理 `操作符优先级` ，将表达式的各个部分均视为大大小小的 `token` , 如 `(3+6/2)` 和 `100` 均可以视为1个 `token` .

关于 `操作符的优先级` , 在处理 `4*3^2` 时, 我们仍按照 `字符串的高位优先` 规则来进行扫描。

每一个 `token_value()函数调用栈` 包含 `1个 操作符或操作数`

在 `递归的自顶向下过程完成时` , 我们扫描读入了 `整个表达式`

![image-20210913083454343](https://raw.githubusercontent.com/SakuraWald/sakurawald.github.io/main/imagesTHBhFCmW4A71xPn.png)

![image-20210913083434355](https://s2.loli.net/2023/01/22/5d7BXZAumQFCx3p.png)

![image-20210913083422195](https://raw.githubusercontent.com/SakuraWald/sakurawald.github.io/main/images/mLDihEPNRXAy7dc.png)

![image-20210913083413587](https://s2.loli.net/2023/01/22/eiVE6UL8csyO7Gh.png)

紧接着, 在 `递归的自低向上过程中`, 我们会逐个计算 `表达式的各个部分`, 并且把 `表达式部分的计算结果` 重新代入 `表达式中`

![image-20210913084005455](https://s2.loli.net/2023/01/22/jh2MkrO3Z5H4v9x.png)

根据 `递归时隐含的函数调用栈 所对应的 运算符优先级`, 我们成功让 `操作数3` 正确地与 `操作数2` 进行 `^运算`,

而不是错误地与 `操作数4` 进行 `*运算` (尽管我们先扫描到 `操作数4` 和 `运算符*`)

接下来，只需要逐步地完成 `递归的自底向上过程`即可完成 `整个表达式的计算`

![image-20210913084252456](https://s2.loli.net/2023/01/22/iKPhAnIMXRBGa2o.png)

![image-20210913084327047](https://s2.loli.net/2023/01/22/mBJF6lLQ3O8t2Ta.png)

![image-20210913084336970](https://s2.loli.net/2023/01/22/97UPlmDIfVgcdvG.png)

![image-20210913084349590](https://s2.loli.net/2023/01/22/bGZhmOFCeKzBxNd.png)

![image-20210913084412029](https://s2.loli.net/2023/01/22/9XWkBJefOLPhzM5.png)

![image-20210913084506107](https://s2.loli.net/2023/01/22/ybzPwmQaR2K6eDv.png)

最终完成 `整个表达式的计算`

![image-20210913084552868](https://s2.loli.net/2023/01/22/AJ58qBaHNheuPlc.png)

## Solution: Recursive

```
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
            } else if (priority == 2 && (op == '*' || op == '/')) {
                cin.get(); // get * or /
                number val = token_value(priority - 1);
                op == '*' ? res *= val : res /= val;
            } else if (priority == 3 && (op == '+' || op == '-')) {
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

```
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
