//
//  RecordSoundsViewController.swift
//  MultiviewApp
//
//  Created by xjiang on 2016-01-17.
//  Copyright © 2016 xjiang. All rights reserved.
//

import UIKit
import AVFoundation // library for AVAudioRecorder

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var microphoneButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    var recordedAudio:RecordedAudio!
    
    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true
        recordLabel.text = "Tap to Record"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: UIButton) {
        print("in recordAudio()")
        // set visibility of buttons and labels
        recordLabel.text = "Recording..."
        microphoneButton.hidden = true
        stopButton.hidden = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        // setup file path for the audio file
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        
        // Assign delegate of audioRecorder to be RecordSoundsViewController
        audioRecorder.delegate = self
        
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        
        
        
    }

    @IBAction func stopRecording(sender: UIButton) {
        // set visibility of buttons and labels
        microphoneButton.hidden = false
        recordLabel.text = "Tap to Record"
        stopButton.hidden = true
        
        // stop recording
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        if(flag){
        // Save recorded audio
        recordedAudio = RecordedAudio()
        recordedAudio.filePathUrl = recorder.url
        recordedAudio.title = recorder.url.lastPathComponent
        
        self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        }
    }
    
    // called before segway is performed
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording"){
            let playSoundsVC:PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
            
            let data = sender as! RecordedAudio
            
            playSoundsVC.receivedAudio = data
        }
    }
    
    
}

