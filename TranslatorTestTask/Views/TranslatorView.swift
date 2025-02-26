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
    @State private var showUnauthoriedAlert: Bool = false
    
    private let viewModel: TranslatorViewModel = TranslatorViewModel()
    
    var body: some View {
        ZStack{
            Background()
            
            VStack() {
                Title("Translator")
                
                HStack {
                    CustomText(translateFrom, size: scale(16))
                        .frame(width: scale(135), height: scale(61))
                    
                    
                    Button {
                        let swap = translateFrom
                        translateFrom = translateTo
                        translateTo = swap
                    } label: {
                        Image("arrow-swap-horizontal")
                    }
                    
                    CustomText(translateTo, size: scale(16))
                        .frame(width: scale(135), height: scale(61))
                    
                }
                .frame(height: scale(61))
                
                HStack{
                    Button {
                        viewModel.startRecording(showUnauthorizedAlert: $showUnauthoriedAlert)
                    } label: {
                        ZStack {
                            VStack{
                                Image("microphone")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: scale(70), height: scale(70))
                                    .padding(.top, scale(44))
                                
                                CustomText("Start Speak", size: scale(16))
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
                    .alert(isPresented: $showUnauthoriedAlert) {
                        Alert(
                            title: Text("Enable Microphone Access"),
                            message: Text("This app needs access to your microphone to work properly."),
                            primaryButton: .cancel(Text("Cancel")),
                            secondaryButton: .default(Text("Settings")) {
                                if let url = URL(string: UIApplication.openSettingsURLString) {
                                        UIApplication.shared.open(url)
                                    }
                            }
                        )
                        
                    }
                    
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
        .onAppear {
            viewModel.getPermission()
        }
    }
}

#Preview {
    TranslatorView()
}
