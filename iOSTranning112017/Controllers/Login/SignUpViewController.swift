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
    @IBOutlet weak private var signUpButton: CustomButton!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tranparentNavigation = true
    }
    @IBAction func doSignUpAction(_ sender: Any) {
        doSignUp()
    }
    func doSignUp() {
        guard let username = userNameInput.text, let password = passWordInput.text, let email = emailInput.text  else {
            return
        }
        configUI(isActive: false)
        if validateInputField(username: username, password: password, email: email) {
            registerRequest(username: username, password: password, email: email)
        } else {
            configUI(isActive: true)
        }
    }
    private func registerRequest(username: String, password: String, email: String) {
        var appService = AppServices.init()
        let parameters = [AppKey.ParameterKey.username: username, AppKey.ParameterKey.password: password, AppKey.ParameterKey.email: email]
        appService.request(httpMethod: .post, parameter: parameters, apiType: .register) { (data, error) in
            if let responseData: [String: Any] = data {
                if responseData[AppKey.ResponseKey.success] as? Int == 1 {
                    self.showLoginVC()
                } else {
                    guard (responseData[AppKey.ResponseKey.message] as? String) != nil else {return}
                    self.showAlertMessage(title: InputResult.LoginError.titleWrongInputType, message: InputResult.LoginError.messageLoginFail, titleAction: InputResult.LoginError.actionTitle)
                    self.configUI(isActive: true)
                }
            } else {
                print(error as Any)
                self.showAlertMessage(title: InputResult.LoginError.titleWrongInputType, message: InputResult.LoginError.messageLoginFail, titleAction: InputResult.LoginError.actionTitle)
            }
        }
    }
    func showLoginVC() {
        DispatchQueue.main.async {
            guard let tabbar = UIStoryboard.init(name: Storyboard.Login.Login, bundle: nil).instantiateViewController(withIdentifier: Storyboard.BaseView.BaseNavigationController) as? BaseNavigationController else {return}
            self.present(tabbar, animated: true, completion: nil)
        }
    }
    private func configUI(isActive: Bool?) {
        guard let isActive = isActive else {
            return
        }
        self.signUpButton.isEnabled = isActive
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
extension SignUpViewController {
    func validateInputField(username: String, password: String, email: String) -> Bool {
        var flag = false
        if username.isEmpty || password.isEmpty || email.isEmpty {
            showAlertMessage(title: InputResult.LoginError.titleWrongInputType, message: InputResult.LoginError.messageMustFilled, titleAction: InputResult.LoginError.actionTitle)
            flag = false
        }
        if username.count > 6 && password.count > 6 && email.count > 6 {
            if username == userNameInput.text && password == passWordInput.text && email == emailInput.text {
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
