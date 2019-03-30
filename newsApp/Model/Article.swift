//
//  Article.swift
//  newsApp
//
//  Created by Reza Arief on 27.03.19.
//  Copyright © 2019 Reza Arief. All rights reserved.
//

import UIKit
struct Article {
    let author:String
    let url: String
    let urlToImage:String
    let source:Source
    let content: String
    let title: String
    let publishedAt:String
    let description: String
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String)
    }
    
    init(item:[String:Any]) throws {
        
        self.author = item["author"] as? String ?? ""
        self.url = item["url"] as? String ?? ""
        self.urlToImage = item["urlToImage"] as? String ?? ""
        self.source = Source(item:item["source"] as! [String:Any])
        self.content = item["content"] as? String ?? ""
        self.title = item["title"] as? String ?? ""
        self.publishedAt = item["publishedAt"] as? String ?? ""
        self.description = item["description"] as? String ?? ""
 
    }
    
}

struct  Source {
    let id:Int?
    let name: String
    
    init(item: [String:Any]) {
        self.id = item["id"] as? Int ?? nil
        self.name = item["name"] as? String ?? ""
    }
}
