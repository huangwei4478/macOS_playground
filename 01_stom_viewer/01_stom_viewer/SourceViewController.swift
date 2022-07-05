//
//  SourceViewController.swift
//  01_stom_viewer
//
//  Created by wei on 2022/7/5.
//

import Cocoa

class SourceViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 100
    }
    
}
