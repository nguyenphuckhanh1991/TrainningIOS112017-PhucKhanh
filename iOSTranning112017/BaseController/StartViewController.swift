//
//  StartViewController.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 12/12/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class StartViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.checkApp()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    private func checkApp() {
        if !isLogged() {
            self.perform(#selector(StartViewController.gotoLogin), with: nil, afterDelay: 0)
        } else {
            self.perform(#selector(StartViewController.gotoMainApp), with: nil, afterDelay: 0)
        }
    }
    func isLogged() -> Bool {
        guard UserDefaults.standard.value(forKey: AppKey.TokenKey.token) != nil else {return false}
        return true
    }
    @objc func gotoLogin() {
        let userLoginVC = LogInViewController.getViewControllerFromStoryboard(Storyboard.Login.Login)
        self.present(userLoginVC, animated: true, completion: nil)
    }
    @objc func gotoMainApp() {
        self.mainTabBarViewController?.setupMainApp()
    }
}
