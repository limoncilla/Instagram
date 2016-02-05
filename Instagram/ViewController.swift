//
//  ViewController.swift
//  Instagram
//
//  Created by Halimat Ipesa-Balogun on 2/4/16.
//  Copyright © 2016 Halimat Ipesa-Balogun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pictures: [NSDictionary]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        // Do any additional setup after loading the view, typically from a nib.
    
        let clientId = "Put your client id here"
        let url = NSURL(string:"https://api.instagram.com/v1/media/popular?client_id=\(clientId)")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            NSLog("response: \(responseDictionary)")
                            self.pictures = responseDictionary["data"] as![NSDictionary]
                            
                    }
                }
        });
        task.resume()
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
}

