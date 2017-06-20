//
//  Transform.swift
//  Sween
//
//  Created by Shun Kuroda on 2017/06/19.
//  Copyright © 2017年 kuroyam. All rights reserved.
//

import Foundation

public class Transform: Sweenable {
    
    public typealias TransformParameter = CGRect
    
    public private(set) var view:     UIView
    public private(set) var duration: CFTimeInterval
    public private(set) var start:    TransformParameter
    public private(set) var end:      TransformParameter
    public private(set) var easing:   Easing.Curve
    
    public init(with view: UIView) {
        self.view     = view
        self.duration = 0.0
        self.start    = view.frame
        self.end      = view.frame
        self.easing   = Linear.Default
    }
    
    public func duration(_ duration: CFTimeInterval) -> Transform {
        self.duration = duration
        return self
    }
    
    public func from(_ rect: TransformParameter) -> Transform {
        start = rect
        return self
    }
    
    public func from(_ point: CGPoint) -> Transform {
        start = CGRect(origin: point, size: start.size)
        return self
    }
    
    public func to(_ rect: TransformParameter) -> Transform {
        end = rect
        return self
    }
    
    public func to(_ point: CGPoint) -> Transform {
        end = CGRect(origin: point, size: end.size)
        return self
    }
    
    public func ease(_ easing: @escaping Easing.Curve) -> Transform {
        self.easing = easing
        return self
    }
    
    public func update(with time: CFTimeInterval) {
        view.frame = CGRect(
            x:      easing(time, Double(start.origin.x), Double(end.origin.x - start.origin.x), duration),
            y:      easing(time, Double(start.origin.y), Double(end.origin.y - start.origin.y), duration),
            width:  easing(time, Double(start.width),    Double(end.width    - start.width),    duration),
            height: easing(time, Double(start.height),   Double(end.height   - start.height),   duration)
        )
    }
    
}
