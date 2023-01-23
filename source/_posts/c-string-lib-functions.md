---
title: "[OJ] C语言赐予你的字符串处理函数"
date: 2021-02-06 13:53:00
tags:
  - oj
---

{% raw %}

<article class="post-718 post type-post status-publish format-standard hentry category-oj category-soj">	

				<div class="post-category">
					<a href="https://www.sakurawald.com/?cat=15" rel="category" class="docs-creator">OJ</a> / <a href="https://www.sakurawald.com/?cat=14" rel="category" class="docs-creator">SOJ</a>				</div><!--/.post-category-->
				
				<h1 class="post-title outline-heading" id="outline-heading-1">[OJ] C语言赐予你的字符串处理函数</h1>
				
				<div class="post-date">
					<i class="far fa-clock"></i>February 6, 2021				</div><!--/.post-date-->


​								
​				<div class="clear"></div>
​				
				<div class="entry">	
					<h1 class="outline-heading" id="outline-heading-2">C语言赐予你的字符串处理函数</h1>
<p>string.h库中包含一系列处理字符串常用的函数，来看看吧。<br>
<a class="wp-editor-md-post-content-link docs-creator" href="https://i.loli.net/2021/02/06/8XI3dLqEgGnZvtA.jpg"><img data-lazyloaded="1" src="https://i.loli.net/2021/02/06/8XI3dLqEgGnZvtA.jpg" data-src="https://i.loli.net/2021/02/06/8XI3dLqEgGnZvtA.jpg" alt="" data-ll-status="loaded" class="entered litespeed-loaded"></a></p>
<p>阅览过string.h的函数列表后，以后遇到类似的字符串处理问题，就可以先查查这个表，看看有没有能直接使用的函数。</p>
<h1 class="outline-heading" id="outline-heading-3">用字符串函数来解题！</h1>
<h3 class="outline-heading" id="outline-heading-4">获取字符串长度 -&gt; strlen()</h3>
<div class="code-toolbar"><pre class="line-numbers language-c" tabindex="0"><code class="language-c"><span class="token comment">// 获取指定字符串的长度（不包含'\0'字符）</span>
<span class="token comment">// str: 目标字符串</span>
<span class="token class-name">size_t</span> <span class="token function">strlen</span><span class="token punctuation">(</span><span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>str<span class="token punctuation">)</span>
<span aria-hidden="true" class="line-numbers-rows"><span></span><span></span><span></span></span></code></pre><div class="toolbar"><div class="toolbar-item"><span>C</span></div><div class="toolbar-item"><button class="copy-to-clipboard-button" type="button" data-copy-state="copy"><span>Copy</span></button></div></div></div>
<p>关键点：题目的单词要么是“click”要么是“double click”，因此没有必要真正去解析词语，只需要运用字符串的长度关系，直接计算出“click”出现次数即可。</p>
<h6 class="outline-heading" id="outline-heading-5">SOJ1409 双击666 AC.c</h6>
<pre class="EnlighterJSRAW" data-enlighter-language="c">s[];main(n){gets(&amp;n);strchr(gets(s),'d')?puts("666"):printf("%d",strlen(s)/6+1);}
</pre>
<p>实际上，这道题的“click”出现次数也可以不计算。</p>
<pre class="EnlighterJSRAW" data-enlighter-language="c">s[];main(n){gets(&amp;n);puts(strchr(gets(s),'d')?"666":&amp;n);}
</pre>
<h3 class="outline-heading" id="outline-heading-6">比较字符串 -&gt; strcmp()</h3>
<div class="code-toolbar"><pre class="line-numbers language-c" tabindex="0"><code class="language-c"><span class="token keyword">int</span> <span class="token function">strcmp</span><span class="token punctuation">(</span><span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>str1<span class="token punctuation">,</span> <span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>str2<span class="token punctuation">)</span>
<span class="token comment">// str1: 要比较的字符串1</span>
<span class="token comment">// str2: 要比较的字符串2</span>
<span aria-hidden="true" class="line-numbers-rows"><span></span><span></span><span></span></span></code></pre><div class="toolbar"><div class="toolbar-item"><span>C</span></div><div class="toolbar-item"><button class="copy-to-clipboard-button" type="button" data-copy-state="copy"><span>Copy</span></button></div></div></div>
<p>该函数返回值为int, 分为3种情况.<br>
1. 字符串相等: 返回 0<br>
2. 字符串str1 &lt; 字符串str2: 返回负数<br>
3. 字符串str1 &gt; 字符串str2: 返回正数</p>
<h3 class="outline-heading" id="outline-heading-7">连接字符串 -&gt; strcat()</h3>
<div class="code-toolbar"><pre class="line-numbers language-c" tabindex="0"><code class="language-c"><span class="token keyword">char</span> <span class="token operator">*</span><span class="token function">strcat</span><span class="token punctuation">(</span><span class="token keyword">char</span> <span class="token operator">*</span>dest<span class="token punctuation">,</span> <span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>src<span class="token punctuation">)</span>
<span class="token comment">// dest: 目标字符串</span>
<span class="token comment">// src: 来源字符串</span>
<span aria-hidden="true" class="line-numbers-rows"><span></span><span></span><span></span></span></code></pre><div class="toolbar"><div class="toolbar-item"><span>C</span></div><div class="toolbar-item"><button class="copy-to-clipboard-button" type="button" data-copy-state="copy"><span>Copy</span></button></div></div></div>
<p>将src字符串 连接到 dest字符串的末尾(请保证dest字符串拥有足够的大小)</p>
<p>strcat(A, B) = A + B</p>
<h3 class="outline-heading" id="outline-heading-8">找出首个不满足字符集的下标 -&gt; strspn()</h3>
<div class="code-toolbar"><pre class="line-numbers language-c" tabindex="0"><code class="language-c"><span class="token class-name">size_t</span> <span class="token function">strspn</span><span class="token punctuation">(</span><span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>str1<span class="token punctuation">,</span> <span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>str2<span class="token punctuation">)</span>
<span class="token comment">// str1: 被检索的字符串</span>
<span class="token comment">// str2: 用于检索的字符串 (可为单字符的字符串)</span>
<span aria-hidden="true" class="line-numbers-rows"><span></span><span></span><span></span></span></code></pre><div class="toolbar"><div class="toolbar-item"><span>C</span></div><div class="toolbar-item"><button class="copy-to-clipboard-button" type="button" data-copy-state="copy"><span>Copy</span></button></div></div></div>
<p>该函数用于在str1中找出 第一个不在str2中出现的字符的下标</p>
<h6 class="outline-heading" id="outline-heading-9">SOJ1082 字符串 AC.c</h6>
<pre class="EnlighterJSRAW" data-enlighter-language="c">char s[];main(t){t=strspn(gets(s),"#");for(printf("%s",s+t);t--;putchar(35));}
</pre>
<h3 class="outline-heading" id="outline-heading-10">大小写转换 -&gt; strupr() &amp; strlwr()</h3>
<p>注意: strupr()和strlwr()并不是string.h的函数</p>
<div class="code-toolbar"><pre class="line-numbers language-c" tabindex="0"><code class="language-c"><span class="token keyword">char</span> <span class="token operator">*</span> <span class="token function">strupr</span><span class="token punctuation">(</span><span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span> str<span class="token punctuation">)</span>
<span class="token comment">// str: 被转换的字符串</span>

