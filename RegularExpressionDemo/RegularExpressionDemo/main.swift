//
//  main.swift
//  RegularExpressionDemo
//
//  Created by DragonLi on 2017/9/4.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

import Foundation

var stringValue = "110222196211067134"

var resultValue = stringValue.isLegalIDCardNumber()

print("110222196211067134:是不是大陆身份证\(resultValue)")

stringValue = "1709011869_"

resultValue = stringValue.isLegalIDCardNumber()

print("1709011869_:是不是手机号\(resultValue)")

