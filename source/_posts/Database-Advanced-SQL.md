---
title: \[Database\] Advanced SQL
date: 2023-01-01 19:46:05
tags:
---

```html
<h1>Advanced SQL</h1>
<div contenteditable="true" spellcheck="false" class="mathjax-block md-end-block md-math-block md-rawblock" id="mathjax-n4" cid="n4" mdtype="math_block" data-math-tag-before="0" data-math-labels="[]" data-math-tag-after="0"><div class="md-rawblock-container md-math-container" contenteditable="false" tabindex="-1"><mjx-container class="MathJax" jax="SVG" display="true" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="2.968ex" height="2.828ex" role="img" focusable="false" viewBox="0 -972 1312 1250" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.629ex;" class="in-text-selection"><defs><path id="MJX-864-TEX-N-40" d="M56 347Q56 429 86 498T164 612T270 680T386 705Q522 705 622 603T722 349Q722 126 608 126Q541 126 513 176Q512 177 512 179T510 182L509 183Q508 183 503 177T487 163T464 146T429 132T385 126Q311 126 251 186T190 347Q190 448 251 508T385 568Q426 568 460 548T509 511T531 479H555Q580 479 582 478Q586 477 587 468Q588 454 588 338V260Q588 200 593 182T619 163Q641 163 655 178T674 223T680 273T682 325V330Q682 426 647 500Q611 569 544 618T388 668Q271 668 184 577T96 347Q96 216 180 121T396 26Q421 26 446 28T493 34T535 43T573 52T605 63T629 72T647 80T657 84H716Q722 78 722 74Q722 65 675 45T547 7T392 -11Q255 -11 156 90T56 347ZM274 347Q274 266 308 214T390 162Q420 162 449 182T498 235L504 245V449L498 459Q453 532 387 532Q347 532 311 483T274 347Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="menclose"><g transform="translate(267, 0)"><g data-mml-node="mstyle"><g data-mml-node="TeXAtom" data-mjx-texclass="ORD"><g data-mml-node="TeXAtom" data-mjx-texclass="ORD"><g data-mml-node="mo"><use data-c="40" xlink:href="#MJX-864-TEX-N-40"></use></g></g></g></g></g><rect x="33.5" y="-244.5" width="1245" height="1183" fill="none" stroke-width="67"></rect></g></g></g></svg></mjx-container></div></div>
<h2>Access DB From PL</h2>
<p>通过 <code>编程语言 (Programming Language)</code>  <code>访问</code> <code>数据库</code> 的方式：</p>
<ul>
<li><p><code>动态SQL</code>：使用 <code>数据库API</code> 来连接 <code>数据库</code></p>
<ul>
<li>JDBC</li>
<li>ODBC</li>
<li>ADO.NET</li>

</ul>
</li>
<li><p><code>嵌入式SQL</code>：可以将 <code>SQL语句</code> 嵌入到 <code>宿主语言</code> 中，通过 <code>预处理器</code> 对 <code>嵌入宿主语言的SQL</code> 进行 <code>转化</code>。</p>
</li>

</ul>
<hr>
<p>这里简单地讨论几点 <code>JDBC</code> 的内容。</p>
<ul>
<li><p>主要涉及的对象：<code>Connection</code>，<code>Statement</code>，<code>ResultSet</code></p>
</li>
<li><p><code>JDBC</code> 并不是仅仅支持 <code>MySQL</code> 的，它可以 <code>指定</code> 用于 <code>建立数据库连接</code> 的 <code>数据库通信的API</code>：如 <code>jdbc:mysql</code>，<code>jdbc:oracle</code> 等来连接 <code>多种类型的数据库</code></p>
<blockquote><p>更准确地说，<code>JDBC</code> 仅 <code>指定通信所用的API</code>，而不是 <code>指定通信所用的协议</code>。因为一个<code>JDBC驱动器</code> 可能同时支持 <code>多种数据库通信协议</code></p>
</blockquote>
</li>

</ul>
<ul>
<li><code>Statement</code> 并不是 <code>SQL语句对象</code>本身，但可以用 <code>Statement</code> 来 <code>执行语句</code></li>
<li>使用 <code>PreparedStatement</code> 而不是 <code>拼接字符串的方式</code> 来 <code>构造SQL语句</code>！</li>
<li><code>数据库</code> 返回的 <code>ResultSet</code> 不仅仅包含 <code>元组数据</code>，还包含许多 <code>元数据</code>。在需要时使用 <code>ResultSet#getMetaData</code> 获得 <code>元数据</code>，而不是 <code>硬编码</code> 它们！</li>
<li>对 <code>Updatable Result Set</code> 的 <code>修改性操作</code> 会 <code>反映到数据库</code></li>
<li>如果需要将 <code>接下来的多条SQL语句作为事务</code>，而不是 <code>每条语句都被视为独立的事务</code>，则请用 <code>Connection#setAutoCommit(false)</code></li>

</ul>
<p>&nbsp;</p>
<h2>Function and Procedure</h2>
<p><code>函数 (Function)</code> 和 <code>过程 (Procedure)</code> 允许 <code>业务逻辑</code> 作为 <code>存储过程</code> 记录在 <code>数据中</code>。</p>
<p>这使得 <code>业务逻辑代码</code> 是 <code>编程语言独立</code> 和 <code>应用独立</code> 的。</p>
<h3>Function</h3>
<ul>
<li>一个简单的 <code>函数</code> 的例子</li>

</ul>
<pre><code class="language-sql" lang="sql">CREATE FUNCTION dept_count(dept_name varchar(20)) RETURNS integer
BEGIN
    DECLARE d_count integer
    SELECT count(*) INTO d_count
    FROM instructor
    WHERE instructor.dept_name = dept_name
    RETURN d_count
END
</code></pre>
<ul>
<li><code>带参数的视图 (Parameterized View)</code></li>

</ul>
<pre><code class="language-sql" lang="sql">CREATE FUNCTION instructor_of(dept_name varchar(20)) RETURNS TABLE(ID varchar(5),
                                                                  name varchar(20),
                                                                  dept_name varchar(20),
                                                                  salary numeric(8,2))
RETURN TABLE(SELECT ID, name, dept_name, salary
             FROM instructor
             WHERE instructor.dept_name = instructor_of.dept_name
            );                                                                 
</code></pre>
<p>我们将 <code>这种函数</code> 视为 <code>广义上的视图</code>。</p>
<h3>Procedure</h3>
<blockquote><p>对于 <code>函数 (Function)</code> 和 <code>过程 (Procedure)</code> 如果做 <code>详细区分</code>，则我们这样定义：</p>
<ul>
<li>函数：带有 <code>返回值</code></li>
<li>过程：不带有 <code>返回值</code></li>

</ul>
<p>从 <code>组成体系结构</code> 的角度看，<code>过程</code> 是比 <code>函数</code>  更加 <code>底层的概念</code></p>
</blockquote>
<pre><code class="language-sql" lang="sql">CREATE PROCEDURE dept_count_proc(IN dept_name varchar(20), OUT d_count integer)
BEGIN
    SELECT count(*) INTO d_count
    FROM instructor
    WHERE instructor.dept_name = dept_count_proc.dept_name
END
</code></pre>
<blockquote><p><code>IN</code> 表示 <code>输入参数</code>，而 <code>OUT 表示输出参数</code>。</p>
<p>这种形式的 <code>传参方式</code> 在某些 <code>底层接口调用</code> 中常见。其中 <code>OUT</code> 经常传递的是 <code>指针类型</code>，以便 <code>调用者</code> 可以通过 <code>变量</code> 来 <code>接收</code> 到 <code>过程的结果</code> </p>
</blockquote>
<h3>Persistent Storage Module</h3>
<p><code>持久存储模块 (Persistent Storage Module)</code> ：用于处理 <code>构造</code> </p>
<p>这里不详细讨论 <code>PSM</code> 的 <code>语法</code>，只给出一个 <code>大号的例子</code></p>
<pre><code class="language-sql" lang="sql">DECLARE out_of_classroom_seats CONDITION
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
    
    IF (currEnrol &lt; limit) 
    	BEGIN
    		INSERT INTO takes VALUES (s_id, s_courseid, s_secid, s_semester, s_year, null);
    		RETURN(0);
    	END
    -- capacity overflow !
    SET errorMsg = 'Enrollment limit reached for course' || s_courseid || 'section' || s_secid;
    RETURN(-1);
END    
)
</code></pre>
<h3>External Language Procedure</h3>
<p><code>数据库</code> 可以将 <code>过程</code> 委托给 <code>外部语言程序</code> 来执行，像这样的 <code>过程</code> 称作 <code>外部语言过程</code></p>
<pre><code class="language-sql" lang="sql">CREATE PROCEDURE dept_count_proc(IN dept_name varchar(20), OUT count integer)
LANGUAGE C
EXTERNAL NAME '/usr/avi/bin/dept_course_proc'
</code></pre>
<blockquote><p>如果为了 <code>性能</code> 而将 <code>任务</code> 委托给 <code>C</code> 这样的语言，可能会导致 <code>安全问题</code>。</p>
<p>而如果委托给 <code>Java</code>，<code>C#</code> 这样的语言，通过 <code>进程间通信</code> 和 <code>沙盒执行</code> 则会导致 <code>效率低下</code>。</p>
<p>此外，编写能 <code>正确处理</code> <code>数据库数据</code> 的 <code>外部例程</code> 的 <code>编码量</code> 通常较多。</p>
</blockquote>
<h2>Trigger</h2>
<p><code>触发器 (Trigger)</code>：用于在 <code>数据库</code> 发生 <code>指定事件</code> 时，<code>自动</code> 被 <code>执行的语句</code></p>
<hr>
<pre><code class="language-sql" lang="sql">CREATE TRIGGER credits_earned AFTER UPDATE OF takes ON(grade)
	REFERENCING NEW ROW AS nrow
	REFERENCING OLD ROW AS orow
	FOR EACH ROW
	WHEN nrow.grade &lt;&gt; 'F' AND nrow.grade IS NOT NULL
		AND (orow.grade = 'F' OR orow.grade IS NULL)
	BEGIN ATOMIC
		UPDATE student
		SET tot_cred = tot_cred + 
            (SELECT credits
            FROM course
            WHERE course.course_id = nrow.course_id)
    	WHERE student.id = nrow.id;
    END
</code></pre>
<blockquote><p><code>触发器类型</code>：</p>
<ul>
<li><code>语句级触发器 (FOR EACH STATEMENT)</code>：对于 <code>引起修改的整个SQL语句</code> <code>仅执行1次</code> <code>触发器</code></li>
<li><code>行级触发器 (FOR EACH ROW)</code>：对 <code>每个受影响的行</code> <code>都执行1次</code> <code>触发器</code></li>

</ul>
<p><code>过渡变量 (Transition Variable)</code>：</p>
<ul>
<li><code>REFERENCING OLD ROW AS symbol</code>：存储 <code>已经更新或删除的行的旧值</code></li>
<li><code>REFERENCING NEW ROW AS symbol</code>：可用于 <code>插入</code> 或 <code>删除</code> 的 <code>行的引用</code></li>

</ul>
<p><code>触发时机</code>：</p>
<ul>
<li><code>BEFORE</code>：用于 <code>避免非法更新</code>，<code>附加额外约束</code></li>
<li><code>AFTER</code>：用于 <code>为某些修改做善后处理</code>，<code>维护某些修改性操作的合法性</code></li>

</ul>
</blockquote>
<p>如果可以使用 <code>存储过程</code>  的话，则尽量不要使用 <code>触发器</code>。</p>
<h2>Recursive Query</h2>
<p><code>递归查询 (Recursive Query)</code> 的典型例子是寻找 <code>传递闭包 (Transitive Closure)</code> ，比如 <code>找出某个课程的所有前置课程</code>。</p>
<hr>
<p>寻找 <code>传递闭包</code></p>
<h3> Iteration</h3>
<pre><code class="language-sql" lang="sql">CREATE FUNCTION findAllPrereqs(cid varchar(8))
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
</code></pre>
<h3>Recursion</h3>
<pre><code class="language-sql" lang="sql">-- define recursive query
WITH RECURSIVE rec_prereq(course_id, prereq_id) AS (SELECT course_id, prereq_id
                                                   FROM prereq)
                                                   UNION 
                                                   (SELECT rec_prereq, course_id, prereq.prereq_id
                                                   FROM prereq, rec_prereq
                                                   WHERE prereq.course_id = rec_prereq.prereq_id)
-- call recursive query
SELECT *
FROM rec_prereq;
</code></pre>
<blockquote><p>上述的SQL中，首先通过 <code>基查询</code> 找到 <code>每门课程的先修课程</code>，然后 <code>递归查询</code> 在 <code>每次迭代过程</code> 中 <code>增加一层课程</code>，直到到达 <code>课程-先修课程的最大层次</code>。</p>
</blockquote>
<blockquote><p>通过 <code>FROM子句</code> 对 <code>递归视图 prc_prereq</code> 进行 <code>递归查询</code>。</p>
<p><code>WITH RECURSIVE</code> 用于声明 <code>递归视图</code>，它会使得 <code>递归</code> 在到达 <code>不动点</code> 时 <code>自动被终止</code></p>
</blockquote>
<blockquote><p><code>SQL标准</code> 要求 <code>递归过程</code> 返回的 <code>结果</code> 是 <code>单调递增的</code>，并且最终到达 <code>不动点 (Fixed Point)</code></p>
<blockquote><p>也就是说，每次 <code>递归过程</code> 返回的 <code>结果</code> 必须是 <code>之前的结果的超集</code></p>
</blockquote>
<blockquote><p>只要 <code>递归过程是递增的</code>，就可以使用 <code>迭代过程来定义递归过程</code>。</p>
</blockquote>
</blockquote>
<p>任何的 <code>递归查询 (Recursive Query)</code> = <code>基查询 (Base Query)</code> UNION <code>递归查询 (Recursive Query)</code></p>
<h2>Advanced Aggregate</h2>
<h3>Rank</h3>
<h4>Sparse Rank &amp; Dense Rank</h4>
<ul>
<li><code>rank()</code></li>

</ul>
<pre><code class="language-sql" lang="sql">-- SQL 1
SELECT ID, rank() OVER (ORDER BY (GPA) DESC) AS s_rank
FROM student_grades
ORDER BY 's_rank'
</code></pre>
<blockquote><p>单纯的 <code>rank</code> 并不会对 <code>结果关系中的元组</code> <code>按rank进行排序</code>。</p>
<p>故添加 <code>ORDER BY 's_rank'</code>  来对 <code>结果关系的元组</code> 进行 <code>排序</code></p>
</blockquote>
<blockquote><p>其他类型的 <code>排序函数</code>：<code>percent_rank()</code>，<code>cume_dist()</code>，<code>row_number()</code></p>
</blockquote>
<blockquote><p>关于 <code>空值</code> 的处理，可以设置策略：<code>NULL FIRST</code> 或 <code>NULL LAST</code></p>
<pre><code class="language-sql" lang="sql">SELECT ID, rank() OVER (ORDER BY (GPA) DESC NULL LAST) AS s_rank
FROM student_grades
ORDER BY 's_rank'
</code></pre>
</blockquote>
<p><mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="14.859ex" height="2.034ex" role="img" focusable="false" viewBox="0 -705 6567.6 899" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.439ex;"><defs><path id="MJX-874-TEX-I-1D446" d="M308 24Q367 24 416 76T466 197Q466 260 414 284Q308 311 278 321T236 341Q176 383 176 462Q176 523 208 573T273 648Q302 673 343 688T407 704H418H425Q521 704 564 640Q565 640 577 653T603 682T623 704Q624 704 627 704T632 705Q645 705 645 698T617 577T585 459T569 456Q549 456 549 465Q549 471 550 475Q550 478 551 494T553 520Q553 554 544 579T526 616T501 641Q465 662 419 662Q362 662 313 616T263 510Q263 480 278 458T319 427Q323 425 389 408T456 390Q490 379 522 342T554 242Q554 216 546 186Q541 164 528 137T492 78T426 18T332 -20Q320 -22 298 -22Q199 -22 144 33L134 44L106 13Q83 -14 78 -18T65 -22Q52 -22 52 -14Q52 -11 110 221Q112 227 130 227H143Q149 221 149 216Q149 214 148 207T144 186T142 153Q144 114 160 87T203 47T255 29T308 24Z"></path><path id="MJX-874-TEX-I-1D444" d="M399 -80Q399 -47 400 -30T402 -11V-7L387 -11Q341 -22 303 -22Q208 -22 138 35T51 201Q50 209 50 244Q50 346 98 438T227 601Q351 704 476 704Q514 704 524 703Q621 689 680 617T740 435Q740 255 592 107Q529 47 461 16L444 8V3Q444 2 449 -24T470 -66T516 -82Q551 -82 583 -60T625 -3Q631 11 638 11Q647 11 649 2Q649 -6 639 -34T611 -100T557 -165T481 -194Q399 -194 399 -87V-80ZM636 468Q636 523 621 564T580 625T530 655T477 665Q429 665 379 640Q277 591 215 464T153 216Q153 110 207 59Q231 38 236 38V46Q236 86 269 120T347 155Q372 155 390 144T417 114T429 82T435 55L448 64Q512 108 557 185T619 334T636 468ZM314 18Q362 18 404 39L403 49Q399 104 366 115Q354 117 347 117Q344 117 341 117T337 118Q317 118 296 98T274 52Q274 18 314 18Z"></path><path id="MJX-874-TEX-I-1D43F" d="M228 637Q194 637 192 641Q191 643 191 649Q191 673 202 682Q204 683 217 683Q271 680 344 680Q485 680 506 683H518Q524 677 524 674T522 656Q517 641 513 637H475Q406 636 394 628Q387 624 380 600T313 336Q297 271 279 198T252 88L243 52Q243 48 252 48T311 46H328Q360 46 379 47T428 54T478 72T522 106T564 161Q580 191 594 228T611 270Q616 273 628 273H641Q647 264 647 262T627 203T583 83T557 9Q555 4 553 3T537 0T494 -1Q483 -1 418 -1T294 0H116Q32 0 32 10Q32 17 34 24Q39 43 44 45Q48 46 59 46H65Q92 46 125 49Q139 52 144 61Q147 65 216 339T285 628Q285 635 228 637Z"></path><path id="MJX-874-TEX-N-31" d="M213 578L200 573Q186 568 160 563T102 556H83V602H102Q149 604 189 617T245 641T273 663Q275 666 285 666Q294 666 302 660V361L303 61Q310 54 315 52T339 48T401 46H427V0H416Q395 3 257 3Q121 3 100 0H88V46H114Q136 46 152 46T177 47T193 50T201 52T207 57T213 61V578Z"></path><path id="MJX-874-TEX-N-3D" d="M56 347Q56 360 70 367H707Q722 359 722 347Q722 336 708 328L390 327H72Q56 332 56 347ZM56 153Q56 168 72 173H708Q722 163 722 153Q722 140 707 133H70Q56 140 56 153Z"></path><path id="MJX-874-TEX-N-32" d="M109 429Q82 429 66 447T50 491Q50 562 103 614T235 666Q326 666 387 610T449 465Q449 422 429 383T381 315T301 241Q265 210 201 149L142 93L218 92Q375 92 385 97Q392 99 409 186V189H449V186Q448 183 436 95T421 3V0H50V19V31Q50 38 56 46T86 81Q115 113 136 137Q145 147 170 174T204 211T233 244T261 278T284 308T305 340T320 369T333 401T340 431T343 464Q343 527 309 573T212 619Q179 619 154 602T119 569T109 550Q109 549 114 549Q132 549 151 535T170 489Q170 464 154 447T109 429Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mi"><use data-c="1D446" xlink:href="#MJX-874-TEX-I-1D446"></use></g><g data-mml-node="mi" transform="translate(645,0)"><use data-c="1D444" xlink:href="#MJX-874-TEX-I-1D444"></use></g><g data-mml-node="mi" transform="translate(1436,0)"><use data-c="1D43F" xlink:href="#MJX-874-TEX-I-1D43F"></use></g><g data-mml-node="mn" transform="translate(2117,0)"><use data-c="31" xlink:href="#MJX-874-TEX-N-31"></use></g><g data-mml-node="mo" transform="translate(2894.8,0)"><use data-c="3D" xlink:href="#MJX-874-TEX-N-3D"></use></g><g data-mml-node="mi" transform="translate(3950.6,0)"><use data-c="1D446" xlink:href="#MJX-874-TEX-I-1D446"></use></g><g data-mml-node="mi" transform="translate(4595.6,0)"><use data-c="1D444" xlink:href="#MJX-874-TEX-I-1D444"></use></g><g data-mml-node="mi" transform="translate(5386.6,0)"><use data-c="1D43F" xlink:href="#MJX-874-TEX-I-1D43F"></use></g><g data-mml-node="mn" transform="translate(6067.6,0)"><use data-c="32" xlink:href="#MJX-874-TEX-N-32"></use></g></g></g></svg></mjx-container><script type="math/tex">SQL 1 = SQL 2</script></p>
<pre><code class="language-sql" lang="sql">-- SQL 2
SELECT ID, (1 + (SELECT count(*)
                FROM student_grades B
                WHERE B.GPA &gt; A.GPA)) AS s_rank
FROM student_grades A
ORDER BY s_rank
</code></pre>
<ul>
<li><code>dense_rank()</code></li>

</ul>
<p><code>rank()</code> 产生的 <code>排名</code> 是 <code>间断的</code>：如果 <code>分数最高的人</code> 有2人，则 <code>这两个人的排名</code> 均为 <code>1</code>，但 <code>分数次高的人</code> 的 <code>排名</code> 则为 <code>3</code></p>
<p>相反的，如果使用 <code>dense_rank()</code>，则产生 <code>不间断</code> 的 <code>排名</code>：<code>分数最高的两人</code> 排名均为 <code>1</code>，但 <code>分数次高的人</code> 的 <code>排名</code> 则为 <code>2</code></p>
<pre><code class="language-sql" lang="sql">-- SQL 3
SELECT ID, dense_rank() OVER (ORDER BY (GPA) DESC) AS s_rank
FROM student_grades
ORDER BY 's_rank'
</code></pre>
<h4>  Partition before Rank</h4>
<pre><code class="language-sql" lang="sql">-- SQL 4
SELECT ID, dept_name, rank() OVER (PARTITION BY dept_name ORDER BY GPA DESC) AS DEPT_RANK
FROM dept_grades
ORDER BY dept_name, dept_rank;
</code></pre>
<blockquote><p>当存在 <code>GROUP BY</code> 时， <code>PARTION</code> 在 <code>GROUP BY</code> 之后执行。</p>
</blockquote>
<blockquote><p>可以认为，如果在 <code>聚集</code> 时没有 <code>显示地指定 PARTITION</code>，则认为 <code>将所有的集合</code> 分为 <code>唯一的一个分区</code></p>
</blockquote>
<h4>Grading</h4>
<p> <code>ntile(n)</code> 按 <code>给定顺序</code> 取得 <code>每个分区 (Partion) 中的元组</code>，然后将 <code>元组</code> 分成 <code>n个具有相同元组数目的桶</code></p>
<pre><code class="language-sql" lang="sql">SELECT ID, ntile(4) OVER (ORDER BY (GPA DESC)) AS quartile
FROM student_grades;
</code></pre>
<p> 可用于构造 <code>百分比直方图</code></p>
<h3>Window Query</h3>
<p><code>窗口查询</code>：可用于对 <code>一定范围内的元组</code> 进行 <code>聚集</code></p>
<blockquote><p>不同于 <code>分区查询</code> 中的 <code>1个元组</code> 只对 <code>1个分区 (Partion)</code> 有贡献，<code>分窗查询</code> 中的 <code>窗口 (Window)</code> 是可以 <code>重叠的</code>。</p>
</blockquote>
<pre><code class="language-sql" lang="sql">SELECT year, avg(num_credits) OVER(ORDER BY year ROWS 3 PRECEDING) AS avg_total_credits
FROM tot_credits;
</code></pre>
<blockquote><p>n.b. 如果 <code>某个年份的元组</code> 具有 <code>多个</code>，则 <code>为某个年份到底选择哪个元组</code> 将 <code>取决于具体实现</code>。</p>
</blockquote>
<blockquote><p><code>窗口</code> 的大小界定参数：</p>
<ul>
<li><code>ROWS n PRECEDING/FOLLOWING</code></li>
<li><code>ROWS UNBOUNDED PRECEDING/FOLLOWING</code></li>
<li><code>ROWS BETWEEN a PRECEEDING AND b FOLLOWING</code></li>
<li><code>RANGE BETWEEN a AND b</code></li>

</ul>
</blockquote>
<p>&nbsp;</p>
<h2>OLAP</h2>
<h3>Introduction</h3>
<p><code>联机分析处理 (OLAP)</code> 是一个 <code>交互式系统</code>，允许 <code>分析人员</code> 查看 <code>多维数据</code> 的 <code>不同种类的汇总数据</code></p>
<hr>
<p>假如我们有 <code>模式</code> <mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="46.536ex" height="2.262ex" role="img" focusable="false" viewBox="0 -750 20569 1000" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.566ex;" class="in-text-selection"><defs><path id="MJX-920-TEX-I-1D460" d="M131 289Q131 321 147 354T203 415T300 442Q362 442 390 415T419 355Q419 323 402 308T364 292Q351 292 340 300T328 326Q328 342 337 354T354 372T367 378Q368 378 368 379Q368 382 361 388T336 399T297 405Q249 405 227 379T204 326Q204 301 223 291T278 274T330 259Q396 230 396 163Q396 135 385 107T352 51T289 7T195 -10Q118 -10 86 19T53 87Q53 126 74 143T118 160Q133 160 146 151T160 120Q160 94 142 76T111 58Q109 57 108 57T107 55Q108 52 115 47T146 34T201 27Q237 27 263 38T301 66T318 97T323 122Q323 150 302 164T254 181T195 196T148 231Q131 256 131 289Z"></path><path id="MJX-920-TEX-I-1D44E" d="M33 157Q33 258 109 349T280 441Q331 441 370 392Q386 422 416 422Q429 422 439 414T449 394Q449 381 412 234T374 68Q374 43 381 35T402 26Q411 27 422 35Q443 55 463 131Q469 151 473 152Q475 153 483 153H487Q506 153 506 144Q506 138 501 117T481 63T449 13Q436 0 417 -8Q409 -10 393 -10Q359 -10 336 5T306 36L300 51Q299 52 296 50Q294 48 292 46Q233 -10 172 -10Q117 -10 75 30T33 157ZM351 328Q351 334 346 350T323 385T277 405Q242 405 210 374T160 293Q131 214 119 129Q119 126 119 118T118 106Q118 61 136 44T179 26Q217 26 254 59T298 110Q300 114 325 217T351 328Z"></path><path id="MJX-920-TEX-I-1D459" d="M117 59Q117 26 142 26Q179 26 205 131Q211 151 215 152Q217 153 225 153H229Q238 153 241 153T246 151T248 144Q247 138 245 128T234 90T214 43T183 6T137 -11Q101 -11 70 11T38 85Q38 97 39 102L104 360Q167 615 167 623Q167 626 166 628T162 632T157 634T149 635T141 636T132 637T122 637Q112 637 109 637T101 638T95 641T94 647Q94 649 96 661Q101 680 107 682T179 688Q194 689 213 690T243 693T254 694Q266 694 266 686Q266 675 193 386T118 83Q118 81 118 75T117 65V59Z"></path><path id="MJX-920-TEX-I-1D452" d="M39 168Q39 225 58 272T107 350T174 402T244 433T307 442H310Q355 442 388 420T421 355Q421 265 310 237Q261 224 176 223Q139 223 138 221Q138 219 132 186T125 128Q125 81 146 54T209 26T302 45T394 111Q403 121 406 121Q410 121 419 112T429 98T420 82T390 55T344 24T281 -1T205 -11Q126 -11 83 42T39 168ZM373 353Q367 405 305 405Q272 405 244 391T199 357T170 316T154 280T149 261Q149 260 169 260Q282 260 327 284T373 353Z"></path><path id="MJX-920-TEX-N-28" d="M94 250Q94 319 104 381T127 488T164 576T202 643T244 695T277 729T302 750H315H319Q333 750 333 741Q333 738 316 720T275 667T226 581T184 443T167 250T184 58T225 -81T274 -167T316 -220T333 -241Q333 -250 318 -250H315H302L274 -226Q180 -141 137 -14T94 250Z"></path><path id="MJX-920-TEX-I-1D456" d="M184 600Q184 624 203 642T247 661Q265 661 277 649T290 619Q290 596 270 577T226 557Q211 557 198 567T184 600ZM21 287Q21 295 30 318T54 369T98 420T158 442Q197 442 223 419T250 357Q250 340 236 301T196 196T154 83Q149 61 149 51Q149 26 166 26Q175 26 185 29T208 43T235 78T260 137Q263 149 265 151T282 153Q302 153 302 143Q302 135 293 112T268 61T223 11T161 -11Q129 -11 102 10T74 74Q74 91 79 106T122 220Q160 321 166 341T173 380Q173 404 156 404H154Q124 404 99 371T61 287Q60 286 59 284T58 281T56 279T53 278T49 278T41 278H27Q21 284 21 287Z"></path><path id="MJX-920-TEX-I-1D461" d="M26 385Q19 392 19 395Q19 399 22 411T27 425Q29 430 36 430T87 431H140L159 511Q162 522 166 540T173 566T179 586T187 603T197 615T211 624T229 626Q247 625 254 615T261 596Q261 589 252 549T232 470L222 433Q222 431 272 431H323Q330 424 330 420Q330 398 317 385H210L174 240Q135 80 135 68Q135 26 162 26Q197 26 230 60T283 144Q285 150 288 151T303 153H307Q322 153 322 145Q322 142 319 133Q314 117 301 95T267 48T216 6T155 -11Q125 -11 98 4T59 56Q57 64 57 83V101L92 241Q127 382 128 383Q128 385 77 385H26Z"></path><path id="MJX-920-TEX-I-1D45A" d="M21 287Q22 293 24 303T36 341T56 388T88 425T132 442T175 435T205 417T221 395T229 376L231 369Q231 367 232 367L243 378Q303 442 384 442Q401 442 415 440T441 433T460 423T475 411T485 398T493 385T497 373T500 364T502 357L510 367Q573 442 659 442Q713 442 746 415T780 336Q780 285 742 178T704 50Q705 36 709 31T724 26Q752 26 776 56T815 138Q818 149 821 151T837 153Q857 153 857 145Q857 144 853 130Q845 101 831 73T785 17T716 -10Q669 -10 648 17T627 73Q627 92 663 193T700 345Q700 404 656 404H651Q565 404 506 303L499 291L466 157Q433 26 428 16Q415 -11 385 -11Q372 -11 364 -4T353 8T350 18Q350 29 384 161L420 307Q423 322 423 345Q423 404 379 404H374Q288 404 229 303L222 291L189 157Q156 26 151 16Q138 -11 108 -11Q95 -11 87 -5T76 7T74 17Q74 30 112 181Q151 335 151 342Q154 357 154 369Q154 405 129 405Q107 405 92 377T69 316T57 280Q55 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-920-TEX-N-5F" d="M0 -62V-25H499V-62H0Z"></path><path id="MJX-920-TEX-I-1D45B" d="M21 287Q22 293 24 303T36 341T56 388T89 425T135 442Q171 442 195 424T225 390T231 369Q231 367 232 367L243 378Q304 442 382 442Q436 442 469 415T503 336T465 179T427 52Q427 26 444 26Q450 26 453 27Q482 32 505 65T540 145Q542 153 560 153Q580 153 580 145Q580 144 576 130Q568 101 554 73T508 17T439 -10Q392 -10 371 17T350 73Q350 92 386 193T423 345Q423 404 379 404H374Q288 404 229 303L222 291L189 157Q156 26 151 16Q138 -11 108 -11Q95 -11 87 -5T76 7T74 17Q74 30 112 180T152 343Q153 348 153 366Q153 405 129 405Q91 405 66 305Q60 285 60 284Q58 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-920-TEX-N-2C" d="M78 35T78 60T94 103T137 121Q165 121 187 96T210 8Q210 -27 201 -60T180 -117T154 -158T130 -185T117 -194Q113 -194 104 -185T95 -172Q95 -168 106 -156T131 -126T157 -76T173 -3V9L172 8Q170 7 167 6T161 3T152 1T140 0Q113 0 96 17Z"></path><path id="MJX-920-TEX-I-1D450" d="M34 159Q34 268 120 355T306 442Q362 442 394 418T427 355Q427 326 408 306T360 285Q341 285 330 295T319 325T330 359T352 380T366 386H367Q367 388 361 392T340 400T306 404Q276 404 249 390Q228 381 206 359Q162 315 142 235T121 119Q121 73 147 50Q169 26 205 26H209Q321 26 394 111Q403 121 406 121Q410 121 419 112T429 98T420 83T391 55T346 25T282 0T202 -11Q127 -11 81 37T34 159Z"></path><path id="MJX-920-TEX-I-1D45C" d="M201 -11Q126 -11 80 38T34 156Q34 221 64 279T146 380Q222 441 301 441Q333 441 341 440Q354 437 367 433T402 417T438 387T464 338T476 268Q476 161 390 75T201 -11ZM121 120Q121 70 147 48T206 26Q250 26 289 58T351 142Q360 163 374 216T388 308Q388 352 370 375Q346 405 306 405Q243 405 195 347Q158 303 140 230T121 120Z"></path><path id="MJX-920-TEX-I-1D45F" d="M21 287Q22 290 23 295T28 317T38 348T53 381T73 411T99 433T132 442Q161 442 183 430T214 408T225 388Q227 382 228 382T236 389Q284 441 347 441H350Q398 441 422 400Q430 381 430 363Q430 333 417 315T391 292T366 288Q346 288 334 299T322 328Q322 376 378 392Q356 405 342 405Q286 405 239 331Q229 315 224 298T190 165Q156 25 151 16Q138 -11 108 -11Q95 -11 87 -5T76 7T74 17Q74 30 114 189T154 366Q154 405 128 405Q107 405 92 377T68 316T57 280Q55 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-920-TEX-I-210E" d="M137 683Q138 683 209 688T282 694Q294 694 294 685Q294 674 258 534Q220 386 220 383Q220 381 227 388Q288 442 357 442Q411 442 444 415T478 336Q478 285 440 178T402 50Q403 36 407 31T422 26Q450 26 474 56T513 138Q516 149 519 151T535 153Q555 153 555 145Q555 144 551 130Q535 71 500 33Q466 -10 419 -10H414Q367 -10 346 17T325 74Q325 90 361 192T398 345Q398 404 354 404H349Q266 404 205 306L198 293L164 158Q132 28 127 16Q114 -11 83 -11Q69 -11 59 -2T48 16Q48 30 121 320L195 616Q195 629 188 632T149 637H128Q122 643 122 645T124 664Q129 683 137 683Z"></path><path id="MJX-920-TEX-I-1D467" d="M347 338Q337 338 294 349T231 360Q211 360 197 356T174 346T162 335T155 324L153 320Q150 317 138 317Q117 317 117 325Q117 330 120 339Q133 378 163 406T229 440Q241 442 246 442Q271 442 291 425T329 392T367 375Q389 375 411 408T434 441Q435 442 449 442H462Q468 436 468 434Q468 430 463 420T449 399T432 377T418 358L411 349Q368 298 275 214T160 106L148 94L163 93Q185 93 227 82T290 71Q328 71 360 90T402 140Q406 149 409 151T424 153Q443 153 443 143Q443 138 442 134Q425 72 376 31T278 -11Q252 -11 232 6T193 40T155 57Q111 57 76 -3Q70 -11 59 -11H54H41Q35 -5 35 -2Q35 13 93 84Q132 129 225 214T340 322Q352 338 347 338Z"></path><path id="MJX-920-TEX-I-1D45E" d="M33 157Q33 258 109 349T280 441Q340 441 372 389Q373 390 377 395T388 406T404 418Q438 442 450 442Q454 442 457 439T460 434Q460 425 391 149Q320 -135 320 -139Q320 -147 365 -148H390Q396 -156 396 -157T393 -175Q389 -188 383 -194H370Q339 -192 262 -192Q234 -192 211 -192T174 -192T157 -193Q143 -193 143 -185Q143 -182 145 -170Q149 -154 152 -151T172 -148Q220 -148 230 -141Q238 -136 258 -53T279 32Q279 33 272 29Q224 -10 172 -10Q117 -10 75 30T33 157ZM352 326Q329 405 277 405Q242 405 210 374T160 293Q131 214 119 129Q119 126 119 118T118 106Q118 61 136 44T179 26Q233 26 290 98L298 109L352 326Z"></path><path id="MJX-920-TEX-I-1D462" d="M21 287Q21 295 30 318T55 370T99 420T158 442Q204 442 227 417T250 358Q250 340 216 246T182 105Q182 62 196 45T238 27T291 44T328 78L339 95Q341 99 377 247Q407 367 413 387T427 416Q444 431 463 431Q480 431 488 421T496 402L420 84Q419 79 419 68Q419 43 426 35T447 26Q469 29 482 57T512 145Q514 153 532 153Q551 153 551 144Q550 139 549 130T540 98T523 55T498 17T462 -8Q454 -10 438 -10Q372 -10 347 46Q345 45 336 36T318 21T296 6T267 -6T233 -11Q189 -11 155 7Q103 38 103 113Q103 170 138 262T173 379Q173 380 173 381Q173 390 173 393T169 400T158 404H154Q131 404 112 385T82 344T65 302T57 280Q55 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-920-TEX-I-1D466" d="M21 287Q21 301 36 335T84 406T158 442Q199 442 224 419T250 355Q248 336 247 334Q247 331 231 288T198 191T182 105Q182 62 196 45T238 27Q261 27 281 38T312 61T339 94Q339 95 344 114T358 173T377 247Q415 397 419 404Q432 431 462 431Q475 431 483 424T494 412T496 403Q496 390 447 193T391 -23Q363 -106 294 -155T156 -205Q111 -205 77 -183T43 -117Q43 -95 50 -80T69 -58T89 -48T106 -45Q150 -45 150 -87Q150 -107 138 -122T115 -142T102 -147L99 -148Q101 -153 118 -160T152 -167H160Q177 -167 186 -165Q219 -156 247 -127T290 -65T313 -9T321 21L315 17Q309 13 296 6T270 -6Q250 -11 231 -11Q185 -11 150 11T104 82Q103 89 103 113Q103 170 138 262T173 379Q173 380 173 381Q173 390 173 393T169 400T158 404H154Q131 404 112 385T82 344T65 302T57 280Q55 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-920-TEX-N-29" d="M60 749L64 750Q69 750 74 750H86L114 726Q208 641 251 514T294 250Q294 182 284 119T261 12T224 -76T186 -143T145 -194T113 -227T90 -246Q87 -249 86 -250H74Q66 -250 63 -250T58 -247T55 -238Q56 -237 66 -225Q221 -64 221 250T66 725Q56 737 55 738Q55 746 60 749Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mi"><use data-c="1D460" xlink:href="#MJX-920-TEX-I-1D460"></use></g><g data-mml-node="mi" transform="translate(469,0)"><use data-c="1D44E" xlink:href="#MJX-920-TEX-I-1D44E"></use></g><g data-mml-node="mi" transform="translate(998,0)"><use data-c="1D459" xlink:href="#MJX-920-TEX-I-1D459"></use></g><g data-mml-node="mi" transform="translate(1296,0)"><use data-c="1D452" xlink:href="#MJX-920-TEX-I-1D452"></use></g><g data-mml-node="mi" transform="translate(1762,0)"><use data-c="1D460" xlink:href="#MJX-920-TEX-I-1D460"></use></g><g data-mml-node="mo" transform="translate(2231,0)"><use data-c="28" xlink:href="#MJX-920-TEX-N-28"></use></g><g data-mml-node="mi" transform="translate(2620,0)"><use data-c="1D456" xlink:href="#MJX-920-TEX-I-1D456"></use></g><g data-mml-node="mi" transform="translate(2965,0)"><use data-c="1D461" xlink:href="#MJX-920-TEX-I-1D461"></use></g><g data-mml-node="mi" transform="translate(3326,0)"><use data-c="1D452" xlink:href="#MJX-920-TEX-I-1D452"></use></g><g data-mml-node="mi" transform="translate(3792,0)"><use data-c="1D45A" xlink:href="#MJX-920-TEX-I-1D45A"></use></g><g data-mml-node="mi" transform="translate(4670,0)"><use data-c="5F" xlink:href="#MJX-920-TEX-N-5F"></use></g><g data-mml-node="mi" transform="translate(5170,0)"><use data-c="1D45B" xlink:href="#MJX-920-TEX-I-1D45B"></use></g><g data-mml-node="mi" transform="translate(5770,0)"><use data-c="1D44E" xlink:href="#MJX-920-TEX-I-1D44E"></use></g><g data-mml-node="mi" transform="translate(6299,0)"><use data-c="1D45A" xlink:href="#MJX-920-TEX-I-1D45A"></use></g><g data-mml-node="mi" transform="translate(7177,0)"><use data-c="1D452" xlink:href="#MJX-920-TEX-I-1D452"></use></g><g data-mml-node="mo" transform="translate(7643,0)"><use data-c="2C" xlink:href="#MJX-920-TEX-N-2C"></use></g><g data-mml-node="mi" transform="translate(8087.7,0)"><use data-c="1D450" xlink:href="#MJX-920-TEX-I-1D450"></use></g><g data-mml-node="mi" transform="translate(8520.7,0)"><use data-c="1D45C" xlink:href="#MJX-920-TEX-I-1D45C"></use></g><g data-mml-node="mi" transform="translate(9005.7,0)"><use data-c="1D459" xlink:href="#MJX-920-TEX-I-1D459"></use></g><g data-mml-node="mi" transform="translate(9303.7,0)"><use data-c="1D45C" xlink:href="#MJX-920-TEX-I-1D45C"></use></g><g data-mml-node="mi" transform="translate(9788.7,0)"><use data-c="1D45F" xlink:href="#MJX-920-TEX-I-1D45F"></use></g><g data-mml-node="mo" transform="translate(10239.7,0)"><use data-c="2C" xlink:href="#MJX-920-TEX-N-2C"></use></g><g data-mml-node="mi" transform="translate(10684.3,0)"><use data-c="1D450" xlink:href="#MJX-920-TEX-I-1D450"></use></g><g data-mml-node="mi" transform="translate(11117.3,0)"><use data-c="1D459" xlink:href="#MJX-920-TEX-I-1D459"></use></g><g data-mml-node="mi" transform="translate(11415.3,0)"><use data-c="1D45C" xlink:href="#MJX-920-TEX-I-1D45C"></use></g><g data-mml-node="mi" transform="translate(11900.3,0)"><use data-c="1D461" xlink:href="#MJX-920-TEX-I-1D461"></use></g><g data-mml-node="mi" transform="translate(12261.3,0)"><use data-c="210E" xlink:href="#MJX-920-TEX-I-210E"></use></g><g data-mml-node="mi" transform="translate(12837.3,0)"><use data-c="1D452" xlink:href="#MJX-920-TEX-I-1D452"></use></g><g data-mml-node="mi" transform="translate(13303.3,0)"><use data-c="1D460" xlink:href="#MJX-920-TEX-I-1D460"></use></g><g data-mml-node="mi" transform="translate(13772.3,0)"><use data-c="5F" xlink:href="#MJX-920-TEX-N-5F"></use></g><g data-mml-node="mi" transform="translate(14272.3,0)"><use data-c="1D460" xlink:href="#MJX-920-TEX-I-1D460"></use></g><g data-mml-node="mi" transform="translate(14741.3,0)"><use data-c="1D456" xlink:href="#MJX-920-TEX-I-1D456"></use></g><g data-mml-node="mi" transform="translate(15086.3,0)"><use data-c="1D467" xlink:href="#MJX-920-TEX-I-1D467"></use></g><g data-mml-node="mi" transform="translate(15551.3,0)"><use data-c="1D452" xlink:href="#MJX-920-TEX-I-1D452"></use></g><g data-mml-node="mo" transform="translate(16017.3,0)"><use data-c="2C" xlink:href="#MJX-920-TEX-N-2C"></use></g><g data-mml-node="mi" transform="translate(16462,0)"><use data-c="1D45E" xlink:href="#MJX-920-TEX-I-1D45E"></use></g><g data-mml-node="mi" transform="translate(16922,0)"><use data-c="1D462" xlink:href="#MJX-920-TEX-I-1D462"></use></g><g data-mml-node="mi" transform="translate(17494,0)"><use data-c="1D44E" xlink:href="#MJX-920-TEX-I-1D44E"></use></g><g data-mml-node="mi" transform="translate(18023,0)"><use data-c="1D45B" xlink:href="#MJX-920-TEX-I-1D45B"></use></g><g data-mml-node="mi" transform="translate(18623,0)"><use data-c="1D461" xlink:href="#MJX-920-TEX-I-1D461"></use></g><g data-mml-node="mi" transform="translate(18984,0)"><use data-c="1D456" xlink:href="#MJX-920-TEX-I-1D456"></use></g><g data-mml-node="mi" transform="translate(19329,0)"><use data-c="1D461" xlink:href="#MJX-920-TEX-I-1D461"></use></g><g data-mml-node="mi" transform="translate(19690,0)"><use data-c="1D466" xlink:href="#MJX-920-TEX-I-1D466"></use></g><g data-mml-node="mo" transform="translate(20180,0)"><use data-c="29" xlink:href="#MJX-920-TEX-N-29"></use></g></g></g></svg></mjx-container><script type="math/tex">sales(item\_name, color, clothes\_size, quantity)</script></p>
<p>可以对 <code>关系中的某些属性</code>  <code>分组 (Group)</code>  为 <code>度量属性</code> 和 <code>维属性</code>：</p>
<ul>
<li><code>度量属性 (Measure Attribute)</code>：对 <code>某个值</code> 进行 <code>度量</code>，并且可以对 <code>这个值</code> 进行 <code>聚集操作</code></li>
<li><code>维属性 (Dimension Attribute)</code>：<code>剩余的属性</code> 称为 <code>维属性</code></li>

</ul>
<p>能够 <code>模式化</code> 为 <code>度量属性</code> 和 <code>维属性</code> 的 <code>数据</code> 统称为 <code>多维数据 (Multi-Dimensional Data)</code></p>
<hr>
<p><code>数据立方体 (Data Cube)</code>：可以用于描述 <code>n维数据</code>。</p>
<blockquote><p><code>交叉表 (Cross-Tabulation / Pivot Table)</code>：可以用于描述 <code>二维属性</code>，是 <code>数据立方体</code> 的 <code>2维情形</code></p>
<p>某些 <code>交叉表</code> 可能还含有 <code>汇总行 (Total Row)</code> 和 <code>汇总列 (Total Column)</code></p>
</blockquote>
<p><code>单元 (Cell)</code>：<code>n维的数据单元</code> 可用 <code>n维向量</code> 进行 <code>定位</code>，每个 <code>单元</code> 存储 <code>1个值</code></p>
<blockquote><p> 当 <code>某个维度</code> 的 <code>取值</code> 为 <code>all</code> 时，则表示 <code>对该维度的数据进行聚集</code>，即 <code>对该维度进行压缩</code>！</p>
<p>如 <code>clothes_size</code>  的 <code>all值</code> 是对 ：<code>small</code>，<code>medium</code> 和 <code>large</code> 进行 <code>聚集</code> 得到的。</p>
</blockquote>
<hr>
<ul>
<li>Select <code>attribute_list</code></li>

</ul>
<p><code>转轴 (Pivot)</code>：改变 <code>交叉表</code> 中 <code>维</code> 的操作</p>
<p><code>切片 (Slice) / 切块 (Dicing)</code>：<code>固定</code> <code>某个维度</code>，<code>观察</code> <code>其余的维度</code></p>
<blockquote><p>一般将 <code>切片</code> 用于 <code>固定1个维度</code>时，<code>切块</code> 用于 <code>固定多个维度</code> 时。</p>
</blockquote>
<ul>
<li>Change <code>observation granularity</code></li>

</ul>
<p><code>上卷 (RollUp)</code> ：即 <code>粒度变粗</code></p>
<p><code>下钻 (Drill Down)</code>：即 <code>粒度变细</code></p>
<blockquote><p><code>较粗粒度的数据</code> 可以由 <code>较细粒度的数据</code> 所产生，反之则不能。</p>
<p>即 <code>高维数据</code> 可以产生 <code>低维数据</code>，反之不能。</p>
</blockquote>
<p>一个 <code>属性</code> 可以有不同的 <code>粒度</code>，这些 <code>不同粒度</code> 组成 <code>层次结构</code>，如 <code>Datetime的层次结构</code>：</p>
<pre><code class="language-mermaid" lang="mermaid">graph TD;
date_time(DateTime) --&gt; hour_of_day(Hour of Day)
date_time --&gt; date(Date)
date --&gt; day_of_week(Day of Week)
date --&gt; month(Month)
month --&gt; quarter(Quarter)
quarter --&gt; year(Year)
</code></pre>
<blockquote><p>当我们讨论 <code>属性的粒度</code> 时， 我们应当把 <code>粒度树</code> <code>倒过来看</code>，这样正好符合 <code>上卷</code> 和 <code>下钻</code>。</p>
<blockquote><p>计算机的 <code>树</code> 就是 <code>倒过来的自然界的树</code>，而 <code>粒度树</code> 是 <code>倒过来的树</code>，也就正好符合 <code>自然界的树</code>。</p>
</blockquote>
</blockquote>
<h3>OLAP in SQL</h3>
<p> <code>模式</code> <mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="46.536ex" height="2.262ex" role="img" focusable="false" viewBox="0 -750 20569 1000" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.566ex;" class="in-text-selection"><defs><path id="MJX-920-TEX-I-1D460" d="M131 289Q131 321 147 354T203 415T300 442Q362 442 390 415T419 355Q419 323 402 308T364 292Q351 292 340 300T328 326Q328 342 337 354T354 372T367 378Q368 378 368 379Q368 382 361 388T336 399T297 405Q249 405 227 379T204 326Q204 301 223 291T278 274T330 259Q396 230 396 163Q396 135 385 107T352 51T289 7T195 -10Q118 -10 86 19T53 87Q53 126 74 143T118 160Q133 160 146 151T160 120Q160 94 142 76T111 58Q109 57 108 57T107 55Q108 52 115 47T146 34T201 27Q237 27 263 38T301 66T318 97T323 122Q323 150 302 164T254 181T195 196T148 231Q131 256 131 289Z"></path><path id="MJX-920-TEX-I-1D44E" d="M33 157Q33 258 109 349T280 441Q331 441 370 392Q386 422 416 422Q429 422 439 414T449 394Q449 381 412 234T374 68Q374 43 381 35T402 26Q411 27 422 35Q443 55 463 131Q469 151 473 152Q475 153 483 153H487Q506 153 506 144Q506 138 501 117T481 63T449 13Q436 0 417 -8Q409 -10 393 -10Q359 -10 336 5T306 36L300 51Q299 52 296 50Q294 48 292 46Q233 -10 172 -10Q117 -10 75 30T33 157ZM351 328Q351 334 346 350T323 385T277 405Q242 405 210 374T160 293Q131 214 119 129Q119 126 119 118T118 106Q118 61 136 44T179 26Q217 26 254 59T298 110Q300 114 325 217T351 328Z"></path><path id="MJX-920-TEX-I-1D459" d="M117 59Q117 26 142 26Q179 26 205 131Q211 151 215 152Q217 153 225 153H229Q238 153 241 153T246 151T248 144Q247 138 245 128T234 90T214 43T183 6T137 -11Q101 -11 70 11T38 85Q38 97 39 102L104 360Q167 615 167 623Q167 626 166 628T162 632T157 634T149 635T141 636T132 637T122 637Q112 637 109 637T101 638T95 641T94 647Q94 649 96 661Q101 680 107 682T179 688Q194 689 213 690T243 693T254 694Q266 694 266 686Q266 675 193 386T118 83Q118 81 118 75T117 65V59Z"></path><path id="MJX-920-TEX-I-1D452" d="M39 168Q39 225 58 272T107 350T174 402T244 433T307 442H310Q355 442 388 420T421 355Q421 265 310 237Q261 224 176 223Q139 223 138 221Q138 219 132 186T125 128Q125 81 146 54T209 26T302 45T394 111Q403 121 406 121Q410 121 419 112T429 98T420 82T390 55T344 24T281 -1T205 -11Q126 -11 83 42T39 168ZM373 353Q367 405 305 405Q272 405 244 391T199 357T170 316T154 280T149 261Q149 260 169 260Q282 260 327 284T373 353Z"></path><path id="MJX-920-TEX-N-28" d="M94 250Q94 319 104 381T127 488T164 576T202 643T244 695T277 729T302 750H315H319Q333 750 333 741Q333 738 316 720T275 667T226 581T184 443T167 250T184 58T225 -81T274 -167T316 -220T333 -241Q333 -250 318 -250H315H302L274 -226Q180 -141 137 -14T94 250Z"></path><path id="MJX-920-TEX-I-1D456" d="M184 600Q184 624 203 642T247 661Q265 661 277 649T290 619Q290 596 270 577T226 557Q211 557 198 567T184 600ZM21 287Q21 295 30 318T54 369T98 420T158 442Q197 442 223 419T250 357Q250 340 236 301T196 196T154 83Q149 61 149 51Q149 26 166 26Q175 26 185 29T208 43T235 78T260 137Q263 149 265 151T282 153Q302 153 302 143Q302 135 293 112T268 61T223 11T161 -11Q129 -11 102 10T74 74Q74 91 79 106T122 220Q160 321 166 341T173 380Q173 404 156 404H154Q124 404 99 371T61 287Q60 286 59 284T58 281T56 279T53 278T49 278T41 278H27Q21 284 21 287Z"></path><path id="MJX-920-TEX-I-1D461" d="M26 385Q19 392 19 395Q19 399 22 411T27 425Q29 430 36 430T87 431H140L159 511Q162 522 166 540T173 566T179 586T187 603T197 615T211 624T229 626Q247 625 254 615T261 596Q261 589 252 549T232 470L222 433Q222 431 272 431H323Q330 424 330 420Q330 398 317 385H210L174 240Q135 80 135 68Q135 26 162 26Q197 26 230 60T283 144Q285 150 288 151T303 153H307Q322 153 322 145Q322 142 319 133Q314 117 301 95T267 48T216 6T155 -11Q125 -11 98 4T59 56Q57 64 57 83V101L92 241Q127 382 128 383Q128 385 77 385H26Z"></path><path id="MJX-920-TEX-I-1D45A" d="M21 287Q22 293 24 303T36 341T56 388T88 425T132 442T175 435T205 417T221 395T229 376L231 369Q231 367 232 367L243 378Q303 442 384 442Q401 442 415 440T441 433T460 423T475 411T485 398T493 385T497 373T500 364T502 357L510 367Q573 442 659 442Q713 442 746 415T780 336Q780 285 742 178T704 50Q705 36 709 31T724 26Q752 26 776 56T815 138Q818 149 821 151T837 153Q857 153 857 145Q857 144 853 130Q845 101 831 73T785 17T716 -10Q669 -10 648 17T627 73Q627 92 663 193T700 345Q700 404 656 404H651Q565 404 506 303L499 291L466 157Q433 26 428 16Q415 -11 385 -11Q372 -11 364 -4T353 8T350 18Q350 29 384 161L420 307Q423 322 423 345Q423 404 379 404H374Q288 404 229 303L222 291L189 157Q156 26 151 16Q138 -11 108 -11Q95 -11 87 -5T76 7T74 17Q74 30 112 181Q151 335 151 342Q154 357 154 369Q154 405 129 405Q107 405 92 377T69 316T57 280Q55 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-920-TEX-N-5F" d="M0 -62V-25H499V-62H0Z"></path><path id="MJX-920-TEX-I-1D45B" d="M21 287Q22 293 24 303T36 341T56 388T89 425T135 442Q171 442 195 424T225 390T231 369Q231 367 232 367L243 378Q304 442 382 442Q436 442 469 415T503 336T465 179T427 52Q427 26 444 26Q450 26 453 27Q482 32 505 65T540 145Q542 153 560 153Q580 153 580 145Q580 144 576 130Q568 101 554 73T508 17T439 -10Q392 -10 371 17T350 73Q350 92 386 193T423 345Q423 404 379 404H374Q288 404 229 303L222 291L189 157Q156 26 151 16Q138 -11 108 -11Q95 -11 87 -5T76 7T74 17Q74 30 112 180T152 343Q153 348 153 366Q153 405 129 405Q91 405 66 305Q60 285 60 284Q58 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-920-TEX-N-2C" d="M78 35T78 60T94 103T137 121Q165 121 187 96T210 8Q210 -27 201 -60T180 -117T154 -158T130 -185T117 -194Q113 -194 104 -185T95 -172Q95 -168 106 -156T131 -126T157 -76T173 -3V9L172 8Q170 7 167 6T161 3T152 1T140 0Q113 0 96 17Z"></path><path id="MJX-920-TEX-I-1D450" d="M34 159Q34 268 120 355T306 442Q362 442 394 418T427 355Q427 326 408 306T360 285Q341 285 330 295T319 325T330 359T352 380T366 386H367Q367 388 361 392T340 400T306 404Q276 404 249 390Q228 381 206 359Q162 315 142 235T121 119Q121 73 147 50Q169 26 205 26H209Q321 26 394 111Q403 121 406 121Q410 121 419 112T429 98T420 83T391 55T346 25T282 0T202 -11Q127 -11 81 37T34 159Z"></path><path id="MJX-920-TEX-I-1D45C" d="M201 -11Q126 -11 80 38T34 156Q34 221 64 279T146 380Q222 441 301 441Q333 441 341 440Q354 437 367 433T402 417T438 387T464 338T476 268Q476 161 390 75T201 -11ZM121 120Q121 70 147 48T206 26Q250 26 289 58T351 142Q360 163 374 216T388 308Q388 352 370 375Q346 405 306 405Q243 405 195 347Q158 303 140 230T121 120Z"></path><path id="MJX-920-TEX-I-1D45F" d="M21 287Q22 290 23 295T28 317T38 348T53 381T73 411T99 433T132 442Q161 442 183 430T214 408T225 388Q227 382 228 382T236 389Q284 441 347 441H350Q398 441 422 400Q430 381 430 363Q430 333 417 315T391 292T366 288Q346 288 334 299T322 328Q322 376 378 392Q356 405 342 405Q286 405 239 331Q229 315 224 298T190 165Q156 25 151 16Q138 -11 108 -11Q95 -11 87 -5T76 7T74 17Q74 30 114 189T154 366Q154 405 128 405Q107 405 92 377T68 316T57 280Q55 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-920-TEX-I-210E" d="M137 683Q138 683 209 688T282 694Q294 694 294 685Q294 674 258 534Q220 386 220 383Q220 381 227 388Q288 442 357 442Q411 442 444 415T478 336Q478 285 440 178T402 50Q403 36 407 31T422 26Q450 26 474 56T513 138Q516 149 519 151T535 153Q555 153 555 145Q555 144 551 130Q535 71 500 33Q466 -10 419 -10H414Q367 -10 346 17T325 74Q325 90 361 192T398 345Q398 404 354 404H349Q266 404 205 306L198 293L164 158Q132 28 127 16Q114 -11 83 -11Q69 -11 59 -2T48 16Q48 30 121 320L195 616Q195 629 188 632T149 637H128Q122 643 122 645T124 664Q129 683 137 683Z"></path><path id="MJX-920-TEX-I-1D467" d="M347 338Q337 338 294 349T231 360Q211 360 197 356T174 346T162 335T155 324L153 320Q150 317 138 317Q117 317 117 325Q117 330 120 339Q133 378 163 406T229 440Q241 442 246 442Q271 442 291 425T329 392T367 375Q389 375 411 408T434 441Q435 442 449 442H462Q468 436 468 434Q468 430 463 420T449 399T432 377T418 358L411 349Q368 298 275 214T160 106L148 94L163 93Q185 93 227 82T290 71Q328 71 360 90T402 140Q406 149 409 151T424 153Q443 153 443 143Q443 138 442 134Q425 72 376 31T278 -11Q252 -11 232 6T193 40T155 57Q111 57 76 -3Q70 -11 59 -11H54H41Q35 -5 35 -2Q35 13 93 84Q132 129 225 214T340 322Q352 338 347 338Z"></path><path id="MJX-920-TEX-I-1D45E" d="M33 157Q33 258 109 349T280 441Q340 441 372 389Q373 390 377 395T388 406T404 418Q438 442 450 442Q454 442 457 439T460 434Q460 425 391 149Q320 -135 320 -139Q320 -147 365 -148H390Q396 -156 396 -157T393 -175Q389 -188 383 -194H370Q339 -192 262 -192Q234 -192 211 -192T174 -192T157 -193Q143 -193 143 -185Q143 -182 145 -170Q149 -154 152 -151T172 -148Q220 -148 230 -141Q238 -136 258 -53T279 32Q279 33 272 29Q224 -10 172 -10Q117 -10 75 30T33 157ZM352 326Q329 405 277 405Q242 405 210 374T160 293Q131 214 119 129Q119 126 119 118T118 106Q118 61 136 44T179 26Q233 26 290 98L298 109L352 326Z"></path><path id="MJX-920-TEX-I-1D462" d="M21 287Q21 295 30 318T55 370T99 420T158 442Q204 442 227 417T250 358Q250 340 216 246T182 105Q182 62 196 45T238 27T291 44T328 78L339 95Q341 99 377 247Q407 367 413 387T427 416Q444 431 463 431Q480 431 488 421T496 402L420 84Q419 79 419 68Q419 43 426 35T447 26Q469 29 482 57T512 145Q514 153 532 153Q551 153 551 144Q550 139 549 130T540 98T523 55T498 17T462 -8Q454 -10 438 -10Q372 -10 347 46Q345 45 336 36T318 21T296 6T267 -6T233 -11Q189 -11 155 7Q103 38 103 113Q103 170 138 262T173 379Q173 380 173 381Q173 390 173 393T169 400T158 404H154Q131 404 112 385T82 344T65 302T57 280Q55 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-920-TEX-I-1D466" d="M21 287Q21 301 36 335T84 406T158 442Q199 442 224 419T250 355Q248 336 247 334Q247 331 231 288T198 191T182 105Q182 62 196 45T238 27Q261 27 281 38T312 61T339 94Q339 95 344 114T358 173T377 247Q415 397 419 404Q432 431 462 431Q475 431 483 424T494 412T496 403Q496 390 447 193T391 -23Q363 -106 294 -155T156 -205Q111 -205 77 -183T43 -117Q43 -95 50 -80T69 -58T89 -48T106 -45Q150 -45 150 -87Q150 -107 138 -122T115 -142T102 -147L99 -148Q101 -153 118 -160T152 -167H160Q177 -167 186 -165Q219 -156 247 -127T290 -65T313 -9T321 21L315 17Q309 13 296 6T270 -6Q250 -11 231 -11Q185 -11 150 11T104 82Q103 89 103 113Q103 170 138 262T173 379Q173 380 173 381Q173 390 173 393T169 400T158 404H154Q131 404 112 385T82 344T65 302T57 280Q55 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-920-TEX-N-29" d="M60 749L64 750Q69 750 74 750H86L114 726Q208 641 251 514T294 250Q294 182 284 119T261 12T224 -76T186 -143T145 -194T113 -227T90 -246Q87 -249 86 -250H74Q66 -250 63 -250T58 -247T55 -238Q56 -237 66 -225Q221 -64 221 250T66 725Q56 737 55 738Q55 746 60 749Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mi"><use data-c="1D460" xlink:href="#MJX-920-TEX-I-1D460"></use></g><g data-mml-node="mi" transform="translate(469,0)"><use data-c="1D44E" xlink:href="#MJX-920-TEX-I-1D44E"></use></g><g data-mml-node="mi" transform="translate(998,0)"><use data-c="1D459" xlink:href="#MJX-920-TEX-I-1D459"></use></g><g data-mml-node="mi" transform="translate(1296,0)"><use data-c="1D452" xlink:href="#MJX-920-TEX-I-1D452"></use></g><g data-mml-node="mi" transform="translate(1762,0)"><use data-c="1D460" xlink:href="#MJX-920-TEX-I-1D460"></use></g><g data-mml-node="mo" transform="translate(2231,0)"><use data-c="28" xlink:href="#MJX-920-TEX-N-28"></use></g><g data-mml-node="mi" transform="translate(2620,0)"><use data-c="1D456" xlink:href="#MJX-920-TEX-I-1D456"></use></g><g data-mml-node="mi" transform="translate(2965,0)"><use data-c="1D461" xlink:href="#MJX-920-TEX-I-1D461"></use></g><g data-mml-node="mi" transform="translate(3326,0)"><use data-c="1D452" xlink:href="#MJX-920-TEX-I-1D452"></use></g><g data-mml-node="mi" transform="translate(3792,0)"><use data-c="1D45A" xlink:href="#MJX-920-TEX-I-1D45A"></use></g><g data-mml-node="mi" transform="translate(4670,0)"><use data-c="5F" xlink:href="#MJX-920-TEX-N-5F"></use></g><g data-mml-node="mi" transform="translate(5170,0)"><use data-c="1D45B" xlink:href="#MJX-920-TEX-I-1D45B"></use></g><g data-mml-node="mi" transform="translate(5770,0)"><use data-c="1D44E" xlink:href="#MJX-920-TEX-I-1D44E"></use></g><g data-mml-node="mi" transform="translate(6299,0)"><use data-c="1D45A" xlink:href="#MJX-920-TEX-I-1D45A"></use></g><g data-mml-node="mi" transform="translate(7177,0)"><use data-c="1D452" xlink:href="#MJX-920-TEX-I-1D452"></use></g><g data-mml-node="mo" transform="translate(7643,0)"><use data-c="2C" xlink:href="#MJX-920-TEX-N-2C"></use></g><g data-mml-node="mi" transform="translate(8087.7,0)"><use data-c="1D450" xlink:href="#MJX-920-TEX-I-1D450"></use></g><g data-mml-node="mi" transform="translate(8520.7,0)"><use data-c="1D45C" xlink:href="#MJX-920-TEX-I-1D45C"></use></g><g data-mml-node="mi" transform="translate(9005.7,0)"><use data-c="1D459" xlink:href="#MJX-920-TEX-I-1D459"></use></g><g data-mml-node="mi" transform="translate(9303.7,0)"><use data-c="1D45C" xlink:href="#MJX-920-TEX-I-1D45C"></use></g><g data-mml-node="mi" transform="translate(9788.7,0)"><use data-c="1D45F" xlink:href="#MJX-920-TEX-I-1D45F"></use></g><g data-mml-node="mo" transform="translate(10239.7,0)"><use data-c="2C" xlink:href="#MJX-920-TEX-N-2C"></use></g><g data-mml-node="mi" transform="translate(10684.3,0)"><use data-c="1D450" xlink:href="#MJX-920-TEX-I-1D450"></use></g><g data-mml-node="mi" transform="translate(11117.3,0)"><use data-c="1D459" xlink:href="#MJX-920-TEX-I-1D459"></use></g><g data-mml-node="mi" transform="translate(11415.3,0)"><use data-c="1D45C" xlink:href="#MJX-920-TEX-I-1D45C"></use></g><g data-mml-node="mi" transform="translate(11900.3,0)"><use data-c="1D461" xlink:href="#MJX-920-TEX-I-1D461"></use></g><g data-mml-node="mi" transform="translate(12261.3,0)"><use data-c="210E" xlink:href="#MJX-920-TEX-I-210E"></use></g><g data-mml-node="mi" transform="translate(12837.3,0)"><use data-c="1D452" xlink:href="#MJX-920-TEX-I-1D452"></use></g><g data-mml-node="mi" transform="translate(13303.3,0)"><use data-c="1D460" xlink:href="#MJX-920-TEX-I-1D460"></use></g><g data-mml-node="mi" transform="translate(13772.3,0)"><use data-c="5F" xlink:href="#MJX-920-TEX-N-5F"></use></g><g data-mml-node="mi" transform="translate(14272.3,0)"><use data-c="1D460" xlink:href="#MJX-920-TEX-I-1D460"></use></g><g data-mml-node="mi" transform="translate(14741.3,0)"><use data-c="1D456" xlink:href="#MJX-920-TEX-I-1D456"></use></g><g data-mml-node="mi" transform="translate(15086.3,0)"><use data-c="1D467" xlink:href="#MJX-920-TEX-I-1D467"></use></g><g data-mml-node="mi" transform="translate(15551.3,0)"><use data-c="1D452" xlink:href="#MJX-920-TEX-I-1D452"></use></g><g data-mml-node="mo" transform="translate(16017.3,0)"><use data-c="2C" xlink:href="#MJX-920-TEX-N-2C"></use></g><g data-mml-node="mi" transform="translate(16462,0)"><use data-c="1D45E" xlink:href="#MJX-920-TEX-I-1D45E"></use></g><g data-mml-node="mi" transform="translate(16922,0)"><use data-c="1D462" xlink:href="#MJX-920-TEX-I-1D462"></use></g><g data-mml-node="mi" transform="translate(17494,0)"><use data-c="1D44E" xlink:href="#MJX-920-TEX-I-1D44E"></use></g><g data-mml-node="mi" transform="translate(18023,0)"><use data-c="1D45B" xlink:href="#MJX-920-TEX-I-1D45B"></use></g><g data-mml-node="mi" transform="translate(18623,0)"><use data-c="1D461" xlink:href="#MJX-920-TEX-I-1D461"></use></g><g data-mml-node="mi" transform="translate(18984,0)"><use data-c="1D456" xlink:href="#MJX-920-TEX-I-1D456"></use></g><g data-mml-node="mi" transform="translate(19329,0)"><use data-c="1D461" xlink:href="#MJX-920-TEX-I-1D461"></use></g><g data-mml-node="mi" transform="translate(19690,0)"><use data-c="1D466" xlink:href="#MJX-920-TEX-I-1D466"></use></g><g data-mml-node="mo" transform="translate(20180,0)"><use data-c="29" xlink:href="#MJX-920-TEX-N-29"></use></g></g></g></svg></mjx-container><script type="math/tex">sales(item\_name, color, clothes\_size, quantity)</script></p>
<ul>
<li><code>pivot()</code></li>

</ul>
<pre><code class="language-sql" lang="sql">SELECT *
FROM sales
pivot(
	sum(quantity)
    FOR color IN ('dark', 'pastel', 'white')
)
</code></pre>
<blockquote><p><code>pivot中的for</code> 的 <code>语义</code> 是：<code>解包</code>  <code>指定属性的指定值</code> ，将 <code>这些值</code> 作为 <code>新属性</code> 插入。</p>
</blockquote>
<figure><table>
<thead>
<tr><th>item_name</th><th>clothes_size</th><th>dark</th><th>pastel</th><th>white</th></tr></thead>
<tbody><tr><td>skirt</td><td>small</td><td>2</td><td>11</td><td>2</td></tr><tr><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td></tr></tbody>
</table></figure>
<ul>
<li><code>cube()</code></li>

</ul>
<pre><code class="language-sql" lang="sql">SELECT item_name, color, clothes_size, sum(quantity)
FROM sales
GROUP BY cube(item_name, color, clothes_size)
</code></pre>
<blockquote><p>如果需要处理 <code>all值</code>，则可以使用 <code>decode()</code> 和 <code>grouping()</code>。</p>
</blockquote>
<p>该查询返回的是一个 <code>关系</code> <mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="41.489ex" height="2.262ex" role="img" focusable="false" viewBox="0 -750 18338 1000" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.566ex;"><defs><path id="MJX-941-TEX-N-28" d="M94 250Q94 319 104 381T127 488T164 576T202 643T244 695T277 729T302 750H315H319Q333 750 333 741Q333 738 316 720T275 667T226 581T184 443T167 250T184 58T225 -81T274 -167T316 -220T333 -241Q333 -250 318 -250H315H302L274 -226Q180 -141 137 -14T94 250Z"></path><path id="MJX-941-TEX-I-1D456" d="M184 600Q184 624 203 642T247 661Q265 661 277 649T290 619Q290 596 270 577T226 557Q211 557 198 567T184 600ZM21 287Q21 295 30 318T54 369T98 420T158 442Q197 442 223 419T250 357Q250 340 236 301T196 196T154 83Q149 61 149 51Q149 26 166 26Q175 26 185 29T208 43T235 78T260 137Q263 149 265 151T282 153Q302 153 302 143Q302 135 293 112T268 61T223 11T161 -11Q129 -11 102 10T74 74Q74 91 79 106T122 220Q160 321 166 341T173 380Q173 404 156 404H154Q124 404 99 371T61 287Q60 286 59 284T58 281T56 279T53 278T49 278T41 278H27Q21 284 21 287Z"></path><path id="MJX-941-TEX-I-1D461" d="M26 385Q19 392 19 395Q19 399 22 411T27 425Q29 430 36 430T87 431H140L159 511Q162 522 166 540T173 566T179 586T187 603T197 615T211 624T229 626Q247 625 254 615T261 596Q261 589 252 549T232 470L222 433Q222 431 272 431H323Q330 424 330 420Q330 398 317 385H210L174 240Q135 80 135 68Q135 26 162 26Q197 26 230 60T283 144Q285 150 288 151T303 153H307Q322 153 322 145Q322 142 319 133Q314 117 301 95T267 48T216 6T155 -11Q125 -11 98 4T59 56Q57 64 57 83V101L92 241Q127 382 128 383Q128 385 77 385H26Z"></path><path id="MJX-941-TEX-I-1D452" d="M39 168Q39 225 58 272T107 350T174 402T244 433T307 442H310Q355 442 388 420T421 355Q421 265 310 237Q261 224 176 223Q139 223 138 221Q138 219 132 186T125 128Q125 81 146 54T209 26T302 45T394 111Q403 121 406 121Q410 121 419 112T429 98T420 82T390 55T344 24T281 -1T205 -11Q126 -11 83 42T39 168ZM373 353Q367 405 305 405Q272 405 244 391T199 357T170 316T154 280T149 261Q149 260 169 260Q282 260 327 284T373 353Z"></path><path id="MJX-941-TEX-I-1D45A" d="M21 287Q22 293 24 303T36 341T56 388T88 425T132 442T175 435T205 417T221 395T229 376L231 369Q231 367 232 367L243 378Q303 442 384 442Q401 442 415 440T441 433T460 423T475 411T485 398T493 385T497 373T500 364T502 357L510 367Q573 442 659 442Q713 442 746 415T780 336Q780 285 742 178T704 50Q705 36 709 31T724 26Q752 26 776 56T815 138Q818 149 821 151T837 153Q857 153 857 145Q857 144 853 130Q845 101 831 73T785 17T716 -10Q669 -10 648 17T627 73Q627 92 663 193T700 345Q700 404 656 404H651Q565 404 506 303L499 291L466 157Q433 26 428 16Q415 -11 385 -11Q372 -11 364 -4T353 8T350 18Q350 29 384 161L420 307Q423 322 423 345Q423 404 379 404H374Q288 404 229 303L222 291L189 157Q156 26 151 16Q138 -11 108 -11Q95 -11 87 -5T76 7T74 17Q74 30 112 181Q151 335 151 342Q154 357 154 369Q154 405 129 405Q107 405 92 377T69 316T57 280Q55 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-941-TEX-N-5F" d="M0 -62V-25H499V-62H0Z"></path><path id="MJX-941-TEX-I-1D45B" d="M21 287Q22 293 24 303T36 341T56 388T89 425T135 442Q171 442 195 424T225 390T231 369Q231 367 232 367L243 378Q304 442 382 442Q436 442 469 415T503 336T465 179T427 52Q427 26 444 26Q450 26 453 27Q482 32 505 65T540 145Q542 153 560 153Q580 153 580 145Q580 144 576 130Q568 101 554 73T508 17T439 -10Q392 -10 371 17T350 73Q350 92 386 193T423 345Q423 404 379 404H374Q288 404 229 303L222 291L189 157Q156 26 151 16Q138 -11 108 -11Q95 -11 87 -5T76 7T74 17Q74 30 112 180T152 343Q153 348 153 366Q153 405 129 405Q91 405 66 305Q60 285 60 284Q58 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-941-TEX-I-1D44E" d="M33 157Q33 258 109 349T280 441Q331 441 370 392Q386 422 416 422Q429 422 439 414T449 394Q449 381 412 234T374 68Q374 43 381 35T402 26Q411 27 422 35Q443 55 463 131Q469 151 473 152Q475 153 483 153H487Q506 153 506 144Q506 138 501 117T481 63T449 13Q436 0 417 -8Q409 -10 393 -10Q359 -10 336 5T306 36L300 51Q299 52 296 50Q294 48 292 46Q233 -10 172 -10Q117 -10 75 30T33 157ZM351 328Q351 334 346 350T323 385T277 405Q242 405 210 374T160 293Q131 214 119 129Q119 126 119 118T118 106Q118 61 136 44T179 26Q217 26 254 59T298 110Q300 114 325 217T351 328Z"></path><path id="MJX-941-TEX-N-2C" d="M78 35T78 60T94 103T137 121Q165 121 187 96T210 8Q210 -27 201 -60T180 -117T154 -158T130 -185T117 -194Q113 -194 104 -185T95 -172Q95 -168 106 -156T131 -126T157 -76T173 -3V9L172 8Q170 7 167 6T161 3T152 1T140 0Q113 0 96 17Z"></path><path id="MJX-941-TEX-I-1D450" d="M34 159Q34 268 120 355T306 442Q362 442 394 418T427 355Q427 326 408 306T360 285Q341 285 330 295T319 325T330 359T352 380T366 386H367Q367 388 361 392T340 400T306 404Q276 404 249 390Q228 381 206 359Q162 315 142 235T121 119Q121 73 147 50Q169 26 205 26H209Q321 26 394 111Q403 121 406 121Q410 121 419 112T429 98T420 83T391 55T346 25T282 0T202 -11Q127 -11 81 37T34 159Z"></path><path id="MJX-941-TEX-I-1D45C" d="M201 -11Q126 -11 80 38T34 156Q34 221 64 279T146 380Q222 441 301 441Q333 441 341 440Q354 437 367 433T402 417T438 387T464 338T476 268Q476 161 390 75T201 -11ZM121 120Q121 70 147 48T206 26Q250 26 289 58T351 142Q360 163 374 216T388 308Q388 352 370 375Q346 405 306 405Q243 405 195 347Q158 303 140 230T121 120Z"></path><path id="MJX-941-TEX-I-1D459" d="M117 59Q117 26 142 26Q179 26 205 131Q211 151 215 152Q217 153 225 153H229Q238 153 241 153T246 151T248 144Q247 138 245 128T234 90T214 43T183 6T137 -11Q101 -11 70 11T38 85Q38 97 39 102L104 360Q167 615 167 623Q167 626 166 628T162 632T157 634T149 635T141 636T132 637T122 637Q112 637 109 637T101 638T95 641T94 647Q94 649 96 661Q101 680 107 682T179 688Q194 689 213 690T243 693T254 694Q266 694 266 686Q266 675 193 386T118 83Q118 81 118 75T117 65V59Z"></path><path id="MJX-941-TEX-I-1D45F" d="M21 287Q22 290 23 295T28 317T38 348T53 381T73 411T99 433T132 442Q161 442 183 430T214 408T225 388Q227 382 228 382T236 389Q284 441 347 441H350Q398 441 422 400Q430 381 430 363Q430 333 417 315T391 292T366 288Q346 288 334 299T322 328Q322 376 378 392Q356 405 342 405Q286 405 239 331Q229 315 224 298T190 165Q156 25 151 16Q138 -11 108 -11Q95 -11 87 -5T76 7T74 17Q74 30 114 189T154 366Q154 405 128 405Q107 405 92 377T68 316T57 280Q55 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-941-TEX-I-210E" d="M137 683Q138 683 209 688T282 694Q294 694 294 685Q294 674 258 534Q220 386 220 383Q220 381 227 388Q288 442 357 442Q411 442 444 415T478 336Q478 285 440 178T402 50Q403 36 407 31T422 26Q450 26 474 56T513 138Q516 149 519 151T535 153Q555 153 555 145Q555 144 551 130Q535 71 500 33Q466 -10 419 -10H414Q367 -10 346 17T325 74Q325 90 361 192T398 345Q398 404 354 404H349Q266 404 205 306L198 293L164 158Q132 28 127 16Q114 -11 83 -11Q69 -11 59 -2T48 16Q48 30 121 320L195 616Q195 629 188 632T149 637H128Q122 643 122 645T124 664Q129 683 137 683Z"></path><path id="MJX-941-TEX-I-1D460" d="M131 289Q131 321 147 354T203 415T300 442Q362 442 390 415T419 355Q419 323 402 308T364 292Q351 292 340 300T328 326Q328 342 337 354T354 372T367 378Q368 378 368 379Q368 382 361 388T336 399T297 405Q249 405 227 379T204 326Q204 301 223 291T278 274T330 259Q396 230 396 163Q396 135 385 107T352 51T289 7T195 -10Q118 -10 86 19T53 87Q53 126 74 143T118 160Q133 160 146 151T160 120Q160 94 142 76T111 58Q109 57 108 57T107 55Q108 52 115 47T146 34T201 27Q237 27 263 38T301 66T318 97T323 122Q323 150 302 164T254 181T195 196T148 231Q131 256 131 289Z"></path><path id="MJX-941-TEX-I-1D467" d="M347 338Q337 338 294 349T231 360Q211 360 197 356T174 346T162 335T155 324L153 320Q150 317 138 317Q117 317 117 325Q117 330 120 339Q133 378 163 406T229 440Q241 442 246 442Q271 442 291 425T329 392T367 375Q389 375 411 408T434 441Q435 442 449 442H462Q468 436 468 434Q468 430 463 420T449 399T432 377T418 358L411 349Q368 298 275 214T160 106L148 94L163 93Q185 93 227 82T290 71Q328 71 360 90T402 140Q406 149 409 151T424 153Q443 153 443 143Q443 138 442 134Q425 72 376 31T278 -11Q252 -11 232 6T193 40T155 57Q111 57 76 -3Q70 -11 59 -11H54H41Q35 -5 35 -2Q35 13 93 84Q132 129 225 214T340 322Q352 338 347 338Z"></path><path id="MJX-941-TEX-I-1D45E" d="M33 157Q33 258 109 349T280 441Q340 441 372 389Q373 390 377 395T388 406T404 418Q438 442 450 442Q454 442 457 439T460 434Q460 425 391 149Q320 -135 320 -139Q320 -147 365 -148H390Q396 -156 396 -157T393 -175Q389 -188 383 -194H370Q339 -192 262 -192Q234 -192 211 -192T174 -192T157 -193Q143 -193 143 -185Q143 -182 145 -170Q149 -154 152 -151T172 -148Q220 -148 230 -141Q238 -136 258 -53T279 32Q279 33 272 29Q224 -10 172 -10Q117 -10 75 30T33 157ZM352 326Q329 405 277 405Q242 405 210 374T160 293Q131 214 119 129Q119 126 119 118T118 106Q118 61 136 44T179 26Q233 26 290 98L298 109L352 326Z"></path><path id="MJX-941-TEX-I-1D462" d="M21 287Q21 295 30 318T55 370T99 420T158 442Q204 442 227 417T250 358Q250 340 216 246T182 105Q182 62 196 45T238 27T291 44T328 78L339 95Q341 99 377 247Q407 367 413 387T427 416Q444 431 463 431Q480 431 488 421T496 402L420 84Q419 79 419 68Q419 43 426 35T447 26Q469 29 482 57T512 145Q514 153 532 153Q551 153 551 144Q550 139 549 130T540 98T523 55T498 17T462 -8Q454 -10 438 -10Q372 -10 347 46Q345 45 336 36T318 21T296 6T267 -6T233 -11Q189 -11 155 7Q103 38 103 113Q103 170 138 262T173 379Q173 380 173 381Q173 390 173 393T169 400T158 404H154Q131 404 112 385T82 344T65 302T57 280Q55 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-941-TEX-I-1D466" d="M21 287Q21 301 36 335T84 406T158 442Q199 442 224 419T250 355Q248 336 247 334Q247 331 231 288T198 191T182 105Q182 62 196 45T238 27Q261 27 281 38T312 61T339 94Q339 95 344 114T358 173T377 247Q415 397 419 404Q432 431 462 431Q475 431 483 424T494 412T496 403Q496 390 447 193T391 -23Q363 -106 294 -155T156 -205Q111 -205 77 -183T43 -117Q43 -95 50 -80T69 -58T89 -48T106 -45Q150 -45 150 -87Q150 -107 138 -122T115 -142T102 -147L99 -148Q101 -153 118 -160T152 -167H160Q177 -167 186 -165Q219 -156 247 -127T290 -65T313 -9T321 21L315 17Q309 13 296 6T270 -6Q250 -11 231 -11Q185 -11 150 11T104 82Q103 89 103 113Q103 170 138 262T173 379Q173 380 173 381Q173 390 173 393T169 400T158 404H154Q131 404 112 385T82 344T65 302T57 280Q55 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-941-TEX-N-29" d="M60 749L64 750Q69 750 74 750H86L114 726Q208 641 251 514T294 250Q294 182 284 119T261 12T224 -76T186 -143T145 -194T113 -227T90 -246Q87 -249 86 -250H74Q66 -250 63 -250T58 -247T55 -238Q56 -237 66 -225Q221 -64 221 250T66 725Q56 737 55 738Q55 746 60 749Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mo"><use data-c="28" xlink:href="#MJX-941-TEX-N-28"></use></g><g data-mml-node="mi" transform="translate(389,0)"><use data-c="1D456" xlink:href="#MJX-941-TEX-I-1D456"></use></g><g data-mml-node="mi" transform="translate(734,0)"><use data-c="1D461" xlink:href="#MJX-941-TEX-I-1D461"></use></g><g data-mml-node="mi" transform="translate(1095,0)"><use data-c="1D452" xlink:href="#MJX-941-TEX-I-1D452"></use></g><g data-mml-node="mi" transform="translate(1561,0)"><use data-c="1D45A" xlink:href="#MJX-941-TEX-I-1D45A"></use></g><g data-mml-node="mi" transform="translate(2439,0)"><use data-c="5F" xlink:href="#MJX-941-TEX-N-5F"></use></g><g data-mml-node="mi" transform="translate(2939,0)"><use data-c="1D45B" xlink:href="#MJX-941-TEX-I-1D45B"></use></g><g data-mml-node="mi" transform="translate(3539,0)"><use data-c="1D44E" xlink:href="#MJX-941-TEX-I-1D44E"></use></g><g data-mml-node="mi" transform="translate(4068,0)"><use data-c="1D45A" xlink:href="#MJX-941-TEX-I-1D45A"></use></g><g data-mml-node="mi" transform="translate(4946,0)"><use data-c="1D452" xlink:href="#MJX-941-TEX-I-1D452"></use></g><g data-mml-node="mo" transform="translate(5412,0)"><use data-c="2C" xlink:href="#MJX-941-TEX-N-2C"></use></g><g data-mml-node="mi" transform="translate(5856.7,0)"><use data-c="1D450" xlink:href="#MJX-941-TEX-I-1D450"></use></g><g data-mml-node="mi" transform="translate(6289.7,0)"><use data-c="1D45C" xlink:href="#MJX-941-TEX-I-1D45C"></use></g><g data-mml-node="mi" transform="translate(6774.7,0)"><use data-c="1D459" xlink:href="#MJX-941-TEX-I-1D459"></use></g><g data-mml-node="mi" transform="translate(7072.7,0)"><use data-c="1D45C" xlink:href="#MJX-941-TEX-I-1D45C"></use></g><g data-mml-node="mi" transform="translate(7557.7,0)"><use data-c="1D45F" xlink:href="#MJX-941-TEX-I-1D45F"></use></g><g data-mml-node="mo" transform="translate(8008.7,0)"><use data-c="2C" xlink:href="#MJX-941-TEX-N-2C"></use></g><g data-mml-node="mi" transform="translate(8453.3,0)"><use data-c="1D450" xlink:href="#MJX-941-TEX-I-1D450"></use></g><g data-mml-node="mi" transform="translate(8886.3,0)"><use data-c="1D459" xlink:href="#MJX-941-TEX-I-1D459"></use></g><g data-mml-node="mi" transform="translate(9184.3,0)"><use data-c="1D45C" xlink:href="#MJX-941-TEX-I-1D45C"></use></g><g data-mml-node="mi" transform="translate(9669.3,0)"><use data-c="1D461" xlink:href="#MJX-941-TEX-I-1D461"></use></g><g data-mml-node="mi" transform="translate(10030.3,0)"><use data-c="210E" xlink:href="#MJX-941-TEX-I-210E"></use></g><g data-mml-node="mi" transform="translate(10606.3,0)"><use data-c="1D452" xlink:href="#MJX-941-TEX-I-1D452"></use></g><g data-mml-node="mi" transform="translate(11072.3,0)"><use data-c="1D460" xlink:href="#MJX-941-TEX-I-1D460"></use></g><g data-mml-node="mi" transform="translate(11541.3,0)"><use data-c="5F" xlink:href="#MJX-941-TEX-N-5F"></use></g><g data-mml-node="mi" transform="translate(12041.3,0)"><use data-c="1D460" xlink:href="#MJX-941-TEX-I-1D460"></use></g><g data-mml-node="mi" transform="translate(12510.3,0)"><use data-c="1D456" xlink:href="#MJX-941-TEX-I-1D456"></use></g><g data-mml-node="mi" transform="translate(12855.3,0)"><use data-c="1D467" xlink:href="#MJX-941-TEX-I-1D467"></use></g><g data-mml-node="mi" transform="translate(13320.3,0)"><use data-c="1D452" xlink:href="#MJX-941-TEX-I-1D452"></use></g><g data-mml-node="mo" transform="translate(13786.3,0)"><use data-c="2C" xlink:href="#MJX-941-TEX-N-2C"></use></g><g data-mml-node="mi" transform="translate(14231,0)"><use data-c="1D45E" xlink:href="#MJX-941-TEX-I-1D45E"></use></g><g data-mml-node="mi" transform="translate(14691,0)"><use data-c="1D462" xlink:href="#MJX-941-TEX-I-1D462"></use></g><g data-mml-node="mi" transform="translate(15263,0)"><use data-c="1D44E" xlink:href="#MJX-941-TEX-I-1D44E"></use></g><g data-mml-node="mi" transform="translate(15792,0)"><use data-c="1D45B" xlink:href="#MJX-941-TEX-I-1D45B"></use></g><g data-mml-node="mi" transform="translate(16392,0)"><use data-c="1D461" xlink:href="#MJX-941-TEX-I-1D461"></use></g><g data-mml-node="mi" transform="translate(16753,0)"><use data-c="1D456" xlink:href="#MJX-941-TEX-I-1D456"></use></g><g data-mml-node="mi" transform="translate(17098,0)"><use data-c="1D461" xlink:href="#MJX-941-TEX-I-1D461"></use></g><g data-mml-node="mi" transform="translate(17459,0)"><use data-c="1D466" xlink:href="#MJX-941-TEX-I-1D466"></use></g><g data-mml-node="mo" transform="translate(17949,0)"><use data-c="29" xlink:href="#MJX-941-TEX-N-29"></use></g></g></g></svg></mjx-container><script type="math/tex"> (item\_name, color, clothes\_size, quantity)</script></p>
<p>该关系表示1个 <code>3维的数据立方体</code></p>
<ul>
<li><code>rollup()</code></li>

</ul>
<pre><code class="language-sql" lang="sql">SELECT item_name, color, clothes_size, sum(quantity)
FROM sales
GROUP BY rollup(item_name, color, clothes_size)
</code></pre>
<p>从 <code>返回的结果关系的模式</code> 来看，<code>rollup()</code> 和 <code>cube()</code> 返回的 <code>结果关系</code> 具有 <code>相同的模式</code>。</p>
<p>实际上，<code>rollup()</code> 生成的是：1个 <code>0维立方体</code>，1个 <code>1维立方体</code>，1个 <code>2维立方体</code>， 1个 <code>3维立方体</code></p>
<blockquote><p>无论是用 <code>cube()</code> 还是 <code>rollup()</code>，我们都无法 <code>精准控制分组的产生</code>，即无法 <code>精准指定分组具有哪些属性</code>。</p>
<p>但我们可以通过 <code>HAVING子句</code> 来去除 <code>GROUP子句</code> 产生的 <code>我们不想要的分组</code></p>
</blockquote>
```

