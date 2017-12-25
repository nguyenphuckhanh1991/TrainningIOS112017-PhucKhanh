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
    self.avatarImage = decoder.decodeObject(forKey: AppKey.UserPropertyKey.avatarImage) as? UIImage
    self.userName = decoder.decodeObject(forKey: AppKey.UserPropertyKey.userName) as? String
    self.emailAddress = decoder.decodeObject(forKey: AppKey.UserPropertyKey.emailAddress) as? String
    self.phoneNumber = decoder.decodeObject(forKey: AppKey.UserPropertyKey.phoneNumber) as? String
    self.dateOfBirth = decoder.decodeObject(forKey: AppKey.UserPropertyKey.dateOfBirth) as? String
  }
  func encode(with coder: NSCoder) {
    coder.encode(avatarImage, forKey: AppKey.UserPropertyKey.avatarImage)
    coder.encode(userName, forKey: AppKey.UserPropertyKey.userName)
    coder.encode(emailAddress, forKey: AppKey.UserPropertyKey.emailAddress)
    coder.encode(phoneNumber, forKey: AppKey.UserPropertyKey.phoneNumber)
    coder.encode(dateOfBirth, forKey: AppKey.UserPropertyKey.dateOfBirth)
  }
}
