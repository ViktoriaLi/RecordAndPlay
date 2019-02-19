//
//  PlayAudioViewController.swift
//  Try saudio
//
//  Created by Mac Developer on 2/16/19.
//  Copyright © 2019 Viktoria. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class PlayAudioViewController: UIViewController {

    @IBOutlet weak var slowPlayButton: UIButton!
    @IBOutlet weak var fastPlayButton: UIButton!
    @IBOutlet weak var chipmunkPlayButton: UIButton!
    @IBOutlet weak var dartPlayButton: UIButton!
    @IBOutlet weak var EchoPlayButton: UIButton!
    @IBOutlet weak var reverbPlayButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    @IBAction func playSoundAction(_ sender : UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate : 0.5)
        case .fast:
            playSound(rate : 1.5)
        case .chipmunk:
            playSound(pitch : 1000)
        case .vader:
            playSound(pitch : -1000)
        case .echo:
            playSound(echo : true)
        case .reverb:
            playSound(reverb : true)
        }
        configureUI(.playing)
    }
    
    @IBAction func stopSound(_ sender : UIButton) {
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
   

}
