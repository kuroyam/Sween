//
//  Easing.swift
//  Sween
//
//  Created by Shun Kuroda on 2017/05/30.
//  Copyright © 2017年 kuroyam. All rights reserved.
//

import Foundation

public protocol Easing {
    typealias Curve = (_ time: Double, _ begin: Double, _ diff: Double, _ duration: Double) -> Double
    
    static var In:    Curve { get }
    static var Out:   Curve { get }
    static var InOut: Curve { get }
}

public struct Linear: Easing {
    
    public static var Default: Curve = { time, begin, diff, duration in
        return diff * time / duration + begin
    }
    
    public static var In:    Curve = Default
    public static var Out:   Curve = Default
    public static var InOut: Curve = Default
    
}

public struct Quad: Easing {
    
    public static var In: Curve = { time, begin, diff, duration in
        let t = time / duration
        return diff * t * t + begin
    }
    
    public static var Out: Curve = { time, begin, diff, duration in
        let t = time / duration
        return -diff * t * (t - 2) + begin
    }
    
    public static var InOut: Curve = { time, begin, diff, duration in
        var t = time / (duration / 2)
        if t < 1 {
            return diff / 2 * t * t + begin
        } else {
            t -= 1
            return -diff / 2 * (t * (t - 2) - 1) + begin
        }
    }
    
}

public struct Back: Easing {
    
    public static var In: Curve = { time, begin, diff, duration in
        let s = 1.70158
        let t = time / duration
        return diff * t * t * ((s + 1) * t - s) + begin
    }
    
    public static var Out: Curve = { time, begin, diff, duration in
        let s = 1.70158
        let t = time / duration - 1
        return diff * (t * t * ((s + 1) * t + s) + 1) + begin
    }
    
    public static var InOut: Curve = { time, begin, diff, duration in
        let s = 1.70158 * 1.525
        var t = time / (duration / 2)
        if t < 1 {
            return diff / 2 * (t * t * ((s + 1) * t - s)) + begin
        } else {
            t -= 2
            return diff / 2 * (t * t * ((s + 1) * t + s) + 2) + begin
        }
    }
    
}
