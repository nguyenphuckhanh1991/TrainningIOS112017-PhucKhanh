//
//  View.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 12/13/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import Foundation
struct Storyboard {
    struct Main {
        static let login                                = "Login"
        static let timeline                             = "Timeline"
    }
    struct Timeline {
        static let TimelineTableViewController          = "TimelineTableViewController"
        static let TimelineCommentContainerView         = "TimelineCommentContainerView"
        static let TimelineCommentTableViewController   = "TimelineCommentTableViewController"
        static let PostViewController                   = "PostViewController"
        static let ProfileTableViewController           = "ProfileTableViewController"
        static let EditProfileTableViewController       = "EditProfileTableViewController"
    }
    struct BaseView {
        static let BaseNavigationController             = "BaseNavigationController"
        static let BaseTabbarController                 = "BaseTabbarController"
        static let BaseViewController                   = "BaseViewController"
        static let StartViewController                  = "StartViewController"
    }
    struct CustomCell {
        static let FirstProfileCell                     = "FirstProfileCell"
        static let FirstCommentTableViewCell            = "FirstCommentTableViewCell"
        static let FirstTimelineTableViewCell           = "FirstTimelineTableViewCell"
        static let CustomCommentCell                    = "CustomCommentCell"
        static let TimeLineTableViewCell                = "TimeLineTableViewCell"
        static let ChatroomCell                         = "ChatroomCell"
    }
    struct Notification {
        static let postStatus                           = "postStatus"
        static let postItem                             = "postItem"
    }
    struct CustomView {
        static let statusBar                            = "statusBar"
    }
}
