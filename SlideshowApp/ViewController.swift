//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Keiichi Funatsuki on 2018/04/26.
//  Copyright © 2018年 keiichi.funatsuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image1 = UIImage(named: "image1")
    var image2 = UIImage(named: "image2")
    var image3 = UIImage(named: "image3")
    
  
    
    var flg = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.image = UIImage(named: "image1.jpg")
        
        
    }
    @IBAction func goFoward(_ sender: Any?) {
        if imageView.image == UIImage(named: "image1.jpg") {
            
        imageView.image = UIImage(named: "image2.jpg")

        } else if imageView.image == UIImage(named: "image2.jpg") {
            imageView.image = UIImage(named: "image3.jpg")
        } else {
            imageView.image = UIImage(named: "image1.jpg")
        }
    
    }
    
    @IBAction func goBack(_ sender: Any) {
    
    if imageView.image == UIImage(named: "image3.jpg") {
    
    imageView.image = UIImage(named: "image2.jpg")
    
    } else if imageView.image == UIImage(named: "image2.jpg") {
    imageView.image = UIImage(named: "image1.jpg")
    } else {
    imageView.image = UIImage(named: "image3.jpg")
    }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

