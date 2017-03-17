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

class SignInVC: UIViewController {
    
    
    @IBOutlet weak var tf_email:UITextField!
    @IBOutlet weak var tf_password:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func buttonSignInClicked(sender : AnyObject?)
    {
        
        if let email = tf_email.text , let password = tf_password.text
        {
            FIRAuth.auth()?.signIn(withEmail:email, password: password, completion: { (user, error) in
                if error == nil{
                    print("User Signed In")
                }
                
                else
                {
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil
                        {
                            print("Error Creating user")
                        }
                        else
                        {
                            print("User created Successfully")
                        }
                    })
                }
            })
        }
        
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

extension SignInVC : UITextFieldDelegate
{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
