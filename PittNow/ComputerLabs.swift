//
//  FirstViewController.swift
//  PittNow
//
//  Created by Omri Barak on 9/17/15.
//  Copyright (c) 2015 PittNow. All rights reserved.
//

import UIKit

class ComputerLabs: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    func setMessage(text: String) {
        self.myLabel.text = text
    }
    func test() {
        var url : String = "http://pittapi.pittcsc.org/"
        var urlRequest = NSURLRequest(URL: NSURL(string: url)!)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue(),
            completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                if(data != nil && error==nil) {
//                    let data = String(format: data, NSUTF8StringEncoding)
                    dispatch_async(dispatch_get_main_queue()) {
                        self.setMessage(/*data*/"Yeah baby")
                    }
                } else {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.setMessage("Error")
                        println(error.description)
                    }
                }
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myLabel.text = "Proof"
        self.test()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

