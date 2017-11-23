//
//  FirstCommentTableViewCell.swift
//  iOSTranning112017
//
//  Created by Joy on 11/28/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class FirstCommentTableViewCell: UITableViewCell {
  @IBOutlet weak private var avaImageView: UIImageView!
  @IBOutlet weak private var nameLabel: UILabel!
  @IBOutlet weak private var timeLabel: UILabel!
  @IBOutlet weak private var stateImageView: UIImageView!
  @IBOutlet weak private var statusImageView: UIImageView!
  @IBOutlet weak private var likeCountLabel: UILabel!
  @IBOutlet weak private var commentCountLabel: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
    override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
}
