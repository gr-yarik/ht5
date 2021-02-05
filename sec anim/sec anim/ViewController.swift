//
//  ViewController.swift
//  anim
//
//  Created by Yaroslav Hrytsun on 27.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let hudView = UIView(frame: .zero)
    let replicatorLayer = CAReplicatorLayer()
    let instanceLayer = CALayer()
    
    let fillingReplicatorLayer = CAReplicatorLayer()
    let fillingInstanceLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 75/255, green: 179/255, blue: 248/255, alpha: 1)
        configureHudView()
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureReplicatorLayer()
        configureInstanceLayer()
        
        configureFillingReplicatorLayer()
        configureFillingInstanceLayer()
        
        fillingAnimation()
    }
    
    
    func configureInstanceLayer() {
        let layerWidth = CGFloat(10)
        let midX = hudView.bounds.midX - layerWidth / 2.0
        instanceLayer.frame = CGRect (x: midX, y: 0.0, width: layerWidth, height: layerWidth * 10)
        
        instanceLayer.backgroundColor = UIColor.black.cgColor
        replicatorLayer.addSublayer(instanceLayer)
    }
    
    
    func configureReplicatorLayer() {
        replicatorLayer.frame = hudView.bounds
        replicatorLayer.instanceCount = 1000
        
        let angle = Float.pi * 2.0 / 100
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)
        
        instanceLayer.opacity = 1
        
        hudView.layer.addSublayer(replicatorLayer)
    }
    
    
    func configureHudView() {
        view.addSubview(hudView)
        
        hudView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hudView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hudView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hudView.heightAnchor.constraint(equalToConstant: 130),
            hudView.widthAnchor.constraint(equalToConstant: 130),
        ])
    }
    
    
    func configureFillingInstanceLayer() {
        fillingInstanceLayer.frame = CGRect(x: 0.0, y: 0.0, width: 1, height: 57)
        fillingInstanceLayer.backgroundColor = UIColor(red: 0/255, green: 108/255, blue: 241/255, alpha: 1).cgColor
        
        fillingInstanceLayer.position = hudView.center
        fillingInstanceLayer.anchorPoint = CGPoint(x: 0.0, y: 1)
    }
    
    
    func configureFillingReplicatorLayer() {
        fillingReplicatorLayer.frame = view.bounds
        fillingReplicatorLayer.position = view.center
        view.layer.addSublayer(fillingReplicatorLayer)
    }
    
    
    func fillingAnimation() {
        let count = 2000
        let delay = TimeInterval(0.005)
        fillingReplicatorLayer.instanceCount = count
        let angle = CGFloat(Float.pi * 2) / CGFloat(count)
        
        fillingReplicatorLayer.instanceTransform = CATransform3DMakeRotation(-angle, 0.0, 0.0, 1.0)
        
        fillingReplicatorLayer.instanceDelay = delay
        
        fillingInstanceLayer.opacity = 0
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1
        opacityAnimation.duration = 100
        opacityAnimation.repeatCount = 0
        opacityAnimation.isRemovedOnCompletion = true
        
        fillingInstanceLayer.add(opacityAnimation, forKey: nil)
        fillingReplicatorLayer.addSublayer(fillingInstanceLayer)
    }
}

