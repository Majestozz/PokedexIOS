//
//  WebService.swift
//  Pokedex
//
//  Created by Alisson Inácio on 24/04/24.
//

import Foundation
import Alamofire

let url = "https://pokeapi.co/api/v2/pokemon?limit=151&offset=0"


struct Todo: Codable{
    let id: Int
    let name: String
    let url: String
}

    AF.request(url).responseJSON{ response in
        switch response.result{
        case .success(let value):
            print("response data:\(value)")
        case .failure(let error):
            print("error: \(error.localizedDescription)")
    }
}
