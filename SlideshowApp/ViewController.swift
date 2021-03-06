//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Keiichi Funatsuki on 2018/04/26.
//  Copyright © 2018年 keiichi.funatsuki. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    //イメージビューアーを接続
    @IBOutlet weak var goFowardBtn: UIButton!
    @IBOutlet weak var goBackBtn: UIButton!
    
    
    var imageCount = 0
    var imageArray = ["image1.jpg", "image2.jpg", "image3.jpg","image4.jpg","image5.jpg","image6.jpg","image7.png"]
    //画像を宣言
    
    var timer : Timer!
    var timer_sec : Double = 0.0
    //タイマー関連
    
    var audioPlayer: AVAudioPlayer!
    //オーディオプレイヤー
    
    func viewImage() {
        let myImage = UIImage(named: imageArray[imageCount])!
        imageView.image = myImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.image = UIImage(named: "image1.jpg")
        //1枚目の画像を表示しとく
        do {
            let filePath = Bundle.main.path(forResource: "n99", ofType: "mp3")
            let musicPath = URL(fileURLWithPath: filePath!)
            audioPlayer = try AVAudioPlayer(contentsOf: musicPath)
            
        } catch {
            print("error")
        
        }
        //オーディオプレイ関連

        
    }
    @IBAction func goFoward(_ sender: Any?) {
        //進むボタン
        imageCount += 1
        if imageCount >= 6 {
            imageCount = 0
        }
        viewImage()

    }
    
    @IBAction func goBack(_ sender: Any) {
        //戻るボタン。　配列は０からカウントが始まるので注意！
        imageCount -= 1
        if imageCount < 0 {
            imageCount = 6
        }
        viewImage()

    }
    
    @IBAction func Play(_ sender: Any) {
        if timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(goFoward), userInfo: nil, repeats: true)
            goFowardBtn.isEnabled = false
            goBackBtn.isEnabled = false
            audioPlayer.play()
//            imageView.isUserInteractionEnabled = false
            
        } else {
            self.timer.invalidate()
            self.timer = nil
            goFowardBtn.isEnabled = true
            goBackBtn.isEnabled = true
            audioPlayer.pause()
//            imageView.isUserInteractionEnabled = true
        }
        
    }
    
    
    
    @IBAction func onTapImage(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
        //画像タップで別ページに移動
        if timer != nil {
            self.timer.invalidate()
            self.timer = nil
            goFowardBtn.isEnabled = true
            goBackBtn.isEnabled = true
            audioPlayer.pause()
        }
        
    }
    
    @IBAction func jumpToList(_ sender: Any) {
        performSegue(withIdentifier: "list", sender: nil)
    }
    
    
    //以下、２つ目と画面をつないだりデータ引き渡したり
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "result" {
            let detailViewController: DetailViewController = segue.destination as! DetailViewController
            detailViewController.imageCount = imageCount
            
//        } else if segue.identifier == "list" {
//            let listViewController : ListViewController = segue.destination as! ListViewController
//
//
        }

        

    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        //戻ってくるために必要
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

