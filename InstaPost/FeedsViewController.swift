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
import FirebaseDatabase

class FeedsViewController: UIViewController {
    
    @IBOutlet weak var tableview:UITableView!
    
    var datasource:[AnyObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.estimatedRowHeight = 100
        tableview.rowHeight = UITableViewAutomaticDimension
        
        DataService.shared.REF_POSTS.observe(.value, with: { (dataSnapShot) in
           
            if let snapshot = dataSnapShot.children.allObjects as? [FIRDataSnapshot]
            {
                for snap in snapshot
                {
                    print("SNAP:\(snap)")
                }
                
            }
            
        })
        
        
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

extension FeedsViewController : UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension FeedsViewController : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_FOR_POST, for: indexPath) as! FeedPostCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  CELL_SPACING
    }
}

extension FeedsViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
