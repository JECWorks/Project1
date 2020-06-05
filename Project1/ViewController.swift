//
//  ViewController.swift
//  Project1
//
//  Created by Jason Cox on 5/21/20.
//  Copyright © 2020 Jason Cox. All rights reserved.
//

import Cocoa

class ViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // this sharedClicked method will get triggered when a toolbar button is clicked as part of the responder chain
    @IBAction func sharedClicked(_ sender: NSView) {
        // grabs the second viewController in our children array and conditionally typecast it as a detailViewController, if fails, then bail
        // using guard similar to how we used it in viewDidChange
        guard let detail = children[1] as? DetailViewController else { return }
        // grabs the image out of the detailViewController's image view. If there isn't one, then bails out
        guard let image = detail.imageView.image else { return }
        // create a new instance of the NSSharingServicePicker object using the image we just got, showing it at the bottom edge of the button
        // The NSSharingServicePicker object is created by passing it an array of items. The OS automatically configures it
        let picker = NSSharingServicePicker(items: [image])
        // this controls where to position the menu with the parameters
        picker.show(relativeTo: .zero, of: sender, preferredEdge: .minY)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

