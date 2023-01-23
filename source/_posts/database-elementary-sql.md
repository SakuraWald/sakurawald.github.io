---
title: "[Database] Elementary SQL"
date: 2022-04-28 19:55:00
tags:
  - database
---

# Elementary SQL

## Primitive Type

| Primitive Type                      | Description                           |
| ----------------------------------- | ------------------------------------- |
| $char(n), character(n)$             | `固定长度的字符串`，`固定长度` 为 n   |
| $varchar(n), character\ varying(n)$ | `可变长度的字符串`，`最大长度` 为 n   |
| $int, integer$                      | `整数类型`                            |
| $smallint$                          | `小整数类型`                          |
| $numeric(p,d)$                      | `定点数类型`：$numeric(3,1) \to 44.5$ |
| $real, double\ precision$           | `浮点数` 和 `双精度浮点数`            |
| $float(n)$                          | `精度至少为n位的浮点数`               |

> `空值 (null)`：任何 `数据类型` 都可能包含 `空值`。`空值` 表达语义 `缺失的值`。

> 对于使用 `char` 类型存放的 `字符串`，会自动执行 `末尾补空格` 策略。 
>
> 但请注意，当我们使用 `char` 和 `varchar` 进行 `相等性测试`时，`行为` 将是 `未定义的`，某些实现可能会 `自动为varchar在末尾补空格`。
>
> 出于这点考虑，建议 `永远只使用varchar`

## Define a Database Pattern

### General Form

```sql
CREATE TABLE r
(Attribute1 Domain1,
 Attribute2 Domain2,
 ...,
 Attributen Domainn,
 <Integrity Constraint>,
 ...,
 <Integrity Constraint>);
```

> `域 (Domain)` ：用于指定 `与域相关联的属性` 的 `数据类型` 以及 `约束`

### Example

```sql
CREATE TABLE teaches(
id varchar(5),
course_id varchar(8),
section_id varchar(8),
semester varchar(6),
year numeric(4,0),
PRIMARY KEY (id, course_id, section_id, semester, year),
FOREIGN KEY (course_id, section_id, semester, year) REFERENCES section,
FOREIGN KEY (id) REFERENCES instructor    
);
```

## Basic DML

### Insert

```sql
INSERT INTO instructor VALUES (10211, 'Smith', 'Biology', 66000);
```

#### Delete

- Delete a `Relationship`

```sql
DROP TABLE r;
```

- Delete `Tuple`

```sql
DELETE FROM student;
```

> 可以使用 `DELETE FROM r`来删除 `关系中的所有元组`，但 `保留关系的模式定义` 

#### Alter

```sql
ALTER TABLE r ADD attribute domain;
```

```sql
ALTER TABLE r DROP attribute;
```

> 某些 `数据库` 仅仅支持 `删除整个关系` ，而不支持 `删除关系中的某个属性`。

## Basic Structure

`SQL` 的 `基本查询` 由 `SELECT`，`FROM`，`WHERE` 三大 `子句` 所构成。



### Single-Relation query

```sql
SELECT name
FROM instructor;
```

> `数学` 上的 `关系` 本质是 `集合`，不允许 `重复元素`。
>
> 但 `维护元素的唯一性` 的 `代价` 非常大，在 `数据库` 中则是 `允许关系中的元素发生重复` 
>
> > - `all`  和 `distinct`
> >
> > 对于 `SELECT` 来说，`去重选项` 默认为 `ALL` 即表示 `不去重`。
> >
> > ```sql
> > SELECT ALL dept_name
> > FROM instructor;
> > ```
> >
> > 也可以手动指定为 `distinct` 表示需要进行 `去重`
> >
> > ```sql
> > SELECT DISTINCT dept_name
> > FROM instructor;
> > ```

使用 `WHERE子句` 可以从 `FROM子句的结果关系` 中 `筛选` 出 `使得谓词为True的元组`

```sql
SELECT name
FROM instructor
WHERE deptname  'Comp.Sci.' AND salary > 70000;
```

###  Multi-Relation query

#### General Form

`多表查询` 的 `通用格式` 

```sql
SELECT attribute1, attribute2, ..., attributen
FROM r1, r2, ..., rn
WHERE P;
```

其中，每种 `子句` 的作用如下：

