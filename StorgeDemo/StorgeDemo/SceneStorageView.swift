//
//  SceneStorageView.swift
//  StorgeDemo
//
//  Created by uunwon on 4/22/24.
//

import SwiftUI

struct SceneStorageView: View {
    // 윈도우 크기 조절
    @SceneStorage("mytext") private var editorText: String = ""
    
    var body: some View {
        TextEditor(text: $editorText)
            .padding(38)
            .font(.largeTitle)
    }
}

#Preview {
    SceneStorageView()
}
