
//: 3.0后   % 使用英文remainder 取余

import UIKit

/// for 循环 反转
for i in (0...10).reversed(){
    print(i)   // 输出10 .9 .8...0
}

//1.和OC不同,swift赋值没有返回值,所以不可以 if a == b 这样判断
//加法支持string
"LFL" + "DragonLi"
var number1 = 5.5
let number2 = 2.5

number1 .remainder(dividingBy: number2) //实际上2.5 *2 + 0.5 = 5.5
//一元运算符
+number2
-number1
//组合赋值
number1 += number2   // 其他一样

//比较运算符
number2 == number1
number1 != number2
number2 > number2

// 三目运算
number1 > number2 ? number1 :number2 // 取二个数最大

//区间运算符
for item in 1..<5{
    print(item)
}

//逻辑运算符
let a = true
let b = false
!b // true

b && a
a || b

//控制流 ,去除了for循环
let range = 1...10
for index in range{
    print(index)
} // 有些时候不需要知道下标的
var a1 = 9
let a2  = 1

for _ in range{
    a1 += a2
    print(a1)
}

//while
var whileNumber = 8
while whileNumber > 0{
    whileNumber -= 1
    print(whileNumber)
}

// do while ----替换为repete while
repeat {
    whileNumber -= 1
    print(whileNumber)
    
} while whileNumber > 0 // 先执行一次,再运算

// if
let numberTest = 9

if numberTest > 10{
    print("no")
}else{
    print("Yes")
} // 可以没有else


//switch
let string1 = "1"
let string2 = "2"

switch string1 {
case "0" :
    print("No")
    
case "1" :
    print("same")
//    必须写default,默认break不写,如果需要穿透,可以使用 fallthrough
default: break
}


//支持开闭区间判断条件

let numberTest1 = 5

switch numberTest1 {
case 1..<5:
    print("value")
case 5..<10:
    print("yes")
default:break
}

let point = (1,0)
switch point{
case (0,0):
    print("origin point")
case (let x,0) where x < 4 :
    print("origin point \(x)")
default:break
}

// continue,跳出本次循环,继续大的循环
for indexNumber in 1...10{
    if indexNumber % 3 == 0{
        continue
    }
    print(indexNumber)
}

// optional 可选类型 (有或者没有)
var ageNumber :Int = -1
if ageNumber > 0{
//    逻辑
}

//可以使用可选取代if判断
var agenumber1 :Optional<Int>

var ageNumber2 :Int?
//强制解析(确定值存在,然后取值)
let num :Int? = 20
if num != nil{
    print(num!) // 20
}

//: 报错! unexpectedly found nil while unwrapping an Optional value
// 每次写 ! 的时候，要考虑 nil!

//可选绑定
let possibleNumber = "100"
if let numberR = Int(possibleNumber){
    print(numberR) // 就可以拿到int 类型的数值
}
//隐式解析可选类型 (已经确定肯定有值,声明时候指定 !)
let stringTest :String! = "aaaaaaaaa"
print(stringTest) // 是string

let stringTest2 = stringTest


// ?? 操作符号，可以判断之前的变量是否为 nil，如果为 nil，使用后面的替换 ?? 运算符号优先级`低`
let nameDragonLi: String?
    nameDragonLi = nil
// 会输出"??default"
print((nameDragonLi ?? "??default"))








