//
//  Post.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 12/25/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

//import UIKit
//
//struct Post {
//    var nameLabel: String?
//    var descriptionLabel: String?
//    var avaImageURl: String?
//    var userPost: User?
//    init(json:[String: Any]) {
//        self.nameLabel = json[AppKey.UserPostKey.userName] as? String
//        self.descriptionLabel = json[AppKey.UserPostKey.description] as? String
//        self.avaImageURl = json[AppKey.UserPostKey.avatarImageURL] as? String
//        let jsonData = json[AppKey.UserPostKey.chatrooms] as? [String: Any]
//        if let user = User(json: jsonData!) {
//            self.userPost = user
//        }
//    }
//    static func createPost(data: [String: Any]?) -> [Post]? {
//        guard let responseData = data else {
//            return nil
//        }
//        var result: [Post] = []
//        guard let posts = responseData else {
//            return nil
//        }
//        for post in posts {
//            let postData = Post(json: post)
//            guard let _p = postData else {
//                return nil
//            }
//            result.append(_p)
//        }
//        return result
//    }
//}
