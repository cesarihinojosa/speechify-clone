//
//  TextItem.swift
//  SpeechifyClone
//
//  Created by Cesar Hinojosa on 2/13/26.
//
import Foundation

struct TextItem: Identifiable {
    let id: String = UUID().uuidString
    var title: String
    var text: String
    let timeStamp: Date
    
    init(title: String, text: String,) {
        self.title = title
        self.text = text
        timeStamp = Date()
    }
}
