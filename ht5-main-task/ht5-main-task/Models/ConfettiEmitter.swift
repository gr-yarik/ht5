//
//  ConfettiEmitter.swift
//  ht5-main-task
//
//  Created by Yaroslav Hrytsun on 05.02.2021.
//

import UIKit

class ConfettiEmitter {
    
    static func getEmitter(withImage image: UIImage) -> CAEmitterLayer {
        let emitter = CAEmitterLayer()
        emitter.emitterShape = .line
        emitter.emitterCells = getCells(withImage: image)
        return emitter
    }
    
    
    private static func getCells(withImage image: UIImage) -> [CAEmitterCell] {
        var cells: [CAEmitterCell] = []
        let colors: [UIColor] = [.red, .green, .blue]
        
        for i in 0...2 {
            let cell = CAEmitterCell()
            cell.contents = image.cgImage
            cell.birthRate = 10
            cell.lifetime = 20
            cell.velocity = 120
            cell.velocityRange = 50
            cell.emissionLongitude = .pi
            cell.emissionRange = 40 * .pi/180
            cell.scale = 0.5
            cell.scaleRange = 1
            cell.spinRange = 1
            cell.color = colors[i].cgColor
            cells.append(cell)
        }
        return cells
    }
}
