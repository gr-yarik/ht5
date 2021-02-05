//
//  GradientLayer.swift
//  ht5-main-task
//
//  Created by Yaroslav Hrytsun on 04.02.2021.
//

import UIKit

class GradientLayer: CAGradientLayer {

    init(frameWidth width: CGFloat, frameHeight height: CGFloat, colors: [CGColor], locations: [NSNumber]) {
        super.init()
        startPoint = CGPoint(x: 0, y: 0)
        endPoint = CGPoint(x: 0, y: 1)
        self.colors = colors
        self.locations = locations
        frame = CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
