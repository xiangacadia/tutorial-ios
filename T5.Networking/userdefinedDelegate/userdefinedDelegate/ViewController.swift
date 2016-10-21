//
//  ViewController.swift
//  userdefinedDelegate
//
//  Created by xjiang on 2016-10-21.
//  Copyright © 2016 xjiang. All rights reserved.
//

import UIKit

// 3. implement delegate
class ViewController: UIViewController, XMLParserDelegate {
    
    let url = NSURL(string: "https://weather.gc.ca/rss/city/ns-19_e.xml")
    var xmlParser = XMLParser()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 4. set delegate
        xmlParser.delegate = self

        
        xmlParser.startParsingWithContentsOfURL(url!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // implement delegate
    func didFinishTask(sender: XMLParser) {
        print("parse has ended")

    }


}

