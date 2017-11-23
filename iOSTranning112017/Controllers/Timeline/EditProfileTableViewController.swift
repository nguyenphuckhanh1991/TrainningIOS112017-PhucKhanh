//
//  EditProfileTableViewController.swift
//  iOSTranning112017
//
//  Created by Joy on 11/24/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit
protocol EditProfileTableViewControllerDelegate: class {
  func saveProfile(user: User)
}
class EditProfileTableViewController: UITableViewController {
  weak var delegate: EditProfileTableViewControllerDelegate?
  @IBOutlet private weak var avaImageView: UIImageView!
  @IBOutlet private weak var userNameInput: UITextField!
  @IBOutlet private weak var emailInput: UITextField!
  @IBOutlet private weak var phoneNumberEdit: UITextField!
  @IBOutlet weak private var birthDayInput: UITextField!
  var identifier = ""
  var avaImage: UIImage? {
    didSet {
      avaImageView.image = avaImage
    }
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.delegate = self
  }
  @IBAction func editAvaImage(_ sender: UIButton) {
    showActionSheet(title: "Action sheet", message: "Try???")
    identifier = "AvatarImage"
  }
  @IBAction func saveInfo(_ sender: Any) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    let date = Date()
    birthDayInput.text = dateFormatter.string(from: date)
    let user = User(avatarImage: avaImageView.image, userName: userNameInput.text, emailAddress: emailInput.text, phoneNumber: phoneNumberEdit.text, dateOfBirth: birthDayInput.text)
    let encodedData = NSKeyedArchiver.archivedData(withRootObject: user)
    UserDefaults.standard.set(encodedData, forKey: "user")
    delegate?.saveProfile(user: user)
    navigationController?.popViewController(animated: true)
  }
  // Image picker
  func showActionSheet(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    alert.addAction(UIAlertAction.init(title: "Pick photo", style: .default, handler: {_ in
      self.pickPhoto()
    }))
    alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {_ in
      self.takePhoto()
    }))
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) -> Void in
      alert.dismiss(animated: true, completion: nil)
    }))
    present(alert, animated: true, completion: nil)
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
  @IBAction func datePickerTapped(_ sender: UITextField) {
    let datePickerView: UIDatePicker = UIDatePicker()
    datePickerView.datePickerMode = UIDatePickerMode.date
    sender.inputView = datePickerView
    datePickerView.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
  }
  @objc func datePickerValueChanged(sender: UIDatePicker) {
    let dateFormatter = DateFormatter()
    birthDayInput.text = dateFormatter.string(from: sender.date)
  }
  // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 0
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 0
  }
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
}
extension EditProfileTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
    let image = info[UIImagePickerControllerOriginalImage] as? UIImage
    self.avaImageView.image = image
    dismiss(animated: true, completion: nil)
  }
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
}

