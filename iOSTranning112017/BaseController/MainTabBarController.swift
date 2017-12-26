//
//  MainTabBarController.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 12/28/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.selectedIndex = 0
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // setup
        self.setupStartApp()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    private func setupView() {
    }
    func hideTabbar(hide: Bool?, animated: Bool = false) {
        self.tabBar.isHidden = hide ?? false
    }
    private func setupStartApp() {
        let startViewController = StartViewController.getViewControllerFromStoryboard(Storyboard.Main.Main)
        // set list childs controller to tabbar
        let controllers = [startViewController]
        viewControllers = controllers
        self.hideTabbar(hide: true)
    }
    func setupMainApp() {
        // Timeline
        let navigationTimeline = UIStoryboard(name: Storyboard.Timeline.Timeline, bundle: nil).instantiateInitialViewController()!
        // User
        let navigationUser = UIStoryboard(name: Storyboard.User.User, bundle: nil).instantiateInitialViewController()!
        //let tabBarItemUser =  UITabBarItem(title: Storyboard.TabBarTitle.profile, image: #imageLiteral(resourceName: "edit_profile"), tag: 20)
        //navigationUser.tabBarItem = tabBarItemUser
        // set list childs controller to tabbar
        let controllers = [navigationTimeline, navigationUser]
        self.viewControllers = controllers
        self.hideTabbar(hide: false)
    }
}
