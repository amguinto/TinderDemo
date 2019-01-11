//
//  HomeBottomControlStackView.swift
//  TinderDemo
//
//  Created by Andy Guinto on 1/10/19.
//  Copyright © 2019 Andy Guinto. All rights reserved.
//

import UIKit

class HomeBottomControlStackView: UIStackView {

    // Required to override constructor of UIStackView
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 100).isActive = true

        let bottomSubView = [#imageLiteral(resourceName: "refresh_circle"), #imageLiteral(resourceName: "dismiss_circle"), #imageLiteral(resourceName: "super_like_circle"), #imageLiteral(resourceName: "like_circle"), #imageLiteral(resourceName: "boost_circle")].map { (imgLiteral) -> UIView in
            let button = UIButton(type: .system)
            
            button.setImage(imgLiteral.withRenderingMode(.alwaysOriginal), for: .normal)
            
            return button
        }
        
        bottomSubView.forEach { (v) in
            addArrangedSubview(v)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
