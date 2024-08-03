//
//  LoadingView.swift
//  WeatherSwift
//
//  Created by Luciano dii Souza on 03/08/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth:. infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