<span class="token keyword">char</span> <span class="token operator">*</span> <span class="token function">strlwr</span><span class="token punctuation">(</span><span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span> str<span class="token punctuation">)</span>
<span class="token comment">// 被转换的字符串</span>
<span aria-hidden="true" class="line-numbers-rows"><span></span><span></span><span></span><span></span><span></span></span></code></pre><div class="toolbar"><div class="toolbar-item"><span>C</span></div><div class="toolbar-item"><button class="copy-to-clipboard-button" type="button" data-copy-state="copy"><span>Copy</span></button></div></div></div>
<h6 class="outline-heading" id="outline-heading-11">SOJ1279 转换为大写 AC.c</h6>
<pre class="EnlighterJSRAW" data-enlighter-language="c">main(n){puts(strupr(gets(&amp;n)));}
</pre>
<h6 class="outline-heading" id="outline-heading-12">SOJ1290 转换为小写 AC.c</h6>
<pre class="EnlighterJSRAW" data-enlighter-language="c">main(n){puts(strlwr(gets(&amp;n)));}
</pre>
<h3 class="outline-heading" id="outline-heading-13">反转字符串 -&gt; strrev()</h3>
<div class="code-toolbar"><pre class="line-numbers language-c" tabindex="0"><code class="language-c"><span class="token keyword">char</span> <span class="token operator">*</span> <span class="token function">strrev</span><span class="token punctuation">(</span><span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span> str<span class="token punctuation">)</span>
<span class="token comment">// str: 待反转的字符串</span>
<span aria-hidden="true" class="line-numbers-rows"><span></span><span></span></span></code></pre><div class="toolbar"><div class="toolbar-item"><span>C</span></div><div class="toolbar-item"><button class="copy-to-clipboard-button" type="button" data-copy-state="copy"><span>Copy</span></button></div></div></div>
<p>注意: 该方法是原址性的, 如果需要保留原始字符串, 则应该事先用strcpy()复制一份原始字符串的副本.</p>
<h6 class="outline-heading" id="outline-heading-14">SOJ1284 字符串正反连接 AC.c</h6>
<pre class="EnlighterJSRAW" data-enlighter-language="c">s[];S[];main(){gets(s);printf("%s%s",s,strrev(strcpy(S,s)));}
</pre>
<h6 class="outline-heading" id="outline-heading-15">SOJ1305 判断是否为对称字符串 AC.c</h6>
<pre class="EnlighterJSRAW" data-enlighter-language="c">s1[];s2[];main(){puts(strcmp(s1,strrev(strcpy(s2,gets(s1))))?"No":"Yes");}
</pre>
<h6 class="outline-heading" id="outline-heading-16">SOJ1615 英语单词逆序 AC.c</h6>
<pre class="EnlighterJSRAW" data-enlighter-language="c">m[];main(){for(;~scanf("%s",&amp;m);printf("%s ",strrev(m)));}
</pre>
<h3 class="outline-heading" id="outline-heading-17">找出指定字符的出现下标 -&gt; strchr()</h3>
<div class="code-toolbar"><pre class="line-numbers language-c" tabindex="0"><code class="language-c"><span class="token keyword">char</span> <span class="token operator">*</span><span class="token function">strchr</span><span class="token punctuation">(</span><span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>str<span class="token punctuation">,</span> <span class="token keyword">int</span> c<span class="token punctuation">)</span>
<span class="token comment">// str: 被检索的字符串</span>
<span class="token comment">// c: 要查找的指定字符 (输入char类型自动转为int)</span>
<span aria-hidden="true" class="line-numbers-rows"><span></span><span></span><span></span></span></code></pre><div class="toolbar"><div class="toolbar-item"><span>C</span></div><div class="toolbar-item"><button class="copy-to-clipboard-button" type="button" data-copy-state="copy"><span>Copy</span></button></div></div></div>
<p>注意: 该方法返回的是 首个符合的字符的指针(char*), 因此，如果需要算出该字符在原字符串中的下标, 应该运用指针算术来得到:<br>
index = strchr(str, 指定字符) – str</p>
<h6 class="outline-heading" id="outline-heading-18">SOJ1336 我已经不是三岁小孩了 AC.c</h6>
<pre class="EnlighterJSRAW" data-enlighter-language="c">s[];main(N,M){gets(s);N=*(strchr(s,45)-1)%48;M=*(strchr(s,45)+1)%48;puts(4&gt;=N&amp;&amp;4&lt;=M?"Yes":"No");}
</pre>
<h6 class="outline-heading" id="outline-heading-19">SOJ1604 英语姓名简写 AC.c</h6>
<pre class="EnlighterJSRAW" data-enlighter-language="c">m[];main(){*strrchr(gets(m),46)=0;puts(m);}
</pre>
<h3 class="outline-heading" id="outline-heading-20">连接部分字符串 -&gt; strncat()</h3>
<div class="code-toolbar"><pre class="line-numbers language-c" tabindex="0"><code class="language-c"><span class="token keyword">char</span> <span class="token operator">*</span><span class="token function">strncat</span><span class="token punctuation">(</span><span class="token keyword">char</span> <span class="token operator">*</span>dest<span class="token punctuation">,</span> <span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>src<span class="token punctuation">,</span> <span class="token class-name">size_t</span> n<span class="token punctuation">)</span>
<span class="token comment">// dest: 目标字符串</span>
<span class="token comment">// src: 来源字符串</span>
<span class="token comment">// n: 将来源字符串的前n个字符 追加到 目标字符串 中</span>
<span aria-hidden="true" class="line-numbers-rows"><span></span><span></span><span></span><span></span></span></code></pre><div class="toolbar"><div class="toolbar-item"><span>C</span></div><div class="toolbar-item"><button class="copy-to-clipboard-button" type="button" data-copy-state="copy"><span>Copy</span></button></div></div></div>
<h3 class="outline-heading" id="outline-heading-21">比较部分字符串 -&gt; strncmp()</h3>
<div class="code-toolbar"><pre class="line-numbers language-c" tabindex="0"><code class="language-c"><span class="token keyword">int</span> <span class="token function">strncmp</span><span class="token punctuation">(</span><span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>str1<span class="token punctuation">,</span> <span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>str2<span class="token punctuation">,</span> <span class="token class-name">size_t</span> n<span class="token punctuation">)</span>
<span class="token comment">// str1: 字符串1</span>
<span class="token comment">// str2: 字符串2</span>
<span class="token comment">// n: 比较字符串1和字符串2的 前n个字符</span>
<span aria-hidden="true" class="line-numbers-rows"><span></span><span></span><span></span><span></span></span></code></pre><div class="toolbar"><div class="toolbar-item"><span>C</span></div><div class="toolbar-item"><button class="copy-to-clipboard-button" type="button" data-copy-state="copy"><span>Copy</span></button></div></div></div>
<h3 class="outline-heading" id="outline-heading-22">复制字符串 -&gt; strcpy()</h3>
<div class="code-toolbar"><pre class="line-numbers language-c" tabindex="0"><code class="language-c"><span class="token keyword">char</span> <span class="token operator">*</span><span class="token function">strcpy</span><span class="token punctuation">(</span><span class="token keyword">char</span> <span class="token operator">*</span>dest<span class="token punctuation">,</span> <span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>src<span class="token punctuation">)</span>
<span class="token comment">// dest: 目标字符串 (请保证有充足的内存空间)</span>
<span class="token comment">// src: 来源字符串</span>
<span aria-hidden="true" class="line-numbers-rows"><span></span><span></span><span></span></span></code></pre><div class="toolbar"><div class="toolbar-item"><span>C</span></div><div class="toolbar-item"><button class="copy-to-clipboard-button" type="button" data-copy-state="copy"><span>Copy</span></button></div></div></div>
<h3 class="outline-heading" id="outline-heading-23">复制部分字符串 -&gt; strncpy()</h3>
<div class="code-toolbar"><pre class="line-numbers language-c" tabindex="0"><code class="language-c"><span class="token keyword">char</span> <span class="token operator">*</span><span class="token function">strncpy</span><span class="token punctuation">(</span><span class="token keyword">char</span> <span class="token operator">*</span>dest<span class="token punctuation">,</span> <span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>src<span class="token punctuation">,</span> <span class="token class-name">size_t</span> n<span class="token punctuation">)</span>
<span class="token comment">// dest: 目标字符串 (请保证有充足的内存空间)</span>
<span class="token comment">// src: 来源字符串</span>
<span class="token comment">// n: 复制src的前n个字符</span>
<span aria-hidden="true" class="line-numbers-rows"><span></span><span></span><span></span><span></span></span></code></pre><div class="toolbar"><div class="toolbar-item"><span>C</span></div><div class="toolbar-item"><button class="copy-to-clipboard-button" type="button" data-copy-state="copy"><span>Copy</span></button></div></div></div>
<h3 class="outline-heading" id="outline-heading-24">检索开头有几个字符不符合条件 -&gt; strnspn()</h3>
<div class="code-toolbar"><pre class="line-numbers language-c" tabindex="0"><code class="language-c"><span class="token class-name">size_t</span> <span class="token function">strcspn</span><span class="token punctuation">(</span><span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>str1<span class="token punctuation">,</span> <span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>str2<span class="token punctuation">)</span>
<span class="token comment">// str1: 被检索的字符串</span>
<span class="token comment">// str2: 检索字符的列表</span>
<span aria-hidden="true" class="line-numbers-rows"><span></span><span></span><span></span></span></code></pre><div class="toolbar"><div class="toolbar-item"><span>C</span></div><div class="toolbar-item"><button class="copy-to-clipboard-button" type="button" data-copy-state="copy"><span>Copy</span></button></div></div></div>
<h3 class="outline-heading" id="outline-heading-25">检索第一个匹配指定字符列表的字符 -&gt; strpbrk()</h3>
<div class="code-toolbar"><pre class="line-numbers language-c" tabindex="0"><code class="language-c"><span class="token keyword">char</span> <span class="token operator">*</span><span class="token function">strpbrk</span><span class="token punctuation">(</span><span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>str1<span class="token punctuation">,</span> <span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>str2<span class="token punctuation">)</span>
<span class="token comment">// str1: 被检索的字符串</span>
<span class="token comment">// str2: 检索字符的列表</span>
<span aria-hidden="true" class="line-numbers-rows"><span></span><span></span><span></span></span></code></pre><div class="toolbar"><div class="toolbar-item"><span>C</span></div><div class="toolbar-item"><button class="copy-to-clipboard-button" type="button" data-copy-state="copy"><span>Copy</span></button></div></div></div>
<p>注意: strpbrk() 与 strspn() 相反.</p>
<h3 class="outline-heading" id="outline-heading-26">找出指定字符最后一次出现的位置 -&gt; strrchr()</h3>
<div class="code-toolbar"><pre class="line-numbers language-c" tabindex="0"><code class="language-c"><span class="token keyword">char</span> <span class="token operator">*</span><span class="token function">strrchr</span><span class="token punctuation">(</span><span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>str<span class="token punctuation">,</span> <span class="token keyword">int</span> c<span class="token punctuation">)</span>
<span class="token comment">// str: 被检索的字符串</span>
<span class="token comment">// c: 指定字符</span>
<span aria-hidden="true" class="line-numbers-rows"><span></span><span></span><span></span></span></code></pre><div class="toolbar"><div class="toolbar-item"><span>C</span></div><div class="toolbar-item"><button class="copy-to-clipboard-button" type="button" data-copy-state="copy"><span>Copy</span></button></div></div></div>
<h3 class="outline-heading" id="outline-heading-27">查找指定子串首次出现位置 -&gt; strstr()</h3>
<div class="code-toolbar"><pre class="line-numbers language-c" tabindex="0"><code class="language-c"><span class="token keyword">char</span> <span class="token operator">*</span><span class="token function">strstr</span><span class="token punctuation">(</span><span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>haystack<span class="token punctuation">,</span> <span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>needle<span class="token punctuation">)</span>
<span class="token comment">// haystack: 被检索的字符串</span>
<span class="token comment">// needle: 指定子串</span>
<span aria-hidden="true" class="line-numbers-rows"><span></span><span></span><span></span></span></code></pre><div class="toolbar"><div class="toolbar-item"><span>C</span></div><div class="toolbar-item"><button class="copy-to-clipboard-button" type="button" data-copy-state="copy"><span>Copy</span></button></div></div></div>
<h3 class="outline-heading" id="outline-heading-28">分隔字符串 -&gt; strtok()</h3>
<div class="code-toolbar"><pre class="line-numbers language-c" tabindex="0"><code class="language-c"><span class="token keyword">char</span> <span class="token operator">*</span><span class="token function">strtok</span><span class="token punctuation">(</span><span class="token keyword">char</span> <span class="token operator">*</span>str<span class="token punctuation">,</span> <span class="token keyword">const</span> <span class="token keyword">char</span> <span class="token operator">*</span>delim<span class="token punctuation">)</span>
<span class="token comment">// str: 目标字符串</span>
<span class="token comment">// delim: 用于分割的字符串</span>
<span aria-hidden="true" class="line-numbers-rows"><span></span><span></span><span></span></span></code></pre><div class="toolbar"><div class="toolbar-item"><span>C</span></div><div class="toolbar-item"><button class="copy-to-clipboard-button" type="button" data-copy-state="copy"><span>Copy</span></button></div></div></div>
<p>注意: strtok()函数会破坏str的数据, 若需要保留数据, 请使用str的副本.<br>
注意: strtok()函数只需要首次调用时传入str即可, 后续调用可传入NULL</p>
<pre class="EnlighterJSRAW" data-enlighter-language="c">void split(char * str, char * delim) {
    /* 首次调用strtok(): 初始化strtok()函数 且 获取第一个被切割的子串*/
    char * token = strtok(str, delim);

    /* 后续调用strtok(): 获取 其他被切割处理的子串 */
    while (token != NULL) {
        printf("str = %s\n", str);
        printf("delim = %s\n", delim);
        printf("token = %s\n\n", token);
        
        token = strtok(NULL, delim);
    }
}

int main() {
    char str1[80] = "First233Second233Third";
    char str2[80] = "233";

    split(str1, str2);
}

/* Output:
str = First
delim = 233
token = First

str = First
delim = 233
token = Second

str = First
delim = 233
token = Third
*/
</pre>
										<div class="clear"></div>				
				</div><!--/.entry-->
				

			</article>

{% endraw %}
