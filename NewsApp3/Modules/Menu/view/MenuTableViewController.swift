//  MenuTableViewController.swift
//  NewsApp3


import UIKit
import AlamofireImage
class MenuTableViewController: UITableViewController, menu_viewModel_output {
   
    
    
    var Articles = [ArticleModel]()
    private var viewModel = MenuViewModel()
    

    
    override func viewDidLoad() {
        self.viewModel.output = self
        self.viewModel.fetchDetails()
    }
    
    func updateView(list_of_articles: [ArticleModel]) {
        print("Updating view from output")
        self.Articles = list_of_articles
        DispatchQueue.main.async {
            print("Reloading Table View")
            self.tableView.reloadData()
        }
    }
    
    
    
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

    ///selected/pressed some row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NewsViewModel.present(Articles[indexPath.row], currentViewController: self)
    }
    

}
