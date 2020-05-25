//
//  DetailViewController.swift
//  Project1
//
//  Created by Jason Cox on 5/21/20.
//  Copyright © 2020 Jason Cox. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {

    @IBOutlet var imageView: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    /*
     Every NSViewController has a parent property that points to the view controller its contained inside.
     Split view controllers have a children property that is an array of the view controllers it contains. The second item in that array ought to be our DetailViewController.
     We need to get the parent, and typecast it as a split view controller. If that works, we need to get its second child view controller and conditionally typecast it as a DetailViewController. If that works, we can call imageSelected(), passing in whatever image was tapped.
     */
    func imageSelected(name: String) {
        imageView.image = NSImage(named: name)
    }
}