- `SELECT子句`：从 `WHERE子句给出的元组` 中 `投影` 指定的 `属性列表`
- `FROM子句`：给出 `作为数据输入的` 的 `关系列表`
- `WHERE子句`：`过滤出` 使得 `谓词` 为 `True` 的 `FROM子句中的元组` 

> `数据库` 执行 `查询` 的 `顺序` 与 `书写顺序` 不太一样：$FROM \to WHERE \to SELECT$
>
> 可以将 `SELECT子句` 看作是一种 `语言学方面的结构提前`，这种 `形式提前` 有利于我们 `快速地了解输出的结构是什么`

> `WHERE子句` 的 `默认值` 为 `WHERE true`

> `FROM子句` 会为 `关系列表` 中的 `所有关系` 都进行 `笛卡尔积运算`，通常会产生一个 `非常巨大的结果关系`
>
> > 实际上，大部分情况下并不会真的 `生成` `关系列表中所有关系的笛卡尔积`。
> >
> > 因为 `查询优化器` 会 `事先过滤`掉 `大部分不可能满足WHERE子句的元组`，使得 `FROM子句` 输出的 `结果关系` 规模 `大幅度减小` 
>
> 对于 `FROM instructor, department` 来说，就是对 `instructor关系` 和 `department关系` 进行 `笛卡尔积` 作为 `结果关系`



#### Match Condition Specified by Where Clause

通过 `Where子句` 指定 `匹配条件`

```sql
SELECT name, course_id
FROM instructor, teaches
WHERE instructor.ID = teaches.ID;
```

> 当 `属性名` 仅出现在 `FROM子句所指定的关系` 的 `一个关系` 中时，可以省略掉 `属性名的全限定前缀`。
>
> 当然，`总是为属性名写上关系名前缀` 是没有错的。 

>  n.b. 上述的 `匹配条件` 并不会查询出 `没有教授任何课程的教师`。
>
>  如果期望显示出这些教师，则应当使用 `外连接`



#### Match Condition Specified by Natural Join

##### Natural Join: Compare all the common attributes

`自然连接 (Natural Join)`：将输入的 `2个关系` 中 `共有属性 (Common Condition) 的值` `均相等` `的元组` 作为 `输出结果`

下列 `查询` 的 `等价形式`

```sql
SELECT name, course_id
FROM instructor, teaches
WHERE instructor.ID = teaches. ID
```

```sql
SELECT name, course_id
FROM instructor NATURAL JOIN teaches
```

> 实际上，可以将 `NATURAL JOIN语句` 看作是一种形式的 `宏展开 (Macro Expansion)`。
>
> 先查找 `两个关系的共有属性`，然后 `改写` 成 `WHERE子句` 形式的 `谓词`：
>
> ```sql
> WHERE S.common_attribute_1 = T.common_attribute_1
> AND S.common_attribute_2 = T.common_attribute_2
> ...
> AND S.common_attribute_n = T.common_attribute_n
> ```

##### Natural Join: Specify specific common attributes

首先，考虑下面这个 `查询`

```sql
-- Query 1
SELECT name, title
FROM instructor NATURAL JOIN teaches, course
WHERE teaches.course_id = course.course_id;
```

> n.b. `teaches.course_id` 追根溯源来自 `teaches`，我们是无法直接 `引用` ` 自然连接的结果关系` 的，但可以 `直接引用` `参与自然连接的属性`，因为 `自然连接的结果关系` 中的 `属性` 正来自这些 `单个关系的属性`。

但是，该查询  `并不等价于` 下列这个 `查询`

```sql
-- Query 2
SELECT name, title
FROM instructor NATURAL JOIN teaches NATURAL JOIN course
```

> `instructor关系`，`teaches关系`，`course关系` 均有 `dept_name属性`。
>
> 对于 `Query 1` ：则只需要考虑 `这两个关系的` `dept_name属性` 的 `相等`，而 `course关系的dept_name属性` 可以与他们不同。也就是说，该查询会显示出 `教师所讲授的课程` 不是 `教师所在系的课程`
>
> 对于 `Query 2`：该查询 `只显示` `教师所教的课程` `就是该教师所在系的课程`

