//
//  ViewController.swift
//  Calculator
//
//  Created by Антон on 03.03.2020.
//  Copyright © 2020 Anton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var result: UITextField!
    
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

