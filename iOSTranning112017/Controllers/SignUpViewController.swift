//
//  SignUpViewController.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 11/14/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class SignUpViewController: BaseViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureKeyboard()
        tranparentNavigation = true
    }
    func configureKeyboard() {
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().enableAutoToolbar = false
        IQKeyboardManager.sharedManager().shouldResignOnTouchOutside = true
    }
}
