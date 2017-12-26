//
//  TimelineCommentContainerView.swift
//  iOSTranning112017
//
//  Created by Joy on 12/4/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class TimelineCommentContainerView: BaseViewController {
  var timelineCommentVC: TimelineCommentTableViewController?
  @IBOutlet private weak var bottomWriteCommentConstant: NSLayoutConstraint!
  override func viewDidLoad() {
    super.viewDidLoad()
    keyboardWillShow()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    keyboardWillShow()
  }
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    if segue.identifier == Storyboard.Timeline.timelineCommentTableViewController {
      timelineCommentVC = segue.destination as? TimelineCommentTableViewController
  }
}
  func keyboardWillShow() {
        self.bottomWriteCommentConstant.constant = 0
      }
  func showWriteComment() {
    self.bottomWriteCommentConstant.constant = -49
  }

}
extension TimelineCommentContainerView: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    showWriteComment()
    return true
  }
}
