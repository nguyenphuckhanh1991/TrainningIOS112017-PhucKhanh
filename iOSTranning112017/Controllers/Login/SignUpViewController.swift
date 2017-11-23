//
//  SignUpViewController.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 11/14/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class SignUpViewController: BaseViewController {
  @IBOutlet weak private var userNameInput: CustomTextField!
  @IBOutlet weak private var passWordInput: CustomTextField!
  @IBOutlet weak private var phoneNumberInput: CustomTextField!
  @IBOutlet weak private var emailInput: CustomTextField!
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    tranparentNavigation = true
  }
}
extension SignUpViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == userNameInput {
      emailInput.becomeFirstResponder()
    }
    if textField == emailInput {
      phoneNumberInput.becomeFirstResponder()
    }
    if textField == phoneNumberInput {
      passWordInput.becomeFirstResponder()
    }
    if textField == passWordInput {
      view.endEditing(true)
    }
    return false
  }
}
