//
//  TimelineCommentTableViewController.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 11/20/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class TimelineCommentTableViewController: UITableViewController {
    @IBAction func postTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Timeline", bundle: nil)
        let postVC = storyboard.instantiateViewController(withIdentifier: "PostViewController")
        self.present(postVC, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let customCommentCellNib = UINib(nibName: "CustomCommentCell", bundle: nil)
        self.tableView.register(customCommentCellNib, forCellReuseIdentifier: "CustomCommentCell")
        self.tableView.estimatedRowHeight = 70
        let firstCommentTableViewCellNib = UINib(nibName: "FirstCommentTableViewCell", bundle: nil)
        self.tableView.register(firstCommentTableViewCellNib, forCellReuseIdentifier: "FirstCommentTableViewCell")
        self.tableView.estimatedRowHeight = 492
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCommentTableViewCell", for: indexPath) as? FirstCommentTableViewCell {
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCommentCell", for: indexPath) as? CustomCommentCell {
                return cell
            }
        }
        return UITableViewCell()
    }
}
