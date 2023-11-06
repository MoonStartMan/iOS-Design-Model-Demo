//
//  AdapterViewController.swift
//  Design-Model-Demo
//
//  Created by 王潇 on 2023/11/6.
//

import UIKit

class AdapterViewController: UIViewController {

    private let adapter: AudioPlayer = Adapter(mp3Player: MP3Player())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        adapter.playAudio(fileName: "song.mp3")
    }

}

protocol AudioPlayer {
    func playAudio(fileName: String)
}

class MP3Player: AudioPlayer {
    func playAudio(fileName: String) {
        print("Playing MP3 audio file: \(fileName)")
    }
}

class WAVPlayer: AudioPlayer {
    func playAudio(fileName: String) {
        print("Playing WAV audio file: \(fileName)")
    }
}

class Adapter: AudioPlayer {
    private let mp3Player: MP3Player
    
    init(mp3Player: MP3Player) {
        self.mp3Player = mp3Player
    }
    
    func playAudio(fileName: String) {
        mp3Player.playAudio(fileName: fileName)
    }
}
