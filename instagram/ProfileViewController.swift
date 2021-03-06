//
//  ProfileViewController.swift
//  instagram
//
//  Created by Rey Oliva on 6/28/17.
//  Copyright © 2017 Rey Oliva. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    
    @IBAction func profileLogoutButton(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
            print("You're logged out")
            self.performSegue(withIdentifier: "profileLogoutSegue", sender: nil)
            // PFUser.currentUser() will now be nil
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
