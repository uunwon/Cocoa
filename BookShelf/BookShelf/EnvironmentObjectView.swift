//
//  EnvironmentObjectView.swift
//  BookShelf
//
//  Created by uunwon on 6/17/24.
//

import SwiftUI

class UserProfile: ObservableObject {
    @Published var name: String
    @Published var favouriteProgrammingLanguage: String
    @Published var favouriteColor: Color
    
    init(name: String, favouriteProgrammingLanguage: String, favouriteColor: Color) {
        self.name = name
        self.favouriteProgrammingLanguage = favouriteProgrammingLanguage
        self.favouriteColor = favouriteColor
    }
}

struct EnvironmentObjectView: View {
    @StateObject var profile = UserProfile(name: "Peter", favouriteProgrammingLanguage: "Swift", favouriteColor: .pink)
    @State var isSettingShown = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Form {
                Section {
                    Text("This is just some random data")
                    Text("Let's assume this was the main screen of an app")
                    Text("Tap the cog icon to go to Bed")
                }
            }
            HStack {
                Text("Sign in as \(profile.name)")
                    .foregroundStyle(Color(UIColor.systemBackground))
                Spacer()
            }
            .padding(30)
            .background(profile.favouriteColor)
        }
        .ignoresSafeArea(edges: .bottom) // 아래쪽 safe Area 를 ignore
        .navigationTitle("@EnvironmentObject")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: showSetting) {
                    Image(systemName: "gearshape")
                }
            }
        }
        .sheet(isPresented: $isSettingShown) {
            NavigationStack {
                SettingScreen()
            }
            .environmentObject(profile)
        }
    }
    
    func showSetting() {
        isSettingShown.toggle()
    }
}

#Preview {
    NavigationStack {
        EnvironmentObjectView()
    }
}
