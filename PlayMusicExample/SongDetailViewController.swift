//
//  SongDetailViewController.swift
//  PlayMusicExample
//
//  Created by Dante Solorio on 3/15/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import UIKit
import AVFoundation

class SongDetailViewController: UIViewController {
    
    @IBOutlet var playButton: UIButton!
    
    private var reproducer: AVAudioPlayer!
    var song: Song!

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Song \(song.title)")
        
        let soundURL = NSBundle.mainBundle().URLForResource(song.title, withExtension: "mp3")
        do{
            try reproducer = AVAudioPlayer(contentsOfURL: soundURL!)
        }catch{
            print("Sound load fails")
        }
        
        if !reproducer.playing{
            reproducer.play()
            playButton.setTitle("Playing...", forState: UIControlState.Normal)
            playButton.enabled = false
        }else{
            playButton.setTitle("Play", forState: UIControlState.Normal)
            playButton.enabled = true
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
