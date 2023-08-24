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
