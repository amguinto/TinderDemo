//
//  ViewController.swift
//  TinderDemo
//
//  Created by Andy Guinto on 1/8/19.
//  Copyright © 2019 Andy Guinto. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // Call overrided constructor
    let bottomStackView = HomeBottomControlStackView()
    let card = UIView()
    let topStackView = HomeTopNavigationStackView()
    
    let users = [
        User(name: "Kelly", age: 23, profession: "Music DJ", imageName: "lady5c"),
        User(name: "Jane", age: 26, profession: "Teacher", imageName: "lady4c")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupLayout()
        setupDummyCards()
    }
    
    fileprivate func setupDummyCards() {
        
        users.forEach { (user) in
            
            // cardView will fill the card section
            let cardView = CardView(frame: .zero)
            cardView.imageView.image = UIImage(named: user.imageName)
            cardView.informationLabel.text = "\(user.name) \(user.age)\n \(user.profession)"
            
            // Modified Attributes
            let attributedText = NSMutableAttributedString(string: user.name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
            
            attributedText.append(NSMutableAttributedString(string: " \(user.age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
            
            attributedText.append(NSMutableAttributedString(string: "\n\(user.profession)", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
            cardView.informationLabel.attributedText = attributedText
            
            card.addSubview(cardView)
            cardView.fillSuperview()
        }
    }

    // MARK:- Fileprivate
    fileprivate func setupLayout() {
        
        let overrallStackView = UIStackView(arrangedSubviews: [topStackView, card, bottomStackView])
        
        // Splits vertically
        overrallStackView.axis = .vertical
        
        view.addSubview(overrallStackView)
        overrallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        
        // Add space to edges of card
        overrallStackView.isLayoutMarginsRelativeArrangement = true
        overrallStackView.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        
        overrallStackView.bringSubviewToFront(card)
    }
}

