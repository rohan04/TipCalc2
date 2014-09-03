//
//  SettingsViewController.swift
//  TipCalc2
//
//  Created by Baddam, Rohan(AWF) on 9/2/14.
//  Copyright (c) 2014 Baddam, Rohan(AWF). All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    @IBOutlet weak var sliderControl: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func onBackClick(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onSliderChanged(sender: AnyObject) {
        
        var sliderVal = sliderControl.value;
        tipPercentageLabel.text = "\(sliderVal)";
        
    }

    func returnSliderVal() ->String{
        return tipPercentageLabel.text;
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
