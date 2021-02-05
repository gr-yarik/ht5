//
//  ViewController.swift
//  ht5
//
//  Created by Yaroslav Hrytsun on 02.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var pulse1, pulse2, pulse3: Pulsing?
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButonPressed(self)
        
    }
    
    
    @IBAction func startButonPressed(_ sender: Any) {
        pulse1 = Pulsing(radius: 110, position: self.view.center, offset: 0)
        pulse2 = Pulsing(radius: 110, position: self.view.center, offset: 0.5)
        pulse3 = Pulsing(radius: 110, position: self.view.center, offset: 1)
        
        guard let pulse1 = pulse1, let pulse2 = pulse2, let pulse3 = pulse3 else { return }
        
        self.view.layer.insertSublayer(pulse1, above: view.layer)
        self.view.layer.insertSublayer(pulse2, above: pulse1)
        self.view.layer.insertSublayer(pulse3, above: pulse2)
        startButton.isEnabled = false
    }
    
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        guard let p1 = pulse1, let p2 = pulse2, let p3 = pulse3 else { return }
        p1.removeFromSuperlayer()
        p2.removeFromSuperlayer()
        p3.removeFromSuperlayer()
        startButton.isEnabled = true
    }
}

