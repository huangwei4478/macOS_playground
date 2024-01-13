//
//  Menus.swift
//  OnThisDay
//
//  Created by wei on 2024/1/13.
//

import SwiftUI

struct Menus: Commands {
  
  @AppStorage("showTotals") var showTotals = true
  @AppStorage("displayMode") var displayMode = DisplayMode.auto
  
  var body: some Commands {
    SidebarCommands()
    ToolbarCommands()
    
    CommandGroup(before: .help) {
      Button("ZenQuotes.io web side") {
        showAPIWebsite()
      }
      .keyboardShortcut("/", modifiers: .command)
    }
    
    CommandMenu("Display") {
      Toggle(isOn: $showTotals) {
        Text("Show Totals")
      }
      .keyboardShortcut("t", modifiers: .command)
      
      // more menu items go here
      Divider()
      
      Picker("Appearance", selection: $displayMode) {
        ForEach(DisplayMode.allCases, id: \.self) {
          Text($0.rawValue)
            .tag($0)
        }
      }
    }
  }
  
  func showAPIWebsite() {
    let address = "https://today.zenquotes.io"
    guard let url = URL(string: address) else {
      fatalError("Invalid address")
    }
    
    NSWorkspace.shared.open(url)
  }
}
