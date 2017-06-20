//
//  Loop.swift
//  Sween
//
//  Created by Shun Kuroda on 2017/06/20.
//  Copyright © 2017年 kuroyam. All rights reserved.
//

import Foundation

public class Loop {
    
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
