//  FilmDetailView.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import SwiftUI

struct FilmDetailView: View {
    @StateObject var filmDetailVM: FilmDetailViewModel

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: filmDetailVM.image) {
                    image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            placeholder: {
                RoundedRectangle(cornerRadius: 15)
                    .aspectRatio(1, contentMode: .fit)
                    .overlay {
                        ProgressView()
                    }
            }
            .padding()

                DividerView()

                VStack {
                    Text(filmDetailVM.title)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    Text("\"\(filmDetailVM.original_title)\"")
                        .fontWeight(.bold)
                        .font(.title)
                    Text("Dir: \(filmDetailVM.director)")
                    Text(filmDetailVM.release_date)
                    Text("Runtime: \(filmDetailVM.run_time) Minutes")

                    DividerView()

                    Text("Plot: \(filmDetailVM.description)")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                }
                .padding(20)
            }
        }
    }
}

#Preview {
    let film = Film(
        id: "2baf70d1-42bb-4437-b551-e5fed5a87abe",
        title: "Castle in the Sky",
        original_title: "天空の城ラピュタ",
        image: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg"),
        description: """
        The orphan Sheeta inherited a mysterious/
        crystal that links her to the mythical sky-kingdom of/
        Laputa. With the help of resourceful Pazu and a /
        rollicking band of sky pirates, she makes her way/
        to the ruins of the once-great civilization. Sheeta and/
        Pazu must outwit the evil Muska, who plans to use/
        Laputa's science to make himself ruler of the world.
        """,
        director: "Hayao Miyazaki",
        release_date: "1986",
        running_time: "124")

    return FilmDetailView(filmDetailVM: FilmDetailViewModel(film: film))
}
