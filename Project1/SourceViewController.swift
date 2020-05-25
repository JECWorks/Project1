//
//  SourceViewController.swift
//  Project1
//
//  Created by Jason Cox on 5/21/20.
//  Copyright © 2020 Jason Cox. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    // This makes the new class SourceViewController conform to all 3 protocols listed (NSViewController, etc.). This allows XCode to adjust it's autocomplete database to include things from these protocols as well.
    @IBOutlet var tableView: NSTableView!
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        // Get a list of all files in our bundles resource path:
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // Loop over each file we found
        
        for item in items {
            // if this item starts with "nssl" add it to our array
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
    }
    func numberOfRows(in tableView: NSTableView) -> Int {
        return pictures.count
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        // the viewFor method gets called once for every column and every row and returns the view shown in the slot.
        // this guard statement changes (typecasts) the NSView request into a NSTableCellView request AND returns a nil
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        vw.textField?.stringValue = pictures[row]
        return vw
    }
    // this asks the tableView what row is selected and protects by not selecting an image if no row is selected.
    // This method gets called whenever the selected row gets changed. It reads the new selected row property of the talbe, ensuring it's not -1. Then it conditionally converts the source viewController's parent viewController into an NSSplitViewController (if this fails, it exits the method).
    // Then it conditionally converts the splitVC second child view controller into a DetailViewController.
    // If that works, then it calls the imageSelected method on it.
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1 else { return }
        guard let splitVC = parent as? NSSplitViewController else { return }
        
        if let detail = splitVC.children[1] as? DetailViewController {
            detail.imageSelected(name: pictures[tableView.selectedRow])
        }
        // It's necessary to change the content compression resistance to keep the new image from taking over the entire window.
        // Content compression resistance means "how hard will I resist being made smaller than my content."
        // Content Hugging Priority means "how hard will I resist being made bigger than my content."
    }
}
