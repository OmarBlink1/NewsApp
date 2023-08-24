//  MenuTableViewController.swift
//  NewsApp3


import UIKit
import AlamofireImage
class MenuTableViewController: UITableViewController {
    
    var Articles = [ArticleModel]()
    var ArticleImages = [Int : Data]()
    
    override func viewDidLoad() {

        MenuViewModel.updateNumberOfArticles(self)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    //Implementing Observer for Notification
    @objc func UpdateTableImage (_ notification: NSNotification)
    {
        if let res = notification.userInfo?["data"] as? Data ,let num = notification.userInfo?["num"] as? Int{
            self.ArticleImages[num] = res
            DispatchQueue.main.async {
                print("Reloading Table View")
                self.tableView.reloadData()
            }
        }
        

    }

    func UpdateTableText (_ articles: [ArticleModel])
    {
            self.Articles = articles
            DispatchQueue.main.async {
                print("Reloading Table View")
                self.tableView.reloadData()
            }

    }

    
    
    
    
    //done implementing Observer
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.Articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :TableViewCell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath) as! TableViewCell
        
        if Articles[indexPath.row] != nil{
            MenuViewModel.set_cell_labels(cell : cell, currentArticle : Articles[indexPath.row] , ind: indexPath.row)
            
        }
        return cell
    }
    

    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(Articles[indexPath.row])
        NewsViewModel.present(Articles[indexPath.row], currentViewController: self)

    }
    

}
