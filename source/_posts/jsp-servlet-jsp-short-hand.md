---
title: JSP - Servlet & JSP Short-Hand
type: 'tags'
tags:
  - web
  - jsp
id: '58129'
categories:
  - - uncategorized
date: 2022-06-13 11:00:00
---

# Servlets & JSP Short-hand

## Servlet

### Register a servlet

```xml
<web-app ...>
    <servlet>
        <servlet-name>This Is Your Custom Servet Name</servlet-name>
        <servlet-class>com.sakurawald.MyServlet</servlet-class>
    </servlet>   

    <servlet-mapping>
        <serlvet-name>This Is Your Custom Servet Name</serlvet-name>
        <url-pattern>/some_url_you_want_to_map</url-pattern>
    </servlet-mapping>    
</web-app>
```

### Life-cycle

`Servlet生命周期`

*   servlet类加载
*   servlet实例化
*   servlet#init
*   servlet#service
*   servlet#destroy

### A simple servlet demo

```java
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class Ch2Servlet extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("<a>hello world</a>");
    }
   
}
```

## MVC

> Servlet只运行自己的业务代码，然后调用一个特定的JSP处理响应HTML，这就能把 `业务逻辑` 与 `表示` 相分离。
> 
> 而采用MVC，不仅要求 `业务逻辑` 与 `表示` 相分离，实际上，`业务逻辑` 根本不知道有 `表示` 的 存在。

MVC的组成部分：

*   Model (模型)：包含具体的 `业务逻辑` 和 `状态`。
*   View (视图)：负责进行 `表示`。
*   Controller (控制器)：从 `请求` 获得 `用户输入`，并明确这些输入对 `模型` 有什么影响。

Misc

*   容器为 `Web应用` 提供了 `通信支持`，`生命周期管理`， `多线程支持`， `声明方式安全`， 以及 `JSP支持`
*   容器根据 `URL` 查找 `正确的Servlet`，并把 `请求` 传递给该Servlet

* * *

```java
// src/com/example/web/BeerServlet.java
package com.example.web;

import com.example.model.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class BeerServlet extends HttpServlet {
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        String c = request.getParameter("color");
        BeerExpert be = new BeerExpert();
        List result = be.getBrands(c);
        
        reqeust.setAttribute("styles", result);
        RequestDispatcher view = request.getRequestDispatcher("result.jsp");
        view.forward(request, response);
    }
        
}
```

```jsp
// result.jsp
<%@ page import="java.util.*" %>

<html>
    <body>
        <h1 align="center">
            Beer Recommendations JSP
        </h1>
        <p>
            
            <%
            
                List styles = (List) request.getAttribute("styles");
                Iterator it = styles.iterator();
                while(it.hasNext()) {
                    out.print("<br>try:" + it.next);
                }

            %>
            
        </p>
    </body>
</html>
```

### Servlet: Request & Response

> `Servet的每个实例...` 这种说法是错误的，`任何Servlet类` 都不会有多个 `实例`。（除非使用 `SingleThreadModel`）
> 
> 否则 `容器` 运行 `多个线程` 来处理 `对1个Servlet` 的 `多个请求` （准确地说：`每个请求` 使用 `1个线程` 来请求 `指定的Servlet`）

> 对于 `每个Servlet`，请在 `init()` 中进行 `初始化操作` 而不是 `构造器函数` 当中。
> 
> `构造器函数` 使得 `Servlet` 具备 `Servlet特性 (Servletness)`，并获得 `作为Servlet所应具有的特权`：如 `通过ServletContext引用从容器中获取信息` 。
> 
> 所以，请不要在 `构造器函数` 中过早地进行 `初始化操作` （在 `构造器函数` 中我们无法 `获得关于Web应用的配置信息等`）

> `每个Servlet` 都有 `自己特有的1个 ServletConfig对象`，它可以用于访问 `整个App共享的1个ServletContext`。
> 
> > 注意：`ServletContext` 更准确得叫法应该叫 `AppContext`，因为 `实际上`，`每个Web应用` `有且仅有` 1个 `ServletContext` ！！！
> > 
> > 这 `并不是` 你所想的那样：`每个Servlet` 都有 `自己特有的1个 ServletContext`
> > 
> > > 但是：`每个Servlet` 确确实实有 `自己特有的1个 ServletConfig` ！！！！！

> ```mermaid
> classDiagram
> 
> class ServletRequest{
>    +Object getAttribute(String)
>    +String getParamterer(String)
>    +Enumeration getParameterNames()
> 
> }
> class ServletResponse{
> +ServletOutputStream getOutputStream()
> +PrintWriter getWriter()
> }
> ServletRequest <-- HttpServletRequest
> class HttpServletRequest {
> +String getContextPath()
> +Cookie[] getCookies()
> +String getHeader(String)
> +String getQueryString()
> +HttpSession getSession()
> +String getMethod()
> }
> 
> ServletResponse <-- HttpServletResponse
> class HttpServletResponse {
> +void addCookie(Cookie)
> +void addHeader(String name, String value)
> }
> ```
> 
> > 之所以需要有 `GenericServlet` 以及 `HttpServletRequest` 和 `HttpServletResponse` ，是因为 `可能会有人` 将 `Servlet技术模型` 用于 `其他协议` （大概不会有人）。

