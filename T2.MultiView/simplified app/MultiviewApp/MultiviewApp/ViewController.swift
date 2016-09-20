//
//  ViewController.swift
//  MultiviewApp
//
//  Created by xjiang on 2016-09-20.
//  Copyright © 2016 xjiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var recordedAudio:Recording!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func stopRecording(sender: UIButton) {
        
        // Save recorded audio
        
        recordedAudio = Recording()
        
        let filepath = NSBundle.mainBundle().pathForResource("mock", ofType: "mp3")
        recordedAudio.path = NSURL.fileURLWithPath(filepath!)
        recordedAudio.title = "mock"

        self.performSegueWithIdentifier("playRecording", sender: recordedAudio)
    }
    
    // transfer data
    // called before segway is performed
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "playRecording"){
            let playSoundsVC:PlayRecordingViewController = segue.destinationViewController as! PlayRecordingViewController
            
            playSoundsVC.receivedAudio = recordedAudio
        }
    }



}

