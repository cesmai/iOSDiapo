//
//  ViewController.swift
//  Diapo
//
//  Created by Admin on 17/12/2018.
//  Copyright © 2018 Cecile M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var photoIndex: Int = 1
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Init
        print("Init image")
        imageView.image = UIImage(named: "photo\(photoIndex)")
        
        // Launch diaporama
        print("Begin diaporama")
        
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (_) in
            
            self.photoIndex += 1
            
            var photoName = "photo\(self.photoIndex)"
            print("Display photo = " + photoName)
            self.imageView.image = UIImage(named: photoName)
            if (self.photoIndex == 3) {
                self.photoIndex = 0
            }
        }
        
        print("End diaporama")
    }
    
    @IBAction func stopButtonTouched() {
        timer?.invalidate()
    }
        
    @IBAction func prevButtonTouched() {
        timer?.invalidate()
        
        if photoIndex > 1 {
            photoIndex -= 1
        } else {
            photoIndex = 3
        }
        var photoName = "photo\(photoIndex)"
        print("Display photo = " + photoName)
        imageView.image = UIImage(named: photoName)
        
    }
    
    @IBAction func nextButtonTouched() {
        timer?.invalidate()
        
        if photoIndex < 3 {
            photoIndex += 1
        } else {
            photoIndex = 1
        }
        var photoName = "photo\(photoIndex)"
        print("Display photo = " + photoName)
        imageView.image = UIImage(named: photoName)
    }
}
