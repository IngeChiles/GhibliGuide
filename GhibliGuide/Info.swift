//  Info.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 6/4/24.

import SwiftUI

struct Info: View {
    var body: some View {
        VStack {
            Text("Disclaimer, copyright for fonts")
                .font(.custom("CactusClassicalSerif-Regular", size: 20))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.oakLeaf)
        .foregroundStyle(.cloud)
    }
}

#Preview {
    Info()
}
