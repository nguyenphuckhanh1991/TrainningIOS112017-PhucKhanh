//
//  PostViewController.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 11/21/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
  @IBAction func cancelTapped(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
  @IBOutlet weak private var savePostInfo: UIBarButtonItem!
  @IBOutlet private var swipeDown: UISwipeGestureRecognizer!
  @IBOutlet private var swipeUp: UISwipeGestureRecognizer!
  @IBOutlet weak private var bottomAddMoreStt: NSLayoutConstraint!
  @IBOutlet weak private var statusTextView: UITextView!
  @IBOutlet weak private var avaImageView: UIImageView!
  @IBOutlet weak private var nameLabel: UILabel!
  @IBOutlet weak private var statusImageView: UIImageView!
  @IBOutlet weak private var cotentStateImageView: UIImageView!
  @IBAction func chooseImage(_ sender: UIButton) {
    let alert = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
    alert.addAction(UIAlertAction.init(title: InputResult.ActionSheet.pickPhoto, style: .default, handler: {_ in
      self.pickPhoto()
    }))
    alert.addAction(UIAlertAction(title: InputResult.ActionSheet.takePhoto, style: .default, handler: {_ in
      self.takePhoto()
    }))
    alert.addAction(UIAlertAction(title: InputResult.ActionSheet.cancel, style: .cancel, handler: { (_) -> Void in
      alert.dismiss(animated: true, completion: nil)
    }))
    present(alert, animated: true, completion: nil)
  }
  @IBAction func postStatusTapped(_ sender: UIButton) {
    let postItem = StatusCellItem.init(avaImage: #imageLiteral(resourceName: "ava_naomi_kyle"), statusImage: statusImageView.image, contentStateImage: #imageLiteral(resourceName: "public_timeline"), likeImage: #imageLiteral(resourceName: "ic_like"), commentImage: #imageLiteral(resourceName: "ic_comment"), shareImage: #imageLiteral(resourceName: "ic_share"), status: statusTextView.text, name: nameLabel.text, date: "Just now. ", likeCount: "0 like", commentCount: "0 comment", likeLabel: "Like", commentLabel: "Comment", shareLabel: "Share")
    let notificationName = Notification.Name("postStatus")
    NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["postItem": postItem])
    dismiss(animated: true, completion: nil)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    savePostInfo.isEnabled = false
    setDefaultTextView()
  }
  private func takePhoto() {
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      let imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      imagePicker.sourceType = .camera
      imagePicker.allowsEditing = false
      self.present(imagePicker, animated: true, completion: nil)
    }
  }
  private func pickPhoto() {
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
      let imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      imagePicker.sourceType = .photoLibrary
      imagePicker.allowsEditing = true
      self.present(imagePicker, animated: true, completion: nil)
    }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  @IBAction func swipeDown(_ sender: UISwipeGestureRecognizer) {
    self.bottomAddMoreStt.constant = -240
    runAnimate()
    statusImageView.isHidden = false
  }
  @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
    self.bottomAddMoreStt.constant = 0
    statusImageView.isHidden = true
    runAnimate()
  }
  @IBAction func addYourPostTapped(_ sender: UIButton) {
    self.bottomAddMoreStt.constant = 0
    statusImageView.isHidden = true
    runAnimate()
  }
}
extension PostViewController: UITextViewDelegate {
  func setDefaultTextView() {
    self.statusTextView.delegate = self
  }
  func textViewDidBeginEditing(_ textView: UITextView) {
    self.statusTextView.textColor = UIColor.black
    self.statusTextView.text = ""
  }
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    let oldText = statusTextView.text! as NSString
    let newText = oldText.replacingCharacters(in: range, with: text)
    if newText.count > 0 {
      savePostInfo.isEnabled = true
    } else {
      savePostInfo.isEnabled = false
    }
    return true
  }
}
extension PostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
    let image = info[UIImagePickerControllerOriginalImage] as? UIImage
    self.statusImageView.image = image
    dismiss(animated: true, completion: nil)
  }
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
}
extension UIViewController {
  func runAnimate() {
    UIView.animate(withDuration: 0.5, animations: {
      self.view.layoutIfNeeded()
    })
  }
}
