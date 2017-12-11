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
    @IBOutlet weak private var loginButton: CustomButton!
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
        guard let username = emailInputTextField.text, let password = passwordInputTextField.text else {
            return
        }
        configUI(isActive: false)
        if validateInputField(username: username, password: password) {
            doLogin(username: username, password: password)
        } else {
            configUI(isActive: true)
        }
    }
    private func doLogin(username: String, password: String) {
        var appService = AppServices.init()
        let parameters = [AppKey.ParameterKey.username: username, AppKey.ParameterKey.password: password]
        appService.request(httpMethod: .post, parameter: parameters, apiType: .login) { (data, _) in
            if let responseData: [String: Any] = data {
                if responseData[AppKey.ResponseKey.success] as? Int == 1 {
                    DispatchQueue.main.async {
                        UserDefaults.standard.set(responseData[AppKey.TokenKey.token], forKey: AppKey.TokenKey.token)
                        UserDefaults.standard.synchronize()
                        self.showMainVC()
                    }
                } else {
                    guard (responseData[AppKey.ResponseKey.message] as? String) != nil else {return}
                    self.showAlertMessage(title: InputResult.LoginError.titleWrongInputType, message: InputResult.LoginError.messageLoginFail, titleAction: InputResult.LoginError.actionTitle)
                    self.configUI(isActive: true)
                }
            }
        }
    }
    func showMainVC() {
        DispatchQueue.main.async {
            guard let tabbar = UIStoryboard.init(name: Storyboard.Main.timeline, bundle: nil).instantiateViewController(withIdentifier: Storyboard.BaseView.BaseTabbarController) as? BaseTabbarController else {return}
            self.present(tabbar, animated: true, completion: nil)
        }
    }
    private func configUI(isActive: Bool?) {
        guard let isActive = isActive else {
            return
        }
        self.loginButton.isEnabled = isActive
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
extension LogInViewController {
    func validateInputField(username: String, password: String) -> Bool {
        var flag = false
        if username.isEmpty || password.isEmpty {
            showAlertMessage(title: InputResult.LoginError.titleWrongInputType, message: InputResult.LoginError.messageMustFilled, titleAction: InputResult.LoginError.actionTitle)
            flag = false
        }
        if username.count > 6 && password.count > 6 {
            if username == emailInputTextField.text && password == passwordInputTextField.text {
                flag = true
            } else {
                showAlertMessage(title: InputResult.LoginError.titleLoginFail, message: InputResult.LoginError.messageInvalid, titleAction: InputResult.LoginError.actionTitle)
            }
        } else {
            showAlertMessage(title: InputResult.LoginError.titleWrongInputType, message: InputResult.LoginError.messageMustGreater, titleAction: InputResult.LoginError.actionTitle)
        }
        return flag
    }
}
