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
        
        let linearView = UIView(frame: CGRect(x: 50.0, y: 80.0, width: 10.0, height: 10.0))
        linearView.backgroundColor = UIColor.blue
        view.addSubview(linearView)
        
        Sween(with: linearView)
            .moveTo(CGPoint(x: 325.0, y: 80.0))
            .duration(1.0)
            .easing(Easing.Linear)
            .loop(interval: 1.0)
            .animate()
        
        let inQuadView = UIView(frame: CGRect(x: 50.0, y: 100.0, width: 10.0, height: 10.0))
        inQuadView.backgroundColor = UIColor.blue
        view.addSubview(inQuadView)
        
        Sween(with: inQuadView)
            .moveTo(CGPoint(x: 325.0, y: 100.0))
            .duration(1.0)
            .easing(Easing.InQuad)
            .loop(interval: 1.0)
            .animate()
        
        let outQuadView = UIView(frame: CGRect(x: 50.0, y: 120.0, width: 10.0, height: 10.0))
        outQuadView.backgroundColor = UIColor.blue
        view.addSubview(outQuadView)
        
        Sween(with: outQuadView)
            .moveTo(CGPoint(x: 325.0, y: 120.0))
            .duration(1.0)
            .easing(Easing.OutQuad)
            .loop(interval: 1.0)
            .animate()
        
        let inOutQuadView = UIView(frame: CGRect(x: 50.0, y: 140.0, width: 10.0, height: 10.0))
        inOutQuadView.backgroundColor = UIColor.blue
        view.addSubview(inOutQuadView)
        
        Sween(with: inOutQuadView)
            .moveTo(CGPoint(x: 325.0, y: 140.0))
            .duration(1.0)
            .easing(Easing.InOutQuad)
            .loop(interval: 1.0)
            .animate()
        
        let inBackView = UIView(frame: CGRect(x: 50.0, y: 160.0, width: 10.0, height: 10.0))
        inBackView.backgroundColor = UIColor.blue
        view.addSubview(inBackView)
        
        Sween(with: inBackView)
            .moveTo(CGPoint(x: 325.0, y: 160.0))
            .duration(1.0)
            .easing(Easing.InBack)
            .loop(interval: 1.0)
            .animate()
        
        let outBackView = UIView(frame: CGRect(x: 50.0, y: 180.0, width: 10.0, height: 10.0))
        outBackView.backgroundColor = UIColor.blue
        view.addSubview(outBackView)
        
        Sween(with: outBackView)
            .moveTo(CGPoint(x: 325.0, y: 180.0))
            .duration(1.0)
            .easing(Easing.OutBack)
            .loop(interval: 1.0)
            .animate()
        
        let inOutBackView = UIView(frame: CGRect(x: 50.0, y: 200.0, width: 10.0, height: 10.0))
        inOutBackView.backgroundColor = UIColor.blue
        view.addSubview(inOutBackView)
        
        Sween(with: inOutBackView)
            .moveTo(CGPoint(x: 325.0, y: 200.0))
            .duration(1.0)
            .easing(Easing.InOutBack)
            .loop(interval: 1.0)
            .animate()
    }
    
}
