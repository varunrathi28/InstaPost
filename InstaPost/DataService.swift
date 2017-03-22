//
//  DataService.swift
//  InstaPost
//
//  Created by Varun Rathi on 22/03/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase


let DB_BASE_URL  = FIRDatabase.database().reference()
class DataService
{
    static let shared = DataService()
    
    private var _REF_BASE = DB_BASE_URL
    private var _REF_POST = DB_BASE_URL.child("posts")
    private var _REF_USERS = DB_BASE_URL.child("users")
    
    var REF_BASE:FIRDatabaseReference { return _REF_BASE  }
    var REF_POSTS:FIRDatabaseReference { return _REF_POST }
    var REF_USERS:FIRDatabaseReference {return _REF_USERS }

    func createFirebaseDBUser( uid: String ,userData: Dictionary<String,String>)
    {
        REF_USERS.child(uid).updateChildValues(userData)
        
        
    }
    
}
