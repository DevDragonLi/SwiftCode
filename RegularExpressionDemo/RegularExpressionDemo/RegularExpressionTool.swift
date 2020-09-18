//
//  RegularExpressionTool.swift
//  RegularExpressionDemo
//
//  Created by DragonLi on 2017/9/4.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
// 

import Foundation

extension String {
    
    /// 身份证正则
    ///
    /// - Returns: boolValue
    func isLegalIDCardNumber() -> Bool {
        // 15位
        // 18位 （末尾可能存在X）
        return regularExpression(patternString:"(^[0-9]{15}$)|([0-9]{17}([0-9]|[X])$)", regexOptions: NSRegularExpression.Options.dotMatchesLineSeparators)
    }
    
    /// 手机号正则
    ///
    /// - Returns: boolValue
    func ISLegalForPhoneNumber() -> Bool {
        return regularExpression(patternString:  "1[0-9]{10}", regexOptions: NSRegularExpression.Options.caseInsensitive)
    }
    
    fileprivate  func regularExpression(patternString:String,regexOptions:NSRegularExpression.Options) -> Bool {
        var result = ""
        let regex = try! NSRegularExpression(pattern: patternString, options: regexOptions)
        // - 3、开始匹配
        let res = regex.matches(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count))
        // 输出结果
        for checkingRes in res {
            result = result + (self as NSString).substring(with: checkingRes.range)
        }
        if result == self {
            return true
        }else{
            return false
        }
    }
    
}
/*
 1. options 正则表达式的选项
 NSRegularExpressionCaseInsensitive             = 1 << 0,   // 不区分大小写的
 NSRegularExpressionAllowCommentsAndWhitespace  = 1 << 1,   // 忽略空格和# -
 NSRegularExpressionIgnoreMetacharacters        = 1 << 2,   // 整体化
 NSRegularExpressionDotMatchesLineSeparators    = 1 << 3,   // 匹配任何字符，包括行分隔符
 NSRegularExpressionAnchorsMatchLines           = 1 << 4,   // 允许^和$在匹配的开始和结束行
 NSRegularExpressionUseUnixLineSeparators       = 1 << 5,   // (查找范围为整个的话无效)
 NSRegularExpressionUseUnicodeWordBoundaries    = 1 << 6    // (查找范围为整个的话无效)
 */
