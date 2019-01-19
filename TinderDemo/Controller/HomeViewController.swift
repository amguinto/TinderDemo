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
    
//    let users = [
//        User(name: "Kelly", age: 23, profession: "Music DJ", imageName: "lady5c"),
//        User(name: "Jane", age: 26, profession: "Teacher", imageName: "lady4c")
//    ]
    
    let cardViewModels = [
        User(name: "Kelly", age: 23, profession: "Music DJ", imageName: "lady5c").toCardViewModel(),
        User(name: "Jane", age: 26, profession: "Teacher", imageName: "lady4c").toCardViewModel()

    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupLayout()
        setupDummyCards()
    }
    
    fileprivate func setupDummyCards() {
        
        cardViewModels.forEach { (cardVM) in
            let cardView = CardView(frame: .zero)
            cardView.imageView.image = UIImage(named: cardVM.imageName)
            cardView.informationLabel.attributedText = cardVM.attributedString
            cardView.informationLabel.textAlignment = cardVM.textAlignment
            
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

