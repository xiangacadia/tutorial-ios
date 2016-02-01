//
//  ViewController.swift
//  Networking
//
//  Created by xjiang on 2016-01-31.
//  Copyright © 2016 xjiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLSessionDownloadDelegate {

    let url = NSURL(string: "https://raw.githubusercontent.com/xiangacadia/tutorial-ios/master/README.md")
    
    var downloadTask: NSURLSessionDownloadTask!
    var backgroundSession: NSURLSession!
    var bytes: NSMutableData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // download data
        downloadData()
        
        // set up background process
        let backgroundSessionConfiguration = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier("backgroundSession")
        backgroundSession = NSURLSession(configuration: backgroundSessionConfiguration, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        
        // download file
        downloadFile()
    
        weatherSearch(){ dictionary in
            //print(dictionary)
        }
        
           }
    
    func downloadData() {
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            print(NSString(data: data!, encoding: NSUTF8StringEncoding))
        }
        
        task.resume()
    }

    func downloadFile() {
        downloadTask = backgroundSession.downloadTaskWithURL(self.url!)
        downloadTask.resume()
    }
    
    // Tells the delegate that a download task has finished downloading.
    func URLSession(session: NSURLSession,
        downloadTask: NSURLSessionDownloadTask,
        didFinishDownloadingToURL location: NSURL){
            
            let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
            let documentDirectoryPath:String = path[0]
            let destinationURLForFile = NSURL(fileURLWithPath: documentDirectoryPath.stringByAppendingString("/file.md"))
            print(destinationURLForFile)
            
    }
    
    func weatherSearch(callback: (Dictionary<String,AnyObject> -> ())) {
        let urlPath = "http://api.openweathermap.org/data/2.5/weather?id=6324729&appid=44db6a862fba0b067b1930da0d769e98"
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            print("Task completed")
            if(error != nil) {
                // If there is an error in the web request, print it to the console
                print(error!.localizedDescription)
            }
            do {
            if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                let dataOut = jsonResult as! Dictionary<String,AnyObject>
                callback(dataOut)
                print(dataOut)
            }
            }catch let serializationError as NSError {
                print(serializationError)
            }
        })
        task.resume()
    }
    
    
}

