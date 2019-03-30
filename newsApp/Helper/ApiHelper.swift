//
//  ApiHelper.swift
//  newsApp
//
//  Created by Reza Arief on 30.03.19.
//  Copyright © 2019 Reza Arief. All rights reserved.
//

import Foundation
class ApiHelper {
    static let shared = ApiHelper()
    
    let apiKey = "5143e461ef0a40b88f500726622f1941"
    let basePath = "https://newsapi.org"
    let topHeadlines = "/v2/top-headlines"
    let everything = "/v2/everything"
    
    static func fetchNews(with country:String,with endPoint:String) -> ([Article]) {
        let url = ApiHelper.shared.basePath + endPoint + "?country=\(country)&apiKey=\(ApiHelper.shared.apiKey)"
        let request = URLRequest(url: URL(string: url)!)
        var articleArray:[Article] = []
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let articles = json["articles"] as? [[String:Any]] {
                            
                            for articleJson in articles {
                                let article = try Article(item: articleJson)
                                articleArray.append(article)
                            }
                        }
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
        return articleArray
    }
}