出现该问题的原因在于，在将 `instructor NATURAL JOIN teaches` 和 `course`进行 `自然连接` 时，`course` 中存在 `我们不希望使用的共同属性` 即 `dept_name`

> `course关系` 共有2个 `共同属性`：`course_id`，`dept_name`

对此，我们可以通过 `带指定属性列表的自然连接 (Natural Join with Specific Arrtibute List)` 来改写 `Query 2` 

```sql
-- Query 3
SELECT name, title
FROM (instructor NATURAL JOIN teaches) JOIN course USING (course_id)
```

这样，`Query 3` 等价于 `Query 1`。

> n.b. 同样的道理，可以再将 `NATURAL JOIN` 视为 `JOIN relation USING attribute_list` 的 `宏展开`。
>
> 默认情况下，`relation_1 NATURAL JOIN relation_2`  可以展开为 `relation_1 JOIN relation_2 USING (common_attribute_list)` 

## Basic Operation

### Rename Operation

`更名运算 (Rename Operation)` 用于为 `实体` 指定 `标识符`。

它主要有以下几种作用：

- 修改 `输出关系`中的 `长属性名` 修改为 `短属性名`

  ```sql
  SELECT instructor_name AS inst_name
  FROM instructor
  ```

- 为 `运算中间结果` 指定 `标识符`，以便 `后续对它的引用`

- 用于 `区分` `涉及自身关系的笛卡尔积运算`

  ```sql
  SELECT DISTINCT T.name
  FROM instructor AS T, instructor AS S
  WHERE T.salary > S.salary AND S.dept_name = 'Biology'
  ```

  > n.b. 可以将 `T` 和 `S` 看作是 `instructor关系` 的 `2份拷贝`
  >
  > > 实际上，并不会真的拷贝2份关系。`T` 和 `S` 只不过是对 `instructor` 的 `引用` 而已。

  > 像 `T` 和 `S` 这样 `用于重命名关系的标识符` 被称为 `相关名称 (Correlation Name)`，或 `表别名 (Table Alias)` 或 `相关变量 (Correlation Variable)` 或 `元组变量 (Tuple Variable)`

### String Operation

#### Pattern Matching

```sql
SELECT dept_name
FROM department
WHERE building LIKE '%Watson%';
```

通过使用 `LIKE操作符`可以实现 `模式匹配 (Pattern Matching)`，使用如下 `字符` 来 `定义模式`：

- `百分号 (%)`：匹配 `任意子串`
- `下划线 (_)`：匹配 `任意一个字符`

> n.b. 尽管 `SQL标准` 中要求 `字符串的相等运算` 是 `大小写敏感的`。
>
> 但 `某些数据库`，如 `MySQL` 和 `SQL Server` 却在 `匹配字符串` 时 `不区分大小写`！
>
> 关于 `字符串相等性测试` 的具体详情，应当查阅 `Manual` 

#### Escape Character

```sql
LIKE 'ab\%cd%' ESCAPE '\'
```

