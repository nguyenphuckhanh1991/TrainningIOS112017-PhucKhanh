//
//  FirstTimelineTableViewCell.swift
//  iOSTranning112017
//
//  Created by Joy on 11/23/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit
protocol FirstTimelineTableViewCellDelegate: class {
    func presentPostStatus()
}
class FirstTimelineTableViewCell: UITableViewCell {
    weak var delegate: FirstTimelineTableViewCellDelegate?
    @IBOutlet weak private var listFriendImageView: UIImageView!
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var postStatusImageView: UIImageView!
    @IBOutlet weak private var cameraImageView: UIImageView!
    @IBOutlet weak private var locationImageView: UIImageView!
    @IBOutlet weak private var postStatusLabel: UILabel!
    @IBOutlet weak private var photoLabel: UILabel!
    @IBOutlet weak private var locationLabel: UILabel!
    @IBOutlet weak private var avaImageView: UIImageView!
    @IBOutlet weak private var textView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    @IBAction func postStatusTapped(_ sender: UIButton) {
        delegate?.presentPostStatus()
    }
}