> Servlet可以处理的 `HTTP Methods` 包括：`GET` ，`PUT`，`HEAD`，`TRACE`，`OPTIONS`，`PUT`，`DELETE` 和 `CONNECT`
> 
> 我们使用 `doGet()` 来处理 `简单请求`，而使用 `doPost()` 来 `接收和处理表单数据`
> 
> HTTP Method
> 
> Description
> 
> GET
> 
> 要求得到所请求URL上的一个东西 （资源/文件）
> 
> POST
> 
> 要求服务器接受 `附加到请求体的体信息`，并提供 `所请求URL上的一个东西`。这类似于 `附带了额外信息的GET`
> 
> HEAD
> 
> 只要求得到 `GET返回结果的首部部分`。这类似于 `响应中没有体的GET`
> 
> TRACE
> 
> 要求请求消息 `回送`，这样客户端能够 `看到` 另一端接收了什么，以便进行调试。
> 
> PUT
> 
> 指出要把 `所包含的体` 放在 `请求的URL` 上
> 
> DELETE
> 
> 指出删除 `所请求的URL` 上的东西 （资源/文件）
> 
> OPTIONS
> 
> 要求得到 `一个HTTP Method列表`，表明 `所请求的URL` 可以处理 这些方法
> 
> CONNECT
> 
> 要求连接以 `建立隧道`
> 
> > 关于 `幂等性`：`GET` 是 `幂等的`，但 `POST` 不是。

> `表单 FORM` 的默认 `HTTP METHOD` 为 `GET` ！！！
> 
> 除非你 `手动地` 指定为 `POST`
> 
> ```html
> <form method="POST" action="SelectBeer.do">
>  <p>
>      Select beer characteristics
>  </p>
>  <select name="color" size="1">
>      <option>light</option>
>      <optoin>amber</optoin>
>      <option>brown</option>
>      <option>dark</option>
>  </select>
> 
>  <center>
>  <input type="SUBMIT">
>  </center>
> 
> </form>
> ```
> 
> 同样的，这些 `参数` 会相应地 `通过` `POST请求中的体信息` 和 `HttpServetRequest#getParameter(String)`
> 
> ```javascript
> color=dark&body=heavy
> ```
> 
> ```java
> public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
>  String colorParam = request.getParameter("color");
>  String bodyParam = request.getParameter("body");
> }
> ```
> 
> > 如果试图对 `只实现了doPost()的servlet` 发送 `GET请求`，则导致 `运行时错误`。
> > 
> > 如果你想让 `某个Servlet` 同时支持 `GET` 和 `POST` ，则这样做：
> > 
> > ```java
> > public void doPost(...) throws ...{
> >  doGet(request, response);   
> > }
> > ```
> 
> `单个参数` 可以有 `多个值` （比如 `Multi-CheckBox`），我们需要使用 `getParameterValues()` 来获取 `表示多值的数组`
> 
> ```java
> String[] sizes = request.getParameterValues("sizes");
> String first_value = request.getParameterValues("sizes")[0];
> String second_value = request.getParameterValues("sizes")[1];
> ```

> `HttpServletRequest#getInputStream` 用于用于对 `POST请求` 中包含的 `巨大请求体` 进行细致处理。

> ```java
> String forwardsNum = Integer.parseInt(request.getHeader("Max-Forwards"));
> // equals to
> String fowwardsNum = request.getIntHeader("Max-Forwards");
> ```

> `ServletRequest` 的 `getLocalPort()` 和 `getRemotePort()` 是相对于 `Servlet` 的

> 可以 `覆盖 init()` ，且 `必须覆盖` 1个 `服务方法 (doGet(), doPost() ...)`

> ```mermaid
> classDiagram
> class Servlet {
> +service(ServletRequest, ServletResponse)
> +init(ServletConfig)
> +destroy()
> +getServletConfig()
> }
> 
> Servlet <-- GenericServlet
> class GenericServlet {
> +init()
> +getInitParameterNames()
> +getInitParameter(String)
> +getServletContext()
> }
> 
> GenericServlet <-- HttpServlet
> class HttpServlet{
> +service(HttpServletRequest, HttpServiceResponse)
> +doGet(HttpServletRequest, HttpServiceResponse)
> +doPost(HttpServletRequest, HttpServiceResponse)
> }
> ```

> `ServletContext#getResourceAsStream("/bookCode.jar")` 中，`斜线` 代表 `Web Application的根目录`

> 对于 `ServletResponse接口` 的 `输出流`，可以选择 `字节流` 或者 `字符流`
> 
> ```java
> // Byte-Stream
> ServletOutputStream out = response.getOutputStream();
> out.write(aByteArray);
> // Character-Stream
> PrintWriter out = response.getWriter();
> our.println(aString)
> ```
> 
> > 你应当猜到，`PrintWriter` 内部包装了 `ServletOutputStream`。
> 
> > `获取对象的方法名` = `去掉对象的第一个词`

> `重定向 (Redirect)` 中 `相对路径` 和 `绝对路径`：
> 
> ```java
> // 用户原来键入: http://www.wickedlysmart.com/myApp/cool/bar.do
> response.sendRedirect("foo/stuff.html") // --> http://www.wickedlysmart.com/myApp/cool/foo/stuff.html
> response.sendRedirect("/foo/stuff.html") // --> httpL//www.wickedlysmart.com/foo/stuff.html
> ```
> 
> > 不能在 `写到响应之后 （即响应已提交，也就是响应已经发送给客户端，即数据已刷新到输出流）` 再调用 `sendRedirect()`，否则将获得 `IllegalStateException`
> 
> > `重定向 (Redirect)` 让 `客户端` 来完成工作，而 `请求分派 (Forward)` 让 `服务端` 来完成工作。
> 
> > 对于 `本来已经存在的header` 而言，`reponse#addHeader` 和 `response#setHeader` 的表现 `完全一样`

### Application: Attribute & Listener

> `Servlet属性的作用域`：`Request`，`Session`，`Context`

> *   `Servlet的初始化参数`
> 
> `每个Servlet` 可以有 `自己特有的初始化参数 (Initialization-Parameter)`
> 
> ```xml
> <servlet>
>     <servlet-name>A Stupid Name</servlet-name>
>     <servlet-class>here.you.should.fill.in.full.class.name</servlet-class>
> 
>     <init-param>
>         <param-name>adminEmail</param-name>
>         <param-value>sakurawald@gmail.com</param-value>
>     </init-param>
> </servlet>
> ```
> 
> ```java
> // Inside one specific servlet
> getServletConfig().getInitParameter("adminEmail");
> ```

> *   `Context的初始化参数`
> 
> ```xml
> <web-app ...>
>     ...
> 
> <context-param>
>     <param-name>adminEmail</param-name>
>         <param-value>sakurawald@gmail.com</param-value>
>     </context-param>
> </web-app>
> ```
> 
> ```java
> // Inside every servelet
> getServletContext().getInitParameter("adminEmail");
> ```

> 不管是 `Servlet的初始化参数` （对应 `ServletConfig`） 和 `Context的初始化参数` （对应 `ServletContext`），都不提供对 `相应的初始化参数的 setInitParameter()`。
> 
> 换句话说，`初始化参数` 是 `部署时常量`， 在运行时不可以 `重新设置`。

> 默认规定，如果没有 `明确地指明` 是 `servlet的初始化参数` 还是 `context的初始化参数`，则我们 `默认` `初始化参数` 是指 `servlet的初始化参数`

> 可以用 `两种方法` 获得 `ServletContext`
> 
> ```java
> this.getServletConfig().getServletContext().getInitParameter();
> // or
> this.getServletContext().getInitParameter();
> ```

> *   `ServletContextListener`
> 
> ```xml
> <web-app ...>
>     <listener>
>         <listener-class>com.example.MyServletContextListener</listener-class>
>     </listener>
> </web-app>
> ```
> 
> ```java
> public class MyServletContextListener implements ServletContextListener {
> 
>     public void contextInitialized(ServletContextEvent event) {
> 
>         ServletContext sc = event.getServletContext();
> 
>         String dogBreed = sc.getInitParameter("breed");
>         Dog dog = new Dog(dogBreed);
>         sc.setAttribute("dog", dog);   
>     }
> 
>     public void contextDestroyed(ServletContextEvent event) {
>         // do some clean-up work.
>     }
> 
> }
> ```

> *   Attribute versus Parameter
> 
>  
> 
> Attribute
> 
> parameter
> 
> Type
> 
> Application/Context  
> Request  
> Session
> 
> Application/Context  
> Request  
> Servlet Initialization-Parameter
> 
> Getter
> 
> getAttribute(String name)
> 
> getInitParameter()
> 
> Setter
> 
> setAttribute(String name, Object value)
> 
> DD
> 
> Return Type
> 
> Object
> 
> String

> `对Context加锁` 而不是 `对Servlet加锁`
> 
> ```java
> synchronized(getServetContext()) {
>  getServletContext().setAttribute("foo", 42);
>  out.println(getServletContext().getAttribute("foo"));
> }
> ```

### Session

> `request.getSession()` 会在 `之前没有存在会话` 时， `自动地` 创建 `新会话`
> 
> ```java
> HttpSession session = request.getSession();
> if (session.isNew()) {
>  ...
> }
> ```
> 
> > 更准确地，可能 `getSession(false)` 才符合 `getter` 的 `语意`：在 `之前不存在会话` 时 应该返回 `null`

> 在 `request` 上调用 `getSession()` ，`容器` 会 `尝试使用cookie`，如果 `客户的浏览器没有启用cookie`，则说明 `客户不会加入会话`。
> 
> 此时，`session#isNew` 总是返回 `true`

> 对于 `客户禁用cookie` 的情况，`总是使用` `URL重写` 来 `追踪会话`。
> 
> 可以通过 `response#encodeURL(String)` 在每个 `链接` 种添加 `会话ID (Session ID)`
> 
> > 如果需要在 `重定向` 的时候，仍然使用 `同一个会话` ，则调用：
> > 
> > ```java
> > response.encodeRedirectURL("/BeerTest.do");
> > ```
> 
> > `容器` `了解客户的cookie能否正常工作` 的 `唯一方式` 是：`检查客户发送的请求是否携带会话ID`。
> > 
> > 一旦容器发现 `客户发送的请求` 没有 `携带会话ID`，则需要在 `返回的响应` 中 `同时尝试` `cookie` 和 `url重写` 这两种方法。
> 
> `JSESSIONID` 会出现在 `header的cookie中`，以及 `URL` 当中
> 
> ```html
> Cookie: JESSIONID=0AAB6C8DE415
> // or
> POST /select/selectBeerTaste.do;JESSIONID=0AAB6C8DE415
> ```

