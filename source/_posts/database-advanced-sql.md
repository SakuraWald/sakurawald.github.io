---
title: "[Database] Advanced SQL"
date: 2022-04-29 21:35:00
tags:
  - database
---

# Advanced SQL

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

## Access DB From PL

?????? `???????????? (Programming Language)`  `??????` `?????????` ????????????

- `??????SQL`????????? `?????????API` ????????? `?????????`
  - JDBC
  - ODBC
  - ADO.NET
- `?????????SQL`???????????? `SQL??????` ????????? `????????????` ???????????? `????????????` ??? `?????????????????????SQL` ?????? `??????`???

---

??????????????????????????? `JDBC` ????????????

- ????????????????????????`Connection`???`Statement`???`ResultSet`

- `JDBC` ????????????????????? `MySQL` ??????????????? `??????` ?????? `?????????????????????` ??? `??????????????????API`?????? `jdbc:mysql`???`jdbc:oracle` ???????????? `????????????????????????`

  > ??????????????????`JDBC` ??? `?????????????????????API`???????????? `???????????????????????????`???????????????`JDBC?????????` ?????????????????? `???????????????????????????`

- `Statement` ????????? `SQL????????????`????????????????????? `Statement` ??? `????????????`
- ?????? `PreparedStatement` ????????? `????????????????????????` ??? `??????SQL??????`???
- `?????????` ????????? `ResultSet` ??????????????? `????????????`?????????????????? `?????????`????????????????????? `ResultSet#getMetaData` ?????? `?????????`???????????? `?????????` ?????????
- ??? `Updatable Result Set` ??? `???????????????` ??? `??????????????????`
- ??????????????? `??????????????????SQL??????????????????`???????????? `???????????????????????????????????????`???????????? `Connection#setAutoCommit(false)`



## Function and Procedure

`?????? (Function)` ??? `?????? (Procedure)` ?????? `????????????` ?????? `???????????? ` ????????? `?????????`???

????????? `??????????????????` ??? `??????????????????` ??? `????????????` ??????

### Function

- ??????????????? `??????` ?????????

```sql
CREATE FUNCTION dept_count(dept_name varchar(20)) RETURNS integer
BEGIN
    DECLARE d_count integer
    SELECT count(*) INTO d_count
    FROM instructor
    WHERE instructor.dept_name = dept_name
    RETURN d_count
END
```

- `?????????????????? (Parameterized View)`

```sql
CREATE FUNCTION instructor_of(dept_name varchar(20)) RETURNS TABLE(ID varchar(5),
                                                                  name varchar(20),
                                                                  dept_name varchar(20),
                                                                  salary numeric(8,2))
RETURN TABLE(SELECT ID, name, dept_name, salary
             FROM instructor
             WHERE instructor.dept_name = instructor_of.dept_name
            );                                                                 
```

????????? `????????????` ?????? `??????????????????`???

### Procedure

> ?????? `?????? (Function) ` ??? `?????? (Procedure)` ????????? `????????????`???????????????????????????
>
> - ??????????????? `?????????`
> - ?????????????????? `?????????`
>
> ??? `??????????????????` ???????????????`??????` ?????? `??????`  ?????? `???????????????`

```sql
CREATE PROCEDURE dept_count_proc(IN dept_name varchar(20), OUT d_count integer)
BEGIN
    SELECT count(*) INTO d_count
    FROM instructor
    WHERE instructor.dept_name = dept_count_proc.dept_name
END
```

> `IN` ?????? `????????????`?????? `OUT ??????????????????`???
>
> ??????????????? `????????????` ????????? `??????????????????` ?????????????????? `OUT` ?????????????????? `????????????`????????? `?????????` ???????????? `??????` ??? `??????` ??? `???????????????` 

### Persistent Storage Module

`?????????????????? (Persistent Storage Module)` ??????????????? `??????` 

????????????????????? `PSM` ??? `??????`?????????????????? `???????????????`

