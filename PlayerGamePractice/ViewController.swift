//
//  ViewController.swift
//  PlayerGamePractice
//
//  Created by Денис Андреев on 7/20/19.
//  Copyright © 2019 Денис Андреев. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    
    var player = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
    }

    
    
    @IBAction func Tap1(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                 self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
    
    
    @IBAction func stopButton(_ sender: UIButton) {
        player.stop()
    }
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        player.skipToNextItem()
    }
    
    func playGenre(genre:String){
         player.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        player.setQueue(with: query)
        player.shuffleMode = .songs
        player.play()
    }
}

