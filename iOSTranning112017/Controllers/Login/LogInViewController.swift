//
//  SignInViewController.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 11/13/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class LogInViewController: BaseViewController {
  @IBOutlet weak private var emailInputTextField: UITextField!
  @IBOutlet weak private var passwordInputTextField: UITextField!
  @IBAction func signUpAction(_ sender: Any) {
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
    self.view.addGestureRecognizer(tapGesture)
    dismissKeyboard(tapGesture)
    tranparentNavigation = true
  }
  @IBAction func logInAction(_ sender: Any) {
    checkUserAuth()
  }
  @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
    view.endEditing(true)
  }
  func checkUserAuth() {
    if emailInputTextField.text!.count > 6 && passwordInputTextField.text!.count > 6 {
      guard let tabbar = UIStoryboard.init(name: "Timeline", bundle: nil).instantiateViewController(withIdentifier: "BaseTabbarController") as? BaseTabbarController else {
        return
      }
      present(tabbar, animated: true, completion: nil)
    } else {
      let alertController = UIAlertController(title: "Error", message: "Email and Password need more than 6 characters", preferredStyle: .alert)
      let alertAction = UIAlertAction(title: "Try Again", style: .default, handler: nil)
      alertController.addAction(alertAction)
      let tabbar = UIStoryboard.init(name: "Timeline", bundle: nil).instantiateInitialViewController()
      let appDelegate = UIApplication.shared.delegate
      appDelegate?.window??.rootViewController = tabbar
    }
  }
}
extension LogInViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == emailInputTextField {
      passwordInputTextField.becomeFirstResponder()
    } else {
      view.endEditing(true)
    }
    return false
  }
}
