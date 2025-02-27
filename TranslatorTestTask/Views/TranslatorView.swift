//
//  ContentView.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 22.02.2025.
//

import SwiftUI
import AVFoundation

struct TranslatorView: View {
    var showTranslation: Binding<Bool>
    var wordCount: Binding<Int>
    var from: Binding<String>
    var animalToPass: Binding<Animals>
    
    @State private var translateFrom: String = "HUMAN"
    @State private var translateTo: String = "PET"
    @State private var selectedAnimal: Animals = .cat
    @State private var showUnauthoriedAlert: Bool = false
    @State private var isRecording: Bool = false
    @State var isTranslating: Bool = false
    
    private let viewModel: TranslatorViewModel = TranslatorViewModel()
    
    @ObservedObject var audioMonitor = AudioMonitor()
    
    var body: some View {
        ZStack{
            Background()
            
            VStack {
                if !isTranslating {
                    VStack {
                        Title("Translator")
                        
                        HStack {
                            CustomText(translateFrom, size: scale(16))
                                .frame(width: scale(135), height: scale(61))
                            Button {
                                let swap = translateFrom
                                translateFrom = translateTo
                                translateTo = swap
                                
                                from.wrappedValue = translateFrom
                                
                            } label: {
                                Image("arrow-swap-horizontal")
                            }
                            
                            CustomText(translateTo, size: scale(16))
                                .frame(width: scale(135), height: scale(61))
                            
                        }
                        .frame(height: scale(61))
                        
                        HStack{
                            Button {
                                if !isRecording {
                                    viewModel.isAuthorized(showUnauthorizedAlert: $showUnauthoriedAlert, $isRecording)
                                } else {
                                    isRecording = false
                                }
                            } label: {
                                if !isRecording {
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
                                } else {
                                    VStack {
                                        visualizeAudioLevels()
                                        CustomText("Recording...")
                                            
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
                                        animalToPass.wrappedValue = animal
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
                    }
                } else {
                    CustomText("Process of translation...")
                        .frame(height: scale(22))
                        .padding(.top, scale(343))
                        .padding(.bottom, scale(12))
                        .onAppear() {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                isTranslating = false
                            }
                        }
                        .onDisappear {
                            showTranslation.wrappedValue = true
                        }
                }
                
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
    TranslatorView(showTranslation: Binding.constant(false), wordCount: Binding.constant(0), from: Binding.constant("HUMAN"), animalToPass: Binding<Animals>.constant(.cat))
}
