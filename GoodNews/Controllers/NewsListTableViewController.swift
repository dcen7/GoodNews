//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Mehmet Deniz Cengiz on 9/14/22.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    private var articalListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6ff5d4ebb7544b27a4a2a1f75edbe623")!
       
        
        Webservice().getArticles(url: url) { articles in
            if let articles = articles {
                self.articalListVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return articalListVM == nil ? 0 : self.articalListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articalListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else { fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = articalListVM.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM.title
        cell.descrioptionLabel.text = articleVM.description
        return cell
    }
}
