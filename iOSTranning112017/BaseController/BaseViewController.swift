//
//  BaseViewController.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 11/13/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    lazy var mainTabBarViewController: MainTabBarController? = {
        if let _tabBarController = self.tabBarController as? MainTabBarController {
            return _tabBarController
        }
        return self.view.window?.rootViewController as? MainTabBarController
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    // MARK: Setting Navigation Controller
    var tranparentNavigation: Bool? {
        didSet {
            if tranparentNavigation == true {
                setTransparentForNavigation()
            } else {
                defaulTranparentNavigation()
            }
        }
    }
    fileprivate func setTransparentForNavigation() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    fileprivate func defaulTranparentNavigation () {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
    }
}
