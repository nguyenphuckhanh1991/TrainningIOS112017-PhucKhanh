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
        self.checkLogged()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    private func checkLogged() {
        if isLogged() {
            gotoMainApp()
        } else {
            gotoLogin()
        }
    }
    func isLogged() -> Bool {
        guard UserDefaults.standard.value(forKey: AppKey.TokenKey.token) != nil else {
            return false
        }
        return true
    }
    func gotoLogin() {
        guard let userSettingVC = UIStoryboard.init(name: Storyboard.Main.login, bundle: nil).instantiateViewController(withIdentifier: Storyboard.BaseView.BaseNavigationController) as? BaseNavigationController else {
            return
        }
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController = userSettingVC
    }
    func gotoMainApp() {
        guard let userSettingVC = UIStoryboard.init(name: Storyboard.Main.timeline, bundle: nil).instantiateViewController(withIdentifier: Storyboard.BaseView.BaseTabbarController) as? BaseTabbarController else {
            return
        }
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController = userSettingVC
    }
}
