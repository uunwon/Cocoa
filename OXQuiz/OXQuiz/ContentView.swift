//
//  ContentView.swift
//  OXQuiz
//
//  Created by uunwon on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var number1: Int = 4
    @State var number2: Int = 2
    @State var resultNumber: Int = 9
    
    @State var countCorrect: Int = 0
    @State var countWrong: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            Text("다음 수식은 맞을까요?")
            Spacer()
            Text("\(number1) x \(number2) = \(resultNumber)")
            Spacer()
            
            HStack {
                Spacer()
                // 맞은 버튼
                Button {
                    selectCorrect()
                    reloadGame()
                } label: {
                    Image(systemName: "checkmark.diamond.fill")
                    Text("맞음")
                        .bold()
                }
                .foregroundStyle(.green)
                Spacer()
                // 틀린 버튼
                Button {
                    selectWrong()
                    reloadGame()
                } label: {
                    Image(systemName: "xmark.diamond")
                    Text("틀림")
                        .bold()
                }
                .foregroundStyle(.red)
                Spacer()
            }
            
            HStack {
                Spacer()
                Text("\(countCorrect)개 맞춤")
                Spacer()
                Text("\(countWrong)개 틀림")
                Spacer()
            }
            
            Spacer()
            Button("카운트 초기화") {
                countCorrect = 0
                countWrong = 0
            }
            Spacer()
        }
        .padding()
        .onAppear() {
            reloadGame()
        }
    }
    
    // ✨ 게임 재시작 로직
    func reloadGame() {
        print("새로운 게임의 시작")
        number1 = Int.random(in: 1...10)
        number2 = Int.random(in: 1...10)
        
        // 확률을 반반하기 싫을 때, 분배하고 싶을 때
        let seedNumber = Int.random(in: 0..<10)
        // if seedNumber < 8 -> 80%, else -> 20%
        
        if Bool.random() {
            // 50% 실행 - 옳은 결과
            resultNumber = number1 * number2
        } else {
            // 50% - 잘못된 결과
            repeat {
                resultNumber = Int.random(in: 1...100)
            } while resultNumber == number1 * number2
            // -> 오답이 출력되어야 repeat..while 문이 끝난다 !!
        }
    }
    
    // ✨ 정답 선택 시 로직
    func selectCorrect() {
        if resultNumber == number1 * number2 {
            countCorrect += 1
        } else {
            countWrong += 1
        }
    }
    
    // ✨ 오답 선택 시 로직
    func selectWrong() {
        if resultNumber == number1 * number2 {
            countWrong += 1
        } else {
            countCorrect += 1
        }
    }
}

#Preview {
    ContentView()
}
