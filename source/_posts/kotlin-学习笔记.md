---
title: Kotlin - 学习笔记
tags:
  - Kotlin
id: '784'
categories:
  - - uncategorized
date: 2021-07-27 22:57:28
---

# Kotlin Study Note

```kotlin
// Kotlin源文件 不需要放在 相匹配的目录或包下, 源文件可以放在任何文件目录
package basics

import java.awt.event.MouseAdapter
import java.awt.event.MouseEvent
import javax.swing.JComponent

// 声明一个对象
object AnObject {

}


// Kotlin的main函数的参数列表可空, 也可写入参数
fun main(args: Array<String>) {

    /** 函数 **/
    // Kotlin的函数定义风格类似Rust, 但使用:符号来引出返回类型
    // 在Kotlin中, 函数属于 第一等公民(First Class)
    fun sum(a: Int, b: Int):Int {
        return a + b
    }

    // Kotlin支持对函数的返回类型 进行 自动类型推断
    // 例外: public方法要求必须手动指明返回值类型
    fun sum2(a:Int, b: Int) = a + b

    // Kotlin中的Unit类型代表 无返回值, 相当于Java中的void

    // Kotlin支持 可变长参数, 使用 vararg关键字进行标识.
    fun vars(vararg values: Int) {
        for (value in values) {
            print(value)
        }
    }

    // Kotlin支持lambda表达式
    val sumLambda: (Int, Int) -> Int = {x, y -> x + y}
    println(sumLambda(1,2))

    // Kotlin中的变量和常量的定义
    // var: 可变变量
    // val: 不可变变量
    // 可以在定义变量或常量时指定类型, 也可以利用 自动类型推断 来省略类型书写
    var aVar: Int = 100
    val aVal: Int = 100

    /** 行注释 和 块注释 **/

    // Kotlin的块注释支持嵌套
    /*
    /*
    It's ok.
     */
     */

    /** 字符串模板 **/

    // Kotlin支持字符串模板
    var a = 1
    println("a is $a");
    println("1 + 2 = ${1+2}")

    /** 空安全 **/

    // Kotlin采用 空安全设计
    // 空安全设计: 对于可能为空的参数, 在使用前要进行判空.
    // Kotlin提供2种处理方式:
    // 方式1: 字段后天就 !!, 则行为与Java相同, 抛出空异常
    // 方式2: 字段后加 ?, 可不做处理返回值为 null 或 配合?: 做空判断处理

    // 字段类型后加?表示可空
    var field1: String? = "23"

    // 加!!表示行为与Java一样, 抛出NPE
    var field2 = field1!!.toInt()

    // 加 ? 表示不作处理, 直接返回null
    var field3 = field1?.toInt();

    // 此外, 可以采用 ?: 来为 空值 提供默认值
    // 下面语句在 field1 为空时, 返回-1
    var field4 = field1?.toInt() ?: -1

    // 当一个引用可能为空时, 对应的类型声明必须使用 ? 进行标记
    fun parseInt(str: String) :Int? {
        // do something.
        return null
    }

    /* 类型检测 和 自动类型转换 */
    // Kotlin提供 is运算符 来判断 表达式是否属于某个类型的实例, 这类似于Jva中的instanceof
    fun getStringLength(obj: Any): Int? {
        if (obj is String) {
            // 在配合if使用过is运算符后, Kotlin会自动对obj进行类型转换
            return obj.length;
        }

        // 在这里的obj仍然属于 Any类型的引用
        return null
    }

    // 同理, if和!is搭配使用 也会让Kotlin自动对obj进行类型转换

    /** 区间 **/
    // 输出1234 (注意: 在Kotlin中, 区间是闭区间, 而不是左闭右开区间)
    for (i in 1..4) print(i)

    // 区间可以配合 step 来指定步长
    for (i in 1..100 step 2) print(i)

    // 当然, 如果需要使用更为常见的区间形式: 左闭右开区间, 则可以使用until
    for (i in 1 until 4) print(i) // 输出123

    /** 基本数据类型 **/
    // 与Java不同, 在Kotlin中, 字符不属于数值类型.
    // 在Kotlin中, 不存在 基础数据类型, 只有 封装的数字类型.
    // 你每定义的一个变量, Kotlin都会帮你封装一个对象. (这样可以保证不会出现空指针)

    // 对于数字类型的对象, 在比较时要注意区分: 比较数字大小 和 比较对象相等
    // 在Kotlin中, === 代表比较对象的地址, == 代表比较对象的数值的大小

    // 使用已有的数字对象来赋值时, Kotlin会进行 自动装箱, 将 数字的值拷贝过去, 封装为新对象.
    println()
    var existNum: Int = 100
    var anotherNum: Int = existNum // 此处发生了 自动装箱, 并不是传递对象引用.
    println("existNum == anotherNum: ${existNum == anotherNum}") // true

    // 在高版本的Kotlin中, 对于Int的===比较将被废除. (此处表现的行为和 == 相同)
    // 虽然此处 === 结果为true, 但实际上, existNum 和 anotherNum 的地址是不同的
    println("existNum === anotherNum: ${existNum === anotherNum}") // true

    // 从下面的例子可以看出, 通过修改existNum, 并不会影响到 anotherNum
    // 由此也可证明, 数字类型对象 在赋值时会经过 自动装箱, 构造新的数字对象, 而不是直接传递原有的引用.
    existNum = 200
    println("after modify existNum, existNum = $existNum") // 200
    println("after modify existNum, anotherNum = $anotherNum") // 100

    // 在Kotlin中, 较小的类型 并不是 较大的类型 的子类
    // 也就是说, 类似的 Byte 不能被隐式转换为 Int
    var byteVar: Byte = 1
//    var intVar: Int = byteVar 编译错误

    // 但是, 在参与 运算表达式 的时候, Kotlin会自动进行 类型的转化.
    var longResult = 1L + 3 // Long + Int = Long

    // Kotlin和Java一样, 也支持 位操作符
    //    shl(bits) – 左移位 (Java’s <<)
    //    shr(bits) – 右移位 (Java’s >>)
    //    ushr(bits) – 无符号右移位 (Java’s >>>)
    //    and(bits) – 与
    //    or(bits) – 或
    //    xor(bits) – 异或
    //    inv() – 反向

    // Kotlin中的 字符Char 不能直接与 数字进行操作, 需要进行转化.
    var numChar: Char = '3'
    var numIntFromChar: Int = numChar.toInt() - '0'.toInt()

    // Kotlin的数组采用 Array类 来实现

    // 创建方法1: arrayOf()函数
    var arr1 = arrayOf(1, 2, 3, 4, 5) // [1, 2, 3, 4, 5]

    // 创建方法2: 工厂函数
    var arr2 = Array(3) { i -> (i * 2) } // [0, 2, 4]

    // 注意: 与Java不同的是, Kotlin中的数组是 不可协变的 (Invariant)

    // 在 字符串 方面, Kotlin提供了 String类
    // 此外, Kotlin提供 多行字符串 支持, 使用3个引号 括起来的字符串 即为多行字符串
    var multiLineText = """
        第一行
        第二行
        第三行
    """.trimIndent()

    /** 条件控制 **/
    // Kotlin的If语句和Java相同
    // Kotlin本身不支持 三目运算符, 但我们可以模拟实现一个:
    // var c = if (condition) a else b

    // 可以使用 if in语句来判断 某个值 是否属于 某个区间
    var x = 5
    if (x in 1..24) {
        println("x 属于区间")
    }

    // Kotlin中的 When表达式 类似于Java中的 Switch语句
    when (x) {
        1 -> println("x == 1")
        2 -> println("x == 2")
        else -> println("x belongs to other num")
    }

    // 如果有 多个分支 的处理方式相同, 则可用 逗号 来分隔这些分支.
    when (x) {
        1, 2 -> println("x is 1 or 2")
    }

    // 此外, Kotlin的 when语句 可以配合 区间in 和 !in 使用
    when (x) {
        in 1..10 -> println("x is in the range")
    }

    /** 循环控制 **/

    // 在Kotlin中支持Foreach语句, 使用 for in 即可
    // Kotlin支持 while 和 do while

    // Kotlin中支持 Break标签 和 Continue标签
    // break标签: 跳转到 该标签指定的循环的后面的执行点
    // continue标签: 继续 该标签指定的循环的下一次迭代
    // 实际上, Kotlin中的任何表达 都可以使用 标签 (@符号) 来标记
    sayHello@ println("Hello");

    // Kotlin中存在 函数字面量, 局部函数 和 对象表达式, 因此, Kotlin的函数是可以被嵌套的 (函数是第一等公民)
    // 通过使用 标签限制的return, 我们可以直接从 外层函数返回

    /*
    fun foo() {
        ints.forEach {
            // 通过 抱歉限制的return, 使得 该lambda表达式中的return从lambda表达式中返回
            if (it == 0) return@forEach
            print(it)
        }
    }

     */

    // 此外, 也可以使用1个匿名函数 来代替 lambda表达式. (匿名函数内部的return语句 将从 该匿名函数自身 返回)
    /*
    fun foo() {
    ints.forEach(fun(value: Int) {
        // 使用匿名函数
        if (value == 0) return
        print(value)
    })
     */

    /** 类和对象 **/

    // Kotlin中提供对 类Class 的比较完善的支持
    // Kotlin的类Class声明方式与Java相同
    // 但请注意, Kotlin中没有 new关键字, 在创建类实例对象时, 与C++更类似
    class AClass {
        var name: String = "default"
    }
    var obj1 = AClass()

    // Kotlin中的类可以拥有 1个主构造器(写在类的头部) 和 多个次构造器
    // 注意: 当主构造器 没有 任何注解 或 可见修饰符 时, 可省略constructor关键字
    class BClass constructor(var name: String) {

    }
    var obj2 = BClass("Alice")

    // Kotlin中支持为 类属性 绑定getter和setter (类似于 操作符重载)
    class CClass {
        var name: String = "default"
            get() {
                return field // 后端字段(Backing Field)机制
            }
            set(value) {
                field = value
                println("I know you set the field to: $value")
            }

    }

    var obj3 = CClass()
    obj3.name = "李四"

    // 在Kotlin的类中, 非空属性 必须在定义的时候进行初始化. (但是可以通过 lateinit关键字 来延迟初始化)
    class DClass {
        lateinit var name: String
    }

    // Kotlin提供 初始化代码块支持, 使用init关键字作为前缀. (这类似于Java中的构造代码块)
    class EClass{
        init {
            println("Hi, init()")
        }
    }
    var obj4 = EClass()

    // Kotlin的类中允许多个 次构造器, 使用 constructor关键字
    class FClass {
        constructor() {
            println("Hi, constructor()")
        }
    }
    var obj5 = FClass()

    // 构造器之间的方法与Java一样, 使用this关键字

```