> `会话失效` 的原因： `会话超时`，`手动调用 session#invalidate()` 和 `应用结束 (崩溃或取消部署)`
> 
> ```xml
> <web-app>
> 
>  <session-config>
>      <!-- 15minutes -->
>  <session-timeout>15</session-timeout>
>  </session-config>
> </web-app>
> ```
> 
> ```java
> // 此处的时间单位 = 秒
> session.setMaxInactiveInterval(15 * 60)
> // session.setMaxInactiveInterval(0) = session.invalidate()    
> ```

> 将 `cookie` 用于 `其他用途` （不仅仅是用于 `会话 (Session)`）
> 
> ```java
> Cookie cookie = new Cookie("username", name);
> cookie.setMaxAge(15 * 60); // 如果设置 -1，则在 浏览器退出是，cookie自动删除
> response.addCookie(cookie);
> ```
> 
> > 有 `getHeader()` 和 `setHeader()`。但只有 `addCookie()` 和 `getCookies()`，没有 `getCookie()` 和 `setCookie()`

### JSP

> 当说到 `表达式` 时，默认指 `脚本表达式 (Java语言表达式)`，而不是 `EL表达式`

Element Type

Example

Scriptlet

<% Float one = new Float(42.5); %>

Script Expression

<%= pageContext.getAttribute("foo") %>

EL Expression

email: ${applicationScope.mail}

Declaration

<%! int y = 3; %>

Instruction

<%@ page import="java.util.\*" %>

Action

<jsp: include page="foo.html" />

* * *

编写的 `JSP` 最终被 `编译` 为 `Servlet`

```jsp
<html>
    <body>
        The page count is:
         <%
    out.println(foo.Counter.getCount()); // 使用 scriptlet + 全限定类名
     %>
    </body>
</html>
```

```jsp
<%@ page import="foo.*" %>
<html>
    <body>
        The page count is:
         <%
    out.println(Counter.getCount()); // 使用 scriptlet + page import
     %>
    </body>
</html>
```

进一步完善，使用 `JSEL`

```jsp
<%@ page import="foo.*" %>
<html>
    <body>
        The page count is:
         <%= Counter.getCount() //使用 Expression
    %>
    </body>
</html>
```

> 当使用 `表达式` 时，`语句末尾` 不能有 `分号` ！！！
> 
> 因为 `<%= Counter.getCount() >` 等价于 `out.print(Counter.getCount())`

> 在 `Scriptlet` 中 `定义变量`
> 
> ```jsp
> <% int count = 0; // 局部变量 %> 
> <%! int count = 0; // 实例变量 %>
> ```

> `JSP的隐式对象`
> 
> API (Servlet)
> 
> 隐式对象 (JSP)
> 
> JspWriter
> 
> out
> 
> HttpServletRequest
> 
> request
> 
> HttpServletResponse
> 
> response
> 
> HttpSession
> 
> session
> 
> ServletContext
> 
> application
> 
> ServletConfig
> 
> config
> 
> Throwable
> 
> exception
> 
> PageContext
> 
> pageContext
> 
> Object
> 
> page
> 
> > `JspWriter` 不在 `PrintWriter` 的 `类层次体系` 中，但它类似于 `带了缓冲的PrintWriter`

> `JSP注释`
> 
> ```jsp
> <%-- your comment --%>
> ```

> `属性的作用域` `映射关系`
> 
> Scope
> 
> Servlet
> 
> JSP
> 
> Application
> 
> getServletContext().setAttribute("foo", barObj);
> 
> application.setAttribute("foo", barObj);
> 
> Request
> 
> request.setAttribute("foo", barObj);
> 
> request.setAttribute("foo", barObj);
> 
> Session
> 
> request.getSession.setAttribute("foo", barObj);
> 
> session.setAttribute("foo", barObj);
> 
> Page
> 
> \\
> 
> pageContext.setAttribute("foo", barObj);

> 使用 `PAGE_CONTEXT` 得到 `属性`
> 
> ```mermaid
> classDiagram
> class JspContext {
> +getAttribute(String name)
> +getAttribute(String name, int scope)
> +getAttributeNames()
> +findAttribuite(String name)
> }
> 
> JspContext <-- PageContext
> class PageContext{
> +APPLICATION_SCOPE
> +PAGE_SCOPE
> +REQUEST_SCOPE
> +SESSION_SCOPE
> +getRequest()
> +getServletConfig()
> +getServletContext()
> +getSession()
> }
> ```
> 
> > `getAttribute(String name)` = `getAttribute(String name, PAGE_SCOPE)`
> 
> > `findAttribute(String name)` 的查找范围为：`PAGE_SCOPE` -> `REQUEST_SCOPE` -> `SESSION_SCOPE` -> `APPLICATION_SCOPE`

