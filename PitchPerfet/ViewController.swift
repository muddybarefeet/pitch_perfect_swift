//
//  ViewController.swift
//  PitchPerfet
//
//  Created by Anna Rogers on 6/21/16.
//  Copyright © 2016 Anna Rogers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func RecordAudio(sender: AnyObject) {
        print("Record Button Pressed")
        recordingLabel.text = "Recording!"
        stopRecordingButton.enabled = true
        recoderButton.enabled = false
    }

    @IBAction func stopRecording(sender: AnyObject) {
        print("Stop Recording")
        recoderButton.enabled = true
        stopRecordingButton.enabled = false
        recordingLabel.text = "Tap to Record!"
    }
    
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recoderButton: UIButton!
    override func viewWillAppear(animated: Bool) {
        stopRecordingButton.enabled = false
    }
}

