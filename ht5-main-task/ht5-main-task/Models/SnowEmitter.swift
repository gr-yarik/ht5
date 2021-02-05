//
//  SnowEmitter.swift
//  ht5-main-task
//
//  Created by Yaroslav Hrytsun on 04.02.2021.
//

import UIKit

class SnowEmitter {
    
    static func getEmitter(withImage image: UIImage) -> CAEmitterLayer {
        let emitter = CAEmitterLayer()
        emitter.emitterShape = .line
        emitter.emitterCells = getCells(withImage: image)
        return emitter
    }
    
    
    private static func getCells(withImage image: UIImage) -> [CAEmitterCell] {
        var cells: [CAEmitterCell] = []
        
        let cell = CAEmitterCell()
        cell.contents = image.cgImage
        cell.birthRate = 10
        cell.lifetime = 20
        cell.velocity = 90
        cell.emissionLongitude = .pi
        cell.emissionRange = 40 * .pi/180
        cell.scale = 0.5
        cell.scaleRange = 1
        
        cells.append(cell)
        
        return cells
    }
}
