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
    var timer: Timer?
    var navTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Init
        //print("Init image")
        ui_imageView.image = UIImage(named: "photo\(photoIndex)")
        ui_navStack.isHidden = true
        
        // Launch diaporama
        //print("Begin diaporama")
        
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (_) in
            
            self.photoIndex += 1
            
            var photoName = "photo\(self.photoIndex)"
            //print("Display photo = " + photoName)
            self.ui_imageView.image = UIImage(named: photoName)
            if (self.photoIndex == 3) {
                self.photoIndex = 0
            }
        }
        
        //print("End diaporama")
    }
    
    @IBAction func stopButtonTouched() {
        timer?.invalidate()
    }
        
    @IBAction func prevButtonTouched() {
        timer?.invalidate()
        showNavStack()
        
        if photoIndex > 1 {
            photoIndex -= 1
        } else {
            photoIndex = 3
        }
        var photoName = "photo\(photoIndex)"
        //print("Display photo = " + photoName)
        ui_imageView.image = UIImage(named: photoName)
        
    }
    
    @IBAction func nextButtonTouched() {
        timer?.invalidate()
        showNavStack()
        
        if photoIndex < 3 {
            photoIndex += 1
        } else {
            photoIndex = 1
        }
        var photoName = "photo\(photoIndex)"
        //print("Display photo = " + photoName)
        ui_imageView.image = UIImage(named: photoName)
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
