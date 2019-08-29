//
//  Sween.swift
//  Sween
//
//  Created by Shun Kuroda on 2017/05/30.
//  Copyright © 2017年 kuroyam. All rights reserved.
//

import QuartzCore
import UIKit

public class Sween<Action: Sweenable> {
    
    private var displayLink: CADisplayLink?
    private var startTimestamp: CFTimeInterval = 0
    
    private let action: Action
    private var loop = Loop(count: 0, interval: 0)
    
    public init(with action: Action) {
        self.action = action
    }
    
    deinit {
        displayLink?.invalidate()
    }
    
    public func loop(count: Int = Loop.infiniteLoop, interval: Double = 0.0) -> Sween {
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
        let current = time >= action.duration ? action.duration : time
        
        action.update(with: current)
        
        if time > action.duration + loop.interval {
            loop.increment()
            if loop.completed {
                displayLink?.invalidate()
            } else {
                startTimestamp = 0
            }
        }
    }
    
}
