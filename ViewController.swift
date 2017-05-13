//
//  ViewController.swift
//  SpeakLine
//
//  Created by JORGE MANRUBIA DIEZ on 13/05/2017.
//  Copyright © 2017 JORGE MANRUBIA DIEZ. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var speakButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func speakIt(_ sender: Any) {
        let text = textField.stringValue
        print("Speak \(text)")
    }
    
    @IBAction func stopIt(_ sender: Any) {
        print("Stop")
    }

}

