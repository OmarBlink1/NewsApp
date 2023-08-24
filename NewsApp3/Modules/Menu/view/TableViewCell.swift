//
//  TableViewCell.swift
//  NewsApp3
//
//  Created by Blinnk22 User on 23/08/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var myImage: UIImageView!
    @IBOutlet var myTitle: UILabel!
    @IBOutlet var myAuthor: UILabel!
//    var NewsURL : URL
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
