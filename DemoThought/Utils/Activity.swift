//
//  Activity.swift
//  TringappsDemo
//
//  Created by Zencode Developer on 19/12/19.
//  Copyright © 2019 Zencode Developer. All rights reserved.
//

import UIKit

final class Activity: UIViewController {
    
    private static var current: Activity?
    private static var window: UIWindow?
    
    static func show() {
        if current == nil {
            current = Activity()
        }
        
        if window == nil {
            let win = UIWindow(frame: UIScreen.main.bounds)
            win.rootViewController = current
            win.windowLevel = UIWindow.Level.alert + 5
            win.makeKeyAndVisible()
            window = win
        }
        
        if let window = window {
            UIView.animate(withDuration: Double(1 - window.alpha) * 2) {
                window.alpha = 1
            }
        }
    }
    
    static func hide() {
        if let window = window {
            UIView.animate(withDuration: Double(window.alpha) / 2, animations: {
                window.alpha = 0
            }) { (_) in
                Activity.window?.isHidden = true
                Activity.window = nil
            }
        }
    }
    
    override func loadView() {
        let background = UIView(frame: UIScreen.main.bounds)
        background.backgroundColor = UIColor(white: 0, alpha: 0.2)
        
        let activity = UIActivityIndicatorView(style: .whiteLarge)
        activity.frame.origin = CGPoint(
            x: (background.frame.width - activity.frame.width) / 2,
            y: (background.frame.height - activity.frame.height) / 2
        )
        activity.startAnimating()
        background.addSubview(activity)
        
        view = background
    }
    
}
