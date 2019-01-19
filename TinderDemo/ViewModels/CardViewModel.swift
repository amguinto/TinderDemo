//
//  CardViewModel.swift
//  TinderDemo
//
//  Created by Andy Guinto on 1/14/19.
//  Copyright © 2019 Andy Guinto. All rights reserved.
//

import UIKit

protocol ProducesCardViewModel {
    func toCardViewModel() -> CardViewModel
}


struct CardViewModel {
    
    // Properties that the view will display/render out
    let imageName: String
    let attributedString: NSAttributedString
    let textAlignment: NSTextAlignment
}
