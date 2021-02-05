//
//  Pulsing.swift
//  ht5
//
//  Created by Yaroslav Hrytsun on 02.02.2021.
//

import UIKit

class Pulsing: CALayer {
    
    var initialPulseScale:  Float = 0
    var nextPulseAfter:     TimeInterval = 0
    var animationDuration:  TimeInterval = 1.5
    var radius:             CGFloat = 200
    
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    
    init (radius:CGFloat, position:CGPoint, offset: TimeInterval) {
        super.init()
        
        backgroundColor = UIColor.black.cgColor
        contentsScale = UIScreen.main.scale
        opacity = 0
        self.radius = radius
        self.position = position
        
        bounds = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)
        cornerRadius = radius
        backgroundColor = UIColor.red.cgColor
        let group = setupAnimationGroup(offset: offset)
        group.fillMode = .forwards
        group.isRemovedOnCompletion = false
        add(group, forKey: nil)
    }
    
    
    func createScaleAnimation (offset: TimeInterval) -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = NSNumber(value: initialPulseScale)
        scaleAnimation.toValue = NSNumber(value: 1)
        scaleAnimation.duration = animationDuration
        scaleAnimation.beginTime = offset
        
        return scaleAnimation
    }
    
    
    func createOpacityAnimation(offset: TimeInterval) -> CAKeyframeAnimation {
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = animationDuration
        opacityAnimation.values = [0.4, 0.8, 0]
        opacityAnimation.keyTimes = [0, 0.2, 1]
        opacityAnimation.beginTime = offset
        return opacityAnimation
    }
    
    
    func setupAnimationGroup(offset: TimeInterval) -> CAAnimationGroup {
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = animationDuration + nextPulseAfter + 1
        animationGroup.repeatCount = Float.infinity
        
        let defaultCurve = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animationGroup.timingFunction = defaultCurve
        animationGroup.fillMode = .forwards
        animationGroup.isRemovedOnCompletion = false
        animationGroup.animations = [createScaleAnimation(offset: offset), createOpacityAnimation(offset: offset)]
        
        return animationGroup
    }
}

