//
//  PostDetailViewController.swift
//  DOC3 Project
//
//  Created by SongYuda on 5/28/17.
//  Copyright © 2017 SongYuda. All rights reserved.
//

import UIKit
import Parse

class PostDetailViewController: UIViewController {
    
    var post: PFObject!
    
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var postTimeLabel: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var contentTextView: UITextView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(post.description)

        if let name = post["name"] as? String {
            nameLabel.text = name
        }
        else {
            nameLabel.text = "ananomous"
        }
        
        if let title = post["title"] as? String {
            titleLable.text = title
        }
        else {
            titleLable.text = ""
        }
        
        if let content = post["content"] as? String{
            contentTextView.text = content
        }
        
        if let image = post["profile"] as? PFFile {
            image.getDataInBackground(block: { (imageData, error) in
                if let imageData = imageData {
                    self.profileImageView.image = UIImage(data: imageData)
                }
            })
        }
        else {
            let image = #imageLiteral(resourceName: "iconmonstr-user-20-240")
            self.profileImageView.image = image
        }
        
        let radius = profileImageView.frame.width / 2
        profileImageView.layer.cornerRadius = radius
        profileImageView.layer.masksToBounds = true
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d HH:mm"
        
        if let date = post.updatedAt {
        
        postTimeLabel.text = dateFormatter.string(from: date)
            
        }
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
