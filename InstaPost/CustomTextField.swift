//
//  CustomTextField.swift
//  InstaPost
//
//  Created by Varun Rathi on 16/03/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.8).cgColor
        layer.borderWidth = 1.0
        
        layer.cornerRadius = 2.0
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10.0, dy: 5)
    }

    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.insetBy(dx: 10.0, dy: 5)
    }
    
    
   
}

extension CustomTextField: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
}
