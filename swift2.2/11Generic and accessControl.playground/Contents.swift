//  泛型   和   访问控制
import UIKit

func swapTwoNumbers(inout num1:Int,inout num2 :Int)  {
    let temp = num1
    num1 = num2
    num2 = temp
    print("\(num1), \(num2)")
}

var a = 10
var b = 20
swapTwoNumbers(&a, num2: &b)

// 如果上述函数,是double ,字符串呢? 避免重复代码(推断类型,实际调用T被推断对应的类型)
//格式<T> ,占位符
func swapGens<T>(inout fristElement:T,inout secondElement:T)  {
    let temp = fristElement
    fristElement = secondElement
    secondElement = temp
    print("\(fristElement), \(secondElement)")
}
var name = "name"
var age = "23"
swapGens(&name, secondElement: &age) // 已经进行交换了

//关联类型   associatedtype

protocol namePro{
//    声明关联类型
    associatedtype typeName // 类型不指定
//    要求实现 
    subscript (i: Int) ->typeName{
        get
    }
}

//自定义类型使用 ,对于属性的类型,也可以指定为T,  类型后面加 <T> 即可
struct nameClass<T> :namePro{
    var dragonLi :[T] = []
    mutating func test(dragon:T){
        self.dragonLi.append(dragon)
    }
    
//    实现关联协议
    subscript(i:Int) ->T{
     return dragonLi[i]
    }
}

//使用后期,可以应对不断变化的需求,初始化时候,<> 指定T的类型
var test = nameClass<String>()

//扩展泛型:
extension nameClass{
    var top :T?{
       return self.top
    }
}

//泛型约束 : eg 比较二个元素是否相等,需要让T :Equatable 等,泛型不是泛
func equeaFun<T :Equatable>(a:T,b:T) -> Bool {
    return a == b
}

//访问控制:控制其他源文件(swift文件)或者模块(独立单元构建和发布的framework或者application)对代码的访问级别
//和OC类似  
//1.public 最高级别
//2.internal  默认,也就是本模块内访问本源文件 (命名空间)
//3.private  只能当前源文件访问  最低

//语法 对应关键字,加载类或者变量等前面即可
private class privateClass{
}

//var privateCl = privateClass()   就会报错
private var privateCl = privateClass()  // 必须加上private

//函数 按照最低的级别来划分
//枚举 :只可以为enum设置 ,不存在单一类型
//````````````````````嵌套类型```````````````````//
//1.类等嵌套,默认无法访问的
//2.子类不能超越父类  ,比如父类私有,嵌套子类不可能公开,

//继承中:可以通过重写,修改访问级别