> `表达式语言 (Expression Language)` 的形式为 `${something}`
> 
> ```jsp
> <!-- Use Expression Language -->
> Please contact: ${applicationScope.mail}
> 
> <!-- Use Java Language -->
> Please contact: <%= application.getAttribute("mail") %>
> ```
> 
> 在 `使用EL`时，别忘了顺便 `封杀JSP中的` `脚本元素 (Script)`
> 
> ```xml
> <web-app>
> <jsp-config>
>    <jsp-property-group>
>        <url-pattern>*.jsp</url-pattern>>
>        <scripting-invalid>true</scripting-invalid>
>    </jsp-property-group>
> </jsp-config>
> </web-app>
> ```

> `动作元素` 分为 `标准动作` 和 `定制动作`
> 
> ```jsp
> // 标准动作
> <jsp:include page="wickedFooter.jsp" />
> // 定制动作
> <c:set var="rate" value="32" />
> ```
> 
> > 有些 `非标准动作` 仍然位于 `标准库`。

### Scriptless-JSP

```jsp
<html>
    <body>
        <% foo.Person p = (foo.Person) request.getAttribute("person"); %>
        Person is: <%= p.getName() %>
    </body>
</html>
<!-- equals to -->
<html>
    <body>
        <jsp:useBean id="person" class="foo.Person" scope="request" />
        Person created by servlet: <jsp:getProperty name="person" property="name" />
    </body>
</html>
```

```jsp
// <jsp:useBean> 在 创建新Bean 时 执行体中的内容
<jsp:useBean id="person" class="foo.Person" scope="page" >
<jsp:setProperty name="person"property="name" value="Fred" />
</jsp:useBean>
```

> JavaBean只有 `无参构造器`，`<jsp:useBean>` 在 `对象` 不存在时，会 `自动地` 通过无参构造器创建新对象

> *   `useBean` 的 `type` 和 `class`
> 
> ```jsp
> <!-- 建立多态的bean引用 -->
> <jsp:useBean id="person" type="foo.Person" class="foo.Employee" scope="page" ></jsp:useBean>
> ```
> 
> ```jsp
> <!-- 只使用type，而没有class -->
> <jsp:useBean id="person" type="foo.Person" scope="page"></jsp:useBean>
> ```
> 
> 规则是这样的：`type` 表示 `引用类型`，`class` 表示 `对象类型 （实际类型）`。即 `type x = new class()`
> 
> `scope` 默认为 "page"。
> 
> *   如果 `只有type`，则要求 `bean` 必须要 `已经存在`
> *   如果 `使用class` （不管是否有type），则 `class不能是抽象类`，且 `必须有无参构造函数`

> *   设置 `JavaBean` 的 `属性` 为 `相应的请求参数`
> 
> ```jsp
> <!-- 使用 Java-Language Expression -->
> <jsp:setProperty name="person" property="name" value="<%= request.getParameter("username")%>" />
> <!-- 直接使用 param属性 (甚至当 表单的请求参数名 与 JavaBean的性质名 相等时，可以直接省略 param) -->
> <!-- 更进一步的，如果 所有的参数名与性质名 都相等，可以使用 param="*" -->
> <jsp:setProperty name="person" property="name" param="userName" />
> ```

> *   setProperty 的 `自动类型转化`：`String -> Primitive`
> 
> ```xml
> <!-- 下列这些会自动转化 -->
> <jsp:setProperty name="person" property="*" />
> <jsp:setProperty name="person" property="empID" />
> <jsp:setProperty name="person" property="empID" value="343" />
> <jsp:setProperty name="person" property="empID" param="343" />
> <!-- 如果使用脚本，则不会自动转化(此时保证类型正确是你的责任) -->
> <jsp:setProperty name="person" property="empID" value="<%= request.getParameter("empID") %>" />
> ```

> *   getProperty
> 
> ```jsp
> <html>
>     <jsp:useBean id="person" class="foo.Person" scope="request" />
>     Dog's name is: <%= ((foo.Person) request.getAttribute("person")).getDog().getName() %>
> <!-- equals to-->
>     Dog's name is: ${person.dog.name}
> </html>    
> ```
> 
> > 注意：`<jsp:getProperty>` 只能访问 `bean属性的性质`，它无法访问 `嵌套性质` （如 person.dog.name）

> *   `EL表达式的隐式对象`：映射对象 （`pageScope`，`requestScope`，`sessionScope`，`applicationScope`，`param` ，`paramValues`，`header`，`headerValues`，`cookie`，`initParam (上下文初始化参数，而不是Servlet初始化参数)`），非映射对象 （`pageContext`）。
>     
>     > 即 `pageContext隐式对象` 是 `JavaBean`，`其他隐式对象` 是 `Map`
>     

> *   `点号操作符` 与 `中括号操作符`
> 
> 点号操作符
> 
> 中括号操作符数组可被解析为数字的东西
> 
> ```jsp
> ${musicMap.Ambient} equals to ${musicMap["Ambient"]}
> ${musicList["1"]} NOT equals to ${musicList.1} (后者是错误的,因为 点号操作符 严格要求 标识符的命名规范)
> ```
> 
> > `EL保留字` 不能用于 `标识符`：`true`，`false`，`null`，`instanceof`，`empty`

> `requestScope` 不是 `请求对象 (Request)`。
> 
> 应通过 `pageContext` 来获得 `request`
> 
> ```jsp
> Method is: ${pageContext.request.method}
> ```

