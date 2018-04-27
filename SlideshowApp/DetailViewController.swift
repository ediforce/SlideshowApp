//
//  DetailViewController.swift
//  SlideshowApp
//
//  Created by Keiichi Funatsuki on 2018/04/26.
//  Copyright © 2018年 keiichi.funatsuki. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func onTapImage(_ sender: Any) {
    }
    
    var imageArray = ["image1.jpg", "image2.jpg", "image3.jpg"]
    
    var imageCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        
        
        let myImage: UIImage = UIImage(named: imageArray[imageCount])!
        imageView.image = myImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
