//
//  ViewController.swift
//  SpeakLine
//
//  Created by JORGE MANRUBIA DIEZ on 13/05/2017.
//  Copyright © 2017 JORGE MANRUBIA DIEZ. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSSpeechSynthesizerDelegate, NSWindowDelegate, NSTableViewDataSource, NSTableViewDelegate {
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var speakButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var tableView: NSTableView!
    
    
    var isSpeaking = false
    
    let speechSynthesizer = NSSpeechSynthesizer()
    
    let voices = NSSpeechSynthesizer.availableVoices() as [String]

    override func viewDidLoad() {
        super.viewDidLoad()
        speechSynthesizer.delegate = self
        updateButtons()
        for voice in voices{
            print(voiceNameForIdentifier(identifier: voice))
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        self.view.window?.delegate = self
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
    
    func windowShouldClose(_ sender: Any) -> Bool {
        return !isSpeaking
    }
    
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        isSpeaking = false
        updateButtons()
    }
    
    func voiceNameForIdentifier(identifier: String) -> String?{
        let attributes = NSSpeechSynthesizer.attributes(forVoice: identifier)
        return attributes[NSVoiceName] as? String
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
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return voices.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        let voice = voices[row]
        let voiceName = voiceNameForIdentifier(identifier: voice)
        return voiceName
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let row = tableView.selectedRow
        if row == -1 {
            speechSynthesizer.setVoice(nil);
            return
        }
        let voice = voices[row]
        speechSynthesizer.setVoice(voice)
    }

}

