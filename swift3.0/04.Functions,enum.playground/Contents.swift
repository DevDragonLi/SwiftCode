
//:3.0后,参数:类型 不可略去  inout 实际失去意义

//16.05.29 下午
import UIKit

//函数名,形参类型 返回值类型

func helloSwift(name:String) -> String {
    return "\(name)"
}

helloSwift(name: "DragonLi")

func opterion(num:Int ,num2:Int ) -> Int {
    return num + num2
}

opterion(num: 7, num2: 5) // 第二个开始形参不可以去掉

//多个返回值 // 返回元祖
func square(num:Double) -> (posSqrt:Double,negSqtr:Double) {
    let posSqrt = sqrt(fabs(num))  // 正的平方根
    print(posSqrt)
    let negSqtr = -sqrt(fabs(num))  // 负的平方根
    return(posSqrt,negSqtr)
}

let (x,y) = square(num: 3)

//指定函数形参名字
func test1(name:String){
    print(name)
}

test1(name: "DragonLi")

// 如果函数参数和返回都一样,使用inout 简写
func swapNnmber ( num1:inout Int , num2:inout Int){
    let tempValue = num1
    num1 = num2
    num2 = tempValue
}
//就需要传递地址
var a = 10
var b = 15
swap(&a, &b)
a
b

//1.如果参数类型不确定...    Eg 求平均数
func average(num:Int...) -> Int {
    var total  = 0
    for value in num {
      total += value
    }
    return total / (num.count)
}

average(num: 10,12,13,18)

/*
 函数类型,swift中函数和其他值类型一样,可以赋值,作为函数参数和返回值返回
 函数类型===== 参数和返回值类型确定
*/

func addNumber(num1:Int ,num2:Int) -> Int {
    return num2 + num1
}

func multiplyNumber(num1:Int ,num2:Int) -> Int {
    return num2 * num1
}
//上面二个就是函数类型相同的 (Int ,Int) ->Int

//,可以直接赋值
var mathFunc = addNumber
//mathFunc.dynamicType

 mathFunc(1,3)

//进阶\

func add(input:Int) -> Int {
    return input + 1
}

func dive(input:Int) -> Int {
    return input - 1
}

func chooseFunc(what:Bool) -> (Int) ->Int {
    return what ? add : dive
}
//调用后返回对应函数
let resultFunc =  chooseFunc(what: true)

resultFunc(2)

//对于返回值可以类似于OC的typedef  
typealias backType = (Int) ->Int // 替换98行返回即可

//  嵌套函数:定义在函数内,外界可以使用,


func chooseFunc1(what:Bool) -> backType{
    func add2(input:Int) -> Int {
        return input + 1
    }
    
    func dive2(input:Int) -> Int {
        return input - 1
    }
   return  what ? add2 : dive2
}

let funChooseWhat = chooseFunc1(what: true)
funChooseWhat(2)   // 3




//      枚举 和OC不同,默认没有初始值的
enum frame{
    case x
    case y
    case width
    case height
}

var frameDir = frame.y
    //frameDir.dynamicType

frameDir = .width  // 已知类型

    switch frameDir{
    case .x :
        print(frameDir)
        
    default: break // 不想列举所有成员值,加上
    }

//实际项目中使用
enum shape{
    case rectagle(width:Int,height:Int)
    case round (radius:Int)
}

var square = shape.rectagle(width: 10, height: 10)

//指定类型
enum frameValue :Int{
    case x
    case y
    case width
    case height
}

frameValue.width.rawValue  // Int 才有,如果是String 就是String
var valueTest = frameValue(rawValue:2) // 没有提示的













