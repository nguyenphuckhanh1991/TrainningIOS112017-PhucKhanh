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
    func saveUserData() {
        let user = User(avatarImage: avaImageView.image!, userName: nameLabel.text!, emailAddress: emailLabel.text!, phoneNumber: phoneNumberLabel.text!, dateOfBirth: birthDayLabel.text!)
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: user)
        UserDefaults.standard.set(encodedData, forKey: "user")
    }
}
extension FirstProfileCell: EditProfileTableViewControllerDelegate {
    func saveProfile(user: User) {
        if let data = UserDefaults.standard.data(forKey: "user"),
            let user = NSKeyedUnarchiver.unarchiveObject(with: data) as? User {
            avaImageView.image = user.avatarImage
            nameLabel.text = user.userName
        }
    }
}
