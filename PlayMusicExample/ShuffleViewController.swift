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
    
    @IBOutlet var closeButton: UIButton!
    
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
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeAction(sender:AnyObject){
        self.dismissViewControllerAnimated(true, completion: nil)
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
