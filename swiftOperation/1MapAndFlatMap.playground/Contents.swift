// 6.12  2016 LFL
//map 和 flatMap

import UIKit
/// map
let numberArrarys = [1,2,3,4,5,6]

let resultNumbers = numberArrarys.map { $0 + 2}
/**
 *  @brief map 方法接受一个闭包作为参数， 然后它会遍历整个 numbers 数组，并对数组中每一个元素执行闭包中定义的操作。 相当于对数组中的所有元素做了一个映射

 func map<T>(transform: (Self.Generator.Element) -> T) rethrows -> [T]
    Self.Generator.Element :当前元素的类型
 注意:这个闭包的返回值，是可以和传递进来的值不同
 */
print("map latter\(resultNumbers)")

let resultString = numberArrarys.map { "LFL->\($0)" }

print(resultString)

resultString.dynamicType  // String数组

///flatMap

let flatNumber = numberArrarys.flatMap{$0 + 2}
    print(flatNumber)   // 和map一样 

//                  区别

let numbersCompound = [[1,2,3],[4,5,6]];
var res = numbersCompound.map { $0.map{ $0 + 2 } }
/**
    这个调用实际上是遍历了这里两个数组元素 [1,2,3] 和 [4,5,6]。 因为这两个元素依然是数组，所以我们可以对他们再次调用 map 函数：$0.map{ $0 + 2 }。 这个内部的调用最终将数组中所有的元素加 2
 */

// [[3, 4, 5], [6, 7, 8]]

var flatRes = numbersCompound.flatMap { $0.map{ $0 + 2 } }
/**
 flatMap 依然会遍历数组的元素，并对这些元素执行闭包中定义的操作。 但唯一不同的是，它对最终的结果进行了所谓的 "降维" 操作。 本来原始数组是一个二维的， 但经过 flatMap 之后，它变成一维的了。
 */
// [3, 4, 5, 6, 7, 8]  降为一唯数组

/**
 1.和 map 不同， flatMap 有两个重载
 func flatMap<S : SequenceType>(transform: (Self.Generator.Element) -> S) -> [S.Generator.Element]
 flatMap的闭包接受的是数组的元素，但返回SequenceType 类型，也就是另外一个数组。
 我们传入给 flatMap 一个闭包 $0.map{ $0 + 2 } , 这个闭包中，又对 $0 调用了 map 方法， 从 map 方法的定义中我们能够知道，它返回的还是一个集合类型，也就是 SequenceType。 所以我们这个 flatMap 的调用对应的就是第二个重载形式
 
 */

//查阅源码  
/**
 文件位置： swift/stdlib/public/core/SequenceAlgorithms.swift.gyb
 extension Sequence {
 public func flatMap<S : Sequence>(
 @noescape transform: (${GElement}) throws -> S
 ) rethrows -> [S.${GElement}] {
 var result: [S.${GElement}] = []
 for element in self {
 result.append(contentsOf: try transform(element))
 }
 return result
 }
 1.对遍历的每一个元素调用try transform(element)。 transform 函数就是我们传递进来的闭包
 2.然后将闭包的返回值通过 result.append(contentsOf:) 函数添加到 result 数组中。
 2.1 名词简单说就是将一个集合中的所有元素，添加到另一个集合。

 }
 */


// 2 func flatMap<T>(transform: (Self.Generator.Element) -> T?) -> [T]
/**
 它的闭包接收的是 Self.Generator.Element 类型， 返回的是一个 T? 。 我们都知道，在 Swift 中类型后面跟随一个 ?， 代表的是 Optional 值。 也就是说这个重载中接收的闭包返回的是一个 Optional 值。 更进一步来说，就是闭包可以返回 nil
 */
let optionalArray: [String?] = ["AA", nil, "BB", "CC"];
var optionalResult = optionalArray.flatMap{ $0 }
// ["AA", "BB", "CC"]
//而使用 print 函数输出 flatMap 的结果集时，会得到这样的输出：

//["AA", "BB", "CC"]

//也就是说原始数组的类型是 [String?] 而 flatMap 调用后变成了 [String]。 这也是 flatMap 和 map 的一个重大区别

//适用;过滤无效数据

var imageNames = ["1.png", "2.png", "nil.png"];
imageNames.flatMap{ UIImage(named: $0) }

//查阅源码
/**
 *  依然是遍历所有元素，并应用 try transform(element) 闭包的调用， 但关键一点是，这里面用到了 if let 语句， 对那些只有解包成功的元素，才会添加到结果集中:
 if let newElement = try transform(element) {
 result.append(newElement)
 }
 */




