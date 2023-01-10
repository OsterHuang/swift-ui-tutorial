//
//  CategoryItem.swift
//  try.switfui
//
//  Created by Oster Huang on 10/01/2023.
//

import SwiftUI

struct CategoryRowLandmark: View {
    var landmark: Landmark
    
    var body: some View {
        VStack {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(15)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
    }
}

struct CategoryRowLandmark_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRowLandmark(landmark: landmarks[3])
    }
}
