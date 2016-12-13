#Swift 编码规范
编码规范的目标是保证代码的 简洁性和可读性。

正确性
把警告当做错误处理。这条规则从根本禁止了一些文法使用，如不要使用运算符++或者-- ，C语言风格的循环和使用字符串作为selectors.

命名
使用具有描述性的名称，并结合驼峰式命名规则给类，方法和变量等命名。类别名称(类，结构体，枚举和协议)首字母大写，而方法或者变量的首字母小写。

正例

private let maximumWidgetCount =100

class WidgetContainer {
    var widgetButton: UIButton  
    let  widgetHeightPercentage = 0.85
}
反例

let MAX_WIDGET_COUNT = 100
class app_widgetContainer {
   var wBut: UIButton
   let  wHeightPct = 0.85
}
缩写和简写应该要尽量避免，遵守苹果命名规范，缩写和简写中的所有字符大小写要一致。

正例

let urlString:  URLString
let userID:  UserID
反例

let uRLString:  UrlString
let userId:  UserId
对于函数和初始化方法，建议给所有参数命名，除非上下文非常清晰，如果结合外部参数命名可以让函数调用更易读，去做吧。

func dateFromString(dateString: String)->NSDate
func convertPointAt(column column:Int, row:Int)>CGPoint
func timedAction(afterDelay delay: NSTime Interval,performaction: SKAction)->SKAction!

// 调用上述函数时如下：
dateFromString("2014-03-14")
convertPointAt(column:42, row:13)
timedAction(afterDelay:1.0, perform: someOtherAction)
方法命名的时候要考虑方法体中的第一个参数的名称。

classCounter {
  //combineWith+otherCounter
  func combineWith(otherCounter:  Counter, options: Dictionary?) { ... }
 //incrementBy+amount
  func incrementBy(amount: Int) { ... }
}
协议
根据苹果接口设计指导准则，协议名称用来描述一些东西是什么的时候是名词，例如：Collection,WidgetFactory。若协议名称用来描述能力应该以-ing, -able, 或 -ible结尾，例如：Equatable,Resizing.

枚举
根据Swift 3苹果接口设计指导文档，枚举中的值使用“小骆驼拼写法”命名规则

enum Shape {
    case rectangle
    case square 
    case  triangle
    case  circle
}
类前缀 
Swift中类别(类，结构体)在编译时会把模块设置为默认的命名空间，所以不用为了区分类别而添加前缀，比如RW. 如果担心来自不同模块的两个名称发生冲突，可以在使用时添加模块来区分，注意不要滥用模块名称，仅在有可能发生冲突或疑惑的场景下使用。

import SomeModule
let myClass = MyModule.UsefulClass()
Selectors
selector 选择器是Objective-C的方法，在很多Cocoa  和 Cocoa Touch 里 接口内作为句柄使用， 在 Swift 2.2中, selector使用类型不安全的字符串.现在Swift 3.0 编译时会有警告，在Xcode里点击‘修复’按钮会用完全体的selector替换这些警告的字符串，但是经常地可以根据上下文使用缩写，推荐这种方式。

正例

let sel = #selector(viewDidLoad)
反例

let sel = #selector(ViewController.viewDidLoad)
泛型
泛型类参数应具有描述性，遵守“大骆驼命名法”。如果一个参数名没有具体的含义，可以使用传统单大写字符，如T,U, 或V. 

正例

struct Stack<Element>{ ... }
func writeTo<Target: OutputStream>(inout target: Target)
func max<T:Comparable>(x: T,_y: T)->T
反例

struct Stack<T>{ ... }
func writeTo<target: OutputStream>(inout t: target)
func max<Thing:Comparable>(x: Thing,_y: Thing)->Thing
语言
使用美式英语来定义苹果接口。

正例

let color = "red"
反例

let colour = "red"

代码组织结构
无用代码
无用的代码，包括Xcode生成的模板代码和占位符注释应该删除，除非是有目的性的保留这些代码。

