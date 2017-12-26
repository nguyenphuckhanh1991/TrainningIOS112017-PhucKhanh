//
//  ProfileTableViewController.swift
//  iOSTranning112017
//
//  Created by Joy on 11/23/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    var userInfo = User.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstProfileCellNib = UINib(nibName: Storyboard.CustomCell.FirstProfileCell, bundle: nil)
        self.tableView.register(firstProfileCellNib, forCellReuseIdentifier: Storyboard.CustomCell.FirstProfileCell)
        self.tableView.estimatedRowHeight = 471
        let firstCommentTableViewCell = UINib(nibName: Storyboard.CustomCell.FirstCommentTableViewCell, bundle: nil)
        self.tableView.register(firstCommentTableViewCell, forCellReuseIdentifier: Storyboard.CustomCell.FirstCommentTableViewCell)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userInfo.getData()
        print(userInfo)
        guard let info = UserDefaults.standard.value(forKey: AppKey.UserDefaultKey.user) as? [String: Any] else {
            return
        }
        print(info)
        self.tableView.reloadData()
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.CustomCell.FirstProfileCell, for: indexPath) as? FirstProfileCell {
                cell.configureCell(user: userInfo)
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.CustomCell.FirstCommentTableViewCell, for: indexPath) as? FirstCommentTableViewCell {
                return cell
            }
        }
        return UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
