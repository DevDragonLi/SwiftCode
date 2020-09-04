# Swift Note

- **Swift**中声明方法
  - fileprivate 当前类读取(3.0开始) 
  - override 重写父类
  - func methodName (参数名: type )
  
```
 fileprivate func addChildVc(_ storyName : String) {
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        addChildViewController(childVc)
    }
    
  // override:有提示加关键字 重写父类属性,Swift 改写了很多方法为属性
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }   
    
```

- **控制器方法使用 extension**,分散实现,方便查找 **MARK:-**

``` 
// MARK:- detail  
extension LFLVC {
    fileprivate func setupDetail() {
     ///  
    }
```

- **点击事件处理** 
 - 事件监听 --> 发送消息 --> 将方法包装SEL  --> 类方法列表 --> IMP

```
action: #selector(Click))

extension LFLVC {
    @objc fileprivate func Click() {
        print("---Click handle--")
    }
}

```

- **分类** :new Swift file 
   - init前加上convenience 关键字的初始化方法，这是swift初始化方法中的“二等公民”，只作为补充和提供使用上的方便。另外convenience的初始化方法是不能被子类重写或从子类中以super的方式被调用的
  
```
extension UIColor {

// 1.在extension中给系统的类扩充构造函数,只能扩充`便利构造函数`
  convenience init(r : CGFloat, g : CGFloat, b : CGFloat, alpha : CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
// 2. ? 可选   alpha : CGFloat = 1.0 默认参数 方便使用  
convenience init?(hex : String, alpha : CGFloat = 1.0) {

 //3. guard 守护 
    guard hex.characters.count >= 6 else {
        return nil
    }
//4. 把字符串 as OC 的 字符串类型,使用 OC 的一些方法   as也就是某种意义的强转
tempHex = (tempHex as NSString).substring(from: 2)


}

}
```


- 自定义 类注意点和遵守协议

```
  1. 类中 init 指定初始化方法 需要先执行 self.init 然后再赋值
  
  2. 遵守协议 
  extension LFLVC :UITableViewDelegate{
    // 代理方法即可
    }
  
```

- **懒加载和闭包**  ,self 涉及

```
1. 懒加载
  fileprivate lazy var name_LFL :String = {
     let name_LFL = "dragonLi"
        return name_LFL
    }()

2. 闭包内部self 不可以省略 ,还有就是方法有可能重名
3. 对于注册 cell  字符串 直接类.self
4. private let KcellID = "DragonLi"  常量申明,取代部分宏

```

- **代理**   继承类 `class` 比较轻级别 使用 `weak` 修饰

```
 extension LFLView :LFLViewDelegate{
  // 协议的代理方法
 }
 
 
```