一些方法内只是简单地调用了父类里面的方法也需要删除，包括UIApplicationDelegate内的空方法和无用方法。

正例

override func tableView(tableView: UITableView,numberOfRowsInSectionsection:Int)->Int{
  returnDatabase.contacts.count
}
反例

override func didReceiveMemoryWarning() {
  super.didReceiveMemoryWarning()
}
override func numberOfSectionsInTableView(tableView: UITableView)->Int{
  return1
}

override func tableView(tableView: UITableView,numberOfRowsInSectionsection:Int)->Int{
  returnDatabase.contacts.count
}
最少引入
减少不必要的引入，例如引入Foundation能满足的情况下不用引入UIKit。

间隔
缩进使用2个空格. 在Xcode的偏好设置和项目设置都可以配置。


Xcode偏好设置

项目设置
方法体的大括号和其他大括号 (if/else/switch/while等) 首括号和首行语句在同一行，尾括号新起一行。

正例

if user.isHappy {
  // xxoo
} else {
  // ooxx
}
反例

if user.isHappy
{
  // xxoo
}
else{
  // ooxx
}
方法体内最多只有一个空行，这样可以保持整齐和简洁，如果需要多个空行，说明代码需要重构。

: 左面不要空格，而右面需要保留空格，例外的是三元操作符 ?: 和空数组[:]

正例

class TestDatabase: Database {
  vardata: [String: CGFloat]=["A": 1.2,"B": 3.2]
}
反例

class TestDatabase:Database {
  vardata :[String:CGFloat]=["A" : 1.2,"B" : 3.2]
}
注释
当需要的时候，使用注释来解释阐明特定一块代码的用途，注释必须保持最新，过期的注释要及时删除。

避免代码中出现注释块，代码本身应尽量起到注释的作用，如果注释是为了生成文档可以例外。


类和结构体
应该使用哪一个

结构体是值类型。结构体在使用中没有标识。一个数组包含[a, b, c]和另外一个数组包含[a, b, c]是完全一样的，它们完全可以互相替换，使用第一个还是使用第二个都一样，因为它们代表的是同一个东西。这就是为什么数组是结构体。

类是引用类型。类使用的场景是需要一个标识或者需要一个特定的生命周期。假设你需要对人抽象为一个类，因为两个人，是两个不同的东西。即使两个人有同样的名字和生日，也不能确定这两个人是一样的。但是人的生日是一个结构体，因为日期1950/03/03和另外一个日期1950/03/03是相同的,日期是结构体没有唯一标示。

有时，一些事物应该定义为结构体，但是还需要兼容AnyObject或者已经在以前的历史版本中定义为类（NSDate，NSSet），所以尽可能的注意类和结构体之间的区别。

类定义

下面是一个设计良好的类定义:

class Circle: Shape {
  var x:Int, y:Int
  var radius:Double
  var diameter:Double{
      get {
        returnradius*2
     } 
     set {      
        radius=newValue/2
    }  
}
   init(x:Int, y:Int, radius:Double) {
      self.x=x
      self.y=y
      self.radius=radius  
  }

 convenience init(x:Int, y:Int, diameter:Double) {
     self.init(x: x, y: y, radius: diameter/2)  
}

func describe()->String{
    return"I am a circle at\(centerString())with an area of\(computeArea())"
}
override func computeArea()->Double{
   returnM_PI*radius*radius  
}

private func centerString()->String{
    return"(\(x),\(y))"
  }
}
上面的例子展示了下面的设计准则：

属性，变量，常量和参数等在声明定义时，其中: 符号后有空格，而: 符号前没有空格，比如x: Int, 和Circle: Shape

如果定义多个变量/数据结构时出于相同的目的和上下文，可以定义在同一行。

缩进getter，setter的定义和属性观察器的定义。

