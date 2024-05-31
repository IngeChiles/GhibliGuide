//  ContentView.swift
//  GhibliGuide
//  Made with ♥︎ by Inge Chiles on 5/30/24.

import SwiftUI

struct ContentView: View {
    @StateObject var filmListVM = FilmsListViewModel(service: RealFilmsService())

    let columns = Array(repeating: GridItem(.flexible()), count: 2)

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
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
                                } placeholder: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 140, height: 200)
                                        .aspectRatio(1, contentMode: .fit)
                                        .overlay {
                                            ProgressView()
                                        }
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.cream)
            .navigationTitle("Ghibli Guide")
            .foregroundStyle(.walnut)
        }
        .task {
            await filmListVM.loadData()
        }
    }
}

#Preview {
    ContentView()
}
