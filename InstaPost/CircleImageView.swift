
//
//  CircleImageView.swift
//  InstaPost
//
//  Created by Varun Rathi on 18/03/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {

   override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        
        layer.cornerRadius = self.frame.height/2
        clipsToBounds = true
        
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
