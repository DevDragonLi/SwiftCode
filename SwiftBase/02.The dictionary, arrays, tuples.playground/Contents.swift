
//:数组和字典遍历,返回元祖,第一个元素是tuple.offset 取值.
//:at 取代atIndex
import UIKit

var emptyArrary = Array<Int>()
// 简写
emptyArrary = [Int]()
//也可以指定,比如[0,0,0],一般不用
// emptyArrary = [Int](count:3,repeatedValue:0) 2.2后废弃
var kkkkkkk = [2,2,2,2,]

//添加新数组,每次增加,如果当前空间不够,会追加当前空间*2 (预分配空间,优化性能)
var combinArrary = emptyArrary + kkkkkkk
combinArrary[0]

//拼接一个元素
combinArrary.append(4)
combinArrary += [1,2,3,6] // += 一般拼接多个

combinArrary.insert(4, at: 1)
//修改对应下标数值
combinArrary[3] = 9

//修改对应范围的数值
let range = 1...3
combinArrary[range] = [1,1,1]

//删除
combinArrary.remove(at: 1) // 返回删除的数值
combinArrary.removeLast() // 
//combinArrary.removeAll()
//combinArrary = []

//遍历
for item in combinArrary{
    print(item)
}

//更详细,下表
for (index ,value) in combinArrary.enumerated(){
    print(index,value)
}
combinArrary.count
combinArrary.isEmpty

// enum block 遍历
for element in combinArrary.enumerated(){
    print(element)
}

//: 反序遍历 ---enumerated + reversed,保持正确
for re in combinArrary.enumerated().reversed(){
    print(re)
}

//          set (元素必须可以哈希化)

var sets1111 = Set([1,2,2]) // 不可以重复的
//删除
sets1111.remove(1)

//是否包含某个元素
sets1111.contains(1)

var sets222 = Set([1,2,2,4,4,5,6,8,9]) // 不可以重复的

//  查看交集 intersect
let res = sets1111.intersection(sets222) // (交集)

let outvalue = sets222.symmetricDifference(sets1111) //(二个集合去掉相同的其他元素)

let unionvalue = sets222.union(sets1111) //(并集)

//let subtractvalue = sets222.subtract(sets1111) //(叉集)
//print(subtractvalue)

sets1111.isEmpty
//MARK:改变 (of:  (with:
sets1111.isSubset(of: sets222)
sets222.isSuperset(of: sets1111) // 是否全部包含
sets222.isDisjoint(with: sets1111) // 

//:字典和元祖
let dictEmpty = Dictionary<String,String>()
let dictOne = [Int:Int]()

var dictTest = ["LFL":"twenty","DraginLi":"boy"]

// 定义 字典数组  [String:AnyObject]
let dicArray = [
    ["name":"DragonLi","age":25],
    ["name":"DragonLi","age":2]
]
print(dicArray)

dictTest["LFL"]
// 如果没有,会输出nil
dictTest["LFLTest"]

//update key or value,如果不存在,会增加
dictTest.updateValue("^^^", forKey: "LFL")

//dictTest.removeValueForKey("LFL")

//遍历
for (key ,value) in dictTest{
    print(key,value)
}
//只查看value
for value in dictTest.values{
    print(value)
}

// 字典的合并,需要遍历,如果key不存在会新增
var dictTest2 = ["LFL":"twenty","DraginLi":"boy"]

for element in dictTest{
    dictTest2[element.key] = dictTest[element.value]
}
print(dictTest2)

//  元祖  使用()直接赋值内容

let tuple_LFL = ("LFL","24")
type(of: tuple_LFL)

//查看值
let (name,age) = tuple_LFL
name
age
//使用_,
let(_,age1) = tuple_LFL
age1
//下标访问
tuple_LFL.0
tuple_LFL.1

//也可以创建时候,直接指定
var tuple2 = (name:"LFl",age:"24")
tuple2.name
tuple2.age  // 代码更直观清晰

//数组和字典每次遍历返回实际上都是元祖

var arrsTest = ["1","2"]
//:
//:
for tuple in arrsTest.enumerated(){
    print(tuple.offset,tuple.element)
}

