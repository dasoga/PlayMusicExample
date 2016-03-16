//
//  ShuffleViewController.swift
//  PlayMusicExample
//
//  Created by Dante Solorio on 3/15/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import UIKit
import AVFoundation

class ShuffleViewController: UIViewController {
    
    @IBOutlet var playButton: UIButton!
    
    private var reproducer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let soundURL = NSBundle.mainBundle().URLForResource("John Wesley Coleman - Tequila 10 Seconds", withExtension: "mp3")
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
    
    //MARK: General Functions
    
    
    
    
    // MARK: Actions
    
    @IBAction func closeAction(sender:AnyObject){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func playFunction(sender:AnyObject){
        if !reproducer.playing{
            reproducer.play()
            playButton.enabled = false
            playButton.setTitle("Playing...", forState: UIControlState.Normal)
        }
    }

    
    @IBAction func stopFunction(sender:AnyObject){
        if reproducer.playing{
            reproducer.stop()
            reproducer.currentTime = 0.0
            playButton.enabled = true
            playButton.setTitle("Play", forState: UIControlState.Normal)
        }
    }
    
    @IBAction func pauseFunction(sender:AnyObject){
        if reproducer.playing{
            reproducer.pause()
            playButton.enabled = true
            playButton.setTitle("Play", forState: UIControlState.Normal)
        }
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
