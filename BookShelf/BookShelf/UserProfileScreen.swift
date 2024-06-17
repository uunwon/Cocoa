//
//  UserProfileScreen.swift
//  BookShelf
//
//  Created by uunwon on 6/17/24.
//

import SwiftUI

struct UserProfileScreen: View {
    @EnvironmentObject var profile: UserProfile
    
    var body: some View {
        VStack(alignment: .leading) {
            Form {
                Section(header: Text("User Profile")) {
                    TextField("Name", text: $profile.name)
                    TextField("Favourite Programming Languate", text: $profile.favouriteProgrammingLanguage)
                    ColorPicker("Favourite Color", selection: $profile.favouriteColor)
                }
            }
        }
        .navigationTitle("User Profile")
    }
}

#Preview {
    NavigationStack {
        UserProfileScreen()
    }
    .environmentObject(UserProfile(name: "Peter", favouriteProgrammingLanguage: "Swift", favouriteColor: .pink))
    
}
