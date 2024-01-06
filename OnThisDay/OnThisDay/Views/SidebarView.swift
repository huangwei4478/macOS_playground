//
//  SidebarView.swift
//  OnThisDay
//
//  Created by wei on 2024/1/6.
//

import SwiftUI

struct SidebarView: View {
  
  @Binding var selection: EventType?
  
  var body: some View {
    List(selection: $selection) {
      Section("TODAY") {
        ForEach(EventType.allCases, id: \.self) {
          type in
          Text(type.rawValue)
        }
      }
    }
    .listStyle(.sidebar)
  }
}

