//
//  LibraryViewModel.swift
//  SpeechifyClone
//
//  Created by Cesar Hinojosa on 2/13/26.
//
import Foundation
import Combine
import SwiftUI

class LibraryViewModel: ObservableObject {
    var textItems: [TextItem] = []
    var search: String = ""
    var filteredTextItems: [TextItem] = []
    var addItem: Bool = false
    var sortByNewest: Bool = false
    let playbackEngine: PlaybackEngine = PlaybackEngine()
    
    init(){
        createData()
    }
    
    func createData(){
        textItems = [
            TextItem(title: "Dracula", text: "Among the rugged peaks that frown down upon the Borgo Pass are found crumbling castles of a bygone age"),
            TextItem(title: "Atomic Habits", text: "All big things come from small beginnings. The seed of every habit is a single, tiny decision. But as that decision is repeated, a habit sprouts and grows stronger."),
            TextItem(title: "The Fountainhead", text: "He stood naked at the edge of a cliff. The lake lay far below him. A frozen explosion of granite burst in flight to the sky over motionless water. The water seemed immovable, the stone flowing."),
            TextItem(title: "1984", text: "The opening describes a cold April day with clocks striking thirteen."),
            TextItem(title: "A Tale of Two Cities", text: "Begins with the observation that happy families are alike but unhappy ones differ."),
            TextItem(title: "Pride and Prejudice", text: "Starts with a wry remark about wealthy single men needing wives.")
        ]
    }
    
    func deleteTextItem(indexSet: IndexSet){
        textItems.remove(atOffsets: indexSet)
    }
    
}
