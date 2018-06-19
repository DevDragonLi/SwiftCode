//: Playground - noun: a place where people can play

import UIKit
/*
 场景:评论界面置顶某个回复
 */
public  var shouldHightModel : String!  // 需要置顶的元素
fileprivate var dataArray = [String]()

    shouldHightModel = "666"
    dataArray = ["😆","稳","厉害了","可以"]

    if  shouldHightModel != nil && dataArray.count > 0{
    let indexValue =  dataArray.index(of: shouldHightModel)
    if let valueIndex = indexValue { // 存在此元素 print("元素查找位置:\(valueIndex)")
        (dataArray[0],dataArray[valueIndex]) = (dataArray[valueIndex],dataArray[0])
    }else{ // 不存在  print("元素不在此数组中")
        dataArray.insert(shouldHightModel, at: 0)
    }
}
print("handle datas\(dataArray)")
