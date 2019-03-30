//
//  NewsFeedCollectionViewCell.swift
//  newsApp
//
//  Created by Reza Arief on 26.02.19.
//  Copyright © 2019 Reza Arief. All rights reserved.
//

import UIKit

class NewsFeedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var publishTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 4.0
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor.clear.cgColor
        containerView.layer.masksToBounds = false
    }
    
    var article: Article? {
        didSet {
            if let article = article {
                title.text = article.title
                content.text = article.content
                publishTime.text = article.publishedAt
                author.text = article.author
                setupImage()
            }
        }
    }
    
    func setupImage() {
        guard article!.urlToImage.isEmpty != true else {
            self.newsImage.image =  #imageLiteral(resourceName: "langosch.jpg")
            return
        }
        
        if let imageUrl = article?.urlToImage {
            let url = URL(string: imageUrl)
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                
                guard data != nil else{
                    self.newsImage.image =  #imageLiteral(resourceName: "langosch.jpg")
                    return
                }
                
                DispatchQueue.main.async {
                    self.newsImage.image = UIImage(data: data!)
                }
            }.resume()
        }
    }
}
