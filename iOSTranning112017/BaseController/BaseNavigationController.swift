//
//  BaseNavigationController.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 11/15/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isTranslucent = true
    }
}
