//
//  AvaImageCollectionViewCell.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 12/27/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class AvaImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var avaImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(avaImageURL: String) {
        if let image = ImageCache.image(forKey: avaImageURL) {
            avaImageView.image = image
        } else {
            var appServices = AppServices.init()
            let parameters = [AppKey.UserPostKey.avatarImageURL: avaImageURL]
            appServices.requestImage(httpMethod: .get, parameter: parameters, apiType: .fetchAvaImage, completion: { (data, error) in
                if let imageData = data as? Data {
                    DispatchQueue.main.async {
                        let image = UIImage.init(data: imageData)
                        ImageCache.setImage(image!, forKey: avaImageURL)
                        self.avaImageView.image = image
                    }
                } else {
                    print(error as Any)
                }
            })
        }
    }
}
