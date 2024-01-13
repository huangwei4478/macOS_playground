//
//  OnThisDayApp.swift
//  OnThisDay
//
//  Created by wei on 2024/1/6.
//

import SwiftUI

@main
struct OnThisDayApp: App {
  
  @StateObject var appState = AppState()
  
  @AppStorage("displayMode") var displayMode = DisplayMode.auto
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(appState)
        .onAppear {
          DisplayMode.changeDisplayMode(to: displayMode)
        }
        .onChange(of: displayMode) { _, newValue in
          DisplayMode.changeDisplayMode(to: newValue)
        }
    }
    .commands {
      Menus()
    }
  }
}
