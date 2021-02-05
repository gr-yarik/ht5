//
//  AnimationPageViewController.swift
//  ht5-main-task
//
//  Created by Yaroslav Hrytsun on 04.02.2021.
//

import UIKit

class AnimationPageViewController: UIPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SnowVC") as? SnowViewController else { return }
        setViewControllers([vc], direction: .forward, animated: true, completion: nil)
    }
}

extension AnimationPageViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        switch viewController.title {
        case "Confetti":
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "SnowVC") as? SnowViewController else { return nil}
            return vc
        case "Fireworks":
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "ConfettiVC") as? ConfettiViewController else { return nil }
            return vc
        default:
            return nil
        }
    }

    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        switch viewController.title {
        case "Snow":
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "ConfettiVC") as? ConfettiViewController else { return nil }
            return vc
        case "Confetti":
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "FireworksVC") as? FireworksViewController else { return nil }
            return vc
        default:
            return nil
        }
    }
}
