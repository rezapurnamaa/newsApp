//
//  NewsFeedCollectionViewCell.swift
//  newsApp
//
//  Created by Reza Arief on 26.02.19.
//  Copyright © 2019 Reza Arief. All rights reserved.
//

import UIKit

class NewsFeedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var publishTime: UILabel!
}
