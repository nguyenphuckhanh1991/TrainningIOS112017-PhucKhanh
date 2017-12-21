//
//  ImageCache.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 12/20/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit

class ImageCache {
    static private let cache = NSCache<NSString, UIImage>()
    class func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString )
    }
    class func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    class func deleteImage(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
    }
    class func deleteAllImage() {
        cache.removeAllObjects()
    }
}
