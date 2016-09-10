
//:swift从2.2到后期版本具体改变请参考代码注释部分和最新部分即可
/*
 16年05-29  swift 2.2    01
 */

/*
 //16年9-10  swift 3.0    01
 */
//: swift 3.0 dynamicType 过期,使用 type(of: 常/变量) 获取类型
// :获取int类型size  print("int8Value: \(sizeof(Int8))") 变为 print("int8Value: \(MemoryLayout<Int8>.size)")

import UIKit

let taiWanNumber = 666 // 不可修改

var DragonLiName = "LFL"
DragonLiName = "Dragon_Li"

// type annotation
let taiWan:Int = 1

//实际上,自动推断类型,编译时类型检查
type(of: taiWan)  // Int.Type 

// DragonLiName.dynamicType   2.2版本

print(DragonLiName,taiWan) // 效率比OC的NSLog高,默认会有\n 换行符

//1.可以设置 terminator: 换行指定 ,可以看到就自定义的换行符号;

print(DragonLiName,taiWan,terminator:"     end")
//2.设置分隔符 separator:
print(DragonLiName,taiWan,separator:",,,",terminator:"")

// 1.base number

/*
 整形 有符号
 Int
 Int8
 Int16
 Int32
 Int64
无符号
 Uint
 uint
 UInt8
 UInt16
 UInt32
 UInt64
 */
//区别
// 内存占用空间 sizeof获取,数据范围不同
// Int Uint 和当前平台的原生字长一致,一般开发中使用Int

let int8Value:Int8 = 16
let int16Value:Int16 = 16
let int64Value:Int64 = 16
//可以打印对应的min 和max 查看对应的取值范围
//Int64.max
// print("int8Value: \(sizeof(Int8))")
 print("int8Value: \(MemoryLayout<Int8>.size)")

//打印 占位 \()
print("int:\(int8Value)")

//Double 64 默认
//Float  32
//Bool (true ,false)

//不同进制

let numberTen = 10
let binaryVal = 0b1010 // 二进制
let eightval = 0o110 // 8进制
let sixVal = 0x10  // 十六

//类似科学计数
var exponentValue = 9e1
exponentValue = 9e-1

//不可以int Uint直接赋值转化,(比如浮点型和整数运算)需要强制转化
let uintValue :UInt = 16
//uintValue = uintValue.toUIntMax() +1 .溢出报错

//类型别名   typealias

typealias DragonLi1 = String
let nameWho:DragonLi1 = "dragonLi"

//字符和字符串

let string1 = "DragonLi"
let string2 = String("hello")
let emptyString = ""
var stringM1 = "1"

//1.判断字符串是否为空
string1.isEmpty
emptyString.isEmpty
//2.添加
stringM1 = stringM1 + "str" // + 后面要有空格

stringM1 = String("New string Value") // 可以再次赋值

//函数和重新修改,是copy ,保证函数或者方法中改字符串不被修改,和当前的值,也就是说,只有真正修改数值,和新对象产生,才会修改,优化性能

//3获取字符串的字符
for char in stringM1.characters{
    print(char)
}

//4 字符
let charSets : [Character] = ["a","b"]

var stringOne = String(charSets)
let charValue:Character = "Y"
stringOne.append(charValue)

//5类似OC的拼接 \ ()

let ComString = "a new String \(stringOne)"

//6.计算字符串数量
    ComString.characters.count
    emptyString.characters.count

//string .index(不是整数索引)  索引
stringOne.startIndex
stringOne.endIndex
//获取下一个和前一个位置
//stringOne.startIndex.successor()
// stringOne.endIndex.predecessor()

stringOne[stringOne.startIndex] // 返回对应字符 ,如果越界,会报错

//如此遍历,获取对应字符
for index in stringOne.characters.indices{
    print(index,stringOne[index])
}
var testString = "LFL Test"
//插入删除,修改等

testString.insert("!", at: testString.startIndex)
//加入字符串需要insertContentsOf("add".characters,对应插入位置)
testString.insert(contentsOf: "add".characters, at: testString.endIndex)

testString.remove(at: testString.startIndex)

//删除指定范围,这比较蛋疼啊 advancedBy 之前

// let range = testString.startIndex.successor()..<testString.startIndex.advancedBy(5)
//testString.removeSubrange(range)

//字符串比较.是否包含某个字节的前缀和后缀

let isEqual = stringOne == stringM1 // 比较字面量

stringM1.hasPrefix("1")
stringOne.hasSuffix("1")
