//
//  ViewController.swift
//  InstaPost
//
//  Created by Varun Rathi on 09/03/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func facebookButonTapped(sender : AnyObject?)
    {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil
            {
                print("Error in Facebook Login")
                
            }
            else if (result?.isCancelled)!
            {
                print("User cancelled Facebook authentication")
            }
            
            else
            {
                print("Sucess Authentication")
                
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                
                self.firebaseAuth(credential)
                
            }
        }
        
    }

    func firebaseAuth(_ credential : FIRAuthCredential)
    {
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil
            {
                print("Firebase authentication Error: \(error)")
            }
            
            else
            {
                print("Firebase authentication successful")
            }
        })
    }
    
}

extension ViewController : UITextFieldDelegate
{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
