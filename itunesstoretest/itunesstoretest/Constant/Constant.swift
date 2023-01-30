//
//  Constant.swift
//  itunesstoretest
//
//  Created by Ravi Borad on 16/11/22.
//

import Foundation
import UIKit

typealias ItemLoadedBlock = (_ result: Any, _ isSuccess : Bool , _ error : String) -> (Void)

//******************************** Story Boards ***************************************//
let storyboardMain = UIStoryboard(name: "Main", bundle: nil)

//******************************** URL Schema ***************************************//
let kBaseUrl = "https://itunes.apple.com/us/"
let kTopPaidApp = "rss/toppaidapplications/limit=200/json"
