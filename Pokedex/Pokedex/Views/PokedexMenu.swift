//
//  PokedexMenu.swift
//  Pokedex
//
//  Created by Alisson Inácio on 23/04/24.
//

import SwiftUI

struct PokedexMenu: View {
    
    @State var pokemon = [PokemonEntry]()
    @State var search = ""
    
    var body: some View {
        NavigationView{
            List{
                ForEach(search == "" ? pokemon : pokemon.filter({
                    $0.name.contains(search.lowercased())
                })){ entry in
                    HStack{
                        PokemonImage(imageLink: "\(entry.url)")
                            .padding(.trailing, 20)
                        NavigationLink("\(entry.name)".capitalized,
                                       destination: Text("Detalhes do \(entry.name)"))
                    }
                }
            }
            
        }
                .onAppear{
            PokeApi().getData() {pokemon in
                self.pokemon = pokemon
            }
        }
        .searchable(text: $search)
        .navigationTitle("Pokedex")
        .navigationBarBackButtonHidden()
        
    }
    
}

#Preview {
    PokedexMenu()
}
