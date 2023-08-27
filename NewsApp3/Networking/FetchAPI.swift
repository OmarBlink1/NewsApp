//
//  FetchAPI.swift
//  NewsApp3
//
//  Created by Blinnk22 User on 23/08/2023.
//

enum NetworkError: Error {
    case badURL
    case DecodingFailed
    case FetchingFailed
}

let NewsURL = "https://newsapi.org/v1/articles?source=techcrunch&apiKey=6d6c705de0144601ae596a1cee44e9fa"
