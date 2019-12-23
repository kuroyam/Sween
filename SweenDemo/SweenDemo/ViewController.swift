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
            .move(to: CGPoint(x: 325.0, y: 80.0))
            .duration(1.0)
            .loop(interval: 1.0)
            .animate()
        
        let inQuadView = UIView(frame: CGRect(x: 50.0, y: 100.0, width: 10.0, height: 10.0))
        inQuadView.backgroundColor = UIColor.blue
        view.addSubview(inQuadView)
        
        Sween(with: inQuadView)
            .move(to: CGPoint(x: 325.0, y: 100.0))
            .duration(1.0)
            .ease(Quad.In)
            .loop(interval: 1.0)
            .animate()
        
        let outQuadView = UIView(frame: CGRect(x: 50.0, y: 120.0, width: 10.0, height: 10.0))
        outQuadView.backgroundColor = UIColor.blue
        view.addSubview(outQuadView)
        
        Sween(with: outQuadView)
            .move(to: CGPoint(x: 325.0, y: 120.0))
            .duration(1.0)
            .ease(Quad.Out)
            .loop(interval: 1.0)
            .animate()
        
        let inOutQuadView = UIView(frame: CGRect(x: 50.0, y: 140.0, width: 10.0, height: 10.0))
        inOutQuadView.backgroundColor = UIColor.blue
        view.addSubview(inOutQuadView)
        
        Sween(with: inOutQuadView)
            .move(to: CGPoint(x: 325.0, y: 140.0))
            .duration(1.0)
            .ease(Quad.InOut)
            .loop(interval: 1.0)
            .animate()
        
        let inBackView = UIView(frame: CGRect(x: 50.0, y: 160.0, width: 10.0, height: 10.0))
        inBackView.backgroundColor = UIColor.blue
        view.addSubview(inBackView)
        
        Sween(with: inBackView)
            .move(to: CGPoint(x: 325.0, y: 160.0))
            .duration(1.0)
            .ease(Back.In)
            .loop(interval: 1.0)
            .animate()
        
        let outBackView = UIView(frame: CGRect(x: 50.0, y: 180.0, width: 10.0, height: 10.0))
        outBackView.backgroundColor = UIColor.blue
        view.addSubview(outBackView)
        
        Sween(with: outBackView)
            .move(to: CGPoint(x: 325.0, y: 180.0))
            .duration(1.0)
            .ease(Back.Out)
            .loop(interval: 1.0)
            .animate()
        
        let inOutBackView = UIView(frame: CGRect(x: 50.0, y: 200.0, width: 10.0, height: 10.0))
        inOutBackView.backgroundColor = UIColor.blue
        view.addSubview(inOutBackView)
        
        Sween(with: inOutBackView)
            .move(to: CGPoint(x: 325.0, y: 200.0))
            .duration(1.0)
            .ease(Back.InOut)
            .loop(interval: 1.0)
            .animate()
    }
    
}
