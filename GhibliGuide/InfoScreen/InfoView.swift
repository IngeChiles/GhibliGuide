//  InfoView.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 6/4/24.

import SwiftUI

/// Displays about section.
struct InfoView: View {

    /// Enables use of openURL for embedding link in "Ghibli API & License Info" button.
    @Environment(\.openURL) var openURL

    /// About section with brief summary and instructions for app use.
    private let infoText =
    """
    This is an iOS application for fans of Studio Ghibli films. All
    aboard the cat bus!

    Users can scroll through a display of Ghibli films, learning
    about each film as they go. If a user has seen a given film,
    they can mark it as "watched" with a cute Totoro stamp.

    Disclaimer: I am in no way affiliated with Studio Ghibli. All
    films and characters in this app are property of Studio Ghibli.
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
                    .accessibilityHidden(true)

                Text(infoText)
                    .font(
                        .custom(
                            "CactusClassicalSerif-Regular",
                            size: 20
                        )
                    )
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)

                Button("Ghibli API & License Info") {
                    openURL(URL(string: "https://ghibliapi.vercel.app/")!)
                }
                .buttonStyle(.borderedProminent)
                .accentColor(.forest)
                .padding(.top, 20)

            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.cloud)

        }
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.oakLeaf)
    }
}

#Preview {
    InfoView()
}
