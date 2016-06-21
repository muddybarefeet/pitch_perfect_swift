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
    }

    @IBAction func stopRecording(sender: AnyObject) {
        print("Stop Recording")
    }
}

