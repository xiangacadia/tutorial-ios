//
//  PlayRecordingViewController.swift
//  MultiviewApp
//
//  Created by xjiang on 2016-09-20.
//  Copyright © 2016 xjiang. All rights reserved.
//

import UIKit
import AVFoundation


class PlayRecordingViewController: UIViewController {
    var receivedAudio:Recording!
    var audioPlayer:AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioPlayer = try! AVAudioPlayer(contentsOfURL: receivedAudio.path)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playRecording(sender: UIButton) {
        audioPlayer.play()
        

    }

    
}
