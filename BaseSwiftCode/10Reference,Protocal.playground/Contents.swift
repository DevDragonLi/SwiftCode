//16年05.31
import UIKit

//自动引用计数:自动资源管理,(实例对象的被引用次数),有OC内存管理基础很好理解
//1.策略 
/*
 强 :strong ref
 弱 :weak ref (一般optional)
 无主引用 : unown 一般非optional
 */
class RefClass {
    var name = ""
    init(name:String){
        self.name = name
        print("init name")
    }
    deinit {
     print("deinit")
    }
}
//三个optional实例
var ref: RefClass?
var ref1: RefClass?
var ref2: RefClass?
ref = RefClass(name: "ref")  //  ref 1
ref1 = ref   // ref    2
ref2 = ref   //ref    3

ref = nil  // 此时,ref 引用计算就会- 1 变为2
ref1 = nil
ref2 = nil  // "deinit\n" 代表释放了

//循环引用 :和OC一样,相互持有导致无法释放,比较简单,就忽略代码了

//解决1: 在一个类中,引用另一个类之前 加weak (如果是可选)
//解决2: 加 unown  (非可选)

//``````````````````````闭包循环引用````````````````/////////
//1.判断是否发生强引用, 闭包中使用析构函数  deinit
//原理跟OC中的block类似, 当有个属性记录下了函数传递回来的闭包, 产生强引用, 就会发生闭包的循环引用
/*
 使用weak修饰变量, 打破强引用, 因为使用weak修饰的变量有一次变成nil的机会
 
 使用[weak self] 修饰闭包原理跟__weak类似, 这样在闭包中使用self, 就是弱引用
 
 使用[unowned self ] 修饰闭包, 跟__unsafe_unretained类似, 不安全
 
 */

//  ``````````````````协议-----思路基本和OC一致```````````````````/////
//1.协议对属性的规定
protocol bridProtocal {
    var canFly:Bool {get} // 只可以读取
    var name :String{get set} // 可读可写
    
}
//2.协议对方法:只需要方法名,参数,返回值类型,不需要括号的
protocol flyProtocal {
    func fly()  //
}

//3.类型协议,需要在方法前面加static,里面不允许使用类里面的属性
protocol bridDesProtocal{
    static func des() //
}
//协议对构造器的规定;可以让遵守者,实现特定的构造器,实现时候,需要加requried
//4.构造器的pro
protocol initBridProtocal{
    init(name:String)  //
}

//实现协议
class flppyBird:bridProtocal,flyProtocal,bridDesProtocal ,initBridProtocal{
//    需要实现 
    var canFly: Bool = true
    var name :String = ""
//    实现协议的构造器
    required init(name: String) {  //required 会提示的
        self.name = name
    }
    
    func fly() {
        print("我是协议方法")
    }
    static func des() {
        print("我是类型协议,不可以使用属性等,需要加static")
    }
}

var brid = flppyBird(name: "initPro")
brid.canFly = true  // 协议属性
brid.name = "flay"
brid.fly()

//          协议可以作为类型使用
var aprotocal :flyProtocal = brid // 把brid
aprotocal.dynamicType  // 类型还是flppyBird.Type,因为遵守协议后是混合体

//作为函数参数类型
func printFun(fly:flyProtocal)  {
    print(flyProtocal)
}

printFun(brid) //

//作为集合类型,

class nameClass:flyProtocal {
    func fly()  {
    }
    func name() {
    }
}
var name = nameClass()
//
let arrary :[flyProtocal] = [brid,name]
arrary.dynamicType // 集合类型











