//:类和struct区别
/*
 前者 引用类型,后者值类型
 类可以继承
 类可以运行时类型转换
 类有析构
 */
//结构体 :apple 官方标准库使用了80+
//原来封装少量相关简单数据值  ,eg:长方形等
//结构体不需要继承其他类型

import UIKit
//定义一个类,可以不继承NSObject.引用类型
class Person{
    var name = ""
    var age = 1
    var gender = ""
    
    func eat() {
      print(" \( name)我要吃")
    }
    func learn() {
        print(" \( name)这个小帅哥去学习了")
    }
//    改变自身属性
    func lev()  {
//    self.gender = self.gender + "6"
        print(self.gender)
    }
}

var draginLi = Person()
//draginLi.dynamicType
draginLi.name = "LFL"
draginLi.age

draginLi.learn()

draginLi.eat()
draginLi.lev()
// 和闭包一样,不会拷贝
var ref = draginLi
ref.lev()
print(ref.gender) // 和dragonLi一样的
print(draginLi.gender)

ref === draginLi  // 一样的 true

//如果类默认值没有,会报错
//class Person2{
//    var name
//    var age
//    var gender
//}


//结构体,默认不赋值也可以,系统默认实现了构造器,值类型
struct Person1{
    var name = ""
    var age = 1
    var gender = ""
    
    func eat() {
        print(" \( name)我要吃")
    }
    func learn() {
        print(" \( name)这个小帅哥去学习了")
    }
    //    改变自身属性
    func lev()  {
//        self.gender = self.gender + "6"
        print(self.gender)
    }
    //    不允许直接函数改变!需要加   mutating
  mutating  func lev1()  {
        self.gender = self.gender + "6"
        print(self.gender)
    }
}

var draginLi1 = Person1()
//draginLi1.dynamicType
draginLi1.name = "LFL"
draginLi1.age

draginLi1.learn()

draginLi.eat()
draginLi1.lev1()

//比较
var refStruct = draginLi1
 draginLi1.age
draginLi1.lev1()
refStruct.gender  // 6
draginLi1.gender   //  66 !
// 说明结构体是值类型,里面的常量值不允许修改




















