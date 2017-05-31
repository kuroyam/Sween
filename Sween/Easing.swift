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
        return -diff * t * (t - 2) + begin
    }
    
    public static var InOutQuad: Curve = { time, begin, diff, duration in
        var t = time / (duration / 2)
        if t < 1 {
            return diff / 2 * t * t + begin
        } else {
            t -= 1
            return -diff / 2 * (t * (t - 2) - 1) + begin
        }
    }
    
    public static var InBack: Curve = { time, begin, diff, duration in
        let s: CGFloat = 1.70158
        let t = time / duration
        return diff * t * t * ((s + 1) * t - s) + begin
    }
    
    public static var OutBack: Curve = { time, begin, diff, duration in
        let s: CGFloat = 1.70158
        let t = time / duration - 1
        return diff * (t * t * ((s + 1) * t + s) + 1) + begin
    }
    
    public static var InOutBack: Curve = { time, begin, diff, duration in
        var s: CGFloat = 1.70158
        var t = time / (duration / 2)
        if t < 1 {
            s *= 1.525
            return diff / 2 * (t * t * ((s + 1) * t - s)) + begin
        } else {
            s += (1.525 * 1.525)
            t -= 2
            return diff / 2 * (t * t * ((s + 1) * t + s) + 2) + begin
        }
    }
    
}
