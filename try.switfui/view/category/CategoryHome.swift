//
//  CategoryHome.swift
//  try.switfui
//
//  Created by Oster Huang on 10/01/2023.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State var showingProfile = false
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                        .aspectRatio(3 / 2, contentMode: .fit)
                        .listRowInsets(EdgeInsets())
                    
                    ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, categoryLandmarks: modelData.categories[key]!)
                            .padding(.vertical)
                            .padding(.horizontal)
                    }
                    
                }
            }.listRowInsets(EdgeInsets())
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
