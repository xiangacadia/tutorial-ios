//
//  PlaySoundsViewController.swift
//  MultiviewApp
//
//  Created by xjiang on 2016-01-17.
//  Copyright © 2016 xjiang. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer = try! AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)

    }

    func stopAudio() {
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer.stop()
    }

    @IBAction func playSlow(sender: UIButton) {
        stopAudio()
        playWithSpeed(0.5)
    }
    
    @IBAction func playFast(sender: UIButton) {
        playWithSpeed(1.5)
        audioPlayer.play()
    }
    
    func playWithSpeed(speed: Float) {
        audioPlayer.rate = speed
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func stopPlay(sender: UIButton) {
        stopAudio()
    }

    @IBAction func playChimp(sender: UIButton) {
        stopAudio()
        playAudioWithVariablePitch(1000)
        
    }
    
    @IBAction func playDarth(sender: UIButton) {
        stopAudio()
        playAudioWithVariablePitch(-1000)
    }
    
    func playAudioWithVariablePitch(pitch: Float){
        stopAudio()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        audioPlayerNode.play()
    }
}
