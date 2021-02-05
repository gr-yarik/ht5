//
//  FireworksViewController.swift
//  ht5-main-task
//
//  Created by Yaroslav Hrytsun on 04.02.2021.
//

import UIKit

class FireworksViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var layer: CALayer?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Firewroks"
        super.viewDidLayoutSubviews()
        startButtonPressed(self)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let imageTop: NSNumber = NSNumber(value: 1 - Float((imageView.bounds.height + 50) / view.bounds.height))
        let gradientLayer = GradientLayer(frameWidth: view.bounds.size.width, frameHeight: view.bounds.size.height, colors: [UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor, UIColor(red: 12/255, green: 3/255, blue: 170/255, alpha: 1).cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor], locations: [0.2, imageTop, 0.9])
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopButtonPressed(self)
    }
    
    
    @IBAction func startButtonPressed(_ sender: Any) {
        let emmiterLayer = FireworksEmitter.getEmitter()
        emmiterLayer.emitterPosition = CGPoint(x: view.frame.width / 2, y: view.frame.height)
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
