//
//  HomeViewController.swift
//  instagram
//
//  Created by Rey Oliva on 6/27/17.
//  Copyright © 2017 Rey Oliva. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDataSource {

    var posts: [PFObject] = []
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
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self as? UITableViewDelegate
        // Do any additional setup after loading the view.
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
