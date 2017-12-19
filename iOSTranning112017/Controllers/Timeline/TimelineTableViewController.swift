//
//  TimelineTableViewController.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 11/16/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class TimelineTableViewController: UITableViewController {
<<<<<<< HEAD
    var postCell = [StatusCellItem]()
=======
    fileprivate lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicatorView.hidesWhenStopped = true
        var center = self.view.center
        //        if let navigationBarFrame = self.navigationController?.navigationBar.frame {
        //            center.y -= (navigationBarFrame.origin.y + navigationBarFrame.size.height)
        //        }
        activityIndicatorView.center = center
        self.view.addSubview(activityIndicatorView)
        return activityIndicatorView
    }()
    var chatroomCells = [[String: Any]]()
    let pageSize = 10
    var currentPage = 0
    var total = 0
    var lastRowIndex = 0
>>>>>>> fetch-chatroom-to-timeline
    let center = NotificationCenter.default
    let mainQueue = OperationQueue.main
    var notiObserver: NSObjectProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellStatusTimelineNib = UINib(nibName: Storyboard.CustomCell.TimeLineTableViewCell, bundle: nil)
        self.tableView.register(cellStatusTimelineNib, forCellReuseIdentifier: Storyboard.CustomCell.TimeLineTableViewCell)
        let firstCellTimelineNib = UINib(nibName: Storyboard.CustomCell.FirstTimelineTableViewCell, bundle: nil)
        self.tableView.register(firstCellTimelineNib, forCellReuseIdentifier: Storyboard.CustomCell.FirstTimelineTableViewCell)
<<<<<<< HEAD
        self.tableView.estimatedRowHeight = 194
        notiObserver = center.addObserver(forName: NSNotification.Name(rawValue: Storyboard.Notification.postStatus), object: nil, queue: mainQueue) { (notification: Notification) in
            guard let userInfo = notification.userInfo, let postCell = userInfo[Storyboard.Notification.postItem] as? StatusCellItem else {
                return
            }
            self.createPost(newPostCell: postCell)
        }
        fetchPostCell()
=======
        let chatroomCellNib = UINib(nibName: Storyboard.CustomCell.ChatroomCell, bundle: nil)
        self.tableView.register(chatroomCellNib, forCellReuseIdentifier: Storyboard.CustomCell.ChatroomCell)
        //        notiObserver = center.addObserver(forName: NSNotification.Name(rawValue: Storyboard.Notification.postStatus), object: nil, queue: mainQueue) { (notification: Notification) in
        //            //            guard let userInfo = notification.userInfo, let postCell = userInfo[Storyboard.Notification.postItem] as? StatusCellItem else {
        //            //                return
        //            //            }
        //            //self.createPost(newPostCell: postCell)
        //        }
        fetchChatroomCell(page: 0)
