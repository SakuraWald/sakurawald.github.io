---
title: Compiler Test
tags:
  - test
id: '1233'
date: 2023-1-15 11:00:00
descriptino: 'This is a description text.'
---



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
\newcommand\lb[1]{\left{\begin{aligned} #1 \end{aligned}\right.} 
\newcommand\rb[1]{\left.\begin{aligned} #1 \end{aligned}\right}} 
\newcommand\env[2]{\begin{#1}#2\end{#1}}

% Misc % 
\newcommand\s[1]{{#1}} 
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
\newcommand\max[1]{\textbf{ max } {#1} } 
\newcommand\min[1]{\textbf{ min } {#1} } 
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
\newcommand+[1]{\mathcal{#1}} 
\newcommand\warnning[1]{\colorbox{Blue}{\textcolor{Yellow}{#1}}} 
\newcommand\error[1]{\colorbox{Black}{\textcolor{White}{#1}}}
$$
{% endraw %}



------

这是中文`and`英文

这是中文 `and` 英文

这是 `code fence`

> 



> **Warning**
>
> This is a warning

```java
Hello World
```



```mermaid
graph TD;
      A-->B;
      A-->C;
      B-->D;
      C-->D;
```

>```mermaid
>graph TD;
>      A-->B;
>      A-->C;
>      B-->D;
>      C-->D;
>```



>```java
>This is the first line.
>This is the second line.
>This is the thrid line.
>```

















>```mermaid
>classDiagram
>class JspContext {
>+getAttribute(String name)
>+getAttribute(String name, int scope)
>+getAttributeNames()
>+findAttribuite(String name)
>}
>
>JspContext <-- PageContext
>class PageContext{
>+APPLICATION_SCOPE
>+PAGE_SCOPE
>+REQUEST_SCOPE
>+SESSION_SCOPE
>+getRequest()
>+getServletConfig()
>+getServletContext()
>+getSession()
>}
>```





> 原理：$\lceil x/y \rceil = \lfloor(x\textcolor{blue}{+y-1})/y \rfloor$
>
> 证明
> $$
> \begin{aligned}
> &\boxed{\text{采用Biasing修复算术右移默认的向下舍入误差}} \\
> &x \dot{=} qy + r,\quad 0 \le r \lt y \\
> &\implies (x+y-1)/y = q + (r+y-1)/y \\
> &\implies \lfloor (\textcolor{red}{x}+y-1)/y \rfloor = q + \lfloor (\textcolor{red}{r}+y-1)/y\rfloor \\
> &= q + epsilon(r) =
> \begin{cases}
> 0,& r = 0 \\
> 1 ,& r \gt 0
> \end{cases}
> \end{aligned}
> $$



$\lceil x/y \rceil = \lfloor(x\textcolor{blue}{+y-1})/y \rfloor$


$$
\begin{aligned}
first \\
second
\end{aligned}
$$



Hi, here are some katex/mathjax examples.

linebreak

$$
\a{
& \boxed{\t{This is a abox}} \\
& \r{\t{This is red}} \\
& \b{\t{This is blue}}
}
$$




![SnackBar](https://camo.githubusercontent.com/53d0e59a884a0744867fe672d691af14c3d7ff00dc1db8d2354c0d897307607c/687474703a2f2f7777772e706f6c6f6e656c2e636f6d2f736e61636b6261722f6c6f676f5f6c617267652e706e67)
