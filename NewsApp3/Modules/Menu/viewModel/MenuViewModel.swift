//  MenuViewModel.swift

import Foundation
import Alamofire
struct MenuViewModel {
    static func updateNumberOfArticles(_ vc : MenuTableViewController){
        ///returns number of rows  needed in menu
        ///It should call the API and return the array in JSON length
        
        AF.request(NewsURL).validate().responseDecodable(of:NewsModel.self){ (response) in
                guard let News = response.value else { return }
            print("New response",News.articles)
            vc.UpdateTable(News.articles)
        }
        
    }
    
    static func set_cell_labels(cell : TableViewCell , currentArticle : ArticleModel ,  ind : Int)
    {
        let currentImageURL = NSURL(string: currentArticle.urlToImage)
        cell.myImage?.af_setImage(withURL: currentImageURL as! URL , placeholderImage: UIImage(named: "basket"))
        cell.myImage?.layer.cornerRadius = 9.0
        cell.myTitle?.text = currentArticle.title
        cell.myAuthor?.text = currentArticle.author
        let date = convertDate(currentArticle.publishedAt)
        cell.dateLabel?.text = date
        
    }
}


