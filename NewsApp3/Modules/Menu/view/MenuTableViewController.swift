//
//  MenuTableViewController.swift
//  NewsApp3
//
//  Created by Blinnk22 User on 22/08/2023.
//

import UIKit
import AlamofireImage
class MenuTableViewController: UITableViewController {
    
    var Articles = [ArticleModel]()
    var ArticleImages = [Int : Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// *added Notification Center Observer*
//        NotificationCenter.default.addObserver(self, selector: #selector(UpdateTableText(_:)), name: NotificationCenterNaming.fetch_name , object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(UpdateTableImage(_:)), name: Notification.Name("image") , object: nil)

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
    
    @objc func UpdateTableTextOld (_ notification: NSNotification)
    {
        print("Inside Update Table")
        if let res = notification.userInfo?["ans"] as? [ArticleModel]{
            self.Articles = res
            DispatchQueue.main.async {
                print("Reloading Table View")
                self.tableView.reloadData()
            }
        }
        else
        {
            print("Notification Failed")
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
        
        // Create a reference to the the appropriate storyboard

        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
//        let customViewController = DetailViewController()
//
//        self.present(customViewController, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
