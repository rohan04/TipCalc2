//
//  ViewController.swift
//  TipCalc2
//
//  Created by Baddam, Rohan(AWF) on 8/26/14.
//  Copyright (c) 2014 Baddam, Rohan(AWF). All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
                            
   
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!

    @IBOutlet weak var stepperControl: UIStepper!
    
    @IBOutlet weak var shareLabel: UILabel!
    
    @IBOutlet weak var noOfPeople: UILabel!
    
    @IBOutlet weak var peopleDiv: UIView!
    
    var total=0.00;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "0.00";
        totalLabel.text = "0.00";
        shareLabel.text = "0.00";
        peopleDiv.hidden = true;
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var settingController = SettingsViewController()
        
        var sliderValue = (settingController.returnSliderVal() as NSString).doubleValue
        
        var tipPercentages = [sliderValue/4, sliderValue/2.5, sliderValue/1.5];
        
        var tipPercent = tipPercentages[tipControl.selectedSegmentIndex];
        
        var billAmount =  (billField.text as NSString).doubleValue;
        
        var tip = billAmount*tipPercent;
        
        total  = billAmount+tip;
        
        if(total > 0){
            
            peopleDiv.hidden = false;
            
            var stepperVal = stepperControl.value;
            var individualShare = total/stepperVal;
            noOfPeople.text = "\(stepperVal)";
            shareLabel.text = "\(currencyStringFromNumber(individualShare))";
        }else{
            peopleDiv.hidden = true;
        }
        
        
        tipLabel.text = "\(currencyStringFromNumber(tip))"
        totalLabel.text = "\(currencyStringFromNumber(total))"
        
    
    }
    
    // Reference stackOverflow
    func currencyStringFromNumber(number: Double) -> String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.currencyCode = NSLocale.currentLocale().displayNameForKey(NSLocaleCurrencySymbol, value: NSLocaleCurrencyCode)
        return formatter.stringFromNumber(number)
    }
}

