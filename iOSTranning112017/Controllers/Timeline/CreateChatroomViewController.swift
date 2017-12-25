//
//  CreateChatroomViewController.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 12/26/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit
protocol PostChatroomViewControllerDelegate: class {
    func postChatRoom(chatroom: [String: Any])
}
class CreateChatroomViewController: BaseViewController {
    weak var delegate: PostChatroomViewControllerDelegate?
    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak private var userNameInput: CustomTextField!
    @IBOutlet weak private var descriptionInput: CustomTextField!
    @IBOutlet weak private var avaImageURL: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
        dismissKeyboard(tapGesture)
    }
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func createChatroom(_ sender: UIButton) {
        view.endEditing(true)
        if userNameInput.text?.count == 0 {
            //showNotification(type: .error, message: "Please enter the name of chatroom")
            return
        }
        if descriptionInput.text?.count == 0 {
            //showNotification(type: .error, message: "Please enter the description")
            return
        }
        if avaImageURL.text?.count == 0 {
            //showNotification(type: .error, message: "Please enter the avatar of chatroom link")
        }
        let parameters: [String: String] = ["name": userNameInput.text!, "description": descriptionInput.text!, "avatarUrl": avaImageURL.text!]
        var appService = AppServices.init()
        appService.request(httpMethod: .post, parameter: parameters, apiType: .createChatroom) { (data, error) in
            if let responseData = data {
                if responseData[AppKey.ResponseKey.success] as? Int == 1 {
                    guard let chatrooms = responseData[AppKey.ResponseKey.chatroom] as? [String: Any] else {
                        self.showAlertMessage(title: InputResult.CreateChatroomError.wrongResponseDataTitle, message: InputResult.CreateChatroomError.wrongResponseDataMessage, titleAction: InputResult.CreateChatroomError.actionTitle)
                        return
                    }
                    self.delegate?.postChatRoom(chatroom: chatrooms)
                    self.dismiss(animated: true, completion: nil)
                } else {
                    guard (responseData[AppKey.ResponseKey.message] as? String) != nil else {
                        return
                    }
                    self.showAlertMessage(title: "Create Chatroom fail!", message: "Can't create chatroom now. Please try again", titleAction: InputResult.ActionSheet.cancel)
                }
            } else {
                print(error as Any)
                self.showAlertMessage(title: "Create Chatroom fail!", message: "Can't create chatroom now. Please try again", titleAction: InputResult.ActionSheet.cancel)
            }
        }
    }
}
