//
//  User.swift
//  TinderDemo
//
//  Created by Andy Guinto on 1/13/19.
//  Copyright © 2019 Andy Guinto. All rights reserved.
//

import UIKit

struct User: ProducesCardViewModel {
    // Define properties for each user
    let name: String
    let age: Int
    let profession: String
    let imageName: String

    func toCardViewModel() -> CardViewModel {
        
        // Modified Attributes
        let attributedText = NSMutableAttributedString(string: "\(name)", attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
        
        attributedText.append(NSAttributedString(string: " \(age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
        
        attributedText.append(NSAttributedString(string: "\n\(profession)", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
        
        return CardViewModel(imageNames: [imageName], attributedString: attributedText, textAlignment: .left)

    }
}
