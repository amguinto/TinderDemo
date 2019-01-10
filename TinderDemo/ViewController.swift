//
//  ViewController.swift
//  TinderDemo
//
//  Created by Andy Guinto on 1/8/19.
//  Copyright © 2019 Andy Guinto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Iterate through colors and takes return values and returns an array
        let subViews = [UIColor.gray, UIColor.darkGray, UIColor.black].map { (color) -> UIView in
            let v = UIView()
            v.backgroundColor = color
            
            return v
        }

        let topStackView = UIStackView(arrangedSubviews: subViews)
        topStackView.distribution = .fillEqually
        topStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let bottomStackView = UIStackView(arrangedSubviews: subViews)
        bottomStackView.distribution = .fillEqually
        bottomStackView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        
        let middleView = UIView()
        middleView.backgroundColor = .blue
        
        
        let overrallStackView = UIStackView(arrangedSubviews: [topStackView, middleView, bottomStackView])
        
        // Splits red and blue view evenly
        // stackView.distribution = .fillEqually

        // Splits vertically
        overrallStackView.axis = .vertical
        
        view.addSubview(overrallStackView)

        // Enables autolayout
        // Use extension file
        overrallStackView.translatesAutoresizingMaskIntoConstraints = false
        
        overrallStackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        overrallStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        overrallStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        overrallStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }


}

