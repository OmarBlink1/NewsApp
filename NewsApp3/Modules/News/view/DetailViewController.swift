//  DetailViewController.swift
//  NewsApp3

import UIKit
import AlamofireImage
class DetailViewController: UIViewController , Detail_viewModel_ouput{
    func updateView(single_article: ArticleModel) {
        
    }
    
    var myArticle :ArticleModel!
    private var viewModel = NewsViewModel()
    
    @IBOutlet var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        NewsViewModel.Set_labels(self)
        self.viewModel.output = self
        self.viewModel.Set_labels()
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
