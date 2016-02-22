//
//  ViewController.swift
//  GCD
//
//  Created by xjiang on 2016-02-11.
//  Copyright © 2016 xjiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClicked(sender: UIButton) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            self.btn1.setTitle("new", forState: .Normal)
        })
        
        
        
    }

    @IBAction func button2Clicked(sender: UIButton) {
        
        dispatch_async(dispatch_get_main_queue(), {
            self.btn2.setTitle("new", forState: .Normal)
        })
        
    }
    
    @IBAction func disableText1(sender: UIButton) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            self.text1.enabled = false
        })
        
    }
    
    @IBAction func disableText2(sender: UIButton) {
        
        dispatch_async(dispatch_get_main_queue(), {
            self.text2.enabled = false
        })
    }
    
}

