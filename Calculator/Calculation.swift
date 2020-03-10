//
//  Calculation.swift
//  Calculator
//
//  Created by Антон on 04.03.2020.
//  Copyright © 2020 Anton. All rights reserved.
//

import Foundation
import UIKit

protocol ColculationDelegate: class {
    func showResult(_ res: String)
}
class Calculation: ObservableObject {
    weak var delegate: ColculationDelegate?
   // @Published var button: UIButton!
//    init(button: UIButton) {
//        self.button = button
//    }
    
    var firstArgument = ""
    var secondArgument = ""
    var action = ""
    var value = ""
    // Если несколько "."
    //в переменной то нельзя больше одной
    func calculateData(button: String) {
        value = button
        
        if ("C".contains(value)){
                  secondArgument = ""
                  firstArgument = ""
                  action = ""
                  delegate?.showResult(firstArgument)

                  
              }
        if ("%".contains(value)) {
            firstArgument = String(Double(firstArgument)! * Double("0.01")!)
            delegate?.showResult(firstArgument)

        }
        if ("s".contains(value)){
            if(firstArgument.contains("+")){
            firstArgument = String(firstArgument.dropFirst())
            firstArgument = "-" + firstArgument
            value = ""
            }
            else if(firstArgument.contains("-")){
            firstArgument = String(firstArgument.dropFirst())
            firstArgument="+" + firstArgument
            value = ""
            }
            else {
                firstArgument="-" + firstArgument
                value = ""
            }
            
            delegate?.showResult(firstArgument)
            
        }
        if ("=".contains(value)){
            print("act =\(action) a1 =\(firstArgument)  a2 =\(secondArgument) v =\(value)" )
            if (secondArgument != "") && (firstArgument == ""){
                
                switch action {
                case "+":
                    secondArgument = String((Double(secondArgument)! + Double(secondArgument)!))
                case "-":
                    secondArgument = String((Double(secondArgument)! - Double(secondArgument)!))
                case "*":
                    secondArgument = String((Double(secondArgument)! * Double(secondArgument)!))
                case "/":
                    secondArgument = String((Double(secondArgument)! / Double(secondArgument)!))
                
                default:
                    firstArgument = ""
                }
                print("act =\(action) a1 =\(firstArgument)  a2 =\(secondArgument) v =\(value)" )
                firstArgument = secondArgument
                secondArgument = ""
                action = ""
                value = ""
            }

            
            
            if (secondArgument != "") && (firstArgument != ""){
                
                switch action {
                case "+":
                    secondArgument = String((Double(firstArgument)! + Double(secondArgument)!))
                case "-":
                    secondArgument = String((Double(secondArgument)! - Double(firstArgument)!))
                case "*":
                    secondArgument = String((Double(firstArgument)! * Double(secondArgument)!))
                case "/":
                    secondArgument = String((Double(secondArgument)! / Double(firstArgument)!))
                
                default:
                    firstArgument = ""
                }
                
                print("act =\(action) a1 =\(firstArgument)  a2 =\(secondArgument) v =\(value)" )
                firstArgument = secondArgument
                secondArgument = ""
                action = ""
                value = ""
            }
            delegate?.showResult(firstArgument)

        }
        if (firstArgument != "") && (secondArgument != "") && ("+-/*".contains(value)) {
            
            switch action {
            case "+":
                secondArgument = String((Double(firstArgument)! + Double(secondArgument)!))
            case "-":
                secondArgument = String((Double(secondArgument)! - Double(firstArgument)!))
            case "*":
                secondArgument = String((Double(firstArgument)! * Double(secondArgument)!))
            case "/":
                secondArgument = String((Double(secondArgument)! / Double(firstArgument)!))
            
            default:
                firstArgument = ""
            }
            firstArgument = ""
            action = value
            value = ""
            //print("act =\(action) a1 =\(firstArgument)  a2 =\(secondArgument) v =\(value)" )
            delegate?.showResult(secondArgument)

            
        }
        
        if ("0123456789.".contains(value)){
            if(firstArgument.contains(".")&&(value == "."))
            {
                value = ""
                print("небывать этому")
            }
            firstArgument = firstArgument + value
            value = ""
            
            print("a1 =\(firstArgument) v =\(value)" )
            delegate?.showResult(firstArgument)
            
        }
        
        if ("+-/*".contains(value)){
            action = value
            value = ""
            if (firstArgument != "") {
                secondArgument = firstArgument
                firstArgument = ""
            }
            //print("act =\(action) a1 =\(firstArgument)  a2 =\(secondArgument) v =\(value)" )

        }
    }
    
}

