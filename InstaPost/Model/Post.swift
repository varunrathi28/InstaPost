//
//  Post.swift
//  InstaPost
//
//  Created by Varun Rathi on 23/03/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import Foundation

class Post
{
    
    private var _caption : String!
    private var _imageUrl: String!
    private var _likes:Int?
    private var _postKey:String!
    
    var caption : String
        {
            return _caption
    }
    
    var imagesUrl:String
        {
            return _imageUrl
    }
    
    var likes:Int
        {
            return _likes!
    }
    
    var postKey:String
    {
        return _postKey
    }
    
    init(caption:String , imageUrl:String, likes:Int) {
        self._likes = likes
        self._imageUrl = imageUrl
        self._caption = caption
    }
    
    init(postKey:String ,postData:Dictionary<String, AnyObject>) {
        
        self._postKey = postKey
        
        if let caption = postData["caption"] as? String
        {
            self._caption = caption
        }
        
        if let likes = postData["likes"] as? Int
        {
            self._likes = likes
        }
        
        if let imageUrl = postData["imageUrl"] as? String
        {
            self._imageUrl = imageUrl
        }
    }
}
