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
        
        // Linear
        let linearView = UIView(frame: CGRect(x: 50.0, y: 80.0, width: 10.0, height: 10.0))
        linearView.backgroundColor = UIColor.blue
        view.addSubview(linearView)
        
        let linearTransform = Transform(with: linearView)
            .duration(1.0)
            .to(CGPoint(x: 325.0, y: 80.0))
            .ease(Linear.Default)
        
        Sween(with: linearTransform).loop(interval: 1.0).animate()
        
        // InQuad
        let inQuadView = UIView(frame: CGRect(x: 50.0, y: 100.0, width: 10.0, height: 10.0))
        inQuadView.backgroundColor = UIColor.blue
        view.addSubview(inQuadView)
        
        let inQuadTransform = Transform(with: inQuadView)
            .duration(1.0)
            .to(CGPoint(x: 325.0, y: 100.0))
            .ease(Quad.In)
        
        Sween(with: inQuadTransform).loop(interval: 1.0).animate()
        
        // OutQuad
        let outQuadView = UIView(frame: CGRect(x: 50.0, y: 120.0, width: 10.0, height: 10.0))
        outQuadView.backgroundColor = UIColor.blue
        view.addSubview(outQuadView)
        
        let outQuadTransform = Transform(with: outQuadView)
            .duration(1.0)
            .to(CGPoint(x: 325.0, y: 120.0))
            .ease(Quad.Out)
        
        Sween(with: outQuadTransform).loop(interval: 1.0).animate()
        
        // InOutQuad
        let inOutQuadView = UIView(frame: CGRect(x: 50.0, y: 140.0, width: 10.0, height: 10.0))
        inOutQuadView.backgroundColor = UIColor.blue
        view.addSubview(inOutQuadView)
        
        let inOutQuadTransform = Transform(with: inOutQuadView)
            .duration(1.0)
            .to(CGPoint(x: 325.0, y: 140.0))
            .ease(Quad.InOut)
        
        Sween(with: inOutQuadTransform).loop(interval: 1.0).animate()
        
        // InBack
        let inBackView = UIView(frame: CGRect(x: 50.0, y: 160.0, width: 10.0, height: 10.0))
        inBackView.backgroundColor = UIColor.blue
        view.addSubview(inBackView)
        
        let inBackTransform = Transform(with: inBackView)
            .duration(1.0)
            .to(CGPoint(x: 325.0, y: 160.0))
            .ease(Back.In)
        
        Sween(with: inBackTransform).loop(interval: 1.0).animate()
        
        // OutBack
        let outBackView = UIView(frame: CGRect(x: 50.0, y: 180.0, width: 10.0, height: 10.0))
        outBackView.backgroundColor = UIColor.blue
        view.addSubview(outBackView)
        
        let outBackTransform = Transform(with: outBackView)
            .duration(1.0)
            .to(CGPoint(x: 325.0, y: 180.0))
            .ease(Back.Out)
        
        Sween(with: outBackTransform).loop(interval: 1.0).animate()
        
        // InOutBack
        let inOutBackView = UIView(frame: CGRect(x: 50.0, y: 200.0, width: 10.0, height: 10.0))
        inOutBackView.backgroundColor = UIColor.blue
        view.addSubview(inOutBackView)
        
        let inOutBackTransform = Transform(with: inOutBackView)
            .duration(1.0)
            .to(CGPoint(x: 325.0, y: 200.0))
            .ease(Back.InOut)
        
        Sween(with: inOutBackTransform).loop(interval: 1.0).animate()
    }
    
}
