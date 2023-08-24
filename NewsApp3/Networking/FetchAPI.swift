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
import Foundation


func FetchNews(afterFetchCompletion : @escaping (_ result : Result<NewsModel,NetworkError>)->Void)
{
    guard let url = URL(string: NewsURL) else {afterFetchCompletion(.failure(NetworkError.badURL)) ; return}
    let task = URLSession.shared.dataTask(with: url) { data, res, err in
        if err == nil , let data = data
        {
            print("Data" , data)
            do
            {
                let myNews = try JSONDecoder().decode(NewsModel.self, from: data)
                /// if i arrived here means I'm not at catch 👍🏼
                afterFetchCompletion(.success(myNews))
            }
            catch
            {
                print(error)
                afterFetchCompletion(.failure(.DecodingFailed))
            }
        }
        else
        {
            afterFetchCompletion(.failure(NetworkError.FetchingFailed))
        }
    }
    task.resume()
}




func FetchImage(imageURL : String , afterFetchCompletion : @escaping (_ result : Result<Data,NetworkError>)->Void)
{
    guard let url = URL(string: imageURL) else {afterFetchCompletion(.failure(NetworkError.badURL)) ; return}
    let task = URLSession.shared.dataTask(with: url) { data, res, err in
        if err == nil , let data = data
        {
            afterFetchCompletion(.success(data))
        }
        else
        {
            afterFetchCompletion(.failure(NetworkError.FetchingFailed))
        }
    }
    task.resume()
}

