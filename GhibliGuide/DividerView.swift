//  DividerView.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import SwiftUI

struct DividerView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .frame(width: 300, height: 4)
            .foregroundStyle(.walnut)
    }
}

#Preview {
    DividerView()
}
