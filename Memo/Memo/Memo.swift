//
//  Memo.swift
//  Memo
//
//  Created by uunwon on 4/23/24.
//

import Foundation
import SwiftUI
import SwiftData

// ✨ Memo 모델은 메모의 내용, 색상, 생성 날짜를 포함한다
@Model
class Memo {
    var id: UUID
    var text: String
    var colorHex: String // Color 지원 X -> String 사용해 색상 표현
    var created: Date
    
    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: created)
        }
    }
    
    init(id: UUID = UUID(), text: String, colorHex: String, created: Date) {
        self.id = id
        self.text = text
        self.colorHex = colorHex
        self.created = created
    }
    
    var color: Color {
        Color(hex: colorHex)
    }
}
