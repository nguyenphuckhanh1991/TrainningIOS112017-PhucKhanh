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
    self.avaImage = aDecoder.decodeObject(forKey: "avaImage") as? UIImage ?? nil
    self.statusImage = aDecoder.decodeObject(forKey: "statusImage") as? UIImage ?? nil
    self.contentStateImage = aDecoder.decodeObject(forKey: "contentStateImage") as? UIImage ?? nil
    self.likeImage = aDecoder.decodeObject(forKey: "likeImage") as? UIImage ?? nil
    self.commentImage = aDecoder.decodeObject(forKey: "commentImage") as? UIImage ?? nil
    self.shareImage = aDecoder.decodeObject(forKey: "shareImage") as? UIImage ?? nil
    self.status = aDecoder.decodeObject(forKey: "status") as? String ?? ""
    self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
    self.date = aDecoder.decodeObject(forKey: "date") as? String ?? ""
    self.likeCount = aDecoder.decodeObject(forKey: "likeCount") as? String ?? ""
    self.commentCount = aDecoder.decodeObject(forKey: "commentCount") as? String ?? ""
    self.commentLabel = aDecoder.decodeObject(forKey: "commentLabel") as? String ?? ""
    self.likeLabel = aDecoder.decodeObject(forKey: "likeLabel") as? String ?? ""
    self.shareLabel = aDecoder.decodeObject(forKey: "shareLabel") as? String ?? ""
  }
  func encode(with aCoder: NSCoder) {
    aCoder.encode(self.avaImage, forKey: "avaImage")
    aCoder.encode(self.avaImage, forKey: "statusImage")
    aCoder.encode(self.contentStateImage, forKey: "contentStateImage")
    aCoder.encode(self.likeImage, forKey: "likeImage")
    aCoder.encode(self.commentImage, forKey: "commentImage")
    aCoder.encode(self.shareImage, forKey: "shareImage")
    aCoder.encode(self.status, forKey: "status")
    aCoder.encode(self.name, forKey: "name")
    aCoder.encode(self.date, forKey: "date")
    aCoder.encode(self.likeCount, forKey: "likeCount")
    aCoder.encode(self.commentCount, forKey: "commentCount")
    aCoder.encode(self.commentLabel, forKey: "commentLabel")
    aCoder.encode(self.likeLabel, forKey: "likeLabel")
    aCoder.encode(self.shareLabel, forKey: "shareLabel")
  }
}
