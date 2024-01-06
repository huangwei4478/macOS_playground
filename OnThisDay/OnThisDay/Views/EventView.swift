//
//  EventView.swift
//  OnThisDay
//
//  Created by wei on 2024/1/6.
//

import SwiftUI

struct EventView: View {
  
  var event: Event
  
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 30) {
        Text(event.year)
          .font(.title)
        Text(event.text)
          .font(.title3)
        
        VStack(alignment: .leading, spacing: 10) {
          Text("Related Links: ")
            .font(.title2)
          
          ForEach(event.links) { link in
            Link(link.title, destination: link.url)
              .onHover(perform: { hovering in
                if hovering {
                  NSCursor.pointingHand.push()
                } else {
                  NSCursor.pop()
                }
              })
          }
        }
        
        Spacer()
      }
      Spacer()
    }
    .padding()
    .frame(width: 250)
  }
}

#Preview {
  EventView(event: Event.sampleEvent)
}
