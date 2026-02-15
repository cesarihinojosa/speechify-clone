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
    @Published var textItems: [TextItem] = []
    @Published var search: String = ""
    @Published var filteredTextItems: [TextItem] = []
    @Published var addItem: Bool = false
    @Published var sortByNewest: Bool = false
    @Published var showAddItemSheet: Bool = false
    
    init(){
        // set up testing data
        textItems = [
            TextItem(title: "Dracula", text: "Among the rugged peaks that frown down upon the Borgo Pass are found crumbling castles of a bygone age"),
            TextItem(title: "Atomic Habits", text: "All big things come from small beginnings. The seed of every habit is a single, tiny decision. But as that decision is repeated, a habit sprouts and grows stronger."),
            TextItem(title: "The Fountainhead", text: "He stood naked at the edge of a cliff. The lake lay far below him. A frozen explosion of granite burst in flight to the sky over motionless water. The water seemed immovable, the stone flowing."),
            TextItem(title: "1984", text: "The opening describes a cold April day with clocks striking thirteen."),
            TextItem(title: "A Tale of Two Cities", text: "Begins with the observation that happy families are alike but unhappy ones differ."),
            TextItem(title: "Pride and Prejudice", text: "Starts with a wry remark about wealthy single men needing wives.")
        ]
        filteredTextItems = textItems
        
        $search
            .combineLatest($textItems, $sortByNewest)
            .debounce(for: .milliseconds(200), scheduler: RunLoop.main)
            .map{ search, textItems, sortByNewest in // seperate this into funcs
                var result = textItems
                if search == "" {
                    result = result
                }
                else {
                    result = []
                    for textItem in textItems {
                        if textItem.title.localizedCaseInsensitiveContains(search) {
                            result.append(textItem)
                        }
                    }
                }
                result.sort { a, b in
                    if sortByNewest {
                        a.timeStamp > b.timeStamp
                    } else {
                        a.timeStamp < b.timeStamp
                    }
                }
                return result
            }
            .assign(to: &$filteredTextItems)
    }
    
    func addTextItem(title: String, content: String){
        textItems.append(TextItem(title: title, text: content))
    }
    
    func deleteTextItem(indexSet: IndexSet){
        textItems.remove(atOffsets: indexSet)
    }
    
}
