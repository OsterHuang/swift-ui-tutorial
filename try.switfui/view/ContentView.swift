//
//  ContentView.swift
//  try.switfui
//
//  Created by Oster Huang on 07/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CategoryHome()
                .environmentObject(ModelData())
                .tabItem {
                    Label("Feature", systemImage: "star")
                }
            LandmarkList()
                .environmentObject(ModelData())
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
    }
}
