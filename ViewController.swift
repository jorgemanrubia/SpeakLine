//
//  ViewController.swift
//  SpeakLine
//
//  Created by JORGE MANRUBIA DIEZ on 13/05/2017.
//  Copyright © 2017 JORGE MANRUBIA DIEZ. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSSpeechSynthesizerDelegate {
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var speakButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    
    
    var isSpeaking = false
    
    let speechSynthesizer = NSSpeechSynthesizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        speechSynthesizer.delegate = self
        updateButtons()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func updateButtons(){
        speakButton.isEnabled = !isSpeaking
        stopButton.isEnabled = isSpeaking
    }
    
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        isSpeaking = false
        updateButtons()
    }

    @IBAction func speakIt(_ sender: Any) {
        let text = textField.stringValue
        if(!text.isEmpty){
            isSpeaking = true
            speechSynthesizer.startSpeaking(text)
            updateButtons()
        }
    }
    
    @IBAction func stopIt(_ sender: Any) {
        speechSynthesizer.stopSpeaking()
    }

}

