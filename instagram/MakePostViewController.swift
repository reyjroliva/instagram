//
//  MakePostViewController.swift
//  instagram
//
//  Created by Rey Oliva on 6/28/17.
//  Copyright © 2017 Rey Oliva. All rights reserved.
//

import UIKit
import Parse

class MakePostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var useCameraButton: UIButton!
    @IBOutlet weak var useGalleryButton: UIButton!
    @IBOutlet weak var photoToPost: UIImageView!
    @IBOutlet weak var useNextButton: UIButton!
    
    
    
    @IBAction func useGallery(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func useCamera(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            print("Camera is available")
            vc.sourceType = .camera
        } else {
            print("Camera is not available so we will use photo library instead")
            vc.sourceType = .photoLibrary
        }
        self.present(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //Get the image captured by the UIImagePickerController
        //let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        
        photoToPost.image = editedImage
        //Do something with the images (based on your use case)
        
        //Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func useNext(_ sender: Any) {
        if photoToPost.image != nil {
            self.performSegue(withIdentifier: "addCommentSegue", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        useCameraButton.layer.cornerRadius = 8
        useGalleryButton.layer.cornerRadius = 8
        useNextButton.layer.cornerRadius = 8
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
