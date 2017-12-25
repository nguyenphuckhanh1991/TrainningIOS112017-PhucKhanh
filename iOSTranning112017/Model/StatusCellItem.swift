//
//  StatusCell.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 11/21/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//
import UIKit

class StatusCellItem: NSObject, NSCoding {
  var avaImage: UIImage?
  var statusImage: UIImage?
  var contentStateImage: UIImage?
  var likeImage: UIImage?
  var commentImage: UIImage?
  var shareImage: UIImage?
  var status: String?
  var name: String?
  var date: String?
  var likeCount: String?
  var commentCount: String?
  var likeLabel: String?
  var commentLabel: String?
  var shareLabel: String?
  required init(avaImage: UIImage?, statusImage: UIImage?, contentStateImage: UIImage?, likeImage: UIImage?, commentImage: UIImage?, shareImage: UIImage?, status: String?, name: String?, date: String?, likeCount: String?, commentCount: String?, likeLabel: String?, commentLabel: String?, shareLabel: String?) {
    self.avaImage = avaImage
    self.statusImage = statusImage
    self.contentStateImage = contentStateImage
    self.likeImage = likeImage
    self.commentImage = commentImage
    self.shareImage = shareImage
    self.status = status
    self.name = name
    self.date = date
    self.likeCount = likeCount
    self.commentCount = commentCount
    self.commentLabel = commentLabel
    self.likeLabel = likeLabel
    self.shareLabel = shareLabel
  }
  required init?(coder aDecoder: NSCoder) {
    self.avaImage = aDecoder.decodeObject(forKey: AppKey.StatusPropertyKey.avatarImage) as? UIImage ?? nil
    self.statusImage = aDecoder.decodeObject(forKey: AppKey.StatusPropertyKey.statusImage) as? UIImage ?? nil
    self.contentStateImage = aDecoder.decodeObject(forKey: AppKey.StatusPropertyKey.contentStateImage) as? UIImage ?? nil
    self.likeImage = aDecoder.decodeObject(forKey: AppKey.StatusPropertyKey.likeImage) as? UIImage ?? nil
    self.commentImage = aDecoder.decodeObject(forKey: AppKey.StatusPropertyKey.commentImage) as? UIImage ?? nil
    self.shareImage = aDecoder.decodeObject(forKey: AppKey.StatusPropertyKey.shareImage) as? UIImage ?? nil
    self.status = aDecoder.decodeObject(forKey: AppKey.StatusPropertyKey.status) as? String ?? ""
    self.name = aDecoder.decodeObject(forKey: AppKey.StatusPropertyKey.userName) as? String ?? ""
    self.date = aDecoder.decodeObject(forKey: AppKey.StatusPropertyKey.date) as? String ?? ""
    self.likeCount = aDecoder.decodeObject(forKey: AppKey.StatusPropertyKey.likeCount) as? String ?? ""
    self.commentCount = aDecoder.decodeObject(forKey: AppKey.StatusPropertyKey.commentCount) as? String ?? ""
    self.commentLabel = aDecoder.decodeObject(forKey: AppKey.StatusPropertyKey.commentLabel) as? String ?? ""
    self.likeLabel = aDecoder.decodeObject(forKey: AppKey.StatusPropertyKey.likeLabel) as? String ?? ""
    self.shareLabel = aDecoder.decodeObject(forKey: AppKey.StatusPropertyKey.shareLabel) as? String ?? ""
  }
  func encode(with aCoder: NSCoder) {
    aCoder.encode(self.avaImage, forKey: AppKey.StatusPropertyKey.avatarImage)
    aCoder.encode(self.avaImage, forKey: AppKey.StatusPropertyKey.statusImage)
    aCoder.encode(self.contentStateImage, forKey: AppKey.StatusPropertyKey.contentStateImage)
    aCoder.encode(self.likeImage, forKey: AppKey.StatusPropertyKey.likeImage)
    aCoder.encode(self.commentImage, forKey: AppKey.StatusPropertyKey.commentImage)
    aCoder.encode(self.shareImage, forKey: AppKey.StatusPropertyKey.shareImage)
    aCoder.encode(self.status, forKey: AppKey.StatusPropertyKey.status)
    aCoder.encode(self.name, forKey: AppKey.StatusPropertyKey.userName)
    aCoder.encode(self.date, forKey: AppKey.StatusPropertyKey.date)
    aCoder.encode(self.likeCount, forKey: AppKey.StatusPropertyKey.likeCount)
    aCoder.encode(self.commentCount, forKey: AppKey.StatusPropertyKey.commentCount)
    aCoder.encode(self.commentLabel, forKey: AppKey.StatusPropertyKey.commentLabel)
    aCoder.encode(self.likeLabel, forKey: AppKey.StatusPropertyKey.likeLabel)
    aCoder.encode(self.shareLabel, forKey: AppKey.StatusPropertyKey.shareLabel)
  }
}
