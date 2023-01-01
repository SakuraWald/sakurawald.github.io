---
title: CSharp - 学习笔记
tags:
  - C++
id: '809'
categories:
  - - uncategorized
date: 2021-08-07 05:56:19
---

# C# Study Note

```c#
// 在任何C#程序中的第一条语句都是这个
using System;
using System.ComponentModel;

// C#的语法与Java高度相似, 同时引入C++的一些概念.
// 把C#当作Java来写似乎也没有问题.
// C#引入了C++中的名称空间namespace概念, 这和Java有点不同.
namespace CSharpStudyDemo
{
    class Rectangle
    {
        // C#的类模型与Java类似
        // C#也存在成员变量和成员函数的概念
        // C#的类中也存在访问修饰符的概念, 与Java类似
        private double length;
        private double width;

        // C#的构造函数与Java类似
        public Rectangle(double length, double width)
        {
            this.length = length;
            this.width = width;
        }

    }

    class Program
    {
        static void Main(string[] args)
        {
            // Let's start our C# Study.
            Console.WriteLine("Hello World!");

            /* 数据类型 */
            // C#的数据类型分为: 值类型(ValueType), 引用类型(Reference Type) 和 指针类型(PointerType)

            // 对象Object是C#的通用类型系统中所有数据类型的基类.
            // 对于某些值类型, C#和Java一样, 也支持 自动装箱(Auto-Boxing)

            // C#额外支持 动态类型. 这些变量的类型检测在运行时发生
            dynamic dynamicVar = 1;
            dynamicVar = "hello dynamic";
            Console.WriteLine(dynamicVar);

            // C#支持 原始字符串(Raw), 使用@符合来表示
            string rawStr = @"C:\Windows";
            Console.WriteLine(rawStr);

            // 与C++类似, C#保留了指针Pointer的概念, 并且支持使用 sizeof()来获取不同平台上的存储尺寸.
            int num = 100;
            unsafe
            {
                int* numPtr = &num;
            }
            // C#中要求对指针的操作必须在 不安全的代码块(Unsafe Block) 中执行.

            /* 类型转换 */
            // 与Java类型, 同样分为隐式类型转换 和 显示类型转换
            double doubleNum = 100.25;
            int intNum = (int)doubleNum;

            /* 变量 */
            // 与Java类似.

            /* 常量 */
            // 与C++类似, C#支持const关键字
            const double PI = 3.1415926;

            /* 运算符 */
            // 与Java类似.
            // 但C#中额外支持 sizeof() 和 typeof()
            // 以及, C#中对于指针操作相关的: 取值运算符 *  和 取址运算符 &
            // 此外, C#中使用is来判断对象类型(而不是instanceof), 使用as进行强制类型转换.

            /* 条件控制 */
            // C#支持三目运算符. 支持if, switch等语句, 与Java类似.

            /* 循环控制 */
            // 与Java类似.

            /* 面向对象 */
            // C#是面向对象的. 
            Rectangle rectangle = new Rectangle(100, 200);
            // C#同样存在 访问修饰符 的概念 (与Java类似)
            // 但C#存在2个独特的访问修饰符 internal(同一个程序集的对象可访问) 和 protected internal(访问限于当前程序集或派生自包含类的类型)
            // 访问修饰符的权限: public > internal > protected > private

            /* 方法 */
            // 与Java类似
            // C#中函数的传参方式默认为 按值传递(与C语言类似)
            // C#同样支持 引用 概念(与C++类似), 可以使用 ref关键字 修饰来指明 按引用传递
            // C#独特地支持了 输出参数(使用out关键字修饰), 输出参数会将值赋值给自己, 原理类似引用参数.

            /* 可空类型 */
            // C#中可以使用 单问号? 来修饰某些无法直接赋值为null的数据类型(如int,double,bool等)
            int? nullableInt = 3;
            nullableInt = null;
            // 这将等价于
            Nullable<int> nullableInt2 = new Nullable<int>(3);
            // 此外, 可以使用 双问号?? 在变量为null的时候返回默认值.
            // C#的 可空类型(Nullable) 对于处理 数据库操作时非常有用.

            /* 数组 */
            // 与Java类似.
            // 此外, C#的 数组名 即为1个指向数组的指针 (与C类似, 但C#的数组是对象, 均继承自Array类)
            double[] balance = {1, 2, 3};
            Console.WriteLine(balance.Length);

            /* 字符串 */
            // 与Java类似, 同时支持使用{0}来格式化字符串

            /* 结构体 */
            // C#支持结构体struct (与C类似)
            // 但是, C#的结构体中可以定义方法.
            // 结构体h不支持构造函数(默认为结构体生成无参构造函数 且 无法被改变), 且不能定义 析构函数.
            // 结构体中的字段不允许赋予初值, 但类可以.
            // 结构体与类相比, 不支持 继承 和 多态, 但可以实现 接口.
            // 结构体的可以不使用new来创建, 转而使用一种C语言风格的创建方式.
            // 对于传参方式, 结构体是 值传递 (与C类似), 类 是 引用传递(与Java类似)

            /* 枚举 */
            // 与 C++类似.

            /* 类 */
            // 与Java类似. (但C#中支持 析构函数, 这与C++类似.)
            // C#支持密封类(Sealed Class), 与Kotlin类似.

            /* 继承 */
            // 与Java类似 (不支持多重继承, 但接口支持多重实现.)
            // C#使用 冒号: 来代替 extends 和 implements

            /* 多态 */
            // C#支持静态多态 和 动态多态
            // 在C#中可以通过 函数重载 和 运算符重载 来实现 静态多态.
            // 通过 继承自抽象类(Abstract Class)来实现 动态多态.
            // C#中支持 抽象类 和 抽象方法 的概念, 同时提供override关键字来标识 重写方法.

            // 此外, C#支持 虚方法
            // 虚方法(Virtual Method): 当有一个定义在类中的函数需要在 继承类 中实现时, 可使用虚方法.

            /* 运算符重载 */
            // C#中支持 运算符重载(Operator Overroad), 与C++类似.

            /* 接口 */
            // 与Java类似.

            /* 命令空间 */
            // 与C++类似.
            // 命名空间(Namespace): 命名空间的设计目的在于提供一种让 一组名称 与 其他名称 分隔开的方式.
            // C#支持 嵌套命名空间. 使用 点号运算符 访问嵌套的成员.

            /* 预处理器指令 */
            // 与C++类似.

            /* 正则表达式 */
            // 与Java类似

            /* 异常处理 */
            // 与Java类似

            /* 文件的输入与输出 */
            // 与Java类似

            /* 特性 */
            // C#的 特性(Attribute) 类似于Java中的 注解(Annotation)
            // 特性(Attribute): 用于在运行时传递 程序中的各种元素 的行为信息的 声明性标签.
            // 特性分为: 自定义特性  和 预定义特性
            // 预定义特性包含3种: AttributeUsage, Conditional, Obsolete
            // AttributeUsage特性: 描述如何使用一个自定义特性类. (规定了 特性 可应用到的项目的类型)
            // Conditional特性: 标记了一个条件方法, 其执行依赖于指定的预处理标识符.
            // Obsolete特性: 标记了不应被使用的程序实体.

            /* 反射 */
            // 反射(Reflection): 指程序可以访问, 检测和修改它本身状态或行为的一种能力.
            // 与Java类似.

            /* 属性 */
            // 属性(Property): 属性指类, 结构 和 接口的命名成员.
            // 类似Kotlin. 可以为1个属性(Property)定义 Get访问器 和 Set访问器. (C#中的幕后字段为value而不是field)
            // 此外, C#也支持 抽象属性(Abstract Property).
            // 抽象属性(Abstract Property): 这些属性在父类定义, 要求派生类实现. 

            /* 索引器 */
            // 索引器(Indexer): 索引器允许一个对象可以像数组一样用下标的方式来访问.
            // C#中索引器的声明方式有点类似 属性(Property). 
            // 实际上, 索引器 有些类似 C++的中括号运算符的重载.

            /* 委托 */
            // 委托(Delegate): 类似C和C++中的函数指针. 委托是存有对某个方法的引用的一种引用类型变量.
            // 委托 可用于 实现事件 和 回调方法, 所有的委托继承自 System.Delegate
            // 声明 委托类型: delegate <return type> <delegate-name> <parameter list>
            // 在声明完委托类型后, 可使用new关键字来创建 委托对象 (并将 委托函数 作为参数传入).
            /*
            // 声明委托类型
            delegate int NumberChanger(int n);

            // 创建委托对象
            NumberChanger nc1 = new NumberChanger(AddNum);
            NumberChanger nc2 = new NumberChanger(MultNum);
            */

            // 委托的多播(Multicasting of a Delegate): 相同类型的委托对象可以用 加号运算符 来合并. 一个合并委托会调用它所合并的2个委托.
            /*
            // 创建委托实例
            NumberChanger nc;
            NumberChanger nc1 = new NumberChanger(AddNum);
            NumberChanger nc2 = new NumberChanger(MultNum);

            // 创建多播
            nc = nc1;
            nc += nc2;
             */

            /* 事件 */
            // C#中使用 事件机制 来实现 线程间的通信
            // 类似观察者模式, 使用 发布-订阅模型(Publisher-Subscriber Model)
            // 发布器(Publisher): 一个包含 事件 和 委托类型 的对象
            // 订阅器(Subscriber): 一个 接受事件 并提供 事件处理程序 的对象
            // 发布器类中的 委托 调用订阅器类中的方法(即 事件处理程序)
            /*
             // 定义 委托类型
             public delegate void NumberChangeHandler();

             // 基于 委托类型 定义 事件
             public event NumberChangeHandler NumberChangeEvent;

             // 注册 事件的监听器
             numberChangeEvent += new NumberChangeHandler(委托方法);

             // 触发 事件
             NumberChangeEvent();
             */

            /* 集合 (Collection) */
            // 与Java类似

            /* 泛型  */
            // 泛型(Generic): 泛型允许 延迟编写类或方法中的编程元素的数据类型, 直到运行时. (泛化 数据类型)
            // 虽然C#的泛型格式与Java类似, 但C#的泛型属于真泛型, 不存在类似Java的泛型擦除现象.

            /* 匿名方法 */
            // 匿名方法(Anonymous Method): 提供了一种传递 代码块 作为 委托参数 的技术.

            /* 不安全代码 */
            // 处于安全考虑, C#中有关指针的操作必须在 不安全代码块(Unsafe Block) 中执行.

            /* 多线程 */
            // 在C#中, 没有Runnable接口, 而是通过 ThreadStart代理来代替.

        }
    }
}
```