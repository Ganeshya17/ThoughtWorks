//
//   UIImage+Ext.swift
//  TringappsDemo
//
//  Created by Zencode Developer on 19/12/19.
//  Copyright © 2019 Zencode Developer. All rights reserved.
//


import Foundation
import UIKit
let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
    func loadImage(withUrl urlString : String) {
        
        guard let url = URL(string: urlString.trim()) else {
            self.image = UIImage.placeholder()
            return
        }

        // cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }

        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            DispatchQueue.main.async {
                if let error = error {
                    print(error.localizedDescription)
                    self.image = UIImage.placeholder()
                    return
                }
                if let data = data {
                    if let image = UIImage(data: data) {
                        imageCache.setObject(image, forKey: urlString as NSString)
                        self.image = image
                    }else {
                        self.image = UIImage.placeholder()
                    }
                }else {
                    self.image = UIImage.placeholder()
                }
            }

        }).resume()
    }
}

extension UIImage {
    static func placeholder() -> UIImage? {
        return UIImage(named: "placeholder")
    }
}
