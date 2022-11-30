//
//  CacheManager.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 18.11.2022.
//

import UIKit

final class CacheManager {
    
    static let shared = CacheManager()
    private init() {}
    
    private var cache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 120
        return cache
    }()
    
    func addToCache(urlString: String, image: UIImage) {
        cache.setObject(image, forKey: urlString as NSString)
    }
    
    func getFromCache(urlString: String) -> UIImage? {
        cache.object(forKey: urlString as NSString)
    }
}
