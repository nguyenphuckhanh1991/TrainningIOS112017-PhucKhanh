//
//  Key.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 12/13/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import Foundation
struct AppKey {
    struct ParameterKey {
        static let username                 = "username"
        static let password                 = "password"
        static let email                    = "email"
    }
    struct HeaderKey {
        static let ContentType              = "Content-Type"
        static let Authorization            = "Authorization"
        static let Accept                   = "Accept"
    }
    struct HeaderValue {
        static let ApplicationJson          = "application/json"
    }
    struct UserDefaultKey {
        static let user                     = "user"
    }
    struct TokenKey {
        static let token                    = "token"
        static let accessToken              = "access_token"
        static let refreshToken             = "refresh_token"
        static let tokeType                 = "token_type"
    }
    struct ResponseKey {
        static let success                  = "success"
        static let code                     = "code"
        static let message                  = "message"
    }
    struct UserPropertyKey {
        static let avatarImage              = "avatarImage"
        static let userName                 = "userName"
        static let emailAddress             = "emailAddress"
        static let phoneNumber              = "phoneNumber"
        static let dateOfBirth              = "dateOfBirth"
    }
    struct StatusPropertyKey {
        static let avatarImage              = "avatarImage"
        static let userName                 = "userName"
        static let emailAddress             = "emailAddress"
        static let phoneNumber              = "phoneNumber"
        static let dateOfBirth              = "dateOfBirth"
        static let statusImage              = "statusImage"
        static let shareImage               = "shareImage"
        static let commentCount             = "commentCount"
        static let likeCount                = "likeCount"
        static let likeLabel                = "likeLabel"
        static let shareLabel               = "shareLabel"
        static let commentLabel             = "commentLabel"
        static let date                     = "date"
        static let status                   = "status"
        static let likeImage                = "likeImage"
        static let contentStateImage        = "contentStateImage"
        static let commentImage             = "commentImage"
    }
}