使用 `ESCAPE关键字` 定义 `转义字符` 为 `\`

### Order Operation

```sql
SELECT *
FROM instructor
WHERE dept_name = 'Physics'
ORDER BY salary DESC, name ASC;
```

> `ORDER BY子句` 的 `默认值` 为 `asc`，而 `desc` 需要手动指定。

#### Between Operation

```sql
-- Query 1
SELECT name
FROM instructor
WHERE salary BETWEEN 9000 AND 10000;
```

```sql
-- Query 2
SELECT name
FROM instructor
WHERE salary >= 9000 AND salary <= 10000;
```

`Query 1` 等价于 `Query 2`

> n.b. 可以将 `Between运算符` 和 `Not Between运算符`  视为 `基于不等式比较运算符写法` 的 `宏展开`。
>
> 但使用 `Between` 和 `Not Between` 使得 `查询` 更加 `清晰`，而且更不容易 `错写` 

#### Multi-Dimensional Tuple

考虑下列 `包含多个AND的相等性测试语句`

```sql
-- Query 1
SELECT name, course_id
FROM instructor, teaches
WHERE instructor.ID = teaches.ID AND dept_name = 'Biology'
```

以及

```sql
-- Query 2
SELECT name, course_id
FROM instructor, teaches
WHERE (instructor.ID, dept_name) = (teaches.ID, 'Biology')
```

`Query 1` 等价于 `Query 2`

> 作为一种更为 `抽象` 的考虑。我们可以认为 `常规所书写的相等语句` 本质上就属于 `1维元组`。
>
> 而如果需要同时测试 `多个属性的某种比较关系`，可以使用 `向量/元组`。
>
> 上述仅仅是 `测试` `相等关系`。同理，也可以用于 `测试` `偏序关系`。
>
> > ```sql
> > (x1, y1) < (x2, y2) 
> > ```

### Set Operation

`SQL标准` 中所定义的 `集合运算` 都是基于 `数学的集合论语义` 的：`所有的集合运算` 会 `自动去重`

> 实际上，`SQL` 的 `集合运算` 有 `两套版本`
>
> -  `自动去重的默认的distinct版本`：`intersect (distinct) `，` union (distinct) ` ，` except (distinct)`
> - `不带去重的all版本` ： `intersect all`，`union all`，`except all`

#### Intersect Operation

```sql
(SELECT course_id
 FROM section
 WHERE semester='Fall' AND year = 2009
) INTERSECT
(SELECT course_id
FROM section
WHERE semester='Spring' AND year = 2010
)
```

#### Union Operation

```sql
(SELECT course_id
 FROM section
 WHERE semester = 'Fall' AND year = 2009
) UNION
(SELECT course_id
FROM section
WHERE semester = 'Spring' AND year = 2010
)
```

#### Except Operation

```sql
(SELECT course_id
 FROM section
WHERE semester = 'Fall' AND year = 2009
) EXCEPT
(SELECT course_id
FROM section
WHERE semester = 'Spring' AND year = 2010   
)
```

## Null

### The type of operation involved

| The type of operation involved | Rule                                                         |
| ------------------------------ | ------------------------------------------------------------ |
| `算术表达式`                   | 任何 `算术表达式` 的 `输入为空`，则 `输出为空`               |
| `逻辑表达式`                   | 任何 `涉及空值的逻辑表达式` 的 `输出为未知 (unknown)`<br />n.b. `unknown` 并不是 `null`或 `not null`，也不是 `true` 和 `false`。<br />`unknown` 是 `区别于true和false的第三种逻辑值`<br /><br />`基本逻辑运算` 对于 `unknown` 定义了 `特殊规则`<br />`fasle AND unknown = false`，`true OR unknown = true `，`NOT unkown = unknown` |

> n.b. `SQL标准` 定义的 `逻辑值` 有3种：`true`，`false`，`unknown`。
>
> 注意 `while子句` 的 `语义` 为：`过滤出` `使得谓词为true的哪些元组` 

> n.b. `未知 (unknown)` 也不是 `空 (null)`。
>
> `unknown`不可以用 `is null` 或 `is not null` 来测试。
>
> 某些 `具体实现` 提供了 `is unknown` 来进行测试。

### Equality Test

| Equality Test      | Rule                                                         |
| ------------------ | ------------------------------------------------------------ |
| `元组的相等性测试` | 在测试 `两个元组的属性值` 是否相等时，如果 `属性值` 均为 `null`，则 `属性值视为相同`<br />n.b. 如果 `只想保留这样的相同元组的一份拷贝`，可以使用 `SELECT DISTINCT` |
| `谓词的相等性测试` | 在测试 `谓词 null = null` 时，将返回 `unknown`，而不是 `true` |

> n.b. 可以认为，`元组的相等性测试` 实际上执行的是 `另一套特殊规则`：它为 `null = null ` 返回 `true`
>
> 而 `谓词的相等性测试` 则：为 `null = null` 返回 `unknown`

## Aggregate Function

`聚集函数 (Aggregate Function)`：以 `值的集合` 作为输入，返回 `单个值` 。

| Intrinsic Aggregate Function | Node               |
| ---------------------------- | ------------------ |
| $avg()$                      |                    |
| $min()$                      |                    |
| $max()$                      |                    |
| $sum()$                      | 忽略 `null`        |
| $count()$                    | 为 `null` 返回 `0` |

###  Basic Aggregate

```sql
SELECT avg(salary)
FROM instructor
WHERE dept_name = 'Comp.Sci.';
```

---

计算 `某个关系中的元组个数`

```sql
SELECT count(*)
FROM course;
```

---

若需要在 `聚集操作` `之前` 进行 `去重`，则可以使用 `distinct关键字`

```sql
SELECT count(DISTINCT ID) 
FROM teaches
WHERE semester = 'Spring' AND year = '2010';
```

> n.b. 可以认为，对于 `内置的5个聚集函数` 而言，默认的 `去重选项` 是 `all`
>
> n.b. `SQL标准` 并不允许为 `count(*)` 使用 `distinct`。但却可以为 `min` 和 `max` 使用 `distinct`。尽管这些 `distinct` 并不会改变 `运算结果` ！

### Grouped Aggregate

`分组聚集 (Grouped Aggregate)` ：可以先对 `某个关系中的元组` 进行 `分组`，然后再 `分别地` 对 `每个分组` 进行 `聚集操作`。

```sql
SELECT dept_name, avg(salary) AS avg_salary
FROM instructor
GROUP BY dept_name;
```

> 可以认为，默认情况下 `省略` `GROUP BY子句` 意味着：将 `整个关系的所有元组` 分为 `唯一的一组`。

---

考虑一个 `错误的查询例子`

```sql
-- This is a wrong query example
SELECT dept_name, ID, avg(salary)
FROM instructor
GROUP BY dept_name;
```

该 `查询` 的问题在于，我们使用 `dept_name属性` 将 `instructor关系的元组` 按 `系` 进行 `分组`，之后的 `avg(salary)` 计算的是 `某个系的所有教师的平均工资`。

而 `ID属性` 的问题在于，对于 `某个系` 来说， `该系中有许多的教师`，如果确实需要 `输出ID`，那么究竟要输出 `该系的所有教师中的哪一个教师的ID`？

综上，我们对于 `GROUP BY` 有一个规则：出现在 `SELECT子句` 中，但没有被 `聚集` 的 `属性`。必须出现在 `GROUP BY` 中。

### Grouped Aggregate with Having Clause

```sql
SELECT dept_name, avg(salary) as avg_salary
FROM instructor
GROUP BY dept_name
HAVING avg(salary) > 42000;
```

`HAVING 子句` 在 `Grouped Aggregate输出结果` `之后` 才进行 `过滤`。

> 换句话说，`HAVING` 必须在 `GROUP BY` 的 `分组形成后` 才能 `执行`

同理，对 `HAVING` 也有类似 `GROUP BY` 的规则 ：出现在 `HAVING子句`中，但没有被 `聚集` 的 `属性`。必须出现在 `GROUP BY`中。

> 可以将 `HAVING子句` 和 `WHERE子句` 作类比。
>
> - `WHERE` ：针对 `元组`
>
> - `HAVING`：针对 `分组`

> 现在，我们可以这样看待 `标准的SELECT-FROM-WHERE查询`为：将 `某个关系的分组` 分为 `唯一的一组`，且 `分组过滤条件` 为 `HAVING true`

## Nested Subquery

我们知道 `SELECT-FROM-WHERE` 返回类型为 `关系`，而 `FROM子句` 的输入类型也为 `关系`，那么 `嵌套子查询 (Nested Subquery)` 应当是合理的。

- `in` 和 `not in`

```sql
SELECT DISTINCT course_id
FROM section
WHERE semester = 'Fall' AND year = 2009 
AND course_id IN (SELECT course_id
                  FROM section
                  WHERE semester = 'Spring' AND year = 2010;
);
```

- `all` 和 `any/some`

```sql
-- Query 1
SELECT DISTINCT T.name
FROM instructor AS T, instructor AS S
WHERE T.salary > S.salary AND S.dept_name = 'Biology';
```

> n.b. 这种实现方式中，必须要加 `DISTINCT`：因为 `FROM子句` 输出的 `结果关系` 为 `2个关系的笛卡尔积`，此时 `结果关系` 中 `满足WHERE条件的元组` 会 `重复`

等价于

```sql
-- Query 2
SELECT name
FROM instructor
WHERE salary > some(SELECT salary
                   FROM instructor
                   WHERE dept_name = 'Biology'
                   );
