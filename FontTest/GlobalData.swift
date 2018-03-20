//
//  GlobalData.swift
//  FontTest
//
//  Created by Myeong chul Kim on 2018. 1. 30..
//  Copyright © 2018년 Myeong chul Kim. All rights reserved.
//

import Foundation
import UIKit

class GlobalData {
    
    static let sharedInstance = GlobalData()

    var strInputText : String!
    var fFontSize : CGFloat!
    var iStyleIndex : Int!
    
    private init() {
        self.strInputText = ""
        self.fFontSize = 0.0
        self.iStyleIndex = 0
    }
}
