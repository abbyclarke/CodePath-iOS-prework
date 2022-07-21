//
//  ViewController.swift
//  Prework
//
//  Created by Abby Clarke on 7/18/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sets the title in the Navigation bar
        self.title = "Tip Calculator"
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        // access userdefaults
        let defaults = UserDefaults.standard
        let tip1 = defaults.double(forKey: "tip1")
        let tip2 = defaults.double(forKey: "tip2")
        let tip3 = defaults.double(forKey: "tip3")
        tipControl.setTitle("\(tip1)%", forSegmentAt: 0)
        tipControl.setTitle("\(tip2)%", forSegmentAt: 1)
        tipControl.setTitle("\(tip3)%", forSegmentAt: 2)
        
        calculateTip((Any).self)
        updateTheme()
    }

    @IBAction func calculateTip(_ sender: Any) {
        //get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // access userdefaults
        let defaults = UserDefaults.standard
        let a = defaults.double(forKey: "tip1")
        let b = defaults.double(forKey: "tip2")
        let c = defaults.double(forKey: "tip3")
        
        //get total tip by multiplying tip * tipPercentage
        let tipPercentages = [a/100, b/100, c/100]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //update total amount
        totalLabel.text = String(format: "%.2f", total)
    }
    
    func updateTheme() {
        let defaults = UserDefaults.standard
        let theme = defaults.string(forKey: "theme")
        if(theme == "light"){
            view.backgroundColor = UIColor.white
        }
        else if(theme == "dark"){
            view.backgroundColor = UIColor.gray
        }
        else if(theme == "green"){
            view.backgroundColor = UIColor.systemGreen
        }
        else if(theme == "red"){
            view.backgroundColor = UIColor.systemRed
        }
    }

}

