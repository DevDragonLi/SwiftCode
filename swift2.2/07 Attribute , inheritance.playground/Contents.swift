
import UIKit
//属性:原来描述类,结构体,枚举里面的值
/*
 存储属性 :enum 没有 ,类似OC的成员变量,可以指定默认值,,可以修改
 计算属性: 间接获取和设置其他属性的值(类似OC的getter 和setter)
 类型属性
 
 */
struct lengthRc {
    var frist :Int
    let secind :Int // 不可以修改
}

var lengthP = lengthRc(frist: 10,secind: 20)
lengthP.frist = 20
//lengthP.secind = 30  //

//1  lazy stored pro: 初始值在第一次使用才计算
/*
 格式: lazy 属性 = { 返回对应的属性}()
 */
class ClassLazy {
    lazy var dragonLi :[String] = {
        print("init")
        var dragonTemp = ["LFL"]
        return dragonTemp
    }()
}

var pro = ClassLazy()
pro.dragonLi
pro.dragonLi // init 只一次

//计算
struct Test{
    var seconds = 10.0
    var min:Double {
        get {
            return seconds / 60
        }
        //        set {
        //            self.seconds = newValue * 60
        ////  1.set          newValue :系统提供
        //        }
        //  2. set  带参数
        set(par){
            self.seconds = par * 60
        }
    }
    //   建立只读属性
    var hour : Double{
        //        get {
        return min / 60
        //        }
        //        可以省略掉get
    }
}
//上面的类,就是可以通过seconds 间接设置了min, 也就是通过一个间接设置另一个

var test = Test(seconds:10)
//等于其他值也都设置了
test.min   // 可以看到0.166666
//test.hour = 5.0  不可以再赋值

//属性观察器: 变量的存储属性上面

class totalValue {
    var total = 2 {
        willSet  {
            print("will set New Value \(newValue)")
        }
        didSet{
            print("older Value \(oldValue),new Value \(total)")
        }
    }
}

let totalP =  totalValue()
totalP.total = 10  // 将会触发set 和did

//全局和局部变量

let globalVar = 10
func testFunc(){
    let localInt = 0
    print(globalVar)
    print(localInt)
}

//实例属性和类型属性
//1.某一个实例的属性,每个都拥有
//2.类型不熟与实例本身,类型属性只有一份 static 修饰

class Person {
    static var value = "DragonLi"
    var name = "DragonLi"
}

let nameTest = Person()
//nameTest.value  会直接报错

Person.value // 类直接调用,可以再次赋值

//继承 inherit :swift中继承是区分类和其他类型的一个基本特征

class Student: Person {
    var degree = "学士"
    final var finalVar  = "" //
}

let student = Student()
student.name  // 继承后识别到父类的name

//重写 override .类似OC的重写,不调用super 不会走父类
//防止重写: 加final













        
