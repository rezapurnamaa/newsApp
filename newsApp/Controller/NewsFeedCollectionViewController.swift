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
    
    @IBOutlet weak var newsFeedCollectionView: UICollectionView!
    var results = [[String:Any]]()
    var realArticles:[Article]?
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch(country: "de", endPoint: ApiHelper.shared.topHeadlines)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        self.newsFeedCollectionView.delegate = self
        self.newsFeedCollectionView.dataSource = self
    }

    func fetch(country: String, endPoint: String) {
//       realArticles = ApiHelper.fetchNews(with: "de", with: ApiHelper.shared.topHeadlines)
        let url = ApiHelper.shared.basePath + endPoint + "?country=\(country)&apiKey=\(ApiHelper.shared.apiKey)"
        let request = URLRequest(url: URL(string: url)!)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let articles = json["articles"] as? [[String:Any]] {
                            self.realArticles = [Article]()
                            for articleJson in articles {
                                let article = try Article(item: articleJson)
                                self.realArticles?.append(article)
                            }
                        }
                    }
                    DispatchQueue.main.async {
                        self.newsFeedCollectionView.reloadData()
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
        //reload collectionView
        
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
        return realArticles?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewsFeedCollectionViewCell
        cell.article = realArticles![indexPath.item]
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.layer.cornerRadius).cgPath
        
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
