---
title: OJ - C语言赐予你的字符串处理函数
tags: []
id: '718'
categories:
  - - OJ
  - - oj
    - SOJ
date: 2021-02-06 13:53:32
---

# C语言赐予你的字符串处理函数

string.h库中包含一系列处理字符串常用的函数，来看看吧。 [![](https://i.loli.net/2021/02/06/8XI3dLqEgGnZvtA.jpg)](https://i.loli.net/2021/02/06/8XI3dLqEgGnZvtA.jpg) 阅览过string.h的函数列表后，以后遇到类似的字符串处理问题，就可以先查查这个表，看看有没有能直接使用的函数。

# 用字符串函数来解题！

### 获取字符串长度 -> strlen()

```c
// 获取指定字符串的长度（不包含'\0'字符）
// str: 目标字符串
size_t strlen(const char *str)
```

关键点：题目的单词要么是“click”要么是“double click”，因此没有必要真正去解析词语，只需要运用字符串的长度关系，直接计算出“click”出现次数即可。

###### SOJ1409 双击666 AC.c

s\[\];main(n){gets(&n);strchr(gets(s),'d')?puts("666"):printf("%d",strlen(s)/6+1);}

实际上，这道题的“click”出现次数也可以不计算。

s\[\];main(n){gets(&n);puts(strchr(gets(s),'d')?"666":&n);}

### 比较字符串 -> strcmp()

```c
int strcmp(const char *str1, const char *str2)
// str1: 要比较的字符串1
// str2: 要比较的字符串2
```

该函数返回值为int, 分为3种情况. 1. 字符串相等: 返回 0 2. 字符串str1 < 字符串str2: 返回负数 3. 字符串str1 > 字符串str2: 返回正数

### 连接字符串 -> strcat()

```c
char *strcat(char *dest, const char *src)
// dest: 目标字符串
// src: 来源字符串
```

将src字符串 连接到 dest字符串的末尾(请保证dest字符串拥有足够的大小) strcat(A, B) = A + B

### 找出首个不满足字符集的下标 -> strspn()

```c
size_t strspn(const char *str1, const char *str2)
// str1: 被检索的字符串
// str2: 用于检索的字符串 (可为单字符的字符串)
```

该函数用于在str1中找出 第一个不在str2中出现的字符的下标

###### SOJ1082 字符串 AC.c

char s\[\];main(t){t=strspn(gets(s),"#");for(printf("%s",s+t);t--;putchar(35));}

### 大小写转换 -> strupr() & strlwr()

注意: strupr()和strlwr()并不是string.h的函数

```c
char * strupr(const char * str)
// str: 被转换的字符串

char * strlwr(const char * str)
// 被转换的字符串
```

###### SOJ1279 转换为大写 AC.c

main(n){puts(strupr(gets(&n)));}

###### SOJ1290 转换为小写 AC.c

main(n){puts(strlwr(gets(&n)));}

### 反转字符串 -> strrev()

```c
char * strrev(const char * str)
// str: 待反转的字符串
```

注意: 该方法是原址性的, 如果需要保留原始字符串, 则应该事先用strcpy()复制一份原始字符串的副本.

###### SOJ1284 字符串正反连接 AC.c

s\[\];S\[\];main(){gets(s);printf("%s%s",s,strrev(strcpy(S,s)));}

###### SOJ1305 判断是否为对称字符串 AC.c

s1\[\];s2\[\];main(){puts(strcmp(s1,strrev(strcpy(s2,gets(s1))))?"No":"Yes");}

###### SOJ1615 英语单词逆序 AC.c

m\[\];main(){for(;~scanf("%s",&m);printf("%s ",strrev(m)));}

### 找出指定字符的出现下标 -> strchr()

```c
char *strchr(const char *str, int c)
// str: 被检索的字符串
// c: 要查找的指定字符 (输入char类型自动转为int)
```

注意: 该方法返回的是 首个符合的字符的指针(char\*), 因此，如果需要算出该字符在原字符串中的下标, 应该运用指针算术来得到: index = strchr(str, 指定字符) - str

###### SOJ1336 我已经不是三岁小孩了 AC.c

s\[\];main(N,M){gets(s);N=\*(strchr(s,45)-1)%48;M=\*(strchr(s,45)+1)%48;puts(4>=N&&4<=M?"Yes":"No");}

###### SOJ1604 英语姓名简写 AC.c

m\[\];main(){\*strrchr(gets(m),46)=0;puts(m);}

### 连接部分字符串 -> strncat()

```c
char *strncat(char *dest, const char *src, size_t n)
// dest: 目标字符串
// src: 来源字符串
// n: 将来源字符串的前n个字符 追加到 目标字符串 中
```

### 比较部分字符串 -> strncmp()

```c
int strncmp(const char *str1, const char *str2, size_t n)
// str1: 字符串1
// str2: 字符串2
// n: 比较字符串1和字符串2的 前n个字符
```

### 复制字符串 -> strcpy()

```c
char *strcpy(char *dest, const char *src)
// dest: 目标字符串 (请保证有充足的内存空间)
// src: 来源字符串
```

### 复制部分字符串 -> strncpy()

```c
char *strncpy(char *dest, const char *src, size_t n)
// dest: 目标字符串 (请保证有充足的内存空间)
// src: 来源字符串
// n: 复制src的前n个字符
```

### 检索开头有几个字符不符合条件 -> strnspn()

```c
size_t strcspn(const char *str1, const char *str2)
// str1: 被检索的字符串
// str2: 检索字符的列表
```

### 检索第一个匹配指定字符列表的字符 -> strpbrk()

```c
char *strpbrk(const char *str1, const char *str2)
// str1: 被检索的字符串
// str2: 检索字符的列表
```

注意: strpbrk() 与 strspn() 相反.

### 找出指定字符最后一次出现的位置 -> strrchr()

```c
char *strrchr(const char *str, int c)
// str: 被检索的字符串
// c: 指定字符
```

### 查找指定子串首次出现位置 -> strstr()

```c
char *strstr(const char *haystack, const char *needle)
// haystack: 被检索的字符串
// needle: 指定子串
```

### 分隔字符串 -> strtok()

```c
char *strtok(char *str, const char *delim)
// str: 目标字符串
// delim: 用于分割的字符串
```

注意: strtok()函数会破坏str的数据, 若需要保留数据, 请使用str的副本. 注意: strtok()函数只需要首次调用时传入str即可, 后续调用可传入NULL

void split(char \* str, char \* delim) {
    /\* 首次调用strtok(): 初始化strtok()函数 且 获取第一个被切割的子串\*/
    char \* token = strtok(str, delim);

    /\* 后续调用strtok(): 获取 其他被切割处理的子串 \*/
    while (token != NULL) {
        printf("str = %s\\n", str);
        printf("delim = %s\\n", delim);
        printf("token = %s\\n\\n", token);
        
        token = strtok(NULL, delim);
    }
}

int main() {
    char str1\[80\] = "First233Second233Third";
    char str2\[80\] = "233";

    split(str1, str2);
}

/\* Output:
str = First
delim = 233
token = First

str = First
delim = 233
token = Second

str = First
delim = 233
token = Third
\*/