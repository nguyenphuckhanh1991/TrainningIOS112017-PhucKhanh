//
//  TimelineTableViewCell.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 11/21/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class TimelineTableViewCell: UITableViewCell {
    @IBOutlet weak private var avaImageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var contentStateImageView: UIImageView!
    @IBOutlet weak private  var statusLabel: UILabel!
    @IBOutlet weak private var likeCountLabel: UILabel!
    @IBOutlet weak private var likeImageView: UIImageView!
    @IBOutlet weak private var commentImageView: UIImageView!
    @IBOutlet weak private var shareImageView: UIImageView!
    @IBOutlet weak private var likeLabel: UILabel!
    @IBOutlet weak private var commentLabel: UILabel!
    @IBOutlet weak private var shareLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
//    func configureWithItem(item: StatusCellItem) {
//        self.avaImageView.image = item.avaImage
//        self.nameLabel.text = item.name
//        self.dateLabel.text = item.date
//        self.contentStateImageView.image = item.contentStateImage
//        self.statusLabel.text = item.status
//        self.likeCountLabel.text = item.likeCount
//        self.likeImageView.image = item.likeImage
//        self.commentImageView.image = item.commentImage
//        self.shareImageView.image = item.shareImage
//        self.likeLabel.text = item.likeCount
//        self.commentLabel.text = item.comment
//        self.shareLabel.text = item.share
//    }
}
