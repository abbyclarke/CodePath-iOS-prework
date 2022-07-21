//
//  SettingsViewController.swift
//  Prework
//
//  Created by Abby Clarke on 7/20/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercent1: UITextField!
    @IBOutlet weak var tipPercent2: UITextField!
    @IBOutlet weak var tipPercent3: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var themeSegment: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // access user defaults
        let defaults = UserDefaults.standard
        
        defaults.set(15, forKey: "tip1")
        defaults.set(18, forKey: "tip2")
        defaults.set(20, forKey: "tip3")
        defaults.synchronize()
        
        updateTheme()
        
    }
    
    @IBAction func updateTips(_ sender: Any) {
        let defaults = UserDefaults.standard
        let tip1 = Double(tipPercent1.text!) ?? 15
        let tip2 = Double(tipPercent2.text!) ?? 18
        let tip3 = Double(tipPercent3.text!) ?? 20
        defaults.set(tip1, forKey: "tip1")
        defaults.set(tip2, forKey: "tip2")
        defaults.set(tip3, forKey: "tip3")
        defaults.synchronize()
    }
    
    func updateTheme() {
        let theme = defaults.string(forKey: "theme")
        if(theme == "light"){
            themeSegment.selectedSegmentIndex = 0
            view.backgroundColor = UIColor.white
        }
        else if(theme == "dark"){
            themeSegment.selectedSegmentIndex = 1
            view.backgroundColor = UIColor.gray
        }
        else if(theme == "green"){
            themeSegment.selectedSegmentIndex = 2
            view.backgroundColor = UIColor.systemGreen
        }
        else if(theme == "red"){
            themeSegment.selectedSegmentIndex = 3
            view.backgroundColor = UIColor.systemRed
        }
    }

    @IBAction func themeChanged(_ sender: Any) {
        switch themeSegment.selectedSegmentIndex{
        case 0:
            defaults.set("light", forKey: "theme")
        case 1:
            defaults.set("dark", forKey: "theme")
        case 2:
            defaults.set("green", forKey: "theme")
        case 3:
            defaults.set("red", forKey: "theme")
        default:
            defaults.set("light", forKey: "theme")
        }
        updateTheme()
        
    }


}
