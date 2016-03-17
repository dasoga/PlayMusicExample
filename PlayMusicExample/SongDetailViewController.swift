//
//  SongDetailViewController.swift
//  PlayMusicExample
//
//  Created by Dante Solorio on 3/15/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import UIKit
import AVFoundation

class SongDetailViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet var playButton: UIButton!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var sliderVolume: UISlider!
    
    private var reproducer: AVAudioPlayer!
    var song: Song!
    var timer:NSTimer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let soundURL = NSBundle.mainBundle().URLForResource(song.title, withExtension: "mp3")
        do{
            try reproducer = AVAudioPlayer(contentsOfURL: soundURL!)
        }catch{
            print("Sound load fails")
        }
        
        reproducer.delegate = self
        
        if !reproducer.playing{
            reproducer.play()
            playButton.setTitle("Playing...", forState: UIControlState.Normal)
            playButton.enabled = false
        }else{
            playButton.setTitle("Play", forState: UIControlState.Normal)
            playButton.enabled = true
        }
        
        //let vol = AVAudioSession.sharedInstance().outputVolume
        sliderVolume.value = 0.5
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(SongDetailViewController.updateTime), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: General functions
    
    func updateTime() {
        let currentTime = Int(reproducer.currentTime)
        let minutes = currentTime/60
        let seconds = currentTime - minutes * 60
        
        durationLabel.text = NSString(format: "%02d:%02d", minutes,seconds) as String
    }
    
    // MARK: Actions
    @IBAction func playFunction(sender:AnyObject){
        if !reproducer.playing{
            reproducer.play()
            playButton.enabled = false
            playButton.setTitle("Playing...", forState: UIControlState.Normal)
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(SongDetailViewController.updateTime), userInfo: nil, repeats: true)

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
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let currentValue = Float(sender.value)
        print("current \(currentValue)")
        reproducer.volume = currentValue
    }
    
    // MARK Audio delegates
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        print("finish playing")
        playButton.setTitle("Play", forState: UIControlState.Normal)
        playButton.enabled = true
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
