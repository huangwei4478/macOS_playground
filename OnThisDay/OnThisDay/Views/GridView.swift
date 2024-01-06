//
//  GridView.swift
//  OnThisDay
//
//  Created by wei on 2024/1/6.
//

import SwiftUI

struct GridView: View {
  
  var gridData: [Event]
  
  var columns: [GridItem] {
    [GridItem(.adaptive(minimum: 250, maximum: 250))]
  }
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 15) {
        ForEach(gridData) {
          EventView(event: $0)
            .frame(height: 350, alignment: .topLeading)
            .background()
            .clipped()
            .border(.secondary, width: 1)
            .padding(.bottom, 5)
            .shadow(color: .primary.opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 3, y: 3)
        }
      }
    }
    .padding(.vertical)
  }
}
