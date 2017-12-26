//
//  User.swift
//  iOSTranning112017
//
//  Created by Joy on 11/24/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class User: NSObject, NSCoding {
    var avatarImage: UIImage?
    var userName: String?
    var emailAddress: String?
    var phoneNumber: String?
    var dateOfBirth: String?
    var idUser: String?
    init?(json: [String: Any]) {
        self.idUser = json[AppKey.UserPostKey.userId] as? String
    }
    override init() {
        super.init()
    }
    init(avatarImage: UIImage?, userName: String?, emailAddress: String?, phoneNumber: String?, dateOfBirth: String?) {
        self.avatarImage = avatarImage
        self.userName = userName
        self.emailAddress = emailAddress
        self.phoneNumber = phoneNumber
        self.dateOfBirth = dateOfBirth
    }
    required init(coder decoder: NSCoder) {
        self.avatarImage = decoder.decodeObject(forKey: "avatarImage") as? UIImage
        self.userName = decoder.decodeObject(forKey: "userName") as? String
        self.emailAddress = decoder.decodeObject(forKey: "emailAddress") as? String
        self.phoneNumber = decoder.decodeObject(forKey: "phoneNumber") as? String
        self.dateOfBirth = decoder.decodeObject(forKey: "dateOfBirth") as? String
    }
    func encode(with coder: NSCoder) {
        coder.encode(avatarImage, forKey: "avatarImage")
        coder.encode(userName, forKey: "userName")
        coder.encode(emailAddress, forKey: "emailAddress")
        coder.encode(phoneNumber, forKey: "phoneNumber")
        coder.encode(dateOfBirth, forKey: "dateOfBirth")
    }
}
