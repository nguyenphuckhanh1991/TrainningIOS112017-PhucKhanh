//
//  SignInViewController.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 11/13/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class LogInViewController: BaseViewController, UITextFieldDelegate {
    @IBOutlet weak private var emailInputTextField: UITextField!
    @IBOutlet weak private var passwordInputTextField: UITextField!
    @IBAction func signUpAction(_ sender: Any) {
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureKeyboard()
        tranparentNavigation = true
    }
    @IBAction func logInAction(_ sender: Any) {
        checkUserAuth()
    }
    func checkUserAuth() {
        if emailInputTextField.text!.count > 6 && passwordInputTextField.text!.count > 6 {
            guard let tabbar = storyboard?.instantiateViewController(withIdentifier: "BaseTabbar") as? BaseTabbarController else {
                return
            }
            present(tabbar, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Error", message: "Email and Password need more than 6 characters", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Try Again", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    func configureKeyboard() {
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().enableAutoToolbar = false
        IQKeyboardManager.sharedManager().shouldResignOnTouchOutside = true
    }
}
