//
//  Helper.swift
//  CloudsAPP
//
//  Created by mike on 2017/8/14.
//  Copyright © 2017年 mike. All rights reserved.
//

import Foundation

class Helper {//singleton pattern 的定義
    static let sharedInstance = Helper()//自己初始化後放在 static
    
    var apiGithubComJsons: [ApiGithubComJsonGloss]?//宣告的變數可以全域使用
    var apiStudentServer: [ApiStudentServer]?
}