```sql
DECLARE out_of_classroom_seats CONDITION
DECLARE EXIT HANDLER FOR out_of_classroom_seats
BEGIN
	sequence of statements
END

CREATE FUNCTION registerStudnet(
    IN s_id varchar(5),
    IN s_courseid varchar(8),
    IN s_secid varchar(8),
    IN s_semester varchar(6),
    IN s_year numeric(4,0),
    OUT errorMsg varchar(100)
	RETURNS integer
BEGIN
    DECLARE currEnrol int;
    SELECT count(*) INTO currEnrol
    FROM takes
    WHERE course_id = s_courseid AND sec_id = s_secid
    AND semester = s_semester AND year = s_year;
    
    DECLARE limit int;
    SELECT capacity INTO limit
    FROM capacity NATURAL JOIN section
    WHERE course_id = s_courseid AND sec_id = s_secid
    AND semester = s_semester AND year = s_year;
    
    IF (currEnrol < limit) 
    	BEGIN
    		INSERT INTO takes VALUES (s_id, s_courseid, s_secid, s_semester, s_year, null);
    		RETURN(0);
    	END
    -- capacity overflow !
    SET errorMsg = 'Enrollment limit reached for course' || s_courseid || 'section' || s_secid;
    RETURN(-1);
END    
)
```

### External Language Procedure

`?????????` ????????? `??????` ????????? `??????????????????` ???????????????????????? `??????` ?????? `??????????????????`

```sql
CREATE PROCEDURE dept_count_proc(IN dept_name varchar(20), OUT count integer)
LANGUAGE C
EXTERNAL NAME '/usr/avi/bin/dept_course_proc'
```

> ???????????? `??????` ?????? `??????` ????????? `C` ????????????????????????????????? `????????????`???
>
> ?????????????????? `Java`???`C#` ???????????????????????? `???????????????` ??? `????????????` ???????????? `????????????`???
>
> ?????????????????? `????????????` `???????????????` ??? `????????????` ??? `?????????` ???????????????

## Trigger

`????????? (Trigger)`???????????? `?????????` ?????? `????????????` ??????`??????` ??? `???????????????`

---

```sql
CREATE TRIGGER credits_earned AFTER UPDATE OF takes ON(grade)
	REFERENCING NEW ROW AS nrow
	REFERENCING OLD ROW AS orow
	FOR EACH ROW
	WHEN nrow.grade <> 'F' AND nrow.grade IS NOT NULL
		AND (orow.grade = 'F' OR orow.grade IS NULL)
	BEGIN ATOMIC
		UPDATE student
		SET tot_cred = tot_cred + 
            (SELECT credits
            FROM course
            WHERE course.course_id = nrow.course_id)
    	WHERE student.id = nrow.id;
    END
```

> `???????????????`???
>
> - `?????????????????? (FOR EACH STATEMENT)`????????? `?????????????????????SQL??????` `?????????1???` `?????????`
> - `??????????????? (FOR EACH ROW)`?????? `?????????????????????` `?????????1???` `?????????`
>
> `???????????? (Transition Variable)`???
>
> - `REFERENCING OLD ROW AS symbol`????????? `????????????????????????????????????`
> - `REFERENCING NEW ROW AS symbol`???????????? `??????` ??? `??????` ??? `????????????`
>
> `????????????`???
>
> - `BEFORE`????????? `??????????????????`???`??????????????????`
> - `AFTER`????????? `??????????????????????????????`???`???????????????????????????????????????`

?????????????????? `????????????`  ?????????????????????????????? `?????????`???

## Recursive Query

`???????????? (Recursive Query)` ???????????????????????? `???????????? (Transitive Closure)` ????????? `???????????????????????????????????????`???

---

?????? `????????????`

###  Iteration

```sql
CREATE FUNCTION findAllPrereqs(cid varchar(8))
RETURN TABLE(course_id varchar(8))
BEGIN
	-- define variables
	CREATE TEMPORARY TABLE c_prereq(course_id varchar(8));
	CREATE TEMPORARY TABLE new_c_prereq(course_id varchar(8));
	CREATE TEMPORARY TABLE temp(course_id varchar(8));
	-- init and continue
	INSERT INTO new_c_prereq
		SELECT prereq_id
		FROM prereq
		WHERE course_id = cid;
	-- loop until not new course is added
	REPEAT
		INSERT INTO c_prereq
			SELECT INTO temp
			FROM new_c_prereq;
		INSERT INTO temp
			(SELECT prereq.course_id
            FROM new_C_prereq, prereq
            WHERE new_c_prereq.course_id = prereq.course_id)
            EXCEPT
            (SELECT course_id
            FROM c_prereq);
        DELETE FROM new_c_prereq;
        INSERT INTO new_c_prereq
        	SELECT *
			FROM temp;
		DELETE FROM temp;
	UNTIL NOT EXISTS (SELECT * FROM new_c_prereq)
	END REPEAT
	-- return the result table
    RETURN TABLE c_prereq;
END 
```

### Recursion

