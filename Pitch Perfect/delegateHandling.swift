//
//  delegateHandling.swift
//  Pitch Perfect
//
//  Created by Mihir Thanekar on 6/21/17.
//  Copyright © 2017 Mihir Thanekar. All rights reserved.
//

import AVFoundation

extension RecordSoundsViewController: AVAudioRecorderDelegate {
    // recording methods
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        guard flag else {
            recordingLabel.text = "Recording failure. Try again."
            return
        }
        performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        
    }

}
