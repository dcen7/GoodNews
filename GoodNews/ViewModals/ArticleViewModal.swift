//
//  ArticleViewModal.swift
//  GoodNews
//
//  Created by Mehmet Deniz Cengiz on 9/14/22.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModal {
        let article = self.articles[index]
        return ArticleViewModal(article)
    }
}

struct ArticleViewModal {
    private let article: Article
}

extension ArticleViewModal {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModal {
    var title: String {
        return self.article.title ?? "title"
    }
    
    var description: String {
        return self.article.description ?? "description"
    }
}