```sql
-- define recursive query
WITH RECURSIVE rec_prereq(course_id, prereq_id) AS (SELECT course_id, prereq_id
                                                   FROM prereq)
                                                   UNION 
                                                   (SELECT rec_prereq, course_id, prereq.prereq_id
                                                   FROM prereq, rec_prereq
                                                   WHERE prereq.course_id = rec_prereq.prereq_id)
-- call recursive query
SELECT *
FROM rec_prereq;
```

> ?????????SQL?????????????????? `?????????` ?????? `???????????????????????????`????????? `????????????` ??? `??????????????????` ??? `??????????????????`??????????????? `??????-???????????????????????????`???

> ?????? `FROM??????` ??? `???????????? prc_prereq` ?????? `????????????`???
>
> `WITH RECURSIVE` ???????????? `????????????`??????????????? `??????` ????????? `?????????` ??? `???????????????`

> `SQL??????` ?????? `????????????` ????????? `??????` ??? `???????????????`????????????????????? `????????? (Fixed Point)`
>
> > ????????????????????? `????????????` ????????? `??????` ????????? `????????????????????????`
>
> > ?????? `????????????????????????`?????????????????? `?????????????????????????????????`???

????????? `???????????? (Recursive Query)` = `????????? (Base Query)` UNION `???????????? (Recursive Query)`

## Advanced Aggregate

### Rank

#### Sparse Rank & Dense Rank

- `rank()`

``` sql
-- SQL 1
SELECT ID, rank() OVER (ORDER BY (GPA) DESC) AS s_rank
FROM student_grades
ORDER BY 's_rank'
```

> ????????? `rank` ???????????? `????????????????????????` `???rank????????????`???
>
> ????????? `ORDER BY 's_rank'`  ?????? `?????????????????????` ?????? `??????`

> ??????????????? `????????????`???`percent_rank()`???`cume_dist()`???`row_number()`

> ?????? `??????` ?????????????????????????????????`NULL FIRST` ??? `NULL LAST`
>
> ```sql
> SELECT ID, rank() OVER (ORDER BY (GPA) DESC NULL LAST) AS s_rank
> FROM student_grades
> ORDER BY 's_rank'
> ```

$SQL 1 = SQL 2$

```sql
-- SQL 2
SELECT ID, (1 + (SELECT count(*)
                FROM student_grades B
                WHERE B.GPA > A.GPA)) AS s_rank
FROM student_grades A
ORDER BY s_rank
```

- `dense_rank()`

`rank()` ????????? `??????` ??? `?????????`????????? `??????????????????` ???2????????? `?????????????????????` ?????? `1`?????? `??????????????????` ??? `??????` ?????? `3`

???????????????????????? `dense_rank()`???????????? `?????????` ??? `??????`???`?????????????????????` ???????????? `1`?????? `??????????????????` ??? `??????` ?????? `2`

```sql
-- SQL 3
SELECT ID, dense_rank() OVER (ORDER BY (GPA) DESC) AS s_rank
FROM student_grades
ORDER BY 's_rank'
```

####   Partition before Rank

```sql
-- SQL 4
SELECT ID, dept_name, rank() OVER (PARTITION BY dept_name ORDER BY GPA DESC) AS DEPT_RANK
FROM dept_grades
ORDER BY dept_name, dept_rank;
```

> ????????? `GROUP BY` ?????? `PARTION` ??? `GROUP BY` ???????????????

> ???????????????????????? `??????` ????????? `??????????????? PARTITION`???????????? `??????????????????` ?????? `?????????????????????`

#### Grading

 `ntile(n)` ??? `????????????` ?????? `???????????? (Partion) ????????????`???????????? `??????` ?????? `n?????????????????????????????????`

```sql
SELECT ID, ntile(4) OVER (ORDER BY (GPA DESC)) AS quartile
FROM student_grades;
```

 ??????????????? `??????????????????`

### Window Query

`????????????`??????????????? `????????????????????????` ?????? `??????`

> ????????? `????????????` ?????? `1?????????` ?????? `1????????? (Partion)` ????????????`????????????` ?????? `?????? (Window)` ????????? `?????????`???

```sql
SELECT year, avg(num_credits) OVER(ORDER BY year ROWS 3 PRECEDING) AS avg_total_credits
FROM tot_credits;
```

> n.b. ?????? `?????????????????????` ?????? `??????`?????? `???????????????????????????????????????` ??? `?????????????????????`???

> `??????` ????????????????????????
>
> - `ROWS n PRECEDING/FOLLOWING`
> - `ROWS UNBOUNDED PRECEDING/FOLLOWING`
> - `ROWS BETWEEN a PRECEEDING AND b FOLLOWING `
> - `RANGE BETWEEN a AND b `



