//
//  ViewController.swift
//  PitchPerfet
//
//  Created by Anna Rogers on 6/21/16.
//  Copyright © 2016 Anna Rogers. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recoderButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!

    var audioRecorder:AVAudioRecorder!

    @IBAction func RecordAudio(sender: AnyObject) { 
        print("Record Button Pressed")
        configureRecordingText(isRecording: true)
        
//        create the file path and save to a file
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath,recordingName]
        
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
//        make a new instance and record
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL:filePath!, settings:[:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }

    @IBAction func stopRecording(sender: AnyObject) {
        print("Stop Recording")
        configureRecordingText(isRecording: false)
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
//    added function to deal with toggling the record and stop buttons
    func configureRecordingText(isRecording recording: Bool){
        recordingLabel.text = recording ? "Recording!" : "Tap to Record"
        stopRecordingButton.enabled = recording
        recoderButton.enabled = !recording
    }

    override func viewWillAppear(animated: Bool) {
        stopRecordingButton.enabled = false
        
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Recording Finished and saved to file")
        if (flag) {
            self.performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
        } else {
            print("Saving the recording failed")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if the segue is stopRecording (named previously) then set the destination to PlaySoundsViewController
        if (segue.identifier == "stopRecording") {
            let playSoundsVC = segue.destinationViewController as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }

}

