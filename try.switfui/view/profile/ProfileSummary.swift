//
//  ProfileSummary.swift
//  try.switfui
//
//  Created by Oster Huang on 10/01/2023.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile = Profile.default
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .font(.title)
                    .bold()
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
            }
            
            Spacer()
                .padding(.top, 32)
            
            VStack(alignment: .leading, content: {
                Text("Completed Badges")
                   .font(.headline)
                ScrollView(.horizontal) {
                    HStack {
                        HikeBadge(name: "First Hike")
                        HikeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                        HikeBadge(name: "Spread Day")
                            .hueRotation(Angle(degrees: 270))
                    }
                    .padding(.bottom)
                }
            })
            
            Spacer()
                .padding(.top, 32)

            VStack(alignment: .leading) {
                Text("Recent Hikes")
                    .font(.headline)

                HikeView(hike: modelData.hikes[0])
            }

        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary()
            .environmentObject(ModelData())
    }
}
