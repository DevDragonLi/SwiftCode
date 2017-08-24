//````````````````````` 错误处理``````````````````//
//16年-5.31
import UIKit
//1.swift 支持在运行时跑出,捕获,传送,操作可恢复
//2.错误遵循:ErrorType这个空协议的值表示

//`````````````````` 16年   6月1 号晚上更新````````````````\\

// 192.168.1.120  每个0 -255

enum IPerror: ErrorType{
    case TooFew  // 少了
    case TooMany // 多了
    case wasbad(Int) // 不是数字
}

//1.抛出错误
throw IPerror.TooMany
//2.swift四种处理错误方式
func converIP(IPstring :String) throws {
    let components = IPstring.componentsSeparatedByString(".")
    if components.count == 4 {
        print("no error")
    } else if components.count < 4 {
        print("TooFew")
        throw IPerror.TooFew
    }
}

//使用try  
//try converIP("192.168.1")

do {
    try converIP("192")
} catch IPerror.TooFew{
    print("TooFew")
}catch IPerror.TooMany{
    print("TooMany")
}catch IPerror.wasbad(let number){
    print("wasbad  对应数字 \(number)")
}

//把错误转化为可选值,需要写返回
//let op = try? converIP("111")
//    op.dynamicType

//  指定清理工作



