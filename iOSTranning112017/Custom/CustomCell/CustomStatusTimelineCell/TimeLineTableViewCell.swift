//
//  TimeLineTableViewCell.swift
//  iOSTranning112017
//
//  Created by Joy on 11/22/17.
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
    @IBOutlet weak private  var statusLabel: UILabel!
    @IBOutlet weak private var likeCountLabel: UILabel!
    @IBOutlet weak private var likeImageView: UIImageView!
    @IBOutlet weak private var commentImageView: UIImageView!
    @IBOutlet weak private var shareImageView: UIImageView!
    @IBOutlet weak private var likeLabel: UILabel!
    @IBOutlet weak private var commentLabel: UILabel!
    @IBOutlet weak private var shareLabel: UILabel!
    @IBOutlet weak private var commentCountLabel: UILabel!
    @IBOutlet weak private var statusImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func commentTapped(_ sender: Any) {
        delegate?.commentPush()
    }
}
