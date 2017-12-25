//
//  FirstTimelineTableViewCell.swift
//  iOSTranning112017
//
//  Created by Joy on 11/28/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit
protocol FirstTimelineTableViewCellDelegate: class {
    func logOut()
    func presentPostStatus()
}
class FirstTimelineTableViewCell: UITableViewCell {
    weak var delegatePostVC: FirstTimelineTableViewCellDelegate?
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
    @IBAction func logoutButton(_ sender: UIButton) {
        delegatePostVC?.logOut()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setDefaultTextView()
    }
    @IBAction func statusTextFieldTapped(_ sender: UIButton) {
        delegatePostVC?.presentPostStatus()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
extension FirstTimelineTableViewCell: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.textView.text = ""
        self.textView.textColor = UIColor.black
    }
    func setDefaultTextView() {
        self.textView.delegate = self
    }
}
