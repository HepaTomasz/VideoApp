//
//  ViewController.swift
//  VideoApp
//
//  Created by Tomasz Hepa on 06.02.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var webView: UIWebView!
  
    
    
    let imagePickerController = UIImagePickerController()
    var videoURL: NSURL?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.isHidden = true
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func whenButtonTouched(_ sender: Any) {
        webView.isHidden = true
        guard let path = Bundle.main.path(forResource: "Sample", ofType:"mp4") else {
            debugPrint("Sample.mp4 not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
        
        
        
        
    }
    
    
    @IBAction func chooseVideoBtnTouched(_ sender: Any) {
        webView.isHidden = true
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePickerController.mediaTypes = ["public.image", "public.movie"]
        
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        videoURL = info["UIImagePickerControllerReferenceURL"] as? NSURL
        print(videoURL as Any)
        imagePickerController.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(  didFinishPickingMediaWithInfo info:NSDictionary!) {
        videoURL = info[UIImagePickerControllerMediaURL] as! NSURL!
        let pathString = videoURL?.relativePath
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func liveStreamBtnTouched(_ sender: Any) {
        guard
            let myURL = URL(string: "https://www.zdf.de/sender/zdf/zdf-live-beitrag-100.html")
            else { return }
        webView.loadRequest( URLRequest(url: myURL) )
        webView.isHidden = false
    }
    
    @IBAction func youtubeBtnTouched(_ sender: Any) {
        guard
            let youtubeURL = URL(string: "https://www.youtube.com/")
            else { return }
        webView.loadRequest( URLRequest(url: youtubeURL) )
        webView.isHidden = false
    }
    
    @IBAction func twitchBtnTouched(_ sender: Any) {
        guard
        let myURL = URL(string: "https://www.twitch.tv/")
        else { return }
        webView.loadRequest( URLRequest(url: myURL) )
        webView.isHidden = false
        
        
    }
    
    
}
