//  FilmsListView.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import SwiftUI

/// The film list screen: the initial screen of the app.
struct FilmListView: View {

    /// Environment variable for `FilmStampingService`, used to stamp and un-stamp films.
    /// Inherited from `GhibliGuideApp`.
    @Environment(FilmStampingService.self) private var stampedFilms

    /// Instantiation of the View Model with `RealFilmService` also instantiated and injected as a dependency.
    @State var filmListVM = FilmListViewModel(service: RealFilmService())

    /// An array of 2 columns for displaying `Film` objects within a LazyVGrid.
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
            .conditionalTheme()
            .navigationBarTitle("Ghibli Guide", displayMode: .large)
            .toolbar {
                ToolbarItemGroup {
                    NavigationLink(destination: InfoView()) {
                        Image(systemName: "info.circle")
                    }
                    .accessibilityLabel("Info Page")
                    .accessibilityIdentifier("infoScreenButton")
                }
            }
        }
        .conditionalTheme()
        .task {
            await filmListVM.loadData()
        }
        .alert("Oops! 🙀", isPresented: $filmListVM.errorAlert) {
        } message: {
            Text("Something went wrong. Please check your connection and try again.")
        }
    }
}

#Preview {
    FilmListView()
        .environment(FilmStampingService())
}