不需要添加internal这样的默认的修饰符。也不需要在重写一个方法时添加访问修饰符。

self的使用
为了保持简洁，可以避免使用 self 关键词，因为Swift 在访问对象属性和调用对象方法不需要使用 self。

不过当在构造器中需要区分属性名和参数名时需要使用 self，还有当在在闭包表达式中引用属性值。

class BoardLocation  {
    let row:Int, column:Int
    init(row:Int, column:Int)  {
        self.row=row
        self.column=column
        let closure= {
            print(self.row)    
         }  
    }
}
计算属性
为了保持简洁，如果一个属性是只读的，请忽略掉get语句。因为只有在需要定义set语句的时候，才需要get语句。

正例

var diameter:Double{
    return radius*2
}
反例

var diameter:Double{
     get{
        return radius*2
     }
}
Final
给那些不打算被继承的类使用final 修饰符， 例如:

// Turn any generic type into a reference type using this Box class.
final classBox<T>{
     let value: T
     init(_ value: T) {
         self.value=value  
     }
}

函数声明
在定义短函数声明时保持在一行，一行并包括头括号:

func reticulateSplines(spline: [Double])->Bool{
     // xxoo
}
对于声明较长的函数时，在适当的位置换行并在第二行多添加一个缩进：

func reticulateSplines(spline: [Double], adjustmentFactor:Double,    translateConstant:Int,          comment:String)->Bool{
      // ooxx
}
闭包表达式
仅在闭包表达式参数在参数列表中的最后一个时，使用尾随闭包表达式。闭包参数命名要有描述性。

正例

UIView.animateWithDuration(1.0) {
     self.myView.alpha=0
}

UIView.animateWithDuration(1.0,  
      animations: {
            self.myView.alpha=0
       }, 
        completion: { finished in 
              self.myView.removeFromSuperview()  
   }
)
反例

UIView.animateWithDuration(1.0, animations: {
      self.myView.alpha=0
}) 

UIView.animateWithDuration(1.0, 
        animations: {
              self.myView.alpha=0
           }) { f in
          self.myView.removeFromSuperview()
}
当单个闭包表达式上下文清晰时，使用隐式的返回值：

attendeeList.sort{ a, b in
     a > b
}
链式方法使用尾随闭包会更清晰易读，至于如何使用空格，换行，还是使用命名和匿名参数不做具体要求。

let value=numbers.map{ $0*2 }.filter{  $0%3==0 }.indexOf(90)

let value=numbers
          .map{ $0*2 }
          .filter{ $0>50 }
          .map{$0+10}
类型
优先使用Swift原生类型，可以根据需要使用Objective-C提供的方法，因为Swift提供了到Objective-C的桥接 。

正例

let width = 120.0  // Double
let widthString = (width as NSNumber).stringValue // String
反例

let width: NSNumber = 120.0 // NSNumber
let widthString: NSString=width.stringValue  // NSString
在 Sprite Kit 代码中, 使用CGFloat可以避免数据多次转换，让代码更简洁。

常量
定义常量使用let关键字，定义变量使用var关键字. 如果变量的值不会改变要使用常量。

建议: 一个好的技巧是，使用 let 定义任何东西，只有在编译器提出警告需要改变的时候才修改为 var 定义。

你可以使用类型属性来定义类型常量而不是实例常量，使用static let 可以定义类型属性常量。 这样方式定义类别属性整体上优于全局常量，因为更容易区分于实例属性. 比如:

正例

enum Math {
 static let e=2.718281828459045235360287  
 static let pi=3.141592653589793238462643
}
radius * Math.pi * 2// 周长
Note: 使用枚举的好处是变量不会被无意初始化和全局有效。

反例

let e=2.718281828459045235360287// 污染全局命名空间
let pi=3.141592653589793238462643

radius * pi * 2// pi是实例数据还是全局常量？
静态方法和变量类型属性
静态方法和类别属性的工作原理类似于全局方法和全局属性，应该节制使用。它们的使用场景在于如果某些功能局限于特别的类型或和Objective-C 互相调用。