> *   使用 `作用域隐式对象` 来避免 `命名冲突`
> 
> ```jsp
> ${foo.person.name}
> <!-- and -->
> ${requestScope["foo.person"].name}
> ```
> 
> 通过 `明确地指定` `作用域`，以避免 `错误地将foo当作某个作用域中的属性`

> 首先，我们知道如下事实：
> 
> *   `servlet的初始化参数` 使用 `<init-param>` 进行配置
> *   `context的初始化参数` 使用 `<context-param>` 进行配置
> 
> 但是，`EL的initParam隐式对象` 实际上对应的是 `上下文的参数` （即它使用 `<contex-param>` 来进行配置）

> *   TLD
> 
> ```java
> package foo;
> public class DiceRoller {
>     public static int rollDice() {
>         return (int) ((Math.random() * 6) + 1);
>     }
> }
> ```
> 
> ```xml
> <taglib ...>
>     <tlib-version>1.2</tlib-version>
>     <uri>DiceFunctions</uri>
>     <function>
>     <name>rollIt</name>
>         <function-class>foo.DiceRoller</function-class>
>         <function-signature>int rollDice()</function-signature>
>     </function>
> </taglib>
> ```
> 
> ```jsp
> <%@ taglib prefix="mine" uri="DiceFunctions" %>
> <html>
>     <body>
>         ${mine:rollIt()}
>     </body>
> </html>
> ```

> EL表达式中，`除0得到INFINITY`，但 `模0将得到错误`

> `EL表达式` 对 `null` 是 `友好处理的` ：`什么也不做` 胜过于 `抛出错误`
> 
> 对于 `unknown` 和 `null`，即使 `找不到表达式中指定名的属性/性质/键`，也仍然会 `显示页面`。
> 
> *   在 `算数表达式` 中，`null` 被视为 `0`
> *   在 `逻辑表达式` 中，`null` 被视为 `false`

> *   两种 `页面包含机制`
> 
> <%@ include file="..."> 指令
> 
> <jsp:include page="..."> 标准动作
> 
> 在 `转换` 时将 `全部的源代码` 进行 `简单的文本粘贴`（取得"Header.jsp"文件中的内容，并在转义之前 `放入` 到 `Contact.jsp` 中）：  
> out.write("the content of Header.jsp");
> 
> 在 `运行时` 进行 `调用`：  
> org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Header.jsp", out, false)
> 
> > `被包含的页面` 不能 `修改响应状态码` 或 `设置首部`。如果尝试这么做，不会 `得到错误`，而仅仅是 `结果达不到预期的目标`
> 
> > 在 `可重用组件` 中不应该编写 `HTMl` 或 `BODY` 标签，以避免 `标签嵌套`

> `<jsp:forward>` 的 响应缓存区 会在 `转发` 之前 `被清空`：故 `不要先刷新输出` 然后再 `转发`
> 
> > 如果在 `转发` 之前 `已经刷新了响应缓冲区 （提交了响应）`，则会将 `刷新输出的内容` 发送给 `客户`，并且不会再 `发生转发`。
> > 
> > 原页面的 `剩余部分` 不会得到处理。

> `<jsp:param>` 只能用于 `<jsp:include>` 和 `<jsp:forward>` 当中。

### JSTL

`JSTL` = `JSP Standard Tag Library`

> *   `<c:out>`
> 
> ```jsp
> <!-- escapeXml默认为false -->
> <c:out value="pageContext.currentTip" escapeXml="true" />
> <!-- 设置 输出的默认值 -->
> <c:out value="${user}" default="guest">
> ```

> *   `<c:forEach>`
> 
> ```jsp
> <c:forEach var="movie" items="movieList">
>     <tr>
>         <td>${movie}</td>
>     </tr>
> </c:forEach>
> ```
> 
> > 可选属性 `varStatus` 可以获得 `循环计次`：1..n

> *   `<c:if>`
> 
> ```jsp
> <c:if test="${userType=='member'">
>     <jsp:include page="inputComments.jsp" />
> </c:if>
> ```
> 
> > 虽然有 `if标签`，但没有 `else标签`。如果需要制定 `默认的分支`，请使用 `choose标签`

> *   `<c: choose>`
> 
> ```jsp
> <c:choose>
>     <c:when test="...">...</c:when>
> <c:when test="...">...</c:when>
> <c:when test="...">...</c:when>
>     <c:otherwise>...</c:otherwise>
> </c:choose>
> ```

> *   `<c:set>`
> 
> 属性变量的的值
> 
> ```jsp
> <!-- 无体版本 -->
> <c:set var="userLevel" scope="session" value="Cowboy" />
> 
> <!-- 有体版本： 计算体的内容，并将结果作为 value的值（如果计算结果为null，则变量会被删除！） -->
> <c:set var="userLevel" scope="session">
>     Sheriff, Bartender, Cowgirl
> </c:set>
> ```
> 
> ```jsp
> <!-- 注意：此处target必须传入 对象的引用本身，而不能传递 对象的ID String-->
> <c:set target="${PetMap}" property="dogName" value="Clover" />
> ```
> 
> > 对于 `<c:out>` ，如果没有指定 `scope`，则默认 `只会搜索 pageScope`

