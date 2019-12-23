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
    
    class Loop {
        
        static let infiniteLoop = -1
        
        let loopCount: Int
        let interval: Double
        
        private var counter = 0
        
        init(count: Int, interval: Double) {
            self.loopCount = count
            self.interval  = interval
        }
        
        var completed: Bool {
            if loopCount == Loop.infiniteLoop {
                return false
            }
            return counter >= loopCount
        }
        
        func increment() {
            if counter == Int.max {
                counter = 0
            }
            counter += 1
        }
        
    }
    
    private var loop = Sween.Loop(count: 0, interval: 0)
    
    private let view:     UIView
    private var fromRect: CGRect
    private var toRect:   CGRect
    private var duration: Double = 0.1
    private var easing:   Easing.Curve = Linear.Default
    
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
    
    public func duration(_ duration: Double) -> Sween {
        self.duration = duration
        return self
    }
    
    public func transform(to rect: CGRect) -> Sween {
        toRect = rect
        return self
    }
    
    public func move(to point: CGPoint) -> Sween {
        toRect = CGRect(origin: point, size: toRect.size)
        return self
    }
    
    public func ease(_ easing: @escaping Easing.Curve) -> Sween {
        self.easing = easing
        return self
    }
    
    public func loop(count: Int = Sween.Loop.infiniteLoop, interval: Double = 0.0) -> Sween {
        loop = Loop(count: count, interval: interval)
        return self
    }
    
    public func animate() {
        displayLink = CADisplayLink(target: self, selector: #selector(displayDidRefresh(_:)))
        displayLink?.add(to: RunLoop.main, forMode: RunLoop.Mode.default)
    }

    @objc func displayDidRefresh(_ displayLink: CADisplayLink) {
        if startTimestamp == 0 {
            startTimestamp = displayLink.timestamp
        }
        
        let elapsedTime = displayLink.timestamp - startTimestamp
        update(with: elapsedTime)
    }
    
    private func update(with time: CFTimeInterval) {
        let current = time >= duration ? duration : time
        view.frame = CGRect(
            x:      easing(current, Double(fromRect.origin.x), Double(toRect.origin.x - fromRect.origin.x), duration),
            y:      easing(current, Double(fromRect.origin.y), Double(toRect.origin.y - fromRect.origin.y), duration),
            width:  easing(current, Double(fromRect.width),    Double(toRect.width    - fromRect.width),    duration),
            height: easing(current, Double(fromRect.height),   Double(toRect.height   - fromRect.height),   duration)
        )
        
        if time > duration + loop.interval {
            loop.increment()
            if loop.completed {
                displayLink?.invalidate()
            } else {
                startTimestamp = 0
            }
        }
    }
    
}