可选类型
可以变量和函数返回值声明为可选类型(?)，如果nil值可以接受。

当你确认实例变量会稍晚在使用前初始化，可以在声明时使用!来隐式的拆包类型，比如在viewDidLoad中会初始化的子视图。

当你访问一个可选类型值时，如果只需要访问一次或者在可选值链中有多个可选类型值时，请使用可选类型值链：

self.textContainer?.textLabel?.setNeedsDisplay()
如果可以方便的一次性拆包或者执行多次性操作时，使用可选类型绑定:

if let textContainer =self.textContainer {
      // 对textContainer多次操作
}
当我们命名一个可选值变量和属性时，避免使用如optionalString 或 maybeView名称，因为可选值的已经体现在类型定义中。

在可选值绑定时，直接映射原始的命名比使用诸如unwrappedView 或 actualLabel好。

正例

var subview: UIView?
var volume:Double?

// later on...
if let subview=subview, volume=volume {
      // xxoo
}
反例

var optionalSubview: UIView?
var volume:Double?
if let unwrappedSubview=optionalSubview {
    if let realVolume=volume {
          // ooxx
    }
}
结构体构造器
使用Swift原生的结构体构造器而不是传统的的CGGeometry构造器。

正例

let bounds=CGRect(x:40, y:20, width:120, height:80)
let centerPoint=CGPoint(x:96, y:42)
反例

let bounds=CGRectMake(40,20,120,80)
let centerPoint=CGPointMake(96,42)
推荐使用结构体内部的常量CGRect.infiniteRect,CGRect.nullRect等，来替代全局常量CGRectInfinite,CGRectNull等。对于已经存在的变量值，可以简写成 .zero。

延迟初始化
延迟初始化用来细致地控制对象的生命周期，这对于想实现延迟加载视图的UIViewController特别有用. 你可以使用即时被调用闭包或私有构造方法：

lazy var locationManager: CLLocationManager=self.makeLocationManager()

private func makeLocationManager()->CLLocationManager {
    let manager=CLLocationManager()                            manager.desiredAccuracy=kCLLocationAccuracyBest  
    manager.delegate=self
    manager.requestAlwaysAuthorization()
    return manager
}
注意：Location manager 的负面效果会弹出对话框要求用户提供权限，这是需要细致控制原因。

类型推断
推荐使用更加紧凑的代码，让编译器能够推断出每个常量和变量的类型。类型推断也适用于小的数组和字典，如果需要可以指定特定的类型，如 CGFloat 或 Int16 。

正例

let message="Click the button"
let currentBounds=computeViewBounds()
var names=["Mic","Sam","Christine"]
let maximumWidth: CGFloat=106.5
反例

let message:String="Click the button"
let currentBounds: CGRect=computeViewBounds()
let names=[String]()
类型注解对空的数组和字典
对空的数据和字典，使用类型注解。

正例

var names:  [String]= []
var lookup:  [String:Int]= [:]
反例

var names=[String]()
var lookup=[String: Int]()
注意：这意味着选择描述性名称更加重要。

语法糖
使用简洁的类型定义语法，而不是全称通用语法。

正例

var deviceModels: [String]
var employees: [Int:String]
var faxNumber:Int?
反例

var deviceModels:Array
var employees:Dictionary
var faxNumber:Optional
函数 VS 方法
自由函数不依附于任何类或类型，应该节制使用。如果可能优先使用方法而不是自由函数，这有助于代码的可读性和易发现性。

自由函数使用的场景是当不确定它和具体的类别或实例相关。

正例

let sorted=items.mergeSort() // 易发现性
rocket.launch()  // 可读性
反例

let sorted=mergeSort(items)// 不易被发现
launch(&rocket)
自由函数

