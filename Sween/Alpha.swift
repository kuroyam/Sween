//
//  Alpha.swift
//  Sween
//
//  Created by Shun Kuroda on 2017/06/20.
//  Copyright © 2017年 kuroyam. All rights reserved.
//

import Foundation

public class Alpha: Sweenable {
    
    public typealias TransformParameter = CGFloat
    
    public private(set) var view:     UIView
    public private(set) var duration: CFTimeInterval
    public private(set) var start:    TransformParameter
    public private(set) var end:      TransformParameter
    public private(set) var easing:   Easing.Curve
    
    public init(with view: UIView) {
        self.view     = view
        self.duration = 0.0
        self.start    = view.alpha
        self.end      = view.alpha
        self.easing   = Linear.Default
    }
    
    public func duration(_ duration: CFTimeInterval) -> Alpha {
        self.duration = duration
        return self
    }
    
    public func from(_ alpha: TransformParameter) -> Alpha {
        start = alpha
        return self
    }
    
    public func to(_ alpha: TransformParameter) -> Alpha {
        end = alpha
        return self
    }
    
    public func ease(_ easing: @escaping Easing.Curve) -> Alpha {
        self.easing = easing
        return self
    }
    
    public func update(with time: CFTimeInterval) {
        view.alpha = CGFloat(easing(time, Double(start), Double(end - start), duration))
    }
    
}
