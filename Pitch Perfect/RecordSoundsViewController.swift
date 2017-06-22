//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Mihir Thanekar on 6/20/17.
//  Copyright © 2017 Mihir Thanekar. All rights reserved.
//

import AVFoundation
import UIKit

class RecordSoundsViewController: UIViewController {
    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordBtn: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    let recInProg = "Recording in progress"
    let tapRec = "Tap to record"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    @IBAction func recordAudio(_ sender: Any) {
        recordingLabel.text = recInProg
        invertButtonsEnabled()
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let filePath = URL(string: dirPath + "/" + recordingName)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        invertButtonsEnabled()
        recordingLabel.text = tapRec
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    private func invertButtonsEnabled() {
        recordBtn.isEnabled = recordBtn.isEnabled == true ? false : true
        stop.isEnabled = recordBtn.isEnabled == true ? false : true
        recordBtn.isEnabled = recordBtn.isEnabled == true ? false : true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playVC = segue.destination as! PlaySoundsViewController
            playVC.recordedAudioURL = audioRecorder.url as URL  // Set the audio path in the other view controller
        }
    }
}
