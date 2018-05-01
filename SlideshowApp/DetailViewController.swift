//
//  DetailViewController.swift
//  SlideshowApp
//
//  Created by Keiichi Funatsuki on 2018/04/26.
//  Copyright © 2018年 keiichi.funatsuki. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController, AVAudioPlayerDelegate {
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var goBackBtn: UIButton!
    @IBOutlet weak var goFowardBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    
   var imageArray = ["image1.jpg", "image2.jpg", "image3.jpg","image4.jpg","image5.jpg","image6.jpg","image7.png"]
    
    var imageCount: Int = 0
    
    func viewImage() {
        let myImage = UIImage(named: imageArray[imageCount])!
        imageView.image = myImage
    }
    
    var timer : Timer!
    var timer_sec : Double = 0.0
    //タイマー関連
    
    var audioPlayer: AVAudioPlayer!
    //オーディオプレイヤー
    
    @IBAction func onTapImage(_ sender: Any) {
        if timer != nil {
            self.timer.invalidate()
            self.timer = nil
            goFowardBtn.isEnabled = true
            goBackBtn.isEnabled = true
            audioPlayer.pause()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        
        
        let myImage: UIImage = UIImage(named: imageArray[imageCount])!
        imageView.image = myImage
        //１ページ目から画像を受け取る関連
        
//        do {
//            let filePath = Bundle.main.path(forResource: "n99", ofType: "mp3")
//            let musicPath = URL(fileURLWithPath: filePath!)
//            audioPlayer = try AVAudioPlayer(contentsOf: musicPath)
//            
//        } catch {
//            print("error")
//            
//        }
//        //オーディオプレイ関連
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func play(_ sender: Any) {
//            if timer == nil {
//                self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(goFoward), userInfo: nil, repeats: true)
//                goFowardBtn.isEnabled = false
//                goBackBtn.isEnabled = false
//                audioPlayer.play()
//                imageView.isUserInteractionEnabled = false
//                //ジェスチャーで設定したアクションをOFFにする
//
//            } else {
//                self.timer.invalidate()
//                self.timer = nil
//                goFowardBtn.isEnabled = true
//                goBackBtn.isEnabled = true
//                audioPlayer.pause()
//                imageView.isUserInteractionEnabled = true
//                //ジェスチャーで設定したアクションをONにする
//
//
//            }
//    }
    
//    @IBAction func goBack(_ sender: Any) {
//        //戻るボタン。　配列は０からカウントが始まるので注意！
//        imageCount -= 1
//        if imageCount < 0 {
//            imageCount = 6
//        }
//        viewImage()
//
//    }
//
//    @IBAction func goFoward(_ sender: Any) {
//        //進むボタン
//        imageCount += 1
//        if imageCount >= 6 {
//            imageCount = 0
//        }
//        viewImage()
//    }


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


