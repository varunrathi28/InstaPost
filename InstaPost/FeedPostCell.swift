//
//  FeedPostCell.swift
//  InstaPost
//
//  Created by Varun Rathi on 20/03/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import Firebase

class FeedPostCell: UITableViewCell {

    @IBOutlet weak var profileImage:UIImageView!
    @IBOutlet weak var lblUserName:UILabel!
    @IBOutlet weak var postImage:UIImageView!
    @IBOutlet weak var postCaption:UITextView!
    @IBOutlet weak var likes:UILabel!
    @IBOutlet weak var btnLike:UIButton!
    @IBOutlet weak var cellContainerView:UIView!
    
    var post:Post!
    var isLiked:Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        postImage.layer.cornerRadius = 5.0
        
        cellContainerView.layer.cornerRadius = 5.0
        btnLike.setImage(UIImage(named: "empty-heart"), for: .normal)
         btnLike.setImage(UIImage(named: "filled-heart"), for: .selected)
    
    }
    
    func configureCell(aPost:Post ,img:UIImage? = nil)
    {
        self.post = aPost
        self.postCaption.text = post.caption
        
        if img != nil
        {
            self.postImage.image = img
        }
        else
        {
                          let ref = FIRStorage.storage().reference(forURL: aPost.imagesUrl)
                ref.data(withMaxSize: 2 * 1024 * 1024, completion: { (data, error) in
                    
                    if error != nil {
                        print("IP:Unable to Download Image")
                    }
                    else {
                        
                        if let imgData = data {
                            
                            if let image = UIImage(data: imgData) {
                                
                                self.postImage.image = image
                                FeedsViewController.imageCache.setObject(image, forKey: self.post.imagesUrl as NSString)
                            }
                        }
                        
                    }
                })
        }
    }
    
    @IBAction func likedClicked(sender:AnyObject)
    {
        btnLike.isSelected = !btnLike.isSelected
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension FeedPostCell : UITextViewDelegate
{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n"
        {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}


