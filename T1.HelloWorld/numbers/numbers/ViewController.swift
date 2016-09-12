//
//  ViewController.swift
//  numbers
//
//  Created by xjiang on 2016-09-12.
//  Copyright © 2016 xjiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var counter:Int = 0
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = "init"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClicked(sender: UIButton) {
        counter += 1
        label.text = String(counter)
    }

}

