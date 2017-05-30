//
//  PostTableViewCell.swift
//  DOC3 Project
//
//  Created by SongYuda on 5/26/17.
//  Copyright © 2017 SongYuda. All rights reserved.
//

import UIKit
import Parse

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
   
    var post : PFObject! {
        didSet {
            titleLabel.text = post["title"] as! String
            nameLabel.text = post["name"] as! String
            if let image = post["profile"] as? PFFile {
                image.getDataInBackground(block: { (imageData, error) in
                    if let imageData = imageData {
                        self.profileImage.image = UIImage(data: imageData)
                    }
                })
            }
            else {
                let image = #imageLiteral(resourceName: "iconmonstr-user-20-240")
                self.profileImage.image = image
            }
            let radius = profileImage.frame.width / 2
            profileImage.layer.cornerRadius = radius
            profileImage.layer.masksToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