let tuples=zip(a, b) 
let value=max(x,y,z)// 天然自由函数！
内存管理
代码应避免指针循环引用，分析对象图谱，使用弱引用和未知引用避免强引用循环. 另外使用值类型(结构体和枚举)可以避免循环引用。

延长对象生命周期
延长对象生命周期习惯上使用[weak self] 和 guard let strongSelf = self else { return }. [weak self] 优于 [unowned self] 因为前者更更能明显地self 生命周期长于闭包块。 显式延长生命周期优先于可选性拆包.

正例

resource.request().onComplete { [weak self] response in
  guard let strongSelf=self else {return}
  let model=strongSelf.updateModel(response)  
  strongSelf.updateUI(model)
}
反例

// 如果self在response之前销毁会崩溃
resource.request().onComplete { [unowned self]  response in
    let model=self.updateModel(response)
    self.updateUI(model)
}
反例

//self可能在updateModel和updateUI被释放
resource.request().onComplete { [weak self] response in
  let model=self?.updateModel(response)
  self?.updateUI(model)
}

访问控制
把 private 做为首个访问控制的修饰符. 除非需要使用 static 修饰符 或 @IBAction  和 @IBOutlet.

正例

class TimeMachine {
   private dynamic lazy var fluxCapacitor = FluxCapacitor()
}
反例

class TimeMachine {
   lazy dynamic private var fluxCapacitor=FluxCapacitor()
}

控制流程
循环使用for-in表达式，而不使用 while 表达式。

正例

for _ in 0..<3 {
   print("Hello three times")
}

for(index, person) in attendeeList.enumerate() {
     print("\(person)is at position #\(index)")
}

for index in 0.stride(to: items.count, by:2) {
   print(index)
}
for index in(0...3).reverse() {
    print(index)
}
反例

var i=0 
while i<3 {
  print("Hello three times") 
  i+=1
}

var i=0
while i<3 {
  let person=attendeeList[i]
  print("\(person)is at position #\(i)")  
  i+=1
}

黄金路径
当编码遇到条件判断时，左边的距离是黄金路径或幸福路径，因为路径越短，速度越快。不要嵌套if循环，多个返回语句是可以的。guard 就为此而设计的。

正例

func computeFFT(context: Context?, inputData: InputData?) throws->Frequencies {
    guard let context=context else { throwFFTError.NoContext }
    guard let inputData=inputData else { throwFFTError.NoInputData }
  //计算frequencies
  return frequencies
}
反例

func computeFFT(context: Context?, inputData: InputData?) throws->Frequencies {
if let context=context {
    if let inputData=inputData {
           // 计算frequencies
          return frequencies    
    } else {
         throwFFTError.NoInputData    
     }  
   } else {
      throwFFTError.NoContext  
   }
}
当有多个条件需要用 guard 或 if let 解包，可用复合语句避免嵌套。

正例

guard let number1=number1, number2=number2, number3=number3 else{
    fatalError("impossible") 
}
// 处理number
反例

if let number1=number1 {
     if let number2=number2 {
           if let number3=number3 {
               // 处理number 
             } else {      
              fatalError("impossible")    
             }  
         } else {    
            fatalError("impossible")  
          }
      } else {
   fatalError("impossible")
}
失败防护
防护语句的退出有很多方式，一般只有一行语句，如 return,throw,break,continue 和 fatalError()等。 避免出现大的代码块，如果清理代码需要多个退出点，可以用 defer 模块避免重复清理代码。

分号
Swift不强制每条语句有分号，当一行内写多个语句的时候是必须的。

不要在一行里用分号分割写多个语句。

例外的是在构造for递增循环时需要使用分号，但构造for循环时推荐使用 用 for-in 结构。

正例

let swift="not a scripting language"
反例

let swift="not a scripting language";
圆括号
条件判断时圆括号不是必须的，建议省略。

正例

if name=="Hello" {
    print("World")
}
反例

if(name=="Hello") {
   print("World")
}

