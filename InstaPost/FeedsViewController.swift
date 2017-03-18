//
//  FeedsViewController.swift
//  InstaPost
//
//  Created by Varun Rathi on 18/03/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import FirebaseAuth

class FeedsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func signOutClicked(sender:AnyObject?)
    {
        let  status = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
       if status
         {
          try!  FIRAuth.auth()?.signOut()
   
            print("Userid removed from Keychain")
            performSegue(withIdentifier: "goToLogin", sender: nil)
        }
        
    }

   }
