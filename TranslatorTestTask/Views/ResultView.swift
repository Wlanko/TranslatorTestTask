//
//  TranslationView.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 27.02.2025.
//

import SwiftUI

struct ResultView: View {
    var from: String
    var animal: Animals
    var showTranslation: Binding<Bool> = Binding.constant(true)
    var wordCount: Int
    
    private let resultModel = ResultViewModel()
    
    var body: some View {
        ZStack {
            Background()
            
            VStack {
                HStack(alignment: .center) {
                    Button {
                        showTranslation.wrappedValue = false
                    } label: {
                        ZStack{
                            Circle()
                                .frame(width: 48, height: 48)
                                .tint(Color.white)
                                .padding(.vertical, 5)
                            
                            Image("Close")
                                .resizable()
                                .scaledToFit()
                                .frame(width: scale(28), height: scale(28))
                        }
                    }
                    
                    Spacer()
                    
                    Title("Result")
                        .frame(height: 58, alignment: .bottom)
                    
                    
                    Spacer()
                    
                    Circle()
                        .frame(width: 48, height: 48)
                        .hidden()
                }
                .frame(height: 58)
                
                if from == "PET" {
                    VStack {
                        CustomText(animal.fromPetSpeachTranslator(wordCount))
                            .frame(width: scale(291), height: scale(142))
                            .background(Color(hex: "#D6DCFF"))
                            .cornerRadius(scale(16))
                            .padding(.top, scale(91))
                            .shadow(color: Color.black.opacity(0.2), radius: 4, y: 4)
                            .fixedSize()
                        
                        HStack {
                            Spacer()
                            Triangle()
                                .fill(Color(hex: "#D6DCFF")!)
                                .frame(width: scale(142), height: scale(71))
                                .shadow(color: Color.black.opacity(0.2), radius: 4, y: 8)
                                .padding(.top, scale(-15))
                        }
                        
                        
                        
                    }
                } else {
                    Button {
                        resultModel.playSounds(animal, wordCount)
                    } label: {
                        HStack {
                            Image("Rotate - Right")
                            
                            CustomText("Repeat")
                        }
                        .frame(width: scale(291), height: scale(54))
                        .background(Color(hex: "#D6DCFF"))
                        .cornerRadius(scale(16))
                        .shadow(color: Color.black.opacity(0.2), radius: 4, y: 4)
                        .padding(.top, scale(198))
                    }
                    .onAppear() {
                        resultModel.playSounds(animal, wordCount)
                    }
                }
                
                Spacer()
                
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: scale(184), height: scale(184))
                    .padding(.bottom, scale(134))
                
            }
            .padding()
        }
    }
}

#Preview {
    ResultView(from: "HUMAN", animal: .cat, wordCount: 0)
}
