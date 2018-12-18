//
//  ViewController.swift
//  Diapo
//
//  Created by Admin on 17/12/2018.
//  Copyright © 2018 Cecile M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ui_imageView: UIImageView!
    @IBOutlet weak var ui_navStack: UIStackView!
    var photoIndex: Int = 1
    var slideshowTimer: Timer?
    var navTimer: Timer?
    var slideshowTimeInterval: TimeInterval = 3
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Init
        //print("Init image")
        ui_imageView.image = UIImage(named: "photo\(photoIndex)")
        ui_navStack.isHidden = true
        
        // Load UserDefaults
        loadUserDefaults()
        
        
        // Launch diaporama
        launchSlideshow()
        
    }
    
    @IBAction func stopButtonTouched() {
        slideshowTimer?.invalidate()
    }
        
    @IBAction func prevButtonTouched() {
        slideshowTimer?.invalidate()
        showNavStack()
        
        if photoIndex > 1 {
            photoIndex -= 1
        } else {
            photoIndex = 3
        }
        let photoName = "photo\(photoIndex)"
        //print("Display photo = " + photoName)
        ui_imageView.image = UIImage(named: photoName)
        
    }
    
    @IBAction func nextButtonTouched() {
        slideshowTimer?.invalidate()
        showNavStack()
        
        if photoIndex < 3 {
            photoIndex += 1
        } else {
            photoIndex = 1
        }
        let photoName = "photo\(photoIndex)"
        //print("Display photo = " + photoName)
        ui_imageView.image = UIImage(named: photoName)
    }
    
    
    func loadUserDefaults() {
        if let ud_timeIntervalValue = UserDefaults.standard.string(forKey: "ud_timeIntervalKey") {
            //slideshowTimeInterval = (ud_timeIntervalValue as NSString).doubleValue
            slideshowTimeInterval = TimeInterval(ud_timeIntervalValue) ?? 0
        }
    }
    
    func launchSlideshow() {
        
        //print("Begin diaporama")
        
        slideshowTimer = Timer.scheduledTimer(withTimeInterval: slideshowTimeInterval, repeats: true) { (_) in
            
            self.photoIndex += 1
            
            let photoName = "photo\(self.photoIndex)"
            //print("Display photo = " + photoName)
            self.ui_imageView.image = UIImage(named: photoName)
            if (self.photoIndex == 3) {
                self.photoIndex = 0
            }
        }
        
        //print("End diaporama")
    }
    
    func showNavStack() {
        // Reset Timer
        navTimer?.invalidate()
        
        // Show nav during few seconds
        self.ui_navStack.isHidden = false
        navTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
            self.ui_navStack.isHidden = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        
        print(ui_navStack.isHidden)
        
        if ui_navStack.isHidden {
            showNavStack()
        } else {
            ui_navStack.isHidden = true
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
    }
}
