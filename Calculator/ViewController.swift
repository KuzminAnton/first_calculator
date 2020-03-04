//
//  ViewController.swift
//  Calculator
//
//  Created by Антон on 03.03.2020.
//  Copyright © 2020 Anton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var minusButton: SpecialButton!
    @IBOutlet weak var dropButton: SpecialButton!
    @IBOutlet weak var equalButton: SpecialButton!
    @IBOutlet weak var zeroButton: SpecialButton!
    @IBOutlet weak var plusButton: SpecialButton!
    @IBOutlet weak var threeButton: SpecialButton!
    @IBOutlet weak var twoButton: SpecialButton!
    @IBOutlet weak var oneButton: SpecialButton!
    @IBOutlet weak var divButton: SpecialButton!
    @IBOutlet weak var sixButton: SpecialButton!
    @IBOutlet weak var fiveButton: SpecialButton!
    @IBOutlet weak var fourButton: SpecialButton!
    @IBOutlet weak var multButton: SpecialButton!
    @IBOutlet weak var nineBUtton: SpecialButton!
    @IBOutlet weak var eightButton: SpecialButton!
    @IBOutlet weak var sevenButton: SpecialButton!
    @IBOutlet weak var result: ShowResult!
    
    let calc = Calculation()
    
     
    @IBAction func buttonClick(_ sender: SpecialButton!) {
          calc.calculateData(button: sender.value(forKey: "buttonValue") as! String)
      }
     
      override func viewDidLoad() {
          super.viewDidLoad()
          calc.delegate = self

          // Do any additional setup after loading the view.
      }
    
 

}

extension ViewController: ColculationDelegate{
    func showResult(_ res: String){
        result.text = res
    }
}

