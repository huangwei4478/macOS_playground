//
//  MarkdownerApp.swift
//  Markdowner
//
//  Created by wei on 2024/1/25.
//

import SwiftUI

@main
struct MarkdownerApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: MarkdownerDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
