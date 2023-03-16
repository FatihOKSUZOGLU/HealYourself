//
//  ContentView.swift
//  HealYourself
//
//  Created by Fatih OKSUZOGLU on 16.03.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hosgeldin Dadlum Iceri Gir")
            Button("Iceri") {
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
