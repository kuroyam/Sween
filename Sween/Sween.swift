//
//  Sween.swift
//  Sween
//
//  Created by Shun Kuroda on 2017/05/30.
//  Copyright © 2017年 kuroyam. All rights reserved.
//

import QuartzCore
import UIKit

public class Sween {
    
    private let view:     UIView
    private var fromRect: CGRect
    private var toRect:   CGRect
    private var duration: CGFloat = 0.1
    private var easing:   Easing.Curve = Easing.Linear
    
    private var displayLink: CADisplayLink?
    private var startTimestamp: CFTimeInterval = 0
    
    public init(with view: UIView) {
        self.view = view
        fromRect  = view.frame
        toRect    = view.frame
    }
    
    deinit {
        displayLink?.invalidate()
    }
    
    public func duration(_ duration: CGFloat) -> Sween {
        self.duration = duration
        return self
    }
    
    public func from(_ rect: CGRect) -> Sween {
        fromRect = rect
        return self
    }
    
    public func to(_ rect: CGRect) -> Sween {
        toRect = rect
        return self
    }
    
    public func moveTo(_ point: CGPoint) -> Sween {
        toRect = CGRect(origin: point, size: toRect.size)
        return self
    }
    
    public func easing(_ easing: @escaping Easing.Curve) -> Sween {
        self.easing = easing
        return self
    }
    
    public func animate() {
        displayLink = CADisplayLink(target: self, selector: #selector(displayDidRefresh(_:)))
        displayLink?.add(to: RunLoop.main, forMode: RunLoopMode.defaultRunLoopMode)
    }

    @objc func displayDidRefresh(_ displayLink: CADisplayLink) {
        if startTimestamp == 0 {
            startTimestamp = displayLink.timestamp
        }
        
        let current: CGFloat = CGFloat(displayLink.timestamp - startTimestamp)
        
        if current >= duration {
            view.frame = CGRect(
                x:      easing(duration, fromRect.origin.x, toRect.origin.x - fromRect.origin.x, duration),
                y:      easing(duration, fromRect.origin.y, toRect.origin.y - fromRect.origin.y, duration),
                width:  easing(duration, fromRect.width,    toRect.width    - fromRect.width,    duration),
                height: easing(duration, fromRect.height  , toRect.height   - fromRect.height,   duration)
            )
            displayLink.invalidate()
        } else {
            view.frame = CGRect(
                x:      easing(current, fromRect.origin.x, toRect.origin.x - fromRect.origin.x, duration),
                y:      easing(current, fromRect.origin.y, toRect.origin.y - fromRect.origin.y, duration),
                width:  easing(current, fromRect.width,    toRect.width    - fromRect.width,    duration),
                height: easing(current, fromRect.height  , toRect.height   - fromRect.height,   duration)
            )
        }
    }
    
}
