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
        
        let grayView = UIView()
        grayView.backgroundColor = .gray
        
        // Iterate through colors and takes return values and returns an array
        let subViews = [UIColor.gray, UIColor.darkGray, UIColor.black].map { (color) -> UIView in
            let v = UIView()
            v.backgroundColor = color
            
            return v
        }
        
        // Turns the top color into a subview of the current subview using the subViews colors array
        let topStackView = UIStackView(arrangedSubviews: subViews)
        topStackView.distribution = .fillEqually

        topStackView.backgroundColor = .red
        topStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        
        // TODO: Implement bottomStackView
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        yellowView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [topStackView, blueView, yellowView])
        
        // Splits red and blue view evenly
        // stackView.distribution = .fillEqually

        // Splits vertically
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        stackView.frame = .init(x: 0, y: 0, width: 300, height: 200)
        
        // Enables autolayout
        // Use extension file
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }


}

