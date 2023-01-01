---
title: Rust - 学习笔记
tags:
  - Rust
id: '775'
categories:
  - - uncategorized
date: 2021-07-27 01:05:00
---

# Rust Study Note

```rust
// 使用use关键字能将 模块标识符 引入 当前作用域
use crate::saygoodbye_mod::sayGoodbye;
use std::fs::File;
use std::{io, fs, thread};
use std::io::{Read, stdin};
use std::time::Duration;
use std::sync::mpsc;

mod saygoodbye_mod;

// 描述 mod 的树状结构
fn foo() {
    // Rust语言的函数书写格式非常常规
    // 同时Rust支持在任何地方书写函数
    // Rust要求函数的参数列表必须声明 参数名称 和 参数类型
    fn innerFoo(x: i32) {
        println!("the value of x: {}", x);
    }

}

fn main() {

    // The println isn't a function.
    // So, we should add '!' to use it.
    println!("Hello, world!");

    // 变量: 我们可以使用let来定义变量, Rust会进行自动类型推断
    let a = 100;
    // 但是, 默认情况下let创建的是 不可变变量
    // 我们无法修改这个变量的值
    // a = 200

    // 如果要创建可变变量, 则需要使用 let mut
    let mut b = 100;
    b = 200;

    // 不可变变量 与 常量 不同
    // 在Rust中, 不可变变量可以被重新绑定, 但常量不可以.
    // 我们把这种 重新绑定 称为 重影(Shadowing)
    // 即: 变量的名称可以被重新使用的机制 为 重影, 重影时变量的类型, 可变属性和值都可以变化
    let  c = 123;
    let c = 456;

    // 虽然Rust可以自动类型推断, 但是也可以手动指定变量的类型
    let d: i32 = 100;

    // 重影时并不会重置变量的旧值
    let e = 5;
    let e = e + 100;
    println!("the value of e = {}", e);

    // 在Rust中, 没有 自增运算符/自减运算符, 但可以改变写法.
    let mut f = 3;
    f += 1;
    f -= 1;

    // 除了基本变量之外, Rust中可以使用 复合类型 元组.
    // 在Rust中, 元组属于基本类型, 使用 值传递
    let tup: (i32, f64, u8) = (500, 6.4, 1);

    // Rust中同样也支持数组.
    let g = [1, 2, 3, 4, 5];
    let h: [i32; 5] = [1, 2, 3, 4, 5];

    // 可以在创建数组时使用指定值来填充
    let l = [3; 5]; // 数组包含5个元素3

    // 此外, 数组也受mut影响, 如果后续要修改数组, 则数组要用mut修饰.

    // 在Rust中, 使用3个斜杠作为 文档注释 的开头.
    // 在文档注释中, 支持使用Markdown语法
    /// This is a documentation comment.

    // Rust 支持使用 大括号 编写 复杂的表达式
    let m = 5;
    let n = {
        let m = 3;
        // 函数体表达式: 由大括号引出的块中, 复杂表达式返回的值 即为 最后一个表达式的返回值
        m + 1
    };
    println!("m = {}", m);
    println!("n = {}", n);

    // Rust的函数使用 -> 来声明返回值
    fn add(a: i32, b: i32) -> i32 {
        return a + b;
    }

    // Rust的 If语句 与 Go语言相似.
    // Rust不支持 bool 和 整数 的自动转换
    let x = 95;
    if x >= 90 {
        println!("成绩优秀");
    }

    // 三目运算符: 在Rust中可以使用 函数体表达式 来模拟 三目运算符
    let number = if a > 0 {1} else {-1};

    // Rust中支持 while语句 和for语句
    // 同时, for语句也支持foreach. 只需要使用 for in即可
    let a = [10, 20, 30, 40, 50];
    for i in a {
        println!("value: {}", i);
    }

    // 也可以使用下标来访问数组
    for i in 0..5 {
        println!("a[{}] = {}", i, a[i]);
    }

    // Rust语言额外提供了 无限循环语句 loop语句
    loop {
        // Endless loop will break here.
        break;
    }

    // loop语句可以通过 break语句来 返回值
    let result = loop {
        break 200;
    };

    // Rust中引入了 所有权机制
    // 所有权规则:
    // 1. Rust中的每一个值 都有一个变量, 称为该值的 所有者
    // 2. 每个值一次只能有1个 所有者
    // 3. 当值的所有者不在程序运行范围时, 该值会被删除

    // Rust中, 变量与数据的交互方式有2种: 移动Move 和 克隆Clone
    // 当s1被赋值给s2时, 此时s1将立即失效. (s1 移动给了 s2)
    let s1 = String::from("hello");
    let s2 = s1;
    // println!("s1 = {}", s1);
    println!("s2 = {}", s2);
    // 如果需要让s1和s2各在堆内存中持有1份数据, 则需要使用克隆
    let s3 = s2.clone();
    println!("s3 = {}", s3);

    // 对于非基本类型: 当变量被当做参数传给函数时, 也会发生 移动Move
    // 被当做函数返回值的变量的所有权 会被 移动出函数, 并将 所有权 返回到调用函数的地方 (而不是直接被无效而释放内存)

    // 可以使用 &运算符 来获取 变量的引用, 使用引用 不会导致 移动Move.
    // 引用: 不会获得值的所有权, 但是能 租借(Borrow)值的所有权. (引用不具有 所指向的值的所有权, 但是具有 使用权)
    // 引用本身也是一个类型, 并且引用具有一个值 (该值即为 别的值所在的位置), 但引用不具有 所指向的值的所有权.

    // 如果 1个引用 在租借所有权的期间, 该引用所指向的值的所有权发生了移动, 则该引用应当重新进行租借.
    let s1 = String::from("hello");
    let mut s2 = &s1;
    // s1的所有权 移动到 s1
    let s3 = s1;
    // 此时, s2引用 需要重新租借所有权
    s2 = &s3;
    println!("the value of s2: {}", s2);

    // 通过引用无法修改所有者的值. (除非 所有者的值 允许引用修改)
    let mut s1 = String::from("run");
    let s2 = &mut s1;
    s2.push_str("ok");
    println!("the value of s2: {}", s2);

    // 可变引用 不允许 多重引用(即所有者的值 可以被多次引用), 但 不可变引用 允许.
    let s = String::from("hello");
    let r1 = &s;
    let r2 = &s;

    // 切片: 指对 数据值的部分引用.
    let s = String::from("broadcat");
    // 0..5 其实相当于其他语言的 0:5
    let part = &s[0..5];
    println!("slice = {}", part);

    // 在Rust中, 字符串切片 的类型为 &str.
    // Rust中的字符串常量的类型也为 &str
    // Rust中存在2种字符串类型: str 和 String
    // 切片不仅仅适用于字符串, 还适用于某些 线性数据结构, 如数组.

    // Rust语言支持结构体struct, 通过如下方式 定义结构体类型
    #[derive(Debug)]
    struct Person {
        name: String,
        age: i32
    }

    // 通过Key-Value方式来创建 结构体实例
    let zhangsan = Person {
        name: String::from("张三"),
        age: 20
    };

    // 可以使用 与 结构体属性名 同名的 变量名 来快速给结构体赋值
    let name = String::from("张三");
    let zhangsan = Person {
        name, // 相当于 name = "name"
        age: 20
    };

    // 可以使用 现有的结构体 来快速对新建的结构体 进行赋值
    let lisi = Person{
        name: String::from("李四"),
        ..zhangsan
    };

    // 出于方便考虑, 你也可以使用 元组结构体
    // 元组结构体: 具有固定的名称 和 固定的类型格式
    struct Color(u8, u8, u8);
    let black = Color(0, 0, 0);

    // 对于结构体struct, 它必须同时掌握 所有字段的所有权
    // 因此, 对于结构体, 更推荐使用 String类型来代替 &str
    // 如果要在结构体中定义 引用型字段, 则需要通过"生命周期"机制来实现.

    // Rust提供了对 结构体输出的快捷方法
    // 需要导入 #[derive(Debug)]
    println!("{:?}", lisi);

    // Rust不是面向对象语言, 但是可以采用面向对象思想来编程
    impl Person {

        // 结构体方法 (Struct Method): Rust支持给结构体struct绑定方法, 同时Rust强制要求该方法的第一个参数为&self
        fn get_name(&self) -> String {
            return self.name.clone();
        }

        // 结构体函数 (Struct Function): 结构体函数与具体的结构体实例没关联, 不需要&self参数, 但需要声明属于哪一个结构体
        fn say_hi() {
            println!("Hi");
        }
        // 同时, 必须使用Person::say_hi();来调用, 不可以使用具体的结构体实例来调用.

    }
    println!("the name of person: {}", lisi.get_name());

    // Rust也支持枚举类
    #[derive(Debug)]
    enum Book {
        Papery, Electronic
    }
    println!("{:?}", Book::Papery);

    // Rust也支持为 枚举元素 绑定 元组属性描述.
    // 当然, 也可以使用 结构体语法 来绑定属性描述
    enum Animal {
        Dog {age: i32}, Cat {name: String}
    }

    // 通过 match语法 可以处理枚举类
    let animal = Animal::Cat {name: String::from("花花")};
    match animal {
        Animal::Dog {age} => {
            println!("Dog: age = {}", age);
        },
        Animal::Cat {name} => {
            println!("Cat: name = {}", name);
        }
    }

    // match语法除了可以处理 枚举类外, 还可以处理整数, 浮点数, 字符和字符串切片引用

    // Rust语言不支持null, 但可以使用Option枚举类 (配合match来进行判空)
    let opt = Option::Some("Hello");
    // 当使用Option::None的时候, 必须帮助编译器手动指出 空值所关联的类型.
    let opt: Option<&str> = Option::None;

    // Option还是一个特殊的枚举类, 它可以在match中进行 含值的分支选择
    let t = Some(64);
    match t {
        Some(64) => println!("Yes"),
        _ => println!("No"),
    }

    // 对于 只有2种情况的match语法, 可以使用 if let语法 来简化
    let i = 0;
    if let 0 = i {
        println!("zero");
    }

    // Rust的组织管理中存在3个重要概念: 箱, 包, 模块

    // 箱 (Crate) 是二进制程序文件 或 库文件, 存放在 包 中
    // "箱"是树状结构的, 树根是 编译器开始运行时 编译的源文件所编译的程序

    // 包 (Package) 是 工程是实质, 包必须由Cargo.toml文件来管理
    // Cargo.toml文件描述了 包的基本信息 以及 依赖项
    // 1个包 最多包含1个 库"箱", 但可以包含任意数量的 二进制"箱", 且至少包含1个箱
    // Cargo默认将 main.rs文件 作为 二进制箱的跟, 编译之后的二进制箱 与 包名相同

    // 模块 (Module) 是 Rust中的组织单位
    // Rust中使用的路径分隔符是::

    // Rust中的绝对路径从 crate关键字开始描述

    // Rust的访问权限分为 公开public 和 私有private
    // 默认情况下, 模块中的成员访问权 是 私有的

    // 如果模块中定义了结构体struct, 则结构体本身 和 结构体内的字段 均是私有的.
    // Rust中的模块Module有点类似Java中的类包装

    // 通过mod方式来引入其他文件的函数
    saygoodbye_mod::sayGoodbye();

    // Rust中的 导入语句 为 use
    // 使用use关键字能将 模块标识符 引入 当前作用域
    sayGoodbye();

    // 当然, 如果出现2个相同名称的冲突情况, 则需要使用 use .. as ...

    // Rust中的错误处理不使用try机制.
    // Rust中的错误分为: 不可恢复错误 和 可恢复错误

    // 不可恢复错误: panic!宏

    // 可恢复错误: Rust中可能产生异常的函数的返回值均为Result类型.
    // 在这点上与Go语言处理异常有点类似.
    /*
    enum Result<T, E> {
    Ok(T),
    Err(E),
    }
     */
    let f = File::open("hello.txt");
    match f {
        Ok(file) => {
            println!("file open successfully.");
        },
        Err(err) => {
            println!("failed to open the file.");
        }
    }

   /*
   我们可以使用 if let语法 来简化 只有2种情况的match语法
   if let Ok(file) = f {
        println!("File opened successfully.");
    } else {
        println!("Failed to open the file.");
    }
     */

    // 使用 unwrap()和expect()均可以将 可恢复错误 当做 不可恢复错误 来处理
    // 调用这2个方法均会调用 panic!宏

    // Rust中可以通过在 Result对象后添加 ?操作符 来将 同类的Err直接传递出去
    // ?操作符: 将Result类 非异常的值取出, 如果有异常则将 异常的Result返回出去(故 ?操作符 仅适用于 返回值类型为Result<T, E>的函数)

    // 可以通过 Err.kind()方法来获取 错误的具体类型, 搭配match语句 来实现错误处理.
    fn read_text_from_file(path: &str) -> Result<String, io::Error> {
        let mut f = File::open(path)?;
        let mut s = String::new();
        f.read_to_string(&mut s)?;
        Ok(s)
    }

    let str_file = read_text_from_file("hello.txt");
    match str_file {
        Ok(s) => println!("{}", s),
        Err(e) => {
            match e.kind() {
                io::ErrorKind::NotFound => {
                    println!("No such file");
                },
                _ => {
                    println!("Cannot read the file");
                }
            }
        }
    }

    // Rust中支持泛型
    struct Point<T> {
        x: T,
        y: T
    }

    // Rust中存在 特性trait, 这有点类似Java中的interface
    // 可以使用 trait 来表示 类中有哪些方法
    trait Eater {
        fn eat();
    }

    // 在类的实现中使用 for 来使用接口
    impl Eater for Person {
        fn eat() {
            println!("person eat something.");
        }
    }
    Person::eat();

    // 特性trait 可以作为函数的参数
    // 下面是通过 trait 来实现 Comparable功能的取最大值函数
    /*
            trait Comparable {
            fn compare(&self, object: &Self) -> i8;
        }

        fn max<T: Comparable>(array: &[T]) -> &T {
            let mut max_index = 0;
            let mut i = 1;
            while i < array.len() {
                if array[i].compare(&array[max_index]) > 0 {
                    max_index = i;
                }
                i += 1;
            }
            &array[max_index]
        }

        impl Comparable for f64 {
            fn compare(&self, object: &f64) -> i8 {
                if &self > &object { 1 }
                else if &self == &object { 0 }
                else { -1 }
            }
        }

        fn main() {
            let arr = [1.0, 3.0, 5.0, 4.0, 2.0];
            println!("maximum of arr is {}", max(&arr));
        }
     */

    // 特性trait可以作函数的返回值, 但是要求函数中 所有可能的返回值类型 必须完全一样.

    // impl可以限制 实现方法的条件, 比如要求 T在已经实现B和C特性的情况下, 才可以实现该impl块
    /*
    struct A<T> {}

    impl<T: B + C> A<T> {
        fn d(&self) {}
    }
     */

    // Rust中存在 生命周期 的概念, 同时支持 生命周期注释
    // 生命周期注释: 用于描述 引用的生命周期

    // 我们通过该使用 泛型声明 来规范 生命周期的名称
    // 通过生命周期注释, 将返回值str的生命周期 声明为 与 传入参数的生命周期一致
    // 注意: 所有用双引号包括的字符串常量所代表的精确数据类型都是 &'static str
    fn longer_number<'a>(s1: &'a str, s2: &'a str) -> &'a str {
        if s2.len() > s1.len() {
            s2
        } else {
            s1
        }
    }

    /* Rust支持基本的 命令行操作 和 IO操作 */

    // 命令行操作
    let mut str_buf = String::new();
    stdin().read_line(&mut str_buf).expect("failed to read line.");
    println!("your input line is: {}", str_buf);

    // IO操作
    let text = fs::read_to_string("D:\\ImportantData\\text.txt").unwrap();
    println!("{}", text);

    // Rust中关于文件操作并没有配套的close()操作, 因为Rust会在文件不再被使用的时候自动关闭.

    /* Rust中提供集合和字符串 */

    // 向量容器
    let mut v: Vec<i32> = Vec::new();
    // 也可以通过已有数组来创建vector
    // let mut v = vec![100, 200];

    v.push(100);
    v.push(200);
    // get方法无法保证一定取到值, 故返回值为Option类
    for i in &v {
        println!("{}", i);
    }

    // 字符串String的每个字符采用UTF-8编码, 每个char占用3个字节

    /* 面向对象 */
    // Rust不属于面向对象语言, 但是可以采用面向对象思想.
    // 通过impl来为struct绑定方法 (self关键字)
    // 通过手动编写new方法来模拟构造函数
    // Rust中可以通过 trait 来实现"多态"
    // Rust没有提供与"继承"相关的语法糖.

    /* 并发编程 */

    // Rust中可以通过spawn()来创建新线程
    fn spawn_function() {
        for i in 0..5 {
            println!("spawned thread print {}", i);
            thread::sleep(Duration::from_millis(1));
        }
    }

    thread::spawn(spawn_function);
    for i in 0..3 {
        println!("main thread print {}", i);
        thread::sleep(Duration::from_millis(1));
    }

    // Rust也支持 闭包 Closures
    // 闭包相当于Rust中的lambda表达式
    thread::spawn( {
       for i in 0..100 {
           println!("current value: {}", i);
       }
    });

    // 使用move关键字来 强制所有权迁移, 避免在 当前子线程使用当前函数的资源
    let s = "hello";
    let handle = thread::spawn(move {
        println!("{}", s);
    });
    handle.join().unwrap();

    // Rust中的消息传递可以通过 管道Channel 来完成.
    let (tx, rx) = mpsc::channel();
    thread::spawn(move  {
        let val = String::from("hi");
        tx.send(val).unwrap();
    });
    let received = rx.recv().unwrap();
    println!("Got: {}", received);

}
```