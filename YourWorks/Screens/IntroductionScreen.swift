//
//  IntroductionScreen.swift
//  YourWorks
//
//  Created by Alimmz on 10/31/25.
//

import SwiftUI

struct IntroductionScreen: View {
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("IntroductionImage")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .clipped()
                .ignoresSafeArea(edges: .horizontal)
            
            VStack {
                Spacer()
                
                Text("Task Management & To-Do List")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .frame(width: 247)
                
                Spacer().frame(height: 20)
                
                Text("This productive tool is designed to help you better manage your task project-wise conveniently!")
                    .foregroundColor(AppColors.secondary)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .frame(width: 266)
                
                Spacer().frame(height: 40)
                
                Button(action: {
                    router.navigate(to: .home)
                }) {
                    ZStack {
                        Text("Let’s Start")
                            .font(.title3)
                            .bold()
                        
                        HStack {
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.title3)
                                .bold()
                        }
                        .padding(.horizontal, 16)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                }
                .buttonStyle(.plain)
                .glassEffect(.regular.tint(AppColors.primary).interactive())
            }
            .padding()
        }
    }
}

#Preview {
    IntroductionScreen()
}