```kotlin
// 注意: 在JVM虚拟机中, 如果 主构造函数的所有参数都有默认值, 则编译器会生成一个 附加的无惨构造函数, 该构造函数会直接使用默认值
// 上述特性使得Kotlin更容易通过 无惨构造函数 来创建类的实例
// Kotlin中同样也支持抽象类, 在class前加入abstract关键字即可

// Kotlin中也支持 嵌套类, 用法和Java一样

// Kotlin中也支持 内部类, 用法和Java一样
// 1. 内部类会带有1个对外部类的对象的引用
// 2. 所有的内部类 都可以访问 外部类的成员属性和成员函数
// 在 内部类 可以通过 this@Outer 来获取 该内部类的外部类的对象实例

// 在Kotlin中, 可以使用 对象表达式 来创建 匿名内部类

/*
Kotlin的 类属性修饰符
    abstract    // 抽象类
    final       // 类不可继承 (类的默认属性)
    enum        // 枚举类
    open        // 类可继承
    annotation  // 注解类

Kotlin的访问权限修饰符 (与Java类似)
    private    // 仅同文件可见
    protected  // 同文件 或 子类 可见
    public     // 所有调用的地方可见
    internal   // 同模块可见
 */

/** 继承 **/
// Kotlin中所有类都继承自Any类 (类似Java的Object类)

// 如果子类没有构造函数, 则必须在 次构造函数 中通过 super来初始化基类

// Kotlin中的重写(Override)要求:
// 1. 基类被open修饰
// 2. 子类的重写方法被override修饰

// Kotlin中是支持 多继承 的, 如果通过多继承, 子类得到多个相同的方法, 则子类必须要对这些方法进行重写.

// Kotlin支持 属性重写, 但属性必须具有兼容类型.
// 父类中每个声明的属性 都可以通过 初始化程序 或 getter方法 进行重写.

/** 接口 **/
// Kotlin的接口与Java类似, 使用interface关键字定义, 允许接口的方法有默认实现
// 注意: 接口中的属性只能是抽象的, 不允许 初始化值. (接口不会保存属性值, 实现接口时必须 重写属性)

/** 拓展 **/
// Kotlin支持为 类的属性和方法 进行静态拓展 (不需要使用 装饰着模式)

// 对类进行 拓展函数 可以在 已有类中添加新的方法, 但不会对 原类 做出修改. (类似 Go语言的接收者对象Receiver Object)
class Book {

}

var book = Book()

// 在对类进行拓展之后
fun Book.getCost() : Double {
    return 80.0
}
book.getCost();

// Kotlin中的拓展是静态拓展, 在调用拓展函数时, 具体被调用的函数 取决于 调用函数的对象表达式 (而不是动态类型)
open class SuperClass
class SubClass : SuperClass()
fun SuperClass.say() = "I'm super class."
fun SubClass.say() = "I'm sub class."
fun saySomething(superClass: SuperClass) {
    println(superClass.say()) // 在继承情况下, 调用拓展函数时, 具体被调用的函数 取决于 调用函数的对象表达式
}
saySomething(SubClass()) // I'm super class.

// 当 一个类的拓展含 和 类的成员函数 相同时, Kotlin会优先使用 成员函数

// 在 拓展函数 中, 可以通过 this 来判断 接收者对象 是否为null
// 即使 接收者 为null, 也可以调用 拓展函数
fun Any?.doSomeStuff() {
    println("do some stuff.")
}
null.doSomeStuff() // It's OK.

// 除了 拓展函数, Kotlin也支持 拓展属性
// 拓展属性 必须定义在 类 或 Kotlin文件 中, 不允许定义在函数内.
// 拓展属性 不允许带有 初始化器

// 同理, 如果 某个类拥有伴生对象, 则你也可以通过 类名.Companion 的方式来为 伴生对象 进行拓展.

// 拓展的作用域: 通常来说, 拓展 会定义在 顶级包 中. 可以通过import导入包的方式来使用拓展.

// Kotlin支持在 一个类 中为 另一个类 进行拓展.
// 在这样的拓展中, 如果存在 多个隐含的接收者: 则 拓展方法定义所在的类的实例 为 分发接收者, 拓展方法的目标类型的实例 为 拓展接收者

// Kotlin规定: 在调用某个函数时, 如果该函数在 分发接收者 和 拓展接收者 中均存在, 则优先使用 拓展接收者. (如果要使用 分发接收者 可以通过 this语法)
class ExpandA {
    fun bar() {println("ExpandA bar")}
}

class ExpandB {
    // 分发接收者 ExpandB 中 存在 与 拓展接收者 ExpandA 相同的函数
    fun bar() {println("ExpandB bar")}

    fun ExpandA.foo() {
        bar() // 优先调用 拓展接收者ExpandA 中的函数
        this@ExpandB.bar() // 通过 this语句 来调用 分发接收者ExpandB 中的函数
    }

    fun caller(expandA: ExpandA) {
        expandA.foo();
    }

}

var expandA = ExpandA()
var expandB = ExpandB()
expandB.caller(expandA) // Output: ExpandA bar \n ExpandB bar

// 在Kotlin中, 以成员形式定义的拓展函数 可以声明为open, 且在子类中可以被覆盖.
// 也就是说, 这类拓展函数的派发过程中: 对于 分发接收者 是虚拟解析, 对于 拓展接收者 是静态解析.
    open class D {
    }

    class SubOfD : D() {
    }

    open class C {
        open fun D.foo() {
            println("D.foo in C")
        }

        open fun SubOfD.foo() {
            println("SubOfD.foo in C")
        }

        fun caller(d: D) {
            d.foo()   // 调用扩展函数
        }
    }

    class SubOfC : C() {
        override fun D.foo() {
            println("D.foo in SubOfC")
        }

        override fun SubOfD.foo() {
            println("SubOfD.foo in SubOfC")
        }
    }

C().caller(D())   // 输出 "D.foo in C"
SubOfC().caller(D())  // 输出 "D.foo in SubOfC" —— 分发接收者虚拟解析
C().caller(SubOfD())  // 输出 "D.foo in C" —— 扩展接收者静态解析

/** 数据类与密封类 **/
// Kotlin中支持快速创建数据类型, 只需要使用 data class 关键字即可
data class User(var name: String, var age: Int)
var user = User("Alive", 300)

// 编译器会自动机构根据 Data类 中的 主构造函数 声明的属性. 自动生成(若未定义): equals(), toString(), componentN(), copy()
// 数据类 不可以声明为 abstract, open, sealed 或 inner
// 数据类 也不能 继承其他类, 但可以实现接口

// 密封类: 用于表示 受限的类继承结构, 当一个值为 有限几种类型, 且不能有其他类型时.
// 密封类有点类似于枚举类, 但是米鞥类的子类可以有 多个可包含状态的实例.
// 使用 sealed class 即可声明 密封类
// 密封类可以有子类, 但所有的子类 必须要内嵌在密封类中
// 与枚举类类似, 密封类可以与 when表达式 搭配进行使用.

/** 泛型 **/
// 与Java一样, Kotlin也支持泛型.
// 泛型: 即 参数化类型, 泛型可以用在 类, 接口 和 方法上

// 与Java一样, Kotlin也支持 泛型约束 (Kotlin使用 上界约束条件)
fun <T : Comparable<T>> sort(list: List<T>) {
    // Do something.
}
// 默认情况下, Kotlin的 泛型约束 为 Any?
// 对于多个 上界约束条件, 可以使用 where子句
fun <T> copyWhenGreater(list: List<T>, threshold: T): List<String>
        where T : CharSequence,
              T : Comparable<T> {
    return list.filter { it > threshold }.map { it.toString() }
}

// Kotlin中没有 通配符类型, 但是有类似想2个东西: 声明处型变 和 类型投影
// 1. 声明处型变 (Declaration-Site Variance): 声明处的类型变异使用 协变注解修饰符 (消费者 in, 生产者 out)

// 生产者 out 使得 一个类型参数协变, 协变类型参数 只能用于输出. (可以用于 返回值类型, 但无法作为 入参的类型)
class QClass<out A>(val q: A) {
    fun foo(): A {
        return q
    }
}

// 消费者 in 使得 一个类型参数逆变, 逆变类型参数 只能用于输入. (可以作为 入参的类型, 但无法作为返回值的类型)
class WClass<in A>(w: A) {
    fun foo(w: A) {
    }
}

// 2. 类型投影 (Type Projections):
// Kotlin的类型投影提供星号影射 (*代表所有类型, 相当于 Any?), 这与Java的 原生类型 (Raw Type)非常类似.

/** 枚举类 **/
// Kotlin支持枚举类, 用法和Java一样.
// 但Kotlin中的枚举类支持声明自己的匿名类, 方法 以及覆盖基类的方法.
/*
enum class ProtocolState {
    WAITING {
        override fun signal() = TALKING
    },
    TALKING {
        override fun signal() = WAITING
    };

    abstract fun signal(): ProtocolState
}*/

/** 对象表达式 和 对象声明 **/
// Kotlin中使用对象表达式 和 对象声明 来创建一个对某个类做了轻微改动的类的对象, 且不需要声明新的子类.
fun countClicks(window: JComponent) {
    var clickCount = 0
    var enterCount = 0

    // 使用 object关键字 来完成 对象声明
    window.addMouseListener(object : MouseAdapter() {
        override fun mouseClicked(e: MouseEvent) {
            clickCount++
        }

        override fun mouseEntered(e: MouseEvent) {
            enterCount++
        }
    })
}

// 在Kotlin中, 我们可以通过使用 object关键字 来声明一个对象, 并获得1个单例
var anObject1 = AnObject
var anObject2 = AnObject
println("anObject1 === anObject2: ${anObject1 === anObject2}") // true

// 注意: 与 对象表达式 不同, 当对象声明在另一个类的内部时, 该对象不能通过 外部类的实例 访问到 该对象.
// 而只能通过该类名来访问. 同样地, 该对象也不能直接访问到 外部类的方法和变量.

// 伴生对象: 类内部的对象声明 可以使用 companion关键字 进行标记, 这样它就可以与 外部类 关联在一起. (我们就可以直接通过外部类来访问 对象的内部元素)
/*
class MyClass {
    companion object Factory {
        fun create(): MyClass = MyClass()
    }
}

val instance = MyClass.create()   // 访问到对象的内部元素 */

// 注意: 一个类里面只能声明1个 内部关联对象.
// 注意: 伴生对象的成员看起来有点像其他语言的静态成员, 但在运行时, 他们仍然是真实对象的实例成员.
// 注意: 伴生对象的初始化是 在相应的类被加载(解析)时进行, 与 Java 静态初始化器的语义相匹配.

/** 委托 **/
// 委托模式: 当有2个对象参与处理同一个请求时, 接受请求的对象 将请求 委托给 另一个对象来处理. (即: 1个类中定义的方法实际上是调用另一个类的对象的方法来实现的)
// Kotlin直接支持委托模式, 通过关键字by来实现委托
/*
// 创建接口
interface Base {
    fun print()
}

// 实现此接口的 被委托的类
class BaseImpl(val x: Int) : Base {
    override fun print() { print(x) }
}

// 通过关键字 by 建立委托类: 编译器会将b保存在Derived的对象实例内部, 且自动生成继承自Base接口的所有方法, 并转发给b.
class Derived(b: Base) : Base by b

fun main(args: Array<String>) {
    val b = BaseImpl(10)
    Derived(b).print() // 输出 10
}
 */

// Kotlin也支持 属性委托.
// 属性委托: 1个类的某个属性值 不是在类中直接进行定义, 而是将其 委托 给1个代理类, 从而实现对该类的属性的统一管理.
// 属性委托语法格式: var/val <属性名>: <类型> by <委托代理类>
/*
import kotlin.reflect.KProperty
// 定义包含属性委托的类
class Example {
    var p: String by Delegate()
}

// 委托的类
class Delegate {
    operator fun getValue(thisRef: Any?, property: KProperty<*>): String {
        return "$thisRef, 这里委托了 ${property.name} 属性"
    }

    operator fun setValue(thisRef: Any?, property: KProperty<*>, value: String) {
        println("$thisRef 的 ${property.name} 属性赋值为 $value")
    }
}
fun main(args: Array<String>) {
    val e = Example()
    println(e.p)     // 访问该属性，调用 getValue() 函数

    e.p = "Hello"   // 调用 setValue() 函数
    println(e.p)
}
 */

// Kotlin的标准库中已经内置了很多的工厂方法来实现属性的委托: 常见的委托属性如 Lazy (只在第一次调用执行某些代码), Observable, Not Null等.
// 当然, Kotlin也支持为 局部变量 声明委托属性.
// 翻译规则: 对于各个 属性委托, Kotlin在背后会自动生成相应的代码 (通过Getter和Setter原理)

// 提供委托: 通过定义 provideDelegate操作符, 可以拓展 创建属性实现所委托对象的逻辑.
/*
class ResourceLoader<T>(id: ResourceID<T>) {
operator fun provideDelegate(
        thisRef: MyUI,
        prop: KProperty<*>
): ReadOnlyProperty<MyUI, T> {
    checkProperty(thisRef, prop.name)
    // 创建委托
}

private fun checkProperty(thisRef: MyUI, name: String) { …… }

fun <T> bindResource(id: ResourceID<T>): ResourceLoader<T> { …… }

class MyUI {
    val image by bindResource(ResourceID.image_id)
    val text by bindResource(ResourceID.text_id)
}
 */

// 注意: provideDelegate方法只影响 辅助属性 的创建, 并不会影响为Getter/Setter生成的代码.
}
```