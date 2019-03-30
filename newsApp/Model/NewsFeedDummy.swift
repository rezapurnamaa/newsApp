//
//  NewsFeedDummy.swift
//  newsApp
//
//  Created by Reza Arief on 25.02.19.
//  Copyright © 2019 Reza Arief. All rights reserved.
//

import UIKit
class NewsFeedDummy: NSObject {
    //Properties
    var status: Int?
    var totalResults: Int = 0
    var articles = [ArticleDummy]()
    
    //constructor
    init(status: Int, totalResults: Int) {
        self.status = status
        self.totalResults = totalResults
    }
}
