//
//  ChatroomCell.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 12/19/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class ChatroomCell: UITableViewCell {
    @IBOutlet weak private var avaImageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func configureCell(data: [String: Any]) {
        nameLabel.text = data[AppKey.Chatroom.username] as? String
        descriptionLabel.text = data[AppKey.Chatroom.description] as? String
        guard let avatarUrl = data[AppKey.Chatroom.avatarUrl] as? String else {return}
        if let image = ImageCache.image(forKey: avatarUrl) {
            avaImageView.image = image
        } else {
            var appService = AppServices()
            appService.requestImage(httpMethod: .get, parameter: data, apiType: .fetchAvaImage, completion: { (data, error) in
                if let imageData = data as? Data {
                    print(imageData)
                    DispatchQueue.main.async {
                        let image = UIImage.init(data: imageData)
                        ImageCache.setImage(image!, forKey: avatarUrl)
                        self.avaImageView.image = image
                    }
                } else {
                    print(error as Any)
                }
            })
        }
    }
    override func prepareForReuse() {
        avaImageView.image = #imageLiteral(resourceName: "ava_naomi_kyle")
        nameLabel.text = ""
        descriptionLabel.text = ""
    }
}
