import SwiftUI

struct SeparateFile: View {
    @EnvironmentObject var passedData: ShareString // 같은 스택 안에서 공유되는 EnvironmentObject
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                TextField("Type here", text: $passedData.message)
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    // SeparateFile(passedData: .constant("")) // constant 는 가짜로 부모를 만듦
    SeparateFile().environmentObject(ShareString())
}
