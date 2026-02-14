//
//  HomeView.swift
//  SpeechifyClone
//
//  Created by Cesar Hinojosa on 2/13/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            Image("speechify")
                .resizable()
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    HomeView()
}
