//
//  ContentView.swift
//  Markdowner
//
//  Created by wei on 2024/1/25.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: MarkdownerDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(MarkdownerDocument()))
}
