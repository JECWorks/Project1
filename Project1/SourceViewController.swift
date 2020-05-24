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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 100
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        vw.textField?.stringValue = "Hello, World!"
        return vw
    }
}
