//  DetailViewController.swift
//  NewsApp3

import UIKit
import AlamofireImage
class DetailViewController: UIViewController {
    var myArticle :ArticleModel!


    @IBOutlet var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NewsViewModel.Set_labels(self)
    }
    
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var myDate: UILabel!
    
    @IBOutlet weak var myAuthor: UILabel!
    @IBOutlet weak var myDesciption: UILabel!
    @IBOutlet weak var URLbutton: UIButton!
    
    @IBAction func pressedURL(_ sender: UIButton) {
        UIApplication.shared.openURL(NSURL(string: myArticle.url)! as URL)

    }
    @IBAction func Dismiss(_ sender: Any) {
        dismiss(animated: true)
    }
    

}
