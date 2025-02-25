//
//  ContentView.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 22.02.2025.
//

import SwiftUI
import AVFoundation

struct TranslatorView: View {
    @State private var translateFrom: String = "HUMAN"
    @State private var translateTo: String = "PET"
    @State private var selectedAnimal: Animals = .cat
    
    var body: some View {
        ZStack{
            Background()
            
            VStack() {
                Title("Translator")
                
                HStack {
                    Text(translateFrom)
                        .font(Font.custom("Konkhmer Sleokchher", size: 16))
                        .frame(width: scale(135), height: scale(61))
                    
                    
                    Button {
                        let swap = translateFrom
                        translateFrom = translateTo
                        translateTo = swap
                    } label: {
                        Image("arrow-swap-horizontal")
                    }
                    
                    Text(translateTo)
                        .font(Font.custom("Konkhmer Sleokchher", size: 16))
                        .frame(width: scale(135), height: scale(61))
                    
                }
                .frame(height: scale(61))
                
                HStack{
                    Button {
                        
                    } label: {
                        ZStack {
                            VStack{
                                Image("microphone")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: scale(70), height: scale(70))
                                    .padding(.top, scale(44))
                                
                                Text("Start Speak")
                                    .font(Font.custom("Konkhmer Sleokchher", size: 16))
                                    .padding(.top, scale(24))
                                    .padding(.bottom, scale(16))
                                    .tint(Color(hex: "#292D32"))
                            }
                        }
                    }
                    .frame(width: scale(178), height: scale(176))
                    .background(.white)
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.2), radius: 4)
                    
                    VStack(alignment: .center, spacing: scale(12)) {
                        ForEach(Animals.allCases, id: \.self) { animal in
                            Button {
                                selectedAnimal = animal
                            } label: {
                                ZStack{
                                    Rectangle()
                                        .frame(width: scale(70), height: scale(70))
                                        .tint(Color(hex: animal.hexBackgroundColor))
                                        .cornerRadius(8)
                                    
                                    Image(animal.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: scale(40), height: scale(40))
                                }
                                .frame(width: scale(83), height: scale(70))
                                .padding(.horizontal, scale(12))
                                .opacity(selectedAnimal == animal ? 1 : 0.6)
                                
                            }
                        }
                        
                    }
                    .frame(width: scale(107), height: scale(176))
                    .background(.white)
                    .cornerRadius(16)
                    .padding(.leading, scale(35))
                    .shadow(color: Color.black.opacity(0.2), radius: 4)
                }
                .padding(.top, scale(58))
                
                Image(selectedAnimal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: scale(184), height: scale(184))
                    .padding(.top, scale(51))
                    
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    TranslatorView()
}
