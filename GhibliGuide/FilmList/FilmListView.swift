//  FilmsListView.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import SwiftUI

/// Displays a scrollable grid of film objects.
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
                            .accessibilityLabel("Loading film list.")
                    }
                    ForEach(filmListVM.films) { film in
                        NavigationLink {
                            FilmDetailView(filmDetailVM: FilmDetailViewModel(film: film))
                        } label: {
                            FilmCell(film: film)
                        }
                    }
                }
                .padding(10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.cream)
            .navigationBarTitle("Ghibli Guide", displayMode: .large)
            .toolbar {
                ToolbarItemGroup {
                    NavigationLink(destination: InfoView()) {
                        Image(systemName: "info.circle")
                    }
                    .accessibilityLabel("Info Page")
                    Spacer()
                }
            }
        }
        .accentColor(.forest)
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
