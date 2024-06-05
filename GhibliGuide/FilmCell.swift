//  FilmCell.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 6/5/24.

import SwiftUI

struct FilmCell: View {
    @Environment(FilmStampingService.self) var stampedFilms

    var film: Film

    var body: some View {
            ZStack {
                AsyncImage(url: film.image) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            if stampedFilms.contains(film) {
                                Rectangle()
                                    .foregroundStyle(.cloud)
                                    .opacity(0.5)
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 10, x: 5, y: 10)

                } placeholder: {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 170, height: 280)
                        .aspectRatio(1, contentMode: .fit)
                        .overlay {
                            ProgressView()
                        }
                }
                .padding(.bottom, 10)

                if stampedFilms.contains(film) {
                    Image("totoro-stamp-watched")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .accessibilityLabel("\(film) is stamped.")
                }

                Text(film.title)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 6)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.forest)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.cloud)
                    .offset(x: 0, y: 120)
                    .shadow(radius: 10, x: 5, y: 10)
            }
            .padding(3)
            .padding(.bottom, 40)
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

    return FilmCell(film: film)
        .environment(FilmStampingService())
}