//
//  ContentView.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 22.02.2025.
//

import SwiftUI

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
                        .frame(width: 135, height: 61)
                    
                    
                    Button {
                        let swap = translateFrom
                        translateFrom = translateTo
                        translateTo = swap
                    } label: {
                        Image("arrow-swap-horizontal")
                    }
                    
                    Text(translateTo)
                        .font(Font.custom("Konkhmer Sleokchher", size: 16))
                        .frame(width: 135, height: 61)
                    
                }
                .frame(height: 61)
                
                HStack {
                    Button {
                        
                    } label: {
                        ZStack {
                            VStack{
                                Image("microphone")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                    .padding(.top, 44)
                                
                                Text("Start Speak")
                                    .font(Font.custom("Konkhmer Sleokchher", size: 16))
                                    .padding(.top, 24)
                                    .padding(.bottom, 16)
                                    .tint(Color(hex: "#292D32"))
                            }
                        }
                    }
                    .frame(width: 178, height: 176)
                    .background(.white)
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.2), radius: 4)
                    
                    VStack(alignment: .center, spacing: 12) {
                        ForEach(Animals.allCases, id: \.self) { animal in
                            Button {
                                selectedAnimal = animal
                            } label: {
                                ZStack{
                                    Rectangle()
                                        .frame(width: 70, height: 70)
                                        .tint(Color(hex: animal.hexBackgroundColor))
                                        .cornerRadius(8)
                                    
                                    Image(animal.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                }
                                .frame(width: 83, height: 70)
                                .padding(.horizontal, 12)
                                .opacity(selectedAnimal == animal ? 1 : 0.6)
                                
                            }
                        }
                        
                    }
                    .frame(width: 107, height: 176)
                    .background(.white)
                    .cornerRadius(16)
                    .padding(.leading, 35)
                    .shadow(color: Color.black.opacity(0.2), radius: 4)
                }
                .padding(.top, 58)
                
                Image(selectedAnimal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 184, height: 184)
                    .padding(.top, 51)
                    
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    TranslatorView()
}