```

> n.b. 两条关于 `全称量词和特称量词` 的 `等价性规则`：
>
> - `= some` 等价于 `in`，但 `<> some` 不等价于 `not in`
> - `<>all` 等价于 ` not in`，但 `= all` 不等价于 `in`

- `exists`

 `exists`：若 `作为exists参数的子查询` 产生的 `结果关系` 是 `非空的`时，则返回 `true`

 ```sql
 SELECT course_id
 FROM section AS S
 WHERE semester = 'Fall' AND year = 2009
 AND EXISTS(SELECT *
            FROM section AS T
            WHERE semester = 'Spring' AND year = 2010
            AND S.course_id = T.course_id;
 );
 ```

> n.b. 该例子中，还有一个需要注意的地方：我们在 `子查询` 中 `引用` 了 `子查询外部的标识符` `S.course_id`。
>
> 我们称 `这样的子查询` 为 `相关子查询 (Correlated Subquery)`：使用了 `来自外层查询的相关名称` 的 `子查询`
>
> > 关于 `子查询` 中对 `标识符` 的 `引用规则`，可以类比于 `PL中的变量作用域规则`

---

`not exists` 可以用于 `测试` `子查询的结果集` 中 `是否不存在元组`。

我们可以利用这个 `特性` 来模拟 `集合的包含关系`

```sql
-- use not exists to represent subset relationship
SELECT S.ID, S.name
FROM student AS S
WHERE NOT EXISTS(
    (SELECT course_id
     FROM course
     WHERE dept_name = 'Biology'
    ) 
    EXCEPT
    (SELECT T.course_id
     FROM takes AS T
     WHERE S.ID = T.ID
    )
);
```

- `unique`

`unique`：若 `作为unique参数的子查询` 产生的 `结果关系` 中 `不存在重复元组`，则返回 `true`。它为 `空集` 返回 `true`。

```sql
SELECT T.course_id
FROM course AS T
WHERE UNIQUE(SELECT R.course_id
            FROM section AS R
             WHERE T.course_id = R.course_id
             AND R.year = 2009
            )
