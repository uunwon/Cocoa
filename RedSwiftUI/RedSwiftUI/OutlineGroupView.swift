//
//  OutlineGroupView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/11/24.
//

import SwiftUI

class Species: Identifiable {
    let id = UUID()
    var name: String
    var classification: [Species]?
    init(name: String, classification: [Species]? = nil) {
        self.name = name
        self.classification = classification
    }
}

@available(iOS 15.0, *)
struct OutlineGroupView: View {
    var Animals: [Species] = [
        Species(name: "포유류", classification: [
            Species(name: "개", classification: [
                Species(name: "Poodle"),
                Species(name: "Collie"),
                Species(name: "St. Bernard"),
            ]),
            Species(name: "고양이"),
            Species(name: "코끼리"),
            Species(name: "고래"),
        ]),
        Species(name: "조류", classification: [
            Species(name: "Canary"),
            Species(name: "Parakeet"),
            Species(name: "Eagle"),
        ]),
    ]
    
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("Outline Group")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
        }
//        List {
//            OutlineGroup(Animals, id: \.id, childer: \.classification { creature in
//                Text(creature.name)
//            })
//        }
    }
}

#Preview {
    OutlineGroupView()
}
