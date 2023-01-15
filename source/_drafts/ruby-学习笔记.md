---
title: Ruby - 学习笔记
tags:
  - Ruby
id: '845'
categories:
  - - uncategorized
date: 2021-09-02 12:58:05
---

# Ruby Study Note

```ruby
#!/usr/bin/ruby

# 简介
# Ruby是一种纯粹的面向对象编程的脚本语言,
puts "Hello World!";

puts "你好";

# Here Document
# Ruby支持多行字符串
print <<EOF
Hi, First Line
Hi, Second Line
EOF

# BEGIN 和 END
# BEGIN块: 在程序运行之前被执行
# END块: 在程序的结尾被执行
BEGIN {
  print "This Program runs\n"
}

END {
  print "This Program stops."
}

# 数据类型
# Ruby支持的数据类型包括: Number, String, Ranges, Symbols, true, false, nil, Array, Hash.

# 模板字符串
# Ruby支持使用 #{expr} 的方式来代替字符串的值
print "The result is: #{1 + 3}\n"

# 范围
# Ruby支持 范围 Range , 使用 ..符号(闭区间) 和 ...符号(左闭右开区间) 来构造 Range
(10..15).each do n
  print n, ' '
end

# 面向对象
# Ruby是一门纯面向对象的语言, Ruby中的一切都是对象.
# Ruby的类中有4种类型的变量: 局部变量, 实例变量, 类变量, 全局变量
# 局部变量: 在类的方法中定义的变量. 以 小写字母 或 _开头
# 实例变量: 在可跨任何特定的实例或对象中的方法使用. 以@开头
# 类变量 (类似static变量): 类变量不可以跨不同的对象使用, 属于类的属性. 以@@开头
# 全局变量: 可以跨类使用的类变量. 以$开头
class Customer
  @name = "Alice"
  @age = 100

  # Ruby中使用  def 来定义成员函数
  def sayHi
    puts "Hi, I'm #{@name}"
  end

  # Ruby支持构造函数, 使用initialize方法来实现.
  def initialize(name, age)
    @name = name
    @age = age
  end

end

# Ruby中使用new方法来创建对象
cust1 = Customer.new("Tom", 40)

# Ruby中的 访问权限修饰符有3种: public, private, protected
# Ruby支持 运算符重载, 本质为对象的方法重载
# Ruby支持 冻结对象, 使用Object.freeze()即可
# 除了使用 new方法(会通过initialize对象构造器)来创建对象, 还可以使用allocate方法创建对象(对象的所有属性处于未初始化状态).

# 变量
# Ruby支持5种类型的变量: 普通变量, 全局变量, 实例变量, 类变量, 常数
# 普通变量 Variable: 小写字母 或 _开头
# 全局变量 Global Variable: $开头
# 实例变量 Instance Variable: @开头
# 类变量 Class Variable: @@开头
# 常数 Constant: 大写字母开头

# 伪变量 (魔术常量)
# Ruby中支持的魔术常量: self, true, false, nil, __FILE__, __LINE__

# 运算符
# Ruby的 运算符 实质上进行的是 函数调用: a + b 等价于 a.+(b)
# Ruby支持算术运算符, 比较运算符, 赋值运算符, 位运算符, 逻辑运算符等常见运算符类型.
# 此外, Ruby支持使用 defined? 运算符来判断 表达式是否已被定义.

# 条件语句
# Ruby支持 if语句, 也支持使用 if修饰符 的写法.
$debug=1
print "debug\n" if $debug
# Ruby支持 unless语句, 租用效果与 if语句相反
# Ruby支持case语句 (类似switch语句)
$age =  5
case $age
when 0 .. 2
    puts "婴儿"
when 3 .. 6
    puts "小孩"
when 7 .. 12
    puts "child"
when 13 .. 18
    puts "少年"
else
    puts "其他年龄段的"
end

# 循环语句

# 普通的while语句
$i = 0
while $i < 10  do
  puts("循环 i = #$i" )
  $i +=1
end

# 使用while修饰符
# begin
#   code
# end while conditional

# Ruby支持until语句, 作用效果与while相反
# 此外, Ruby也支持for in语句
(0..5).each do i
  puts "局部变量的值为 #{i}"
end

# 方法
# Ruby支持 默认参数, 可变参数
# 调用Ruby中的方法时, 不需要使用小括号, 直接使用 方法名 即可
# Ruby支持 多返回值, 以数组形式返回
# 当方法定义在类外部时, 默认private. 类内部的方法默认为public
# Ruby支持使用 alias语句 为 方法 和 全局变量 起别名。即使方法被重写，方法的别名也会保持方法的当前定义.
# Ruby支持使用 undef语句 取消方法的定义.

# 代码块
# Ruby支持 代码块, 你可以使用 yield语句来调用 代码块
def test
   puts "在 test 方法内"
   yield
   puts "你又回到了 test 方法内"
   yield
end
test {puts "你在块内"}

# 通过 yield语句 调用代码块
def myBlock
  yield
end
myBlock{ puts "Hello world"}

# 模块
# Ruby中的模块定义了一个命名空间, 可以使用require语句来引入
# 此外, 可以通过 include语句 来在类中嵌入模块
# Ruby不支持多继承, 但可以通过 mixins 来模拟多继承.
module A
   def a1
   end
   def a2
   end
end

module B
   def b1
   end
   def b2
   end
end

class Sample
include A
include B
   def s1
   end
end

samp=Sample.new
samp.a1
samp.a2
samp.b1
samp.b2
samp.s1

# 字符串
# Ruby的 默认字符集 是ASCII, 字符可以使用单个字节表示.
# 如果使用UTF-8编码, 则1个字符需要1-4个字节表示.
# Ruby对字符串提供了大量强大的内建函数

# 数组 Array 和 哈希 Hash
# 类似Php

# 迭代器
# Ruby支持foreach语法, 通过迭代器实现
# 此外, Ruby对 Map有直接的 迭代支持.

# 异常
# Ruby中采用 begin-rescue-end机制来进行异常处理.
# 使用 raise语句 来抛出异常
# 使用 retry语句 来重新执行begin块.
# 完整的流程: begin-rescue-else-ensure-end
begin
  puts 'I am before the raise.'
  raise 'An error has occurred.'
  puts 'I am after the raise.'
rescue
  puts 'I am rescued.'
end
puts 'I am after the begin block.'

# 此外, Ruby也支持使用 throw-catch机制来处理异常

# CGI编程
# Ruby支持便捷的CGI编程, 引入cgi库即可. 写法类似Kotlin

# 多线程
# 见thread类, 与传统多线程模型类似.

# JSON
# 使用方式与Php类似, 将JSON映射为Ruby对象

# 包管理器
# RubyGem
```