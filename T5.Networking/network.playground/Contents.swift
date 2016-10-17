//: Playground - noun: a place where people can play

import UIKit
import Foundation
import XCPlayground

// By default Playgrounds execute the code in each page, from top-to-bottom, 
// then they stop executing.
// By setting the needsIndefiniteExecution to be true,
// we allow any asynchronous code we have in our Playground to continue running indefinitely.
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

// An NSURL object represents a URL that can potentially contain the location of a resource 
// on a remote server, the path of a local file on disk, or even an arbitrary piece of encoded data.
let url = NSURL(string: "http://api.topcoder.com/v2/challenges?pageSize=2")

// NSURLRequest objects represent a URL load request in a manner independent of protocol and URL scheme.
let request = NSURLRequest(URL: url!)

// You use this object to configure the timeout values, caching policies, connection requirements, 
// and other types of information that you intend to use with your NSURLSession object.
let config = NSURLSessionConfiguration.defaultSessionConfiguration()

// The NSURLSession class and related classes provide an API for downloading content.
let session = NSURLSession(configuration: config)

// Creates a task that retrieves the contents of a URL based on the specified URL request object, 
// and calls a handler upon completion.
let task = session.dataTaskWithRequest(request,
                                       // trailing closure
                                       completionHandler: {(data, response, error) in
    
    if error != nil {
        // If there is an error in the web request, print it to the console
        print(error!.localizedDescription)
    }
    
    do {
        // parse json
        if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
            let dataOut = jsonResult as! Dictionary<String,AnyObject>
            
            // access json
            print(dataOut["serverInformation"])
            
        }
    }catch let serializationError as NSError {
        print(serializationError)
    }
    

    
});

// run the task
task.resume()