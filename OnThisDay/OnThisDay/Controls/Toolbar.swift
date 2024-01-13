//
//  Toolbar.swift
//  OnThisDay
//
//  Created by wei on 2024/1/13.
//

import SwiftUI

struct Toolbar: ToolbarContent {
  var body: some ToolbarContent {
    // 3
    ToolbarItem(placement: .navigation) {
      Button {
        toggleSidebar()
      } label: {
        Image(systemName: "sidebar.left")
      }
      .help("Toggle Sidebar")
    }
  }
  
  func toggleSidebar() {
    NSApp.keyWindow?
      .contentViewController?
      .tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)),
                    with: nil)
  }
}
