//
//  CardView.swift
//  TinderDemo
//
//  Created by Andy Guinto on 1/12/19.
//  Copyright © 2019 Andy Guinto. All rights reserved.
//

import UIKit

class CardView: UIStackView {
    
    var cardViewModel: CardViewModel! {
        didSet {
            imageView.image = UIImage(named: cardViewModel.imageName)
            informationLabel.attributedText = cardViewModel.attributedString
            informationLabel.textAlignment = cardViewModel.textAlignment
        }
    }
    
    fileprivate let imageView = UIImageView(image: #imageLiteral(resourceName: "lady5c"))
    fileprivate let informationLabel = UILabel()
    fileprivate let threshold: CGFloat = 100
    fileprivate let gradientLayer = CAGradientLayer()
    
    // Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
    }
    
    // When user stops touching the screen
    fileprivate func handleEnded(_ gesture: UIPanGestureRecognizer) {
        
        // Card will be flung along the x-axis
        let shouldDismissCard = gesture.translation(in: nil).x > threshold
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            // Fling card away
            if shouldDismissCard {
                
                self.frame = CGRect(x: 1000, y: 0, width: self.frame.width, height: self.frame.height)
            
            } else {
                self.transform = .identity
            }
        }) { (_) in
            
            // If rotated/moved but not flung away, the card will return back to the center
            self.transform = .identity
            
            // Bring card back
            // self.frame = CGRect(x: 0, y: 0, width: self.superview!.frame.width, height: self.superview!.frame.height)
            
            // Remove Card from view
            if shouldDismissCard {
                self.removeFromSuperview()
            }
            
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
        case .began:
            superview?.subviews.forEach({ (subview) in
                subview.layer.removeAllAnimations()
            })
        case .changed:
            handleChanged(gesture)
        case .ended:
            handleEnded(gesture)
        default:
            ()
        }
    }

    fileprivate func setupGradientLayer() {
        // Draw a gradient
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5,1.1]
        
        // self.frame = zero frame
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        layer.addSublayer(gradientLayer)
    }
    
    fileprivate func setupLayout() {
        
        // Keep card bounded
        layer.cornerRadius = 12
        clipsToBounds = true
        imageView.layer.masksToBounds = true
        
        // Scales picture on card
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        imageView.fillSuperview()
        
        // Add gradient layer
        setupGradientLayer()
        
        addSubview(informationLabel)
        
        // Anchor the information label and adds padding
        informationLabel.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        
        
        /// TODO: Refactor extensions
        informationLabel.textColor = UIColor.white
        
        // Allows multiple lines in label
        informationLabel.numberOfLines = 0
    }
    
    
    // Executed everytime the view draws itself
    override func layoutSubviews() {
        gradientLayer.frame = self.frame
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
