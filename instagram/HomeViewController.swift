//
//  HomeViewController.swift
//  instagram
//
//  Created by Rey Oliva on 6/27/17.
//  Copyright © 2017 Rey Oliva. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class HomeViewController: UIViewController, UITableViewDataSource {

    var posts: [PFObject] = []
    var refreshControl: UIRefreshControl!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    @IBAction func logoutButton(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
            print("You're logged out")
            self.performSegue(withIdentifier: "logoutSegue", sender: nil)
            // PFUser.currentUser() will now be nil
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedPostCell", for: indexPath) as! feedPostCell
        
        let post = posts[indexPath.row]
        let caption = post["caption"] as! String
        let author = post["author"] as! PFUser
        let media = post["media"] as! PFFile
        cell.feedCaption.text = caption
        cell.abovePhotoProfileName.text = author.username
        cell.belowPhotoProfileName.text = author.username
        cell.feedPhoto.file = media
        cell.feedPhoto.loadInBackground()
        
        return cell
    }
    
    func fetchPosts() {
        
        let query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        query.limit = 20
        //fetch data asychronously
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let posts = posts {
                self.posts = posts
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
                //do something with the array of objects returnedby the call
//                for post in posts {
//                    //access the object as a dictionary and cast type
//                    let likeCount  = post["likesCount"] as? Int
//                }
            } else {
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    func didPullToRefresh(_ refreshControl: UIRefreshControl) {
        fetchPosts()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(HomeViewController.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        fetchPosts()
        tableView.dataSource = self
        tableView.delegate = self as? UITableViewDelegate
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){
            let post = posts[indexPath.row]
            let destinationViewController = segue.destination as! PhotoDetailViewController
        
            destinationViewController.post = post

            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
