//  FilmDetailView.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import SwiftUI

/// Displays detailView for film.
struct FilmDetailView: View {
    @Environment(FilmStampingService.self) var stampedFilms

    @StateObject var filmDetailVM: FilmDetailViewModel

    var body: some View {
        ScrollView {
            VStack {
                Image("stick-divider")
                    .accessibilityHidden(true)
                    .rotationEffect(.degrees(180))

                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: filmDetailVM.film.image) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(radius: 10, x: 5, y: 10)
                            .accessibilityLabel("Poster for \(filmDetailVM.film.title)")

                    } placeholder: {
                        RoundedRectangle(cornerRadius: 15)
                            .aspectRatio(1, contentMode: .fit)
                            .overlay {
                                ProgressView()
                            }
                    }

                    if stampedFilms.contains(filmDetailVM.film) {
                        Image("totoro-stamp-watched")
                            .accessibilityLabel("\(filmDetailVM.film.title) is stamped.")

                    }
                }
                .padding()

                VStack {
                    Button(stampedFilms.contains(filmDetailVM.film) ? "Remove stamp" : "Hey I've seen this one!") {
                        if stampedFilms.contains(filmDetailVM.film) {
                            stampedFilms.remove(filmDetailVM.film)
                        } else {
                            stampedFilms.add(filmDetailVM.film)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundStyle(.cloud)
                    .accentColor(.oakLeaf)
                    .padding(.bottom)

                    Text(filmDetailVM.film.title)
                        .fontWeight(.bold)
                        .font(.largeTitle)

                    Text("\"\(filmDetailVM.film.originalTitle)\"")
                        .fontWeight(.bold)
                        .font(.title)

                    Spacer()

                    Text("Director: \(filmDetailVM.film.director)")

                    Text("Released: \(filmDetailVM.film.releaseDate)")

                    Text("Runtime: \(filmDetailVM.film.runningTime) Minutes")

                    Spacer(minLength: 15)

                    Text("**Plot: \(filmDetailVM.film.description)**")
                        .font(.title3)
                }
                .multilineTextAlignment(.center)
                .foregroundStyle(.oakLeaf)
                .padding(20)

                Image("stick-divider")
            }
        }
        .background(.cream)
        .navigationBarTitle("", displayMode: .inline)
    }
}

#Preview {
    let film = Film(
        id: "2baf70d1-42bb-4437-b551-e5fed5a87abe",
        title: "Castle in the Sky",
        originalTitle: "天空の城ラピュタ",
        image: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg"),
        description: """
        The orphan Sheeta inherits a mysterious crystal \
        that links her to the mythical sky-kingdom of Laputa. \
        With the help of resourceful Pazu and a rollicking \
        band of sky pirates, she makes her way to the ruins \
        of the once-great civilization. Sheeta and Pazu must \
        outwit the evil Muska, who plans to use Laputa's science \
        to make himself ruler of the world.
        """,
        director: "Hayao Miyazaki",
        releaseDate: "1986",
        runningTime: "124")

    return FilmDetailView(filmDetailVM: FilmDetailViewModel(film: film))
        .environment(FilmStampingService())
}
