//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Mihir Thanekar on 6/20/17.
//  Copyright © 2017 Mihir Thanekar. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int{case slow = 0, fast, chipmunk, vader, echo, reverb}
    
    @IBAction func playSoundforButton(_ sender: UIButton) {
        switch ButtonType(rawValue: sender.tag)! {
        case .slow:
            playSound(rate: 0.5)    // Slow it down
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch:  1000)     // Increase pitch
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)       // Echo
        case .reverb:
            playSound(reverb: true)     // reverb
        }
        configureUI(.playing)
    }
    
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
}
