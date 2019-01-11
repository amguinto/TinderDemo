//
//  ViewController.swift
//  TinderDemo
//
//  Created by Andy Guinto on 1/8/19.
//  Copyright © 2019 Andy Guinto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Call overrided constructor
    let bottomStackView = HomeBottomControlStackView()
    let middleView = UIView()
    let topStackView = HomeTopNavigationStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupLayout()
        middleView.backgroundColor = .blue
        
    }

    // MARK:- Fileprivate
    fileprivate func setupLayout() {
        
        let overrallStackView = UIStackView(arrangedSubviews: [topStackView, middleView, bottomStackView])
        
        // Splits vertically
        overrallStackView.axis = .vertical
        
        view.addSubview(overrallStackView)
        overrallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
    }
}

