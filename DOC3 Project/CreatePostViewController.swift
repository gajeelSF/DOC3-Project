//
//  CreatePostViewController.swift
//  DOC3 Project
//
//  Created by SongYuda on 5/26/17.
//  Copyright © 2017 SongYuda. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD
import SwiftGifOrigin

class CreatePostViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var contentTextView: UITextView!
    var pickedImage : UIImage!

    @IBOutlet weak var shareThoughtLabel: UILabel!
    
    var viewChangeOffset: CGFloat!
    
    @IBAction func onTapImage(_ sender: UITapGestureRecognizer) {
        let vc = UIImagePickerController()
        
        vc.delegate = self
        vc.allowsEditing = true
        let chooseActionSheet = UIAlertController(title:"Choose image from",message: "choose", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {action in
            print("here")
            vc.sourceType = .camera
            self.present(vc, animated: true, completion: nil)
            
        })
        let photoRollAction = UIAlertAction(title: "Photo Library", style: .default, handler: {action in
            vc.sourceType = .photoLibrary
            self.present(vc, animated: true, completion: nil)
            
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {action in
        })
        
        chooseActionSheet.addAction(cameraAction)
        chooseActionSheet.addAction(photoRollAction)
        chooseActionSheet.addAction(cancelAction)
        
        self.present(chooseActionSheet, animated: true, completion: nil)
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        print("back")
        
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        self.pickedImage = resize(image: editedImage)
        profileImage.image = self.pickedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onPost(_ sender: Any) {
        let event = PFObject(className: "post")
        
        if let name = nameTextField.text {
        
            event["name"] = name
        }
        if let title = titleTextField.text {
            event["title"] = title
        }
        if let content = contentTextView.text{
            event["content"] = content
        }
        if let image = self.pickedImage  {
            event["profile"] = getPFFileFromImage(image: image)
        }
        
        let progress = MBProgressHUD.showAdded(to: self.view, animated: true)
        
        progress.label.text = "Posting"
        
        event.saveInBackground { (success, error) in
            if success {
                print("saved")
                self.dismiss(animated: true, completion: nil)
            }
            else {
                print(error?.localizedDescription)
            }
        }
        
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                print("return image")
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
        let radius = profileImage.frame.width / 2
        profileImage.layer.cornerRadius = radius
        profileImage.layer.masksToBounds = true
        
        contentTextView.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        UIView.animate(withDuration: 0.2) {
            self.viewChangeOffset = self.shareThoughtLabel.frame.origin.y - 80

            self.view.frame.origin.y -= self.viewChangeOffset
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        UIView.animate(withDuration: 0.2) {
            self.view.frame.origin.y += self.viewChangeOffset
        }
    }

    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    func resize(image: UIImage) -> UIImage {
        let resizeImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 80, height: 80))
        resizeImageView.contentMode = UIViewContentMode.scaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
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
