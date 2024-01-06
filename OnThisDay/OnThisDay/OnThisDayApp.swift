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
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(appState)
    }
  }
}
