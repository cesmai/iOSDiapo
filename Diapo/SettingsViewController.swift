//
//  SettingsViewController.swift
//  Diapo
//
//  Created by Admin on 18/12/2018.
//  Copyright © 2018 Cecile M. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var ui_timeInterval: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load UserDefaults
        if let ud_timeIntervalValue = UserDefaults.standard.string(forKey: "ud_timeIntervalKey") {
            ui_timeInterval.text = ud_timeIntervalValue
        }
    }
    
    @IBAction func moreSettingsButtonTouched() {
        
        if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func saveButtonTouched() {
        
        // Save in UserDefaults
        UserDefaults.standard.set(ui_timeInterval.text, forKey: "ud_timeIntervalKey")
        
        // Back to previous view
        dismiss(animated: true, completion: nil)
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
