//  FilmsListView.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import SwiftUI

struct FilmListView: View {
    @Environment(FilmStampingService.self) var stampedFilms
    @StateObject var filmListVM = FilmListViewModel(service: RealFilmService())

    let columns = Array(repeating: GridItem(.flexible()), count: 2)

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    if filmListVM.films.isEmpty {
                        ProgressView()
                    }
                    ForEach(filmListVM.films) { film in
                        NavigationLink {
                            FilmDetailView(filmDetailVM: FilmDetailViewModel(film: film))
                        } label: {
                            ZStack {
                                AsyncImage(url: film.image) {
                                    image in
                                    image
                                        .resizable()
                                        .scaledToFit()
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
//                                    .frame(width: 150, height: 100)
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
                }
                .padding(10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.cream)
            .navigationBarTitle("Ghibli Guide", displayMode: .inline)
//                                    .navigationTitle("Ghibli Guide")
            .toolbar {
                ToolbarItemGroup() {
                    NavigationLink(destination: Info()) {
                        Image(systemName: "info.circle")
                    }
                    Spacer()
                }
            }
//            .toolbarColorScheme(.dark)
        }
//        .foregroundStyle(.white)
        .accentColor(.oakLeaf)
        .task {
            await filmListVM.loadData()
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    FilmListView()
        .environment(FilmStampingService())
}
