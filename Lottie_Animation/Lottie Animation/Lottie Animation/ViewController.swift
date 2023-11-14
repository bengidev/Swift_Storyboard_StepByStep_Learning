//
//  ViewController.swift
//  Lottie Animation
//
//  Created by Bambang Tri Rahmat Doni on 14/11/23.
//

import Lottie
import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var animationViewContainer: UIView!
    
    private var animationView = LottieAnimationView()
    private var isAnimated = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLottieViewContainer()
        configureLottieAnimation()
        
    }
    
    private func configureLottieViewContainer() -> Void {
        animationViewContainer.layer.cornerRadius = 10
        animationViewContainer.layer.shadowRadius = 5
        animationViewContainer.layer.shadowOpacity = 0.5
    }
    
    private func configureLottieAnimation() -> Void {
        animationView = LottieAnimationView(name: "hi-animation", bundle: Bundle.main)
        animationView.frame = animationViewContainer.bounds
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .autoReverse
        
        animationViewContainer.addSubview(animationView)
    }
    
    @IBAction func animateButtonPressed(_ sender: UIButton) {
        isAnimated.toggle()
        
        if !isAnimated {
            DispatchQueue.main.async { [weak self] in
                sender.setTitle("Start Animate", for: .normal)
                self?.animationView.stop()
            }
        } else {
            DispatchQueue.main.async { [weak self] in
                sender.setTitle("Stop Animate", for: .normal)
                self?.animationView.play()
            }
        }
    }
}
