//
//  ContentView.swift
//  SpeechifyClone
//
//  Created by Cesar Hinojosa on 2/13/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Label("", systemImage: "house")
                }
            LibraryView()
                .tabItem{
                    Label("", systemImage: "books.vertical")
                }
            ScanView()
                .tabItem{
                    Label("", systemImage: "plus")
                }
            BooksView()
                .tabItem{
                    Label("", systemImage: "book")
                }
            AssistantView()
                .tabItem{
                    Label("", systemImage: "waveform.mid")
                }
        }
    }
}

#Preview {
    ContentView()
}
