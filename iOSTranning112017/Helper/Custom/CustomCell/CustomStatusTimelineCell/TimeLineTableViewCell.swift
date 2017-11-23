//
//  TimeLineTableViewCell.swift
//  iOSTranning112017
//
//  Created by Joy on 11/28/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit
protocol TimeLineTableViewCellDelegate: class {
  func commentPush()
}
class TimeLineTableViewCell: UITableViewCell {
  weak var delegate: TimeLineTableViewCellDelegate?
  @IBOutlet weak private var avaImageView: UIImageView!
  @IBOutlet weak private var nameLabel: UILabel!
  @IBOutlet weak private var timeLabel: UILabel!
  @IBOutlet weak private var contentStateImageView: UIImageView!
  @IBOutlet weak private var statusLabel: UILabel!
  @IBOutlet weak private var likeCountLabel: UILabel!
  @IBOutlet weak private var likeImageView: UIImageView!
  @IBOutlet weak private var commentImageView: UIImageView!
  @IBOutlet weak private var shareImageView: UIImageView!
  @IBOutlet weak private var likeLabel: UILabel!
  @IBOutlet weak private var commentLabel: UILabel!
  @IBOutlet weak private var shareLabel: UILabel!
  @IBOutlet weak private var commentCountLabel: UILabel!
  @IBOutlet weak private var statusImageHeightContaint: NSLayoutConstraint!
  @IBOutlet weak private var statusImageView: UIImageView!
  @IBAction func likeButtonTaped(_ sender: UIButton) {
    if likeImageView.image == #imageLiteral(resourceName: "ic_like") {
      likeImageView.image = #imageLiteral(resourceName: "ic_likeHighlighted")
      likeCountLabel.text = "You and 69 likes"
    } else {
      likeImageView.image = #imageLiteral(resourceName: "ic_like")
      likeCountLabel.text = "69 likes"
    }
  }
  override func awakeFromNib() {
    super.awakeFromNib()
    self.translatesAutoresizingMaskIntoConstraints = true
  }
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  @IBAction func commentTapped(_ sender: Any) {
    delegate?.commentPush()
  }
  func configureCell(listCell: StatusCellItem) {
    self.avaImageView.image = listCell.avaImage
    self.nameLabel.text = listCell.name
    self.timeLabel.text = listCell.date
    self.contentStateImageView.image = listCell.contentStateImage
    self.statusLabel.text = listCell.status
    self.likeCountLabel.text = listCell.likeCount
    self.likeImageView.image = listCell.likeImage
    self.commentImageView.image = listCell.commentImage
    self.shareImageView.image = listCell.shareImage
    self.likeLabel.text = listCell.likeLabel
    self.commentLabel.text = listCell.commentLabel
    self.shareLabel.text = listCell.shareLabel
    self.commentCountLabel.text = listCell.commentCount
    self.statusImageView.image = listCell.statusImage
    if statusImageView.image == nil {
      self.statusImageHeightContaint.constant = 0
    } else {
      self.statusImageHeightContaint.constant = 351
    }
  }
}
