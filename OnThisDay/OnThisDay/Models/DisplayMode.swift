//
//  DisplayMode.swift
//  OnThisDay
//
//  Created by wei on 2024/1/13.
//

import SwiftUI

enum DisplayMode: String, CaseIterable {
  case light = "Light"
  case dark = "Dark"
  case auto = "Auto"
  
  static func changeDisplayMode(to mode: DisplayMode) {
    @AppStorage("displayMode") var displayMode = DisplayMode.auto
    
    displayMode = mode
    
    switch mode {
    case .light:
      NSApp.appearance = NSAppearance(named: .aqua)
    case .dark:
      NSApp.appearance = NSAppearance(named: .darkAqua)
    case .auto:
      NSApp.appearance = nil
    }
  }
}
