//
//  ListViewController.swift
//  SlideshowApp
//
//  Created by Keiichi Funatsuki on 2018/04/27.
//  Copyright © 2018年 keiichi.funatsuki. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageArray = ["image1.jpg", "image2.jpg", "image3.jpg","image4.jpg","image5.jpg","image6.jpg","image7.png"]
    
    var myImage: UIImage?
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 30
//    }
//
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let testCell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let imageView = testCell.contentView.viewWithTag(1) as! UIImageView
        
        let cellImage = UIImage(named: imageArray[indexPath.row])
        
        imageView.image = cellImage
        
        let label = testCell.contentView.viewWithTag(2) as! UILabel
        label.text = imageArray[indexPath.row]
        
        return testCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        myImage = UIImage(named: imageArray[indexPath.row])
        if myImage != nil {
            performSegue(withIdentifier: "toDetailViewController", sender: nil)
        }
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
//        if (segue.identifier == "toDetailViewController") {
//            let detailViewController : DetailViewController = (segue.destination as! DetailViewController)
//            
//            detailViewController.myImage = myImage
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let horizontalSpace:CGFloat = 4
        let cellSize:CGFloat = self.view.bounds.width/2 - horizontalSpace
        
        return CGSize(width: cellSize, height: cellSize)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count;
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
