//
//  ContentView.swift
//  Pokedex
//
//  Created by Alisson Inácio on 23/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Text("Seja Bem-Vindo Treinador!")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .lineSpacing(10)
                    .foregroundStyle(Color("redMain"))
                    .bold()
                Image(.groundonIntro)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 800, height: 400)
                Text("Comece a explorar tudo do maravilhoso mundo de Pokemon!!")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .lineSpacing(10)
                Spacer()
                NavigationLink(destination: PokedexMenu()){
                    ZStack{
                        Rectangle()
                            .frame(width: 200, height: 70)
                            .cornerRadius(20)
                            .foregroundStyle(Color("redMain"))
                        Text("Iniciar Pokedex")
                            .foregroundStyle(.white)
                    }
                    
                }
                
            }
            .background(Color("backgroundColor"))
        }
    }
}

#Preview {
    ContentView()
}
