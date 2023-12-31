//  NewsViewModel.swift


import Foundation
import UIKit
import Alamofire
class NewsViewModel
{
    weak var output : DetailViewController?
    
    static func present(_ myArt : ArticleModel , currentViewController : UIViewController)
    {
        print("Inside NewsViewModel")
        let customViewController = DetailViewController()
        customViewController.myArticle = myArt
        customViewController.modalPresentationStyle = .fullScreen
        currentViewController.present(customViewController, animated: true)
    }
    
    func Set_labels()
    {
        let vc = self.output
        vc?.myAuthor?.text = "✍️ \(vc?.myArticle.author)"
        vc?.myDate?.text = "🕰 \(convertDate((vc?.myArticle.publishedAt)!))"
        
        vc?.myDesciption?.text = vc?.myArticle.description
        guard let imgURL = URL(string: (vc?.myArticle.urlToImage)!) else { return }
        
        vc?.myImage?.af_setImage(withURL: imgURL , placeholderImage: UIImage(named: "basket"))
        vc?.myImage?.layer.masksToBounds = true
        vc?.myImage.layer.cornerRadius = CGRectGetWidth((vc?.myImage.frame)!)/30.0

        vc?.myDesciption?.layer.masksToBounds = true
        vc?.myDesciption?.layer.cornerRadius = 9.0
        vc?.URLbutton?.layer.cornerRadius = 9.0
        vc?.BackButton?.layer.cornerRadius = 9.0
    }
              
}
