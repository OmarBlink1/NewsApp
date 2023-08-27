//  MenuViewModel.swift

import Foundation
import Alamofire
struct MenuViewModel {
    weak var output : MenuTableViewController?
    
    func fetchDetails() {
        AF.request(NewsURL).validate().responseDecodable(of:NewsModel.self){ (response) in
                guard let News = response.value else { return }
            print("fetched neews and calling output")
            print("Output : ",self.output)
            //MARK: NOTE 1: Is this considered Delegete ?
            self.output?.updateView(list_of_articles: News.articles)
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


