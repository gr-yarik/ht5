//
//  ConfettiViewController.swift
//  ht5-main-task
//
//  Created by Yaroslav Hrytsun on 04.02.2021.
//

import UIKit

class ConfettiViewController: UIViewController {

    var layer: CALayer?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Confetti"
        super.viewDidLayoutSubviews()
        startButtonPressed(self)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let gradientLayer = GradientLayer(frameWidth: view.bounds.size.width, frameHeight: view.bounds.size.height, colors: [UIColor(red: 107/255, green: 201/255, blue: 1, alpha: 1).cgColor, UIColor(red: 185/255, green: 246/255, blue: 1, alpha: 1).cgColor], locations: [0])
        view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopButtonPressed(self)
    }
    

    @IBAction func startButtonPressed(_ sender: Any) {
        guard let image = UIImage(named: "confetti") else { return }
        let emmiterLayer = ConfettiEmitter.getEmitter(withImage: image)
        emmiterLayer.emitterPosition = CGPoint(x: view.frame.width / 2, y: -20)
        emmiterLayer.emitterSize = CGSize(width: view.frame.width, height: 1)
        if layer == nil { layer = CALayer() }
        guard let layer = layer else { return }
        layer.addSublayer(emmiterLayer)
        view.layer.addSublayer(layer)
    }
    
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        guard let layer = layer else { return }
        layer.removeFromSuperlayer()
        self.layer = nil
    }
}
