//
//  AnimalImageView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/8/24.
//

import SwiftUI

extension Color {
    static let myCustomColor = Color(red: 0.6, green: 0.8, blue: 0.3)
}

struct AnimalImageView: View {
    var body: some View {
        VStack {
                        // ✨ 이미지 크기 조정, 크롭(자르기, 원형)
                         Image("sample_dog_square")
                             .resizable()
                             .frame(width: 100, height: 100)
                             .aspectRatio(contentMode: .fill)
             
                         Image("sample_cat_square")
                             .resizable()
                             .frame(width: 100, height: 100)
                             .aspectRatio(contentMode: .fill)
                             .clipShape(Circle())
            

                        // ✨ 이미지 그림자 효과
                         Image("sample_dog_square")
                             .resizable()
                             .frame(width: 100, height: 100)
                             .aspectRatio(contentMode: .fill)
                             .shadow(color: .black, radius: 46, x: 0, y: 0)
             
                         Image("sample_cat_square")
                             .resizable()
                             .frame(width: 100, height: 100)
                             .aspectRatio(contentMode: .fill)
                             .clipShape(Circle())
                             .shadow(color: .gray, radius: 46, x: 90, y: 50)
            
            
                        Image(systemName: "heart.fill")
                            // 색상 넣기 1️⃣: Asset Color scheme 사용
                            .foregroundStyle(Color("custom_wine"))
                            .padding(.top)
            
                        let customColor = Color(red: 0, green: 0, blue: 1)
                        Image(systemName: "heart.fill")
                            // 색상 넣기 2️⃣: 지역 상수 사용
                            .foregroundStyle(customColor)
            
                        Image(systemName: "heart.fill")
                            // 색상 넣기 3️⃣: 전역 상수 사용
                            .foregroundStyle(Color.myCustomColor)
                            .padding(.bottom)
            

                        // ✨ 이미지 테두리 오버레이
                         Image("sample_dog_square")
                             .resizable()
                             .frame(width: 100, height: 100)
                             .aspectRatio(contentMode: .fill)
                             .shadow(color: .black, radius: 46, x: 0, y: 0)
                             .overlay(Rectangle().stroke(Color.black, lineWidth: 2))
             
                         Image("sample_cat_square")
                             .resizable()
                             .frame(width: 100, height: 100)
                             .aspectRatio(contentMode: .fill)
                             .clipShape(Circle())
                             .shadow(color: .gray, radius: 46, x: 90, y: 50)
                             .overlay(Circle().stroke(Color.black, lineWidth: 2))

            
                        // ✨ 이미지 투명도 조절
                         Image("sample_dog_square")
                             .resizable()
                             .frame(width: 100, height: 100)
                             .aspectRatio(contentMode: .fill)
                             .opacity(0.5)

                         Image("sample_cat_square")
                             .resizable()
                             .frame(width: 100, height: 100)
                             .aspectRatio(contentMode: .fill)
                             .opacity(0.25)

        }
    }
}

#Preview {
    AnimalImageView()
}