```

> 实际上，可以利用 `count()` 将 `exists` ，`not exists` ，`unique` 和 `not unique` 进行 `宏展开`
>
> ```sql
> SELECT T.course_id
> FROM course AS T
> WHERE 1 >= (SELECT count(R.course_id)
>          FROM section AS R
>          WHERE T.course_id = R.course_id
>          AND R.year = 2009
>         )
> ```
>
> 解释：`WHERE子句` 将对 `T关系中的每个元组` 进行 `测试`，判断 `嵌套子查询` 中 `与该元组相等的元组的个数` 是否 `小于等于1`
>
> > 该例子中，通过 `course_id` 作为 `主键` 来判断 `两个元组是否相等`。
> >
> > 而 `AND R.year = 2009` 仅仅是 `附加的过滤条件`

> n.b. `unique` 判断 `元组是否重复` 是基于 `元组的相等性测试` 的。故如果 `两个元组中的某个元组的某个属性` 为 `null`，则 `这两个元组` `不相等`。
>
> 换句话说，使用 `unique` 判断 `某些属性为空的元组` 是否 `重复` 是错误的：
>
> 在这种情况下，尽管 `某个元组确确实实有多个副本`，但 `该元组有一个属性为空`，则 `元组的相等性测试` 将永远为 `false`，进而使得 `unique` 永远返回 `true`

- `FROM子查询`

可以利用 `FROM子查询` 来 `去除`  `HAVING子句`

```sql
-- Query 1
SELECT dept_name, avg(salary) as avg_salary
FROM instructor
GROUP BY dept_name
HAVING avg(salary) > 42000;
```

等价于

```sql
-- Query 2
SELECT dept_name, avg_salary
FROM (SELECT dept_name, avg(salary)
     FROM instructor
     GROUP BY dept_name) AS dept_avg(dept_name, avg_salary)
WHERE avg_salary > 42000; 
```

该 `转化` 的思想在于：`HAVING子句` 实际上的 `执行时机` 是在 `GROUP BY产生结果关系之后`，再对 `结果关系(也就是一些分组)` 进行 `过滤`。

因此，我们可以 `先获得作为结果关系的这些分组`，然后再 `对这些分组进行过滤`。

- `WITH子句`

`WITH子句`：用于定义 `仅对包含with子句的查询可见` 的 `临时关系`

```sql
WITH dept_total(dept_name, value) AS (SELECT dept_name, sum(salary)
                                     FROM instructor
                                     GROUP BY dept_name),
	dept_total_avg(value) AS (SELECT avg(salary)
                             FROM dept_total)