## OLAP

### Introduction

`?????????????????? (OLAP)` ????????? `???????????????`????????? `????????????` ?????? `????????????` ??? `???????????????????????????`

---

??????????????? `??????` $sales(item\_name, color, clothes\_size, quantity)$

????????? `????????????????????????`  `?????? (Group)`  ??? `????????????` ??? `?????????`???

- `???????????? (Measure Attribute)`?????? `?????????` ?????? `??????`?????????????????? `?????????` ?????? `????????????`
- `????????? (Dimension Attribute)`???`???????????????` ?????? `?????????`

?????? `?????????` ??? `????????????` ??? `?????????` ??? `??????` ????????? `???????????? (Multi-Dimensional Data)`

---

`??????????????? (Data Cube)`????????????????????? `n?????????`???

> `????????? (Cross-Tabulation / Pivot Table)`????????????????????? `????????????`?????? `???????????????` ??? `2?????????`
>
> ?????? `?????????` ??????????????? `????????? (Total Row)` ??? `????????? (Total Column)`

`?????? (Cell)`???`n??????????????????` ?????? `n?????????` ?????? `??????`????????? `??????` ?????? `1??????`

>  ??? `????????????` ??? `??????` ??? `all` ??????????????? `?????????????????????????????????`?????? `????????????????????????`???
>
>  ??? `clothes_size`  ??? `all???` ?????? ???`small`???`medium` ??? `large` ?????? `??????` ????????????

---

- Select `attribute_list`

`?????? (Pivot)`????????? `?????????` ??? `???` ?????????

`?????? (Slice) / ?????? (Dicing)`???`??????` `????????????`???`??????` `???????????????`

> ????????? `??????` ?????? `??????1?????????`??????`??????` ?????? `??????????????????` ??????

- Change ` observation granularity`

`?????? (RollUp)` ?????? `????????????`

`?????? (Drill Down)`?????? `????????????`

> `?????????????????????` ????????? `?????????????????????` ??????????????????????????????
>
> ??? `????????????` ???????????? `????????????`??????????????????

?????? `??????` ?????????????????? `??????`????????? `????????????` ?????? `????????????`?????? `Datetime???????????????`???

```mermaid
graph TD;
date_time(DateTime) --> hour_of_day(Hour of Day)
date_time --> date(Date)
date --> day_of_week(Day of Week)
date --> month(Month)
month --> quarter(Quarter)
quarter --> year(Year)
```

> ??????????????? `???????????????` ?????? ??????????????? `?????????` `????????????`????????????????????? `??????` ??? `??????`???
>
> > ???????????? `???` ?????? `???????????????????????????`?????? `?????????` ??? `???????????????`????????????????????? `???????????????`???

### OLAP in SQL

 `??????` $sales(item\_name, color, clothes\_size, quantity)$

- `pivot()`

```sql
SELECT *
FROM sales
pivot(
	sum(quantity)
    FOR color IN ('dark', 'pastel', 'white')
)
```

> `pivot??????for` ??? `??????` ??????`??????`  `????????????????????????` ?????? `?????????` ?????? `?????????` ?????????

| item_name | clothes_size | dark | pastel | white |
| --------- | ------------ | ---- | ------ | ----- |
| skirt     | small        | 2    | 11     | 2     |
| ...       | ...          | ...  | ...    | ...   |

- `cube()`

```sql
SELECT item_name, color, clothes_size, sum(quantity)
FROM sales
GROUP BY cube(item_name, color, clothes_size)
```

> ?????????????????? `all???`?????????????????? `decode()` ??? `grouping()`???

??????????????????????????? `??????` $ (item\_name, color, clothes\_size, quantity)$

???????????????1??? `3?????????????????????`

- `rollup()`

```sql
SELECT item_name, color, clothes_size, sum(quantity)
FROM sales
GROUP BY rollup(item_name, color, clothes_size)
```

??? `??????????????????????????????` ?????????`rollup()` ??? `cube()` ????????? `????????????` ?????? `???????????????`???

????????????`rollup()` ???????????????1??? `0????????????`???1??? `1????????????`???1??? `2????????????`??? 1??? `3????????????`

> ???????????? `cube()` ?????? `rollup()`?????????????????? `???????????????????????????`???????????? `????????????????????????????????????`???
>
> ????????????????????? `HAVING??????` ????????? `GROUP??????` ????????? `????????????????????????`
