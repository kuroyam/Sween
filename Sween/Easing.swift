//
//  Easing.swift
//  Sween
//
//  Created by Shun Kuroda on 2017/05/30.
//  Copyright © 2017年 kuroyam. All rights reserved.
//

import Foundation

public struct Easing {
    
    public typealias Curve = (_ time: CGFloat, _ begin: CGFloat, _ diff: CGFloat, _ duration: CGFloat) -> CGFloat
    
    public static var Linear: Curve = { time, begin, diff, duration in
        return diff * time / duration + begin
    }
    
    public static var InQuad: Curve = { time, begin, diff, duration in
        let t = time / duration
        return diff * t * t + begin
    }
    
    public static var OutQuad: Curve = { time, begin, diff, duration in
        let t = time / duration
        return begin + -diff * t * (t - 2.0)
    }
    
    public static var InOutQuad: Curve = { time, begin, diff, duration in
        let t = time / duration / 2.0
        if t < 1 {
            return begin + diff / 2.0 * t * t
        } else {
            return begin + -diff / 2.0 * ((t - 1) * (t - 3) - 1)
        }
    }
    
}
