//
//  TimelineTableViewController.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 11/16/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class TimelineTableViewController: UITableViewController {
  var postCell = [StatusCellItem]()
  let center = NotificationCenter.default
  let mainQueue = OperationQueue.main
  var notiObserver: NSObjectProtocol?
  override func viewDidLoad() {
    super.viewDidLoad()
    let cellStatusTimelineNib = UINib(nibName: "TimeLineTableViewCell", bundle: nil)
    self.tableView.register(cellStatusTimelineNib, forCellReuseIdentifier: "TimeLineTableViewCell")
    //self.tableView.estimatedRowHeight = 570
    let firstCellTimelineNib = UINib(nibName: "FirstTimelineTableViewCell", bundle: nil)
    self.tableView.register(firstCellTimelineNib, forCellReuseIdentifier: "FirstTimelineTableViewCell")
    //self.tableView.estimatedRowHeight = 194
    notiObserver = center.addObserver(forName: NSNotification.Name(rawValue: "postStatus"), object: nil, queue: mainQueue) { (notification: Notification) in
      guard let userInfo = notification.userInfo, let postCell = userInfo["postItem"] as? StatusCellItem else {
        return
      }
      self.createPost(newPostCell: postCell)
    }
    fetchPostCell()
    tableView.bounces = false
  }
  deinit {
      self.center.removeObserver(notiObserver!)
  }
  override func viewWillDisappear(_ animated: Bool) {
    self.navigationController?.isNavigationBarHidden = false
    super.viewWillDisappear(animated)
    if let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as? UIView {
      statusBar.backgroundColor = UIColor.clear
    }
    UIApplication.shared.statusBarStyle = .lightContent
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.isNavigationBarHidden = true
    if let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as? UIView {
      statusBar.backgroundColor = UIColor(red: 78/255.0, green: 105/255.0, blue: 162/255.0, alpha: 1)
    }
    UIApplication.shared.statusBarStyle = .lightContent
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  func fetchPostCell() {
    let postItem = StatusCellItem(avaImage: #imageLiteral(resourceName: "ava_olson"), statusImage: #imageLiteral(resourceName: "stt_picture"), contentStateImage: #imageLiteral(resourceName: "public_timeline"), likeImage: #imageLiteral(resourceName: "ic_like"), commentImage: #imageLiteral(resourceName: "ic_comment"), shareImage: #imageLiteral(resourceName: "ic_share"), status: "Brainstorming over some wireframes for an upcoming app.", name: "Tammy Olson", date: "2hrs .", likeCount: "69 likes", commentCount: "70 comments", likeLabel: "Like", commentLabel: "Comment", shareLabel: "Share")
    for _ in 0...10 {
      postCell.append(postItem)
    }
  }
  func createPost(newPostCell: StatusCellItem) {
    postCell.insert(newPostCell, at: 0)
    tableView.reloadData()
  }
  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return postCell.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      if let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTimelineTableViewCell", for: indexPath) as? FirstTimelineTableViewCell {
        cell.delegatePostVC = self
        return cell
      }
    } else {
      if let cell = tableView.dequeueReusableCell(withIdentifier: "TimeLineTableViewCell", for: indexPath) as? TimeLineTableViewCell {
        cell.configureCell(listCell: postCell[indexPath.row - 1])
        cell.delegate = self
        return cell
      }
    }
    return UITableViewCell()
  }
}
extension TimelineTableViewController: TimeLineTableViewCellDelegate, FirstTimelineTableViewCellDelegate {
  func presentPostStatus() {
    let postStatusVC = UIStoryboard.init(name: "Timeline", bundle: nil).instantiateViewController(withIdentifier: "PostViewController")
    navigationController?.present(postStatusVC, animated: true, completion: nil)
  }
  func commentPush() {
    let timeLineCommentVC = UIStoryboard.init(name: "Timeline", bundle: nil).instantiateViewController(withIdentifier: "TimelineCommentContainerView")
    navigationController?.pushViewController(timeLineCommentVC, animated: true)
  }
}
