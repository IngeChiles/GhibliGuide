//  InfoView.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 6/4/24.

import SwiftUI

struct InfoView: View {
    let infoText = """
    Follows young Luke Skywalker as he joins forces \
    with Princess Leia, Han Solo, and Obi-Wan Kenobi \
    to battle the oppressive Galactic Empire and destroy \
    its superweapon, the Death Star. Guided by the Force, \
    Luke becomes a hero in the Rebel Alliance's quest \
    to bring peace to the galaxy.
    """
    var body: some View {
        ScrollView {
            VStack {
                Text("About")
                    .font(
                        .custom(
                            "CactusClassicalSerif-Regular",
                            size: 40
                        )
                    )
                
                Image("stick-divider")
                    .padding(.top, -20)
                
                Text(infoText)
                    .font(
                        .custom(
                            "CactusClassicalSerif-Regular",
                            size: 20
                        )
                    )
                    .padding(.top, 10)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.cloud)
        }
        .background(.oakLeaf)
    }
}

#Preview {
    InfoView()
}
