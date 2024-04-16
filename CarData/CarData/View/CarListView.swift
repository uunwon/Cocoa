//
//  CarListView.swift
//  CarData
//
//  Created by uunwon on 4/16/24.
//

import SwiftUI

struct CarListView: View {
    @State private var viewModel = CarListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.) { car in
                NavigationLink(car.name, value: car)
            }
            .navigationTitle("TopGear")
            .navigationDestination(for: Car.self) { car in
                CarDetailView(car: car)
            }
        }
    }
}

#Preview {
    CarListView()
}
