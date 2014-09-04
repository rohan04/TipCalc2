//
//  SettingsViewController.swift
//  TipCalc2
//
//  Created by Baddam, Rohan(AWF) on 9/2/14.
//  Copyright (c) 2014 Baddam, Rohan(AWF). All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var settingsSegControl: UISegmentedControl!
    
    @IBOutlet weak var taxesLabel: UILabel!
    
    @IBOutlet weak var taxesSliderControl: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("taxSliderVal") != nil){
           var taxSliderValue = (NSUserDefaults.standardUserDefaults().floatForKey("taxSliderVal") as NSNumber).doubleValue
            taxesLabel.text = NSString(format:"%.2f", taxSliderValue)+"%"
            taxesSliderControl.value = NSUserDefaults.standardUserDefaults().floatForKey("taxSliderVal")
            
        }
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("settingSegIndex") != nil){
            var defaultTipIndex = (NSUserDefaults.standardUserDefaults().integerForKey("settingSegIndex") as NSNumber).integerValue
            settingsSegControl.selectedSegmentIndex = defaultTipIndex
            
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func onBackClick(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func onDefaultValChanged(sender: AnyObject) {
        
    }
    

    @IBAction func onSliderChanged(sender: AnyObject) {
        var val = NSString(format:"%.2f", taxesSliderControl.value)
        
        taxesLabel.text = "\(val)%";
        //NSUserDefaults.setValue(val, forKey: "taxSliderVal")
        NSUserDefaults.standardUserDefaults().setFloat(taxesSliderControl.value, forKey: "taxSliderVal")
        

    }
    
    @IBAction func onSegmentUIChanged(sender: AnyObject) {
        
        //NSUserDefaults.setValue(settingsSegControl.selectedSegmentIndex, forKey: "settingSegIndex")
        
        NSUserDefaults.standardUserDefaults().setInteger(settingsSegControl.selectedSegmentIndex, forKey: "settingSegIndex")
    }
    
    
    
  /*  func returnTaxesSliderPercent() ->Float{
        if(taxesSliderControl != nil){
            return taxesSliderControl.value;
        }else{
            return 0;
        }
    }
    
    func returnSegmentIndex() ->Int{
        if(settingsSegControl != nil){
            return settingsSegControl.selectedSegmentIndex;
        }else{
            return 0;
        }
        
    } */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
