//
//  PostViewController.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 11/21/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    @IBAction func cancelTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak private var statusTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultTextView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension PostViewController: UITextViewDelegate {
    func setDefaultTextView() {
        self.statusTextView.delegate = self
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.statusTextView.text = ""
        self.statusTextView.textColor = UIColor.black
    }
}