>>>>>>> fetch-chatroom-to-timeline
        tableView.bounces = false
    }
    deinit {
        self.center.removeObserver(notiObserver!)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        super.viewWillDisappear(animated)
        if let statusBar: UIView = UIApplication.shared.value(forKey: Storyboard.CustomView.statusBar) as? UIView {
            statusBar.backgroundColor = UIColor.clear
        }
        UIApplication.shared.statusBarStyle = .lightContent
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        if let statusBar: UIView = UIApplication.shared.value(forKey: Storyboard.CustomView.statusBar) as? UIView {
            statusBar.backgroundColor = UIColor(red: 78/255.0, green: 105/255.0, blue: 162/255.0, alpha: 1)
        }
        UIApplication.shared.statusBarStyle = .lightContent
<<<<<<< HEAD
=======
        self.tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
>>>>>>> fetch-chatroom-to-timeline
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
<<<<<<< HEAD
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
=======
    func fetchChatroomCell(page: Int) {
        activityIndicatorView.startAnimating()
        var appService = AppServices.init()
        let parameters = [AppKey.Chatroom.page: String(page), AppKey.Chatroom.pagesize: String( pageSize)]
        appService.request(httpMethod: .get, parameter: parameters, apiType: .timeline) { (data, error) in
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()
            }
            if let responseData = data {
                if responseData[AppKey.ResponseKey.success] as? Int == 1 {
                    guard let pagination = responseData[AppKey.Chatroom.pagination] as? [String: Int], let chatrooms = responseData[AppKey.Chatroom.chatrooms] as? [[String: Any]] else {return}
                    if self.chatroomCells.count == self.total {
                        if self.total == pagination[AppKey.Chatroom.total]! {
                            return
                        }
                    }
                    self.chatroomCells.append(contentsOf: chatrooms)
                    self.updatePageInfo(pagination: pagination)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } else {
                    guard (responseData[AppKey.ResponseKey.message] as? String) != nil else {return}
                }
                if responseData[AppKey.ResponseKey.code] as? String == AppKey.ResponseKey.unauthorized {
                    self.showLoginVC()
                }
            } else {
                print(error as Any)
            }
        }
    }
    func updatePageInfo(pagination: [String: Int]) {
        currentPage = pagination[AppKey.Chatroom.page]!
        lastRowIndex = pagination[AppKey.Chatroom.lastindex]! % pageSize
        total = pagination[AppKey.Chatroom.total]!
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatroomCells.count
>>>>>>> fetch-chatroom-to-timeline
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.CustomCell.FirstTimelineTableViewCell, for: indexPath) as? FirstTimelineTableViewCell {
                cell.delegatePostVC = self
                return cell
            }
        } else {
<<<<<<< HEAD
            if let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.CustomCell.TimeLineTableViewCell, for: indexPath) as? TimeLineTableViewCell {
                cell.configureCell(listCell: postCell[indexPath.row - 1])
                cell.delegate = self
=======
            if let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.CustomCell.ChatroomCell, for: indexPath) as? ChatroomCell {
                cell.configureCell(data: chatroomCells[indexPath.row])
                //cell.delegate = self
>>>>>>> fetch-chatroom-to-timeline
                return cell
            }
        }
        return UITableViewCell()
    }
<<<<<<< HEAD
=======
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == chatroomCells.count - 1 {
            if lastRowIndex == 0 {
                currentPage += 1
            }
            fetchChatroomCell(page: currentPage)
        }
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 194
        } else {
            return 64
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
>>>>>>> fetch-chatroom-to-timeline
}
extension TimelineTableViewController: TimeLineTableViewCellDelegate, FirstTimelineTableViewCellDelegate {
    func logOut() {
        var appService = AppServices.init()
        appService.request(httpMethod: .post, parameter: nil, apiType: .logout) { (data, error) in
            if let responseData: [String: Any] = data {
                if responseData[AppKey.ResponseKey.success] as? Int == 1 {
                    self.showLoginVC()
                } else {
                    guard (responseData[AppKey.ResponseKey.message] as? String) != nil else {return}
                    self.showAlertMessage(title: InputResult.LoginError.titleWrongInputType, message: InputResult.LoginError.messageInvalid, titleAction: InputResult.LoginError.actionTitle)
                }
            } else {
                print(error as Any)
            }
        }
    }
    func showLoginVC() {
        DispatchQueue.main.async {
            UserDefaults.standard.removePersistentDomain(forName:
                Bundle.main.bundleIdentifier!)
            guard let tabbar = UIStoryboard.init(name: Storyboard.Main.login, bundle: nil).instantiateViewController(withIdentifier: Storyboard.BaseView.BaseNavigationController) as? BaseNavigationController else {return}
            self.present(tabbar, animated: true, completion: nil)
        }
    }
    func presentPostStatus() {
        let postStatusVC = UIStoryboard.init(name: Storyboard.Main.timeline, bundle: nil).instantiateViewController(withIdentifier: Storyboard.Timeline.PostViewController)
        navigationController?.present(postStatusVC, animated: true, completion: nil)
    }
    func commentPush() {
        let timeLineCommentVC = UIStoryboard.init(name: Storyboard.Main.timeline, bundle: nil).instantiateViewController(withIdentifier: Storyboard.Timeline.TimelineCommentTableViewController)
        navigationController?.pushViewController(timeLineCommentVC, animated: true)
    }
}
