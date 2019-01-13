//
//  CardView.swift
//  TinderDemo
//
//  Created by Andy Guinto on 1/12/19.
//  Copyright © 2019 Andy Guinto. All rights reserved.
//

import UIKit

class CardView: UIStackView {
    
    fileprivate let imageView = UIImageView(image: #imageLiteral(resourceName: "lady5c"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
    }
    
    fileprivate func handleEnded() {
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.transform = .identity
        }) { (_) in
            
        }
    }
    
    fileprivate func handleChanged(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: nil)
        self.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
    }
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
        // Drag card
        switch gesture.state {
        case .changed:
            handleChanged(gesture)
        case .ended:
            handleEnded()
        default:
            ()
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
