
//  可选链:可以请求和调用方法,属性和下标脚本的过程,请求或者调用的目标可能为空

import UIKit
class Room {
    var roomNumber = 1
}
class Person {
    var name = ""
    var room : Room?
}
//  可选变量
var person : Person? = Person()
//强制解析
var result =  person!.name
result.dynamicType
//可选连访问 .可选类型
var result1 =  person?.name
result1.dynamicType

//如果 ,初始化,直接(),可能强制解析直接出错,但是可选链不会

//下标
var dic :[String:Person] = [:]
dic["test"]?.name // 不会报错 虽然没有 ,还可以自己洗调用.俄罗斯你结构体一直点


//类型转化
class Media{
    enum MediaType:Int {
        case movie
        case other
    }
    var mediaType = MediaType.movie // 初始化
    var name = ""
    init(name:String){
     self.name = name
    }
}

class Song:Media{  // 子类
}

class Movie:Media{  // 子类
}

let song = Song(name: "song")
let movie = Movie(name: "movie")
let media = Media(name: "media")

let collection = [song,movie,media]
collection.dynamicType // 识别到父类

//1.类的类别判定
media is Media  // 对象调取 is 后面类名 返回bool

//向下转型  as ?  as !(强制)
for item in collection{
    if let movie = item as? Movie{
    print(movie) // movie
    }else if let song = item as? Song {
        print(song) // song
    }
}

//2.和OC一样,类型swift 在= 右边确定

// AnyObject
let testCollection :[AnyObject] = [media,song] // any 类型

//嵌套类型:类等里面包含enum 等 ,参考media类 
//以扩展形式扩充 Character example
extension Character {
    enum Kind {
        case Vowel, Consonant, Other
    }
    var kind: Kind {
        switch String(self).lowercaseString {
        case "a", "e", "i", "o", "u":
            return .Vowel
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
             "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            return .Consonant
        default:
            return .Other
        }
    }
}
//该例子向Character添加了新的嵌套枚举。这个名为Kind的枚举表示特定字符的类型。具体来说，就是表示一个标准的拉丁脚本中的字符是元音还是辅音(不考虑口语和地方变种)，或者是其它类型。

//这个类子还向Character添加了一个新的计算实例属性，即kind，用来返回合适的Kind枚举成员。

//现在，这个嵌套枚举可以和一个Character值联合使用了：

func printLetterKinds(word: String) {
    print("'\\(word)' is made up of the following kinds of letters:")
    for character in word.characters {
        switch character.kind {
        case .Vowel:
            print("vowel ")
        case .Consonant:
            print("consonant ")
        case .Other:
            print("other ")
        }
    }
    print("\n")
}
printLetterKinds("Hello")


//  extension  Int example
extension Int{
    var squre :Int {return self * self}
}

10.squre  // 返回100






