//
//  NewsFeedCollectionViewController.swift
//  newsApp
//
//  Created by Reza Arief on 25.02.19.
//  Copyright © 2019 Reza Arief. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class NewsFeedCollectionViewController: UICollectionViewController {

    
    //properties
    let article: Article = Article(title: "News Dummy", content: "Dummy content", author: "JJ Dummy Author", publishedAt: "10. Jan 2019", image:UIImage(named: "langosch")!, imageUrl: "url")
    var articles = [Article]()
//    let newsFeed: NewsFeed = NewsFeed(status: 200, totalResults: articles.count)
    @IBOutlet weak var newsFeedCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        articles.append(article)
        articles.append(article)
        articles.append(article)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.newsFeedCollectionView!.register(NewsFeedCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.newsFeedCollectionView.delegate = self
        self.newsFeedCollectionView.dataSource = self
        // Do any additional setup after loading the view.
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
        return articles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewsFeedCollectionViewCell
        cell.title.text = articles[indexPath.row].title
        cell.content.text = articles[indexPath.row].content
        cell.publishTime.text = articles[indexPath.row].publishTime
        cell.author.text = articles[indexPath.row].author
        cell.newsImage.image = articles[indexPath.row].image
        
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
