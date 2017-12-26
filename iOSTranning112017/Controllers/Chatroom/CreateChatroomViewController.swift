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
    private var avaImageURL: String = ""
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak private var userNameInput: CustomTextField!
    @IBOutlet weak private var descriptionInput: CustomTextField!
    @IBOutlet weak private var avaImageView: UIImageView!
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
    }
    @IBAction func selectaAvaImage(_ sender: UIButton) {
        guard  let avaImageVC = UIStoryboard.init(name: Storyboard.Main.timeline, bundle: nil).instantiateViewController(withIdentifier: Storyboard.Timeline.AvatarImageViewController) as? AvatarImageViewController  else {
            return
        }
        avaImageVC.delegate = self
        navigationController?.pushViewController(avaImageVC, animated: true)
    }
    @IBAction func createChatroom(_ sender: UIButton) {
        view.endEditing(true)
        if userNameInput.text?.count == 0 {
            return
        }
        if descriptionInput.text?.count == 0 {
            return
        }
        let parameters: [String: String] = ["name": userNameInput.text!, "description": descriptionInput.text!, "avatarUrl": avaImageURL]
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
extension CreateChatroomViewController: AvatarImageViewControllerDelegate {
    func avaImageSelected(avaImageURL: String) {
        if let image = ImageCache.image(forKey: avaImageURL) {
            avaImageView.image = image
        }
        self.avaImageURL = avaImageURL
    }
}
