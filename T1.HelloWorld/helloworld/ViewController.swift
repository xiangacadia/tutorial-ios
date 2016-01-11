//
//  ViewController.swift
//  helloworld
//
//  Created by xjiang on 2015-11-25.
//  Copyright © 2015 xjiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lebel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var showLabel = true;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClicked(sender: AnyObject) {
        if (showLabel == false){
            lebel.hidden = false;
            showLabel = true;
            button.setTitle("Hide", forState:.Normal);
        }
        else{
            lebel.hidden = true;
            showLabel = false;
            button.setTitle("Show", forState:.Normal);
        }

    }

}

