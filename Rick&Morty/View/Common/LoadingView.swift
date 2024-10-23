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
            Text("Loading")
                .padding(EdgeInsets(top: 0, leading: 8.0, bottom: 0, trailing: 8.0))
        }
    }
}

#Preview {
    LoadingView()
}
