//
//  StatusCell.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 11/21/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//
import UIKit

class StatusCellItem: NSObject {
    var avaImage: UIImage?
    var contentStateImage: UIImage?
    var likeImage: UIImage?
    var commentImage: UIImage?
    var shareImage: UIImage?
    var status: String?
    var name: String?
    var date: String?
    var likeCount: String?
    var like: String?
    var comment: String?
    var share: String?
    required init(avaImage: UIImage?, contentStateImage: UIImage?, likeImage: UIImage?, commentImage: UIImage?, shareImage: UIImage?, status: String?, name: String?, date: String?, likeCount: String?, like: String?, comment: String?, share: String?) {
        self.avaImage = avaImage
        self.contentStateImage = contentStateImage
        self.likeImage = likeImage
        self.commentImage = commentImage
        self.shareImage = shareImage
        self.status = status
        self.name = name
        self.date = date
        self.likeCount = likeCount
        self.comment = comment
        self.like = like
        self.share = share
    }
}
