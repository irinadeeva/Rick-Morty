//
//  LoadingView.swift
//  Rick&Morty
//
//  Created by Irina Deeva on 23/10/24.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        VStack {
            ProgressView()
            Text("Loading ...")
                .padding()
        }
    }
}

#Preview {
    LoadingView()
}
