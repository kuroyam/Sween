//
//  Sweenable.swift
//  Sween
//
//  Created by Shun Kuroda on 2017/06/19.
//  Copyright © 2017年 kuroyam. All rights reserved.
//

import Foundation

public protocol Sweenable {
    
    associatedtype TransformParameter
    
    var duration: CFTimeInterval { get }
    var easing: Easing.Curve { get }
    var start: TransformParameter { get }
    var end: TransformParameter { get }
    
    func update(with time: CFTimeInterval)
    
}
