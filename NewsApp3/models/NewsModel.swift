// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let news = try? JSONDecoder().decode(News.self, from: jsonData)

import Foundation

// MARK: - News
struct NewsModel: Codable {
    let status, source, sortBy: String
    let articles: [ArticleModel]
}

// MARK: - Article
struct ArticleModel: Codable {
    let author, title, description: String
    let url: String
    let urlToImage: String
    let publishedAt: String //should convert to Date later
}
