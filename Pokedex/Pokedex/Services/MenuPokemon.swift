//
//  MenuPokemon.swift
//  Pokedex
//
//  Created by Alisson Inácio on 24/04/24.
//

import Foundation


struct MenuPokemon: Codable{
    var results: [PokemonEntry]
}

struct PokemonEntry: Codable, Identifiable{
    let id = UUID()
    var name: String
    var url: String
}

class PokeApi{
    func getData(completion: @escaping ([PokemonEntry]) -> ()){
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=251") else {
            return
        }
        
        URLSession.shared.dataTask(with: url){(data, response, error) in
            guard let data = data else {return}
            
            let pokemonList = try! JSONDecoder().decode(MenuPokemon.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
        }.resume()
    }
}
