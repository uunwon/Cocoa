//
//  NavigationLinkView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/11/24.
//

import SwiftUI

// struct FileView: View {
//    var choice: String
//    
//    var body: some View {
//        VStack {
//            Text(" choose = ✨ \(choice) ✨")
//        }
//    }
//}

struct Movie: Identifiable, Hashable {
    let id = UUID() // 타입이 아니고 난수 부여라서 '=' 작성
    let title: String
    let description: String
}

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = [ // 이벤트 발생했을 때 게시하도록 도와줌 @Published
        Movie(title: "Movie 1", description: "Movie Description 1"),
        Movie(title: "Movie 2", description: "Movie Description 2"),
        Movie(title: "Movie 3", description: "Movie Description 3")
    ]
}

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            Text(movie.title)
                .font(.title)
            Text(movie.description)
                .padding()
        }
    }
}

class ShareString: ObservableObject {
        @Published var message = ""
}

struct FileView: View {
    @EnvironmentObject var choice: ShareString
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                TextField("Type here: ", text: $choice.message)
                Spacer()
            }
            Spacer()
        }.background(Color.yellow)
    }
}

struct NavigationLinkView: View {
    // 뷰를 넘나들 때 다 사용할 수 있도록, 그 상태가 계-속 유지되도록 하는게 StateObject
    // 그냥 State 면 이 뷰가 사라지면 사라지는 변수가 되거든 ‼️
    // @StateObject private var viewModel = MovieListViewModel() // movies 배열을 가진 객체
    // @State var message = ""
    @StateObject var showMe = ShareString() // 객체 인스턴스를 생성하기 때문에 () 씀
    
    var body: some View {
        NavigationStack {
            
            // ✨ 다른 뷰를 호출해서 불러옴
//            NavigationLink(destination: FileView(choice: "Head")) {
//                Text("Choose Head")
//                    .foregroundStyle(Color.black)
//            }
            
            // ✨ 리스트마다 다른 뷰로 이동하기
//            List(viewModel.movies) { movie in // 각각 요소 가져오기
//                NavigationLink(movie.title, value: movie)
//            }
//            .navigationTitle("Movie List")
//            .navigationDestination(for: Movie.self) { movie in
//                MovieDetailView(movie: movie)
//            }
            
            TextField("Type here:", text: $showMe.message)
            NavigationLink(destination: FileView()) {
                Text("Heads")
            }
            NavigationLink(destination: SeparateFile()) {
                Text("Tails")
            }
            .navigationTitle("Flip a Coin")
        }
        .environmentObject(showMe)
    }
}

#Preview {
    NavigationLinkView()
}
