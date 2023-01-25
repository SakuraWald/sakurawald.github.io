---
title: "[Blog] 从WordPress迁移到Hexo"
date: 2023-01-25 13:11:58
tags:
  - blog
  - wordpres
  - hexo
---

# 从WordPress到Hexo

## 背景

在经历过 `WordPress` 的数次折磨之后，最终决定将 `Blog` 系统迁移到 `Hexo`。



## 为什么WordPress不适合作为博客系统

对于Blog搭建而言，是时候该放弃 WordPress 了，至少出于以下这些原因：

- WordPress定位早已不属于Blog系统，它更像一个 `复杂易用` 的全能的建站网站。

- WordPress过于臃肿。

  > 存在大量的陈年代码，想修改和新增功能必须按照官方那套繁琐的文档进行。
  >
  > WordPress有丰富的现成 `plugin` ，尽管使用门槛很低，但是自定义的门槛较高。
  >
  > 并且想找到合适的 `plugin` 并配置到完美工作的状态，也需要耗费不少的时间。 
  >
  > 一般来说，你很难直接修改WordPress的核心代码（版本更新的时候会覆盖，况且不优雅），只能通过大量的 `hook` 来完成。
  >
  > 相比于直接修改原生代码而言，麻烦很多。
  >
  > ![image-20230125133135140](https://s2.loli.net/2023/01/25/4saLYcGC6A7eNrb.png)
  >
  > > 更糟糕的是，WordPress的开发团队**根本不清楚**什么东西应该被加入到核心之中。
  > >
  > > 如果你仍然使用 WordPress，请 `务必关闭自动更新`，否则你不会预料到，你的站点会突然多出什么神奇的东西。

- WordPress的访问速度过慢。

  > 有很大一部分原因是因为它需要使用PHP来进行数据库查询，动态生成网页。
  >
  > 尽管可以使用OpenLiteSpeed（提供HTTP 3.0 QUIC协议） + CachePlugin（静态资源，数据库缓存） 进行极大地优化，但是仍然略显笨重。
  >
  > ![image-20230125133354174](https://s2.loli.net/2023/01/25/jgToz6hDynfvV8l.png)
  >
  > 以下是经过高度优化之后的Google Lighthouse分析。
  >
  > 尽管如此，在用户的实际体验上，WordPress 仍然会存在 **明显的卡顿感**。
  >
  > ![image-20230125133711341](https://s2.loli.net/2023/01/25/4TQ9guNr1ohRPsv.png)

- WordPress容易收到垃圾回复。

  > 针对 WordPress 站点存在大量的自动爬虫。
  >
  > ![image-20230125133345387](https://s2.loli.net/2023/01/25/WuQh5fFmOLvrGD9.png)
  >
  > ![image-20230125133327838](https://s2.loli.net/2023/01/25/JsYa49fvQcCpdSL.png)

  

## 迁移到新的博客系统

  对于 `博客系统` 来说，首要考虑的是 `是否能满足写作的纯粹性`。

  它应该至少能提供 `较为舒适` 的  `写作环境` 和 `阅读环境`

### 写作

  比如说，我期望使用 `Markdown` 这门简单但功能完备的标记语言来进行写作  ，并且除了自带的网页编辑器以外，可以选择独立的编辑器。

  至少要 `完美地` 支持以下几种 `渲染器`：

  - Markdown
  - Highlightjs/Prism
  - Mathjax/Katex
  - Mermaid

 

  > WordPress的 `Gutenberg Editor` 是很糟糕的，甚至远远差于 `Classic Editor`。
  >
  > 它的语言是 `Rich Text`，或者说，它根本没有一种适合写作的语言。
  >
  > 当你使用它的时候，你更像是在做 `设计 (Design)` 工作，而不是单纯的 `写作 (Writing)` 。
  >
  > 总之，富文本很难使用，而且难以协调。
  >
  > > 当然，WordPress也可以安装第三方的渲染插件，比如 `Markdown插件`。
  > >
  > > 但是我要说的是，直到2023年，WordPress还没有一个 `能用的Markdown插件`。
  > >
  > > 更致命的是，如果你选择在 `WordPress的后台页面` 通过 `Live Preview` 来书写 Markdown，那么神奇的事情会发生在 `草稿被发布之后`：你将看到由于 `前后台CSS样式的不一致性`，导致 `渲染结果` 错乱。
  > >
  > > 可以说，WordPress从来没有考虑过打造一个更舒适的写作环境。
  > >
  > > > Hexo在尝试打造一个更舒适的写作环境，但 `失败` 了。
  > > >
  > > > > 尽管经过多年的发展，Hexo的 `renders` 仍然存在一些问题：
  > > > >
  > > > > - 因为调用 `syntax render` 与渲染引擎存在的冲突，无法正确识别 `blockquote` 中的代码。（你必须手动实现。）
  > > > >
  > > > > - 因为模板引擎的原因，你甚至会因为一些在文章中输入`{% raw %} {# {% endraw %} `而直接引发整个渲染系统的悄无声息的崩溃。
  > > > >
  > > > >   > 当你使用 `Mathjax` 进行书写 `macro` 的时候，你就可以很自然地发现这个问题。（使用繁琐转义语法可以解决）
  > > > >
  > > > > - 采用 `hexo-renderer-marked` 导致 `mathjax` 必须用 `\\\\` 才能实现换行。
  > > > > - `extented-tag` 使用繁琐，无法保证与本地Markdown编辑器的一致性。
  > > > > - ...



目前为止，我所发现的在WordPress上 `完美` 实现 `Markdown` 写作的方式是：自定义CSS + Typora导出为HTML代码进行嵌入

对于 Hexo 来说，可以自行通过引用 `CSS` + `JS` 的方式，来实现自己喜欢的 `render`



### 阅读

我更倾向于选择 `minimalism theme`，前端所展示的界面应当只有 `article container` 和 `comment container`。

此外，再加上 `toc` 功能和一些必要的 `跳转链接` 即可。

![image-20230125141549951](https://s2.loli.net/2023/01/25/mCrvBHM68IQGwN1.png)

### 评论

评论系统必须基于 `Github Issue/Discussion`，以便将所有的数据存放在 `Github Repository` 之中。

没有任何理由选择 **某些** 要求 `实名认证信息` 甚至 `人脸识别数据` 的 评论系统。

> 在 `后互联网时代`，`每个人` 都应该有属于自己的 `Github` 账号。

`markdown` 和 `syntax` 的 `style` 均复刻 `github style`，实现一致性。

![image-20230125141805248](https://s2.loli.net/2023/01/25/6kGMenzcrhUBIJx.png)

### 过滤器

#### 搜索

基于 `本地搜索`，提供按 `keyword` 查询的能力。

#### 标签

通过 `tag` 来分类文章。（`category` 的功能和 `tag` 重复了，并且可以被后者所替代。）

## 截图

![image-20230125140808447](https://s2.loli.net/2023/01/25/f1u4Ckpw2SrQmPo.png)

![image-20230125140749365](https://s2.loli.net/2023/01/25/eaRkUsD74CMYfHI.png)
