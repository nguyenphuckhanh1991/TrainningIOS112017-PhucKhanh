//
//  CustomCommentCell.swift
//  iOSTranning112017
//
//  Created by Joy on 11/22/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class CustomCommentCell: UITableViewCell {
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var avaImageView: UIImageView!
    @IBOutlet weak private var statusLabel: UILabel!
    @IBOutlet weak private var timeLabel: UILabel!
    @IBOutlet weak private var likeLabel: UILabel!
    @IBOutlet weak private var likeHighlightedImageView: UIImageView!
    @IBOutlet weak private var replyLabel: UILabel!
    @IBOutlet weak private var likeCountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
