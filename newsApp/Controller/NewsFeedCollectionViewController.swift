//
//  NewsFeedCollectionViewController.swift
//  newsApp
//
//  Created by Reza Arief on 25.02.19.
//  Copyright © 2019 Reza Arief. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class NewsFeedCollectionViewController: UICollectionViewController {

    
    //properties
    let article: Article = Article(title: "News Dummy", content: "Dummy content. Dummy content.Dummy content. Dummy content. Dummy content. Dummy content. Dummy content. Dummy content. Dummy content. Dummy content. Dummy content. Dummy content. Dummy content. Dummy content. Dummy content. Dummy content.", author: "JJ Dummy Author", publishedAt: "10. Jan 2019", image:UIImage(named: "langosch")!, imageUrl: "url")
    var articles = [Article]()
    var newsFeed: NewsFeed?
    @IBOutlet weak var newsFeedCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...5 {
            articles.append(article)
        }
        
        newsFeed = NewsFeed(status: 200, totalResults: articles.count)
        newsFeed?.articles = articles
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        self.newsFeedCollectionView.delegate = self
        self.newsFeedCollectionView.dataSource = self
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return newsFeed!.totalResults
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewsFeedCollectionViewCell
        cell.title.text = newsFeed!.articles[indexPath.row].title
        cell.content.text = newsFeed!.articles[indexPath.row].content
        cell.publishTime.text = newsFeed!.articles[indexPath.row].publishTime
        cell.author.text = newsFeed!.articles[indexPath.row].author
        cell.newsImage.image = newsFeed!.articles[indexPath.row].image
        
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