SELECT dept_name
FROM dept_total, dept_total_avg
WHERE dept_total.value >= dept_total_avg.value;
```

> n.b. 使用 `WITH子句` 可以 `非常有效地` 去除 `嵌套子查询`。
>
> 如果可能，`应当尽量使用WITH子句来消除嵌套子查询`

- `标量子查询 (Scalar Subquery)`

`SQL` 会 `自动地` 将 `仅含有单属性单元组的关系`  `解包`为 `单个值`。

```sql
SELECT name
FROM instructor
WHERE salary < (SELECT avg(salary)
               FROM instructor)
```

>  n.b. 从 `本质` 上来说， `标量子查询` 返回的 `数据类型` 是确确实实的 `关系`。
>
>  只不过，在 `SQL` 实现中可以自动地 `对这种类型的关系` 进行 `拆包`。这类似于 `Java` 中的 `Auto Boxed/Unboxed`
>
>  `SQL编译器` 并无法 `检测` `标量子查询` 是否真的符合要求。
>
>  如果在 `运行时` 发现 `需要输入单个值的地方` 所使用的 `标量子查询` 包含 `多个值`，则会导致 `运行时错误`

### Modifying Operation

### Delete

考虑该例子的 `语句执行顺序`

```sql
-- This is a wrong example
DELETE FROM instructor
WHERE salary < (SELECT avg(salary)
               FROM instructor)
```

请注意，`我们所编写的SQL语句` 应当 `满足` ：在该语句进行 `修改性操作` 之前，必须先 `测试所有的元组`，将 `符合测试条件的元组` 加入到 `待删除列表`，之后再 `一次性地` 执行 `修改性操作`。

注意：这里所说的 `修改性操作` 不仅仅是指 `Delete`，包括 `Insert` 和 `Alter` 都有 `类似的问题`

> 该问题类似于 `ArrayList的并发修改问题`，当我们对 `正在遍历中的列表` 进行 `修改性操作` 时，必须保证 `最终的效果` 不依赖于 `修改性操作所执行的顺序`

> 给出 `MySQL 8.0` 以上版本将 `拒绝执行该语句` 并且 `返回错误`
>
> 1093 - You can't specify target table 'instructor' for update in FROM clause

### Insert

常用的插入操作

```sql
INSERT INTO course(course_id, title, dept_name, credits)
VALUES ('CS-437', 'Database Systems', 'Comp. SCi.', 4);
```

```sql
INSERT INTO instructor
SELECT ID, name, dept_name, 18000
FROM student
WHERE dept_name = 'Music' AND total_cred > 144;
```

---

```sql
-- This is a wrong example
INSERT INTO student
SELECT *
FROM student
```

该语句 `可能会导致无限递归插入`，这取决于 `数据库的具体实现`。

>经过实际测试，`MySQL 8.0` 以上可以 `正常地执行该语句`，并且 `查询会终止`。
>
>它的 `语义` 为：将 `表中的所有元组` 按照 `顺序` `克隆一份插入到表的末尾`
>
>![image-20220428194552573](https://s2.loli.net/2023/01/22/IZJoX6kCLmR9YDE.png)
>
>
>
>![image-20220428194617665](https://s2.loli.net/2023/01/22/nSNc6QLpFMDde1Z.png)

### Alter

当 `update语句` 之间 `受语句执行顺序` 所 `影响` 时，可以使用 `case结构`

```sql
-- SQL 1
UPDATE instructor
SET salary = salary * 1.03
WHERE salary > 100000
```

```sql
-- SQL 2
UPDATE instructor
SET salary = salary * 1.05
WHERE salary <= 100000
```

为了 `正确地表达语义`，我们可以使用 `case` 结构来 `正确表述执行顺序之间相互影响的语句`

```sql
UPDATE instructor
SET salary = CASE
             WHEN salary <= 100000 THEN salary * 1.05
             ELSE salary * 1.03
             END
```
