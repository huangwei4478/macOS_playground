//
//  ContentView.swift
//  OnThisDay
//
//  Created by wei on 2024/1/6.
//

import SwiftUI

struct ContentView: View {
  
  @State private var eventType: EventType? = .events
  
  @EnvironmentObject var appState: AppState
  
  @State private var searchText = ""
  
  var events: [Event] {
    appState.dataFor(eventType: eventType, searchText: searchText)
  }
  
  var body: some View {
    NavigationView {
      SidebarView(selection: $eventType)
        .frame(width: 200)
      GridView(gridData: events)
    }
    .frame(
      minWidth: 700,
      idealWidth: 1000,
      maxWidth: .infinity,
      minHeight: 400,
      idealHeight: 800,
      maxHeight: .infinity
    )
    .toolbar {
      Toolbar()
    }
    .searchable(text: $searchText)
  }
}

#Preview {
  ContentView()
}
