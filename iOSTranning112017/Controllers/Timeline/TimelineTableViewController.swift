//
//  TimelineTableViewController.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 11/16/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class TimelineTableViewController: UITableViewController, TimeLineTableViewCellDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellStatusTimelineNib = UINib(nibName: "TimeLineTableViewCell", bundle: nil)
        self.tableView.register(cellStatusTimelineNib, forCellReuseIdentifier: "TimeLineTableViewCell")
        self.tableView.estimatedRowHeight = 415
        let firstCellTimelineNib = UINib(nibName: "FirstTimelineTableViewCell", bundle: nil)
        self.tableView.register(firstCellTimelineNib, forCellReuseIdentifier: "FirstTimelineTableViewCell")
        self.tableView.estimatedRowHeight = 194
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
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTimelineTableViewCell", for: indexPath) as? FirstTimelineTableViewCell {
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TimeLineTableViewCell", for: indexPath) as? TimeLineTableViewCell {
                cell.delegate = self
                return cell
            }
        }
         return UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func commentPush() {
        let timeLineCommentVC = UIStoryboard.init(name: "Timeline", bundle: nil).instantiateViewController(withIdentifier: "TimelineCommentTableViewController")
        navigationController?.pushViewController(timeLineCommentVC, animated: true)
    }
}
