//
//  SpecialButton.swift
//  Calculator
//
//  Created by Антон on 04.03.2020.
//  Copyright © 2020 Anton. All rights reserved.
//

import UIKit

@IBDesignable class SpecialButton: UIButton {

    
    @IBInspectable var buttonValue: String = ""
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 15
    }
   
}
