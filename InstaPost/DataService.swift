//
//  DataService.swift
//  InstaPost
//
//  Created by Varun Rathi on 22/03/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import Foundation
import Firebase
import Firebase
import SwiftKeychainWrapper

// MARK: Firebase access URLs

let DB_BASE_URL  = FIRDatabase.database().reference()
let STORAGE_BASE_URL = FIRStorage.storage().reference()


class DataService
{
    static let shared = DataService()
    
    // DB References
    private var _REF_BASE = DB_BASE_URL
    private var _REF_POST = DB_BASE_URL.child("posts")
    private var _REF_USERS = DB_BASE_URL.child("users")
    
    // DB getters for URLS
    
    var REF_BASE:FIRDatabaseReference {     return _REF_BASE    }
    var REF_POSTS:FIRDatabaseReference {    return _REF_POST    }
    var REF_USERS:FIRDatabaseReference {    return _REF_USERS   }

    
    var REF_USER_CURRENT : FIRDatabaseReference
    {
        let uid = KeychainWrapper.standard.string(forKey: KEY_UID)
        let ref = REF_USERS.child(uid!)
        return ref
    }
    
    // Storage References
    
    private var _REF_POST_IMAGES = STORAGE_BASE_URL.child("post-images")
    var REF_POST_IMAGES : FIRStorageReference {   return _REF_POST_IMAGES   }
    
    // Storage getters for URLs 
    
    
    // MARK: Utility functions for Database
    
    func createFirebaseDBUser( uid: String ,userData: Dictionary<String,String>)
    {
        REF_USERS.child(uid).updateChildValues(userData)
        
        
    }
    
}
