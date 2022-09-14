//
//  Response.swift
//  GoodNews
//
//  Created by Mehmet Deniz Cengiz on 9/14/22.
//

import Foundation

struct ArticleList: Codable {
    let articles: [Article]
}


struct Article: Codable {
    let title: String?
    let description: String?
}