> *   `<c:remove>`
> 
> ```jsp
> <c:set var="userStatus" scope="request" value="Brilliant" />
> before userStatus: ${userStatus} <br>
> <!-- scope是可选的，默认会指定为 所有的作用域 -->
> <c:remove var="userStatus" scope="request" />
> <!-- 此处会打印出 空字符串 （因为EL是null友好的） -->
> after userStatus: ${userStatus} <br>
> ```

> *   `<c:import>`
> 
> 在 `请求` 时，将 `URL指定的内容` 粘贴到 `当前页面`。（类似于 `<jsp:include> 标准动作`，只不过 `<c:import>` 可以 `通过URL来引用app外部的资源` ）
> 
> > 可以搭配 `<c:param>` 来使用。
> > 
> > ```jsp
> > <c:import url="Header.jsp">
> >  <c:param name="subTitle" value="We take the sting out of SOAP." />
> > </c:import>
> > ```

> *   `<c:url>`
> 
> ```java
> out.println("<a href=\"" + response.encodeURL("/BeerTest.do") + "\">Click Here</a>");
> ```
> 
> ```jsp
> <a href="<c:url value='/inputComments.jsp' />">Click Here</a>
> ```
> 
> > 注意，`<c:url>` 仅仅进行 `URL重写`，但不包含 `URL编码`。
> > 
> > 若需要 `URL编码`，则使用 `<c:param>` 来 `显式地指出所有的参数列表`
> > 
> > ```jsp
> > <c:url value="/inputComments.jsp" var="inputURL">
> >  <c:param name="firstName" value="${first}" />
> >  <c:param name="lastName" value="${last}" />
> > </c:url>
> > ```

> *   建立 `错误页面`
> 
> ```jsp
> <!-- errorPage.jsp -->
> <%@ page isErrorPage="true" %>
> <html>
> You caused a ${pageContext.exception} on the server.
> </html>
> ```
> 
> ```jsp
> <!-- badPage.jsp -->
> <%@ page errorPage="errorPage.jsp" %>
> <html>
>     About to be bad...
>     <% int x = 10 / 0; %>
> </html>
> ```
> 
> > 此外，也可以通过 `DD文件` 来指定 `错误页面` 的 `匹配规则`
> > 
> > ```xml
> > <error-page>
> >  <exception-type>java.lang.ArithmeticException</exception-type>
> >  <location>/aritimeticErrorPage.jsp</location>
> > </error-page>
> > ```

> *   `<c:catch>`
> 
> 该标签会 `同时` 作为 `try` 和 `catch`，实际上，它的语义和 `catch` 不同。（它表现得更快 `try` 块）
> 
> 一旦 `异常` 发生，`控制流` 会 `直接跳转` 到 `<c:catch>标记体的末尾`。即：一旦 `<c:catch>` 中出现异常，则 `体中的剩余部分` 不会继续运行。

> *   自定义 `Tag Library`
> 
> ```xml
> <!-- 标记库描述文件 (Tag Library Descriptor, TLD) -->
> <!-- 
> 容器在4个位置中查找TLD：
> 1. WEB-INF目录
> 2. WEB-INF的一个子目录
> 3. WEB-INF/lib的jar文件中的META-INF目录
> 4. WEB-INF/lib的jar文件中的META-INF目录的一个子目录
> -->
> <xml ...>
>     <tlib-version>1.2</tlib-version>
>     <short-name>RandomTags</short-name>
> 
>     <!-- 自定义EL函数 -->
>     <function>
>         <name>rollIt</name>
>         <function-class>foo.DiceRoller</function-class>
>         <function-signature>int rollDice()</function-signature>
>     </function>
> 
>     <!-- 自定义标签 -->
> 
>     <!-- uri只不过是一个名称，而不是一个必须存在的位置 -->
>     <uri>randomThings</uri>
>     <tag>
>         <description>random advice</description>
>         <name>advice</name>
>         <tag-class>foo.AdvisorTagHandler</tag-class>
>         <!-- 即使这里声明位empty，仍然可以通过 <jsp:attribute> 在标记的体中存放属性！ -->
>         <!-- 对于声明为empty，仍然可以通过 开始标记 和 结束标记 之间没有内容 的方式来调用 -->
>         <!-- body-content可以设置为：empty, scriptless, tagdependent, JSP -->
> <body-content>empty</body-content>
> 
>         <!-- 对于定制标记，并不在TLD中书写attribute，而是转移到 标记文件 中书写属性。-->
>         <attribute>
>         <name>user</name>
>             <!-- 必须? -->
>             <required>true</required>
>             <!-- 允许是运行时表达式量? 默认false -->
>             <rtexprvalue>true</rtexprvalue>
>         </attribute>
>     </tag>
> 
> </xml>
> ```
> 
> ```jsp
> <html> 
>     <body>
>         <!-- prefix只是一个方便引用的前缀，你可以任意取名。
> 但注意不要取保留的前缀名：jsp, jspx, java, javax, servlet, sun, sunw
> -->
>         <!-- 对于定制标记，使用tagdir而不是uri -->
>     <%@ taglib prefix="mine" uri="randomThings" %>
>         Advisor Page<br> <mine:advice user="${userName}" />
>     </body>
> </html>
> ```
> 
> ```java
> public class AdvisorTagHandler extends SimpleTagSupport {
> 
>     private String user;
> 
>     public void doTag() throws JspException, IOException {
>         getJspContext().getOut().write("hello " + user + ": " + getAdvice() );
>     }
> 
>     public void setUser(String user) {
>         this.user = user;
>     }
> 
>     String getAdvice() {
>         return "do nothing";
>     }
> 
> }
> ```

