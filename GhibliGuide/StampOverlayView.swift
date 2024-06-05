//  StampOverlayView.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 6/2/24.

import SwiftUI

struct StampOverlayView: View {
    var body: some View {
        VStack {
            Image(systemName: "doc.richtext.ja")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.walnut)
                .background(.cream.opacity(0.7))
        }
    }
}

#Preview {
    StampOverlayView()
}
