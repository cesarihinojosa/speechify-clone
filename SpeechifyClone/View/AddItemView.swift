//
//  AddItemView.swift
//  SpeechifyClone
//
//  Created by Cesar Hinojosa on 2/14/26.
//

import SwiftUI

struct AddItemView: View {
    @State private var title: String = ""
    @State private var content: String = ""
    @Environment(\.dismiss) var dismiss
    var onAdd: (String, String) -> Void //understand this better
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Title", text: $title)
                TextEditor(text: $content)
            }
            .toolbar {
                ToolbarItem (placement: .topBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem (placement: .topBarLeading) {
                    Button("Add") {
                        onAdd(title, content)
                        dismiss()
                    }
                    .disabled(title.isEmpty || content.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddItemView{title, content in }
}
