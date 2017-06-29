//
//  AddCaptionViewController.swift
//  instagram
//
//  Created by Rey Oliva on 6/28/17.
//  Copyright © 2017 Rey Oliva. All rights reserved.
//

import UIKit
import Parse

class AddCaptionViewController: UIViewController, UITextFieldDelegate {
    
    var image: UIImage!
    @IBOutlet weak var photoToPost: UIImageView!
    @IBOutlet weak var addCaptionTextField: UITextField! = nil
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoToPost.image = image
        addCaptionTextField.delegate = self
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
