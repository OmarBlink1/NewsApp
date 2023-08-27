//
//  utilities.swift
//  NewsApp3
//
//  Created by Blinnk22 User on 23/08/2023.
//

import Foundation
func convertDate(_ dateString: String) -> String {
  // Create a date formatter with the desired format.
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

  // Convert the date string to a Date object.
  let date = dateFormatter.date(from: dateString)!

  // Create a new date formatter with the desired output format.
  let outputFormatter = DateFormatter()
  outputFormatter.dateFormat = "d/M/yyyy h:mm a"

  // Get the formatted date string.
  let formattedDateString = outputFormatter.string(from: date)

  return formattedDateString

}
let dummyData = ""

enum NetworkError: Error {
    case badURL
    case DecodingFailed
    case FetchingFailed
}

let NewsURL = "https://newsapi.org/v1/articles?source=techcrunch&apiKey=6d6c705de0144601ae596a1cee44e9fa"
