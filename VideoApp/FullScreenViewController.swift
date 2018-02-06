//
//  StreamViewController.swift
//  VideoApp
//
//  Created by Tomasz Hepa on 06.02.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit

class FullScreenViewController: UIViewController {

    @IBOutlet weak var streamWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard
            let youtubeURL = URL(string: "https://www.zdf.de/sender/zdf/zdf-live-beitrag-100.html")
            else { return }
            streamWebView.loadRequest( URLRequest(url: youtubeURL) )

        // Do any additional setup after loading the view.
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
