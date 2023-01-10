//
//  CategoryRow.swift
//  try.switfui
//
//  Created by Oster Huang on 10/01/2023.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var categoryLandmarks: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.bottom, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categoryLandmarks) {landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryRowLandmark(landmark: landmark)
                        }
                    }
                }
            }
        }.frame(height: 185)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var category = Landmark.Category.lakes
    
    static var previews: some View {
        CategoryRow(
            categoryName: category.rawValue,
            categoryLandmarks: landmarks.filter { landmark in
                landmark.category.rawValue == category.rawValue
            }
        )
    }
}