> `标记文件 (*.tag)` 最后仍然需要作为 `JSP的一部分`，它可以使用 `JSP隐式对象` 和 `EL隐式对象`。
> 
> 但不能使用 `ServletContext`，取而代之的是使用 `JspContext`。

### My Custom Tag

#### Custom Tag File

```xml
<!-- TLD -->
<taglib>
    <tlib-version>1.0</tlib-version>
    <uri>myTagLibrary</uri>
    <tag-file>
    <name>Header</name>
        <path>/META-INF/tags/Header.tag</path>
    </tag-file>
</taglib>
```

```jsp
<!-- Custom Tag File (定制标记文件) -->
<%@ attribute name="subTitle" required="true" rtexprvalue="true" %>
<!-- body-content可取值为 scriptless(默认值), empty, tagdependent(直接当作纯文本处理)-->
<%@ tag body-content="tagdepent" %>
<strong>${subTitle}</strong>
```

```jsp
<!-- Usage -->
<%@ taglib prefix="myTags" tagdir="/WEB-INF/tags" %>
<html>
    <body>
    <myTags:Header subTitle="We take the String out of SOAP" />
    </body>
</html>
```

#### Custom Tag Handler

```xml
<!-- TLD -->
<taglib ..>
    <tlib-version>1.2</tlib-version>
    <uri>simpleTags</uri>
    
    <tag>
    <description>worst use of a custom tag</description>
        <name>simple1</name>
        <tag-class>foo.SimpleTagTest1</tag-class>
        <body-content>empty</body-content>
    </tag>
</taglib>
```

```java
/* Tag Handler */
// 每个SimpleTagHandler不会重用，每个实例只会被调用1次
public class SimpleTagTest1 extends SimpleTagSupport {
 public void doTag() throws JspException, IOException {
     // 使用 getJspBody().invoke(null) 来处理标记的体 (如果有)，并将结果打印到响应
 // 使用 throw new SkipPageException() 来停止处理后续的页面。（对于嵌套的页面，该异常只会影响 直接抛出该异常的页面，外围页面均不受异常的影响）      // setJspBody() 只会在 实际调用标记 时 确确实实 存在体 才会被执行。（不管标记的声明是否要求 有体）
    
     ...
 }   
}
```

```jsp
<%@ taglib prefix="myTags" uri="simpleTags" %>
<html>
    <body>
    <myTags:simple1 />
    </body>
</html>
```

> 这里仅列出 `SimpleTagSupport`，不考虑 `TagSupport`

### Deploy Application

> OUT-OF-DATE

### Application Security

`Servlet安全` 可以划分为： `认证`，`授权`，`机密性`， `数据完整性`

```jsp
<web-app>
<security-constraint>
    <web-resource-collection>
            <!-- 至少指定1个url-pattern -->
        <url-pattern>/Beer/AddRecipe/*</url-pattern>
            <url-pattern>/Beer/ReviewRecipe/*</url-pattern>
            <!-- 如果没有指定任何http方法，则所有的方法都是受约束的。（一旦指定任何http方法，则只有这部分方法受约束） -->
            <http-method>GET</http-method>
            <http-method>POST</http-method>
        </web-resource-collection>
    
        <auth-constraint>
            <!-- 通过role-name对用户进行许可 -->
            <!-- <role-name>*</role-name> 表示所有用户都被许可-->
            <!-- 如果两个不同的非空<auto-constraint>元素应用于 同一个受限资源，则两个元素中的所有角色的并集 都可以访问该首先资源-->
            <role-name>Admin</role-name>
            <role-name>Member</role-name>
        </auth-constraint>
    </security-constraint>

</web-app>
```

### Filter & Wrapper

只有1个 `过滤器接口：Filter`，当谈到 `请求过滤器` 和 `响应过滤器` 时，只是在说 `如何使用` 过滤器，对于容器来说，只有 `1种过滤器`

```java
public class BeerRequestFilter implements Filter {
    
    private FilterConfig fc;
    
    public void init(FilterConfig config) throws ServletException {
this.fc=config;
    }
    
    public void doFilter(ServletRequest req, ServletResponse, resp, FilterChain chain) throws ServletException, IOException {
        // do something.
        chain.doFilter(req, resp);
    }
    
    public void destroy() {
        // do some clean-up
    }
    
}
```

```xml
<filter>
    <filter-name>BeerRequest</filter-name>
    <filtet-class>com.example.web.BeerRequestFilter</filtet-class>
    <init-param>
    <param-name>LogFileName</param-name>
        <param-value>UserLog.txt</param-value>
    </init-param>
</filter>

<filter-mapping>
<filter-name>BeerRequest</filter-name>
    <url-pattern>*.do</url-pattern>
</filter-mapping>

<!-- or -->
<filter-mapping>
<filter-name>BeerRequest</filter-name>
    <servlet-name>AdviceServlet</servlet-name>
</filter-mapping>
```

### Pattern & struts

> OUT-OF-DATE

实际上，这篇文章几乎都是错误。





