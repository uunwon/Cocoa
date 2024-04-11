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
    // 생성자도 함수야, 기본값은 nil 이고 -> 그럼 classification 없는 애까지 만들어줌
    init(name: String, classification: [Species]? = nil) { // 옵셔널이기 때문에 nil 한거임
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
            
//            List {
//                OutlineGroup(Animals, id: \.id, children: \.classification) { creature in
//                    Text(creature.name)
//                }
//            }
        }
    }
}

#Preview {
    OutlineGroupView()
}
