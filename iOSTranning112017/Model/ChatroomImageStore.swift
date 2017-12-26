//
//  ChatroomImageStore.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 12/27/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import Foundation

class ChatroomImageStore {
    private var avaImages = [String]()
    init() {
            avaImages = [
            "https://avatars0.githubusercontent.com/u/2322183?s=200&v=4",
            "https://i.pinimg.com/474x/5b/e6/7b/5be67bac173ceaa0f92560241a76fc6c--elizabeth-olsen-scarlet-witch-scarlet-witch-avengers.jpg"
        ]
    }
    func getAvaImages() -> [String] {
        return avaImages
    }
}
