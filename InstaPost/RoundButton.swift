//
//  RoundButton.swift
//  InstaPost
//
//  Created by Varun Rathi on 16/03/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    override func  awakeFromNib()
    {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        imageView?.contentMode = .scaleAspectFit
        
        layer.cornerRadius = self.frame.height/2
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
       // layer.cornerRadius = 5.0 //self.frame.height/2
    }
   }
