//
//  PhotoDetailViewController.swift
//  instagram
//
//  Created by Rey Oliva on 6/29/17.
//  Copyright © 2017 Rey Oliva. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PhotoDetailViewController: UIViewController {
    
    var post: PFObject!
    var caption: String = ""
    var author: String = ""
    var media: PFFile?
    var dateString: String = ""
    @IBOutlet weak var feedPhoto: PFImageView!
    @IBOutlet weak var belowPhotoProfileName: UILabel!
    @IBOutlet weak var feedCaptoin: UITextView!
    @IBOutlet weak var timestamp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let media = post["media"] as! PFFile
        let author = post["author"] as! PFUser
        let caption = post["caption"] as! String
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss +zzzz"
        dateFormatter.locale = Locale.init(identifier: "en_GB")
        dateFormatter.dateFormat = "MM-dd-yyyy"
        if let createdAt = post.createdAt {
            timestamp.text =  "\(dateFormatter.string(from: createdAt))"
        }
        feedPhoto.file = media
        feedPhoto.loadInBackground()
        belowPhotoProfileName.text = author.username
        feedCaptoin.text = caption
        
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
