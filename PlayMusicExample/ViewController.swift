//
//  ViewController.swift
//  PlayMusicExample
//
//  Created by Dante Solorio on 3/14/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import UIKit

struct Song {
    var title:String = ""
    var cover:String = ""
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableViewSongs: UITableView!
    
    var songsArray: [Song] = []
    var songToSend: Song!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillArray()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Fill array
    func fillArray(){
        songsArray = [Song(title: "John Wesley Coleman - Tequila", cover: "cover1"),
                      Song(title: "junior85 - Function", cover: "cover2"),
                      Song(title: "Black Ant - realest year", cover: "cover3"),
                      Song(title: "Dave Girtsman - Goofy Vocal Groove", cover: "cover4"),
                      Song(title: "Norrin Radd - Quantum Uncertainty", cover: "cover5") ]
    }
    
    // MARK: Actions
    @IBAction func goToShuffleView(sender:AnyObject){
        performSegueWithIdentifier("shuffleSegue", sender: self)
    }
    
    // MARK: Table View Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsArray.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableViewSongs.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1).- \"\(songsArray[indexPath.row].title)\" "
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        songToSend = songsArray[indexPath.row]        
        performSegueWithIdentifier("songDetail", sender: self)
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "songDetail"{
            let destinationVC = segue.destinationViewController as! SongDetailViewController
            destinationVC.song = songToSend
        }
        if segue.identifier == "shuffleSegue"{
            let randomNumber = Int(arc4random_uniform(UInt32(songsArray.count)))
            let nav = segue.destinationViewController as! UINavigationController
            let destinationVC = nav.topViewController as! ShuffleViewController
            destinationVC.song = songsArray[randomNumber]
        }

    }
    

}

