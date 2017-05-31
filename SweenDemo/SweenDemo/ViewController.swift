//
//  ViewController.swift
//  SweenDemo
//
//  Created by Shun Kuroda on 2017/05/30.
//  Copyright © 2017年 kuroyam. All rights reserved.
//

import Sween
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let subview = UIView(frame: CGRect(x: 100.0, y: 100.0, width: 10.0, height: 10.0))
        subview.backgroundColor = UIColor.blue
        view.addSubview(subview)
        
        Sween(with: subview)
            .moveTo(CGPoint(x: 100.0, y: 400.0))
            .duration(0.5)
            .easing(Easing.OutQuad)
            .animate()
    }
    
}
