//
//  ContentView.swift
//  Networking
//
//  Created by Rishabh Sharma on 18/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .task {
            viewModel.postDataWithParam()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
