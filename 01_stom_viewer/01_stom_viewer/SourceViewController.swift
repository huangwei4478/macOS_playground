//
//  SourceViewController.swift
//  01_stom_viewer
//
//  Created by wei on 2022/7/5.
//

import Cocoa

class SourceViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet weak var tableView: NSTableView!
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get a list of all files in our bundle's resource path
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        
        vw.textField?.stringValue = pictures[row]
        
        return vw
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1 else { return }
        
        guard let splitVC = parent as? NSSplitViewController else {
            return
        }
        
        if let detail = splitVC.children[1] as? DetailViewController {
            detail.imageSelected(name: pictures[tableView.selectedRow])
        }
        
    }
}
