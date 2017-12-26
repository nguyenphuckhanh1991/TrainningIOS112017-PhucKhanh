//
//  FirstProfileCell.swift
//  iOSTranning112017
//
//  Created by Joy on 11/28/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class FirstProfileCell: UITableViewCell {
  @IBOutlet weak private var listFriendImageView: UIImageView!
  @IBOutlet weak private var phoneNumberLabel: CustomLabelAddPhoto!
  @IBOutlet weak private var nameLabel: UILabel!
  @IBOutlet weak private var coverImageView: UIImageView!
  @IBOutlet weak private var avaImageView: UIImageView!
  @IBOutlet weak private var postButtonImageView: UIImageView!
  @IBOutlet weak private var editProfileButtonImageView: UIImageView!
  @IBOutlet weak private var activityLogButtonImageView: UIImageView!
  @IBOutlet weak private var moreButtonImageView: UIImageView!
  @IBOutlet weak private var editCoverImageButton: CustomButton!
  @IBOutlet weak private var activityLogLabel: UILabel!
  @IBOutlet weak private var editProfileLabel: UILabel!
  @IBOutlet weak private var postLabel: UILabel!
  @IBOutlet weak private var moreLabel: UILabel!
  @IBOutlet weak private var editAvaImageButton: CustomButton!
  @IBOutlet weak private var birthDayImageView: UIImageView!
  @IBOutlet weak private var emailImageView: UIImageView!
  @IBOutlet weak private var birthDayLabel: CustomLabelAddPhoto!
  @IBOutlet weak private var emailLabel: CustomLabelAddPhoto!
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
    }
//    func configureCell(user: [String: Any]) {
//        DispatchQueue.main.async {
//                        self.avaImageView.image = user[AppKey.UserInfoKey.avaImage] as? UIImage
//                        self.nameLabel.text = user[AppKey.UserInfoKey.userName] as? String
//                        self.emailLabel.text = user[AppKey.UserInfoKey.emailAddress] as? String
//                        self.phoneNumberLabel.text = user[AppKey.UserInfoKey.phoneNumber] as? String
//                        self.birthDayLabel.text = user[AppKey.UserInfoKey.dateOfBirth] as? String
//        }
//    }
  func configureCell(user: User) {
    self.avaImageView.image = user.avatarImage
    self.nameLabel.text = user.userName
    self.phoneNumberLabel.text = user.phoneNumber
    self.emailLabel.text = user.emailAddress
    self.birthDayLabel.text = user.dateOfBirth
  }
}
