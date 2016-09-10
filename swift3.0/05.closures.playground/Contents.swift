
import UIKit

//  闭包 :自包含的函数代码块,函数是闭包的一种类型
//1.闭包表达式语法
/*
 {
 (parameters) ->return Type  in
 code
 }
 */
//类似于函数,可以理解为匿名函数,(内联闭包)

func caculate(a:Int,_ b:Int, _ operation : (Int,Int) ->Int) -> Int {
    return operation(a,b)
}

func plus(a:Int,b:Int) -> Int {
    return a + b
}

func mulitly(a:Int,b:Int) -> Int {
    return a * b
}
 // 函数类型的使用,-----闭包实现最后参数?
caculate(a: 3, 7, mulitly)

// caculate(3, 7, mulitly)  2.2 已过期

//  
let plusClosure = {
    (a:Int,b:Int)   ->Int in
    return a + b
}
//查看类型 ,和函数一样
caculate(a: 2, 10, plusClosure)
// caculate(2, 10, plusClosure) 2.2 已过期

let mulityClousure = {
    (a:Int ,b:Int) ->Int in
    return a * b
}

caculate(a: 3, 6, mulityClousure)

// 上面闭包和写函数一致,匿名呢
caculate(a: 5, 5, {  (a:Int ,b:Int) ->Int in return a * b })

//因为swift 类型推断,闭包特性:根据上下文推断类型,简写
caculate(a: 5, 5, {  (a ,b) in  a * b })

// 默认 $1,$2
caculate(a: 5, 5, {$0 + $1})

//运算符函数 ,少到没朋友
caculate(a: 5, 5,  + )

//2.尾随闭包
caculate(a: 5, 5){$0 + $1}

//捕获值

func increasefun(num:Int) -> () ->Int {
    var number = 0
    func funDetail () ->Int{
        number += num
        return number
    }
    return funDetail
}

let numberWhat = increasefun(num: 20)
//每次调用都会把内部的number 增加
numberWhat()  // 20
numberWhat()  // 40

let numberWhat2 = increasefun(num: 10)
//每次调用都会把内部的number 增加
numberWhat2()  // 10
numberWhat2()  // 20

// 声明不同,调用不同,捕获值不同,引用类型
//每次都是产生新的副本

let numberWhat3 = numberWhat2
//每次调用都会把内部的number 增加
numberWhat3()  // 20 + 10








