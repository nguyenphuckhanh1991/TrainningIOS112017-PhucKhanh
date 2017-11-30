//
//  UIViewController.swift
//  iOSTranning112017
//
//  Created by Joy on 11/24/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlertMessage(title: String, message: String, titleAction: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: titleAction, style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
