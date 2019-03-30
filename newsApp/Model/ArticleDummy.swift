//
//  ArticleDummy.swift
//  newsApp
//
//  Created by Reza Arief on 26.02.19.
//  Copyright © 2019 Reza Arief. All rights reserved.
//

import UIKit
struct ArticleDummy {
    let title: String?
    let content: String?
    let author: String?
    let publishTime: String?
    let image: UIImage?
    let imageUrl: String?
    
    init(title: String, content:String, author: String, publishedAt: String, image: UIImage, imageUrl: String) {
        self.title = title
        self.content = content
        self.author = author
        self.publishTime = publishedAt
        self.image = image
        self.imageUrl = imageUrl
    }
}
