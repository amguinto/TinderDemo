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
    
    // Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        // TODO: Label
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
    }
    
    // When user stops touching the screen
    fileprivate func handleEnded(_ gesture: UIPanGestureRecognizer) {
        
        // Card will be flung along the x-axis
        let threshold: CGFloat = 100
        let shouldDismissCard = gesture.translation(in: nil).x > threshold
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            // Fling card away
            if shouldDismissCard {
                
                self.frame = CGRect(x: 1000, y: 0, width: self.frame.width, height: self.frame.height)
            
            } else {
                self.transform = .identity
            }
        }) { (_) in
            
            // Bring card back
            self.transform = .identity
            self.frame = CGRect(x: 0, y: 0, width: self.superview!.frame.width, height: self.superview!.frame.height)
        }
    }
    
    // When user is holding the screen the screen
    fileprivate func handleChanged(_ gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: nil)
        
        // Rotation along x-axis
        let degrees: CGFloat = translation.x / 20
        let radians = degrees * .pi / 180
        
        let rotationalTransformation = CGAffineTransform(rotationAngle: radians)
        
        // Set current card transformation to rotate and translate
        self.transform = rotationalTransformation.translatedBy(x: translation.x, y: translation.y)

    }
    
    // Cases when the user interacts when touching the screen
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
        
        // Drag card
        switch gesture.state {
        case .changed:
            handleChanged(gesture)
        case .ended:
            handleEnded(gesture)
        default:
            ()
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
