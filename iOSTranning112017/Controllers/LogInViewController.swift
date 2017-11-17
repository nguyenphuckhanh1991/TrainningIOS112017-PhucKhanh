//
//  SignInViewController.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 11/13/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class LogInViewController: BaseViewController, UITextFieldDelegate {
    @IBOutlet weak var emailInputTextField: UITextField!
    @IBOutlet weak var passwordInputTextField: UITextField!
    @IBAction func signUpAction(_ sender: Any) {
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tranparentNavigation = true
    }
    @IBAction func logInAction(_ sender: Any) {
        checkUserAuth()
    }
    func checkUserAuth() {
        let email = emailInputTextField.text!
        let password = passwordInputTextField.text!
        if email.count > 6 && password.count > 6 {
            let tabbar = storyboard?.instantiateViewController(withIdentifier: "BaseTabbar") as! BaseTabbarController
            present(tabbar, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Error", message: "Email and Password need more than 6 characters", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Try Again", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}
