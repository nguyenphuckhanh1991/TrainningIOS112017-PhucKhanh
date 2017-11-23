//
//  ProfileTableViewController.swift
//  iOSTranning112017
//
//  Created by Joy on 11/23/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
  var userInfo = User.init(avatarImage: #imageLiteral(resourceName: "ava_naomi_kyle"), userName: "Naomi Kyle", emailAddress: "naomi@naomikyle.com", phoneNumber: "0961254789", dateOfBirth: "13/01/1986")

  override func viewDidLoad() {
    super.viewDidLoad()
    let firstProfileCellNib = UINib(nibName: "FirstProfileCell", bundle: nil)
    self.tableView.register(firstProfileCellNib, forCellReuseIdentifier: "FirstProfileCell")
    //self.tableView.estimatedRowHeight = 471
    let firstCommentTableViewCell = UINib(nibName: "FirstCommentTableViewCell", bundle: nil)
    self.tableView.register(firstCommentTableViewCell, forCellReuseIdentifier: "FirstCommentTableViewCell")
    //self.tableView.estimatedRowHeight = 483
    let encodedData = NSKeyedArchiver.archivedData(withRootObject: userInfo)
    UserDefaults.standard.set(encodedData, forKey: "user")
    UserDefaults.standard.synchronize()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let data = UserDefaults.standard.value(forKey: "user") as? Data
     userInfo = (NSKeyedUnarchiver.unarchiveObject(with: data!) as? User)!
    self.tableView.reloadData()
  }
  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      if let cell = tableView.dequeueReusableCell(withIdentifier: "FirstProfileCell", for: indexPath) as? FirstProfileCell {
        cell.configureCell(user: userInfo)
        return cell
      }
    } else {
      if let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCommentTableViewCell", for: indexPath) as? FirstCommentTableViewCell {
        return cell
      }
    }
    return UITableViewCell()
  }
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
}
