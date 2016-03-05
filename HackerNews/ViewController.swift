//
//  ViewController.swift
//  HackerNews
//
//  Created by Wen Niao Qu on 3/1/16.
//  Copyright (c) 2016 Wen Niao Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var newsData: NewsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //print(newsData)
        
        let url = NSURL(string: (newsData?.url)!)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

