//
//  HomeTopNavigationStackView.swift
//  TinderDemo
//
//  Created by Andy Guinto on 1/10/19.
//  Copyright © 2019 Andy Guinto. All rights reserved.
//

import UIKit

class HomeTopNavigationStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        let topSubView = [#imageLiteral(resourceName: "top_left_profile"), #imageLiteral(resourceName: "app_icon"), #imageLiteral(resourceName: "top_right_messages")].map { (imgLiteral) -> UIView in
            let button = UIButton(type: .system)
            
            button.setImage(imgLiteral.withRenderingMode(.alwaysOriginal), for: .normal)
            
            return button
        }
        
        topSubView.forEach { (v) in
            addArrangedSubview(v)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
