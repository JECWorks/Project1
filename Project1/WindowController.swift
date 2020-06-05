//
//  WindowController.swift
//  Project1
//
//  Created by Jason Cox on 6/5/20.
//  Copyright © 2020 Jason Cox. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    @IBOutlet var shareButton: NSButton!
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        
        shareButton.sendAction(on: .leftMouseDown)
        
    }
    @IBAction func sharedClicked(_ sender: NSView) {
        
        guard let split = contentViewController as? NSSplitViewController else { return }
        // grabs the second viewController in our children array and conditionally typecast it as a detailViewController, if fails, then bail
        // using guard similar to how we used it in viewDidChange
        guard let detail = split.children[1] as? DetailViewController else { return }
        // grabs the image out of the detailViewController's image view. If there isn't one, then bails out
        guard let image = detail.imageView.image else { return }
        // create a new instance of the NSSharingServicePicker object using the image we just got, showing it at the bottom edge of the button
        // The NSSharingServicePicker object is created by passing it an array of items. The OS automatically configures it
        let picker = NSSharingServicePicker(items: [image])
        // this controls where to position the menu with the parameters
        picker.show(relativeTo: .zero, of: sender, preferredEdge: .minY)
    }
    
    
    @IBAction func shhButton(_ sender: Any) {
        let alert = NSAlert()
        alert.informativeText = "You found the not-secret button!"
        alert.runModal()
        
    }
    
}
