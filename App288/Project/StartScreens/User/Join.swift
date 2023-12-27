//
//  Join.swift
//  App288
//
//  Created by IGOR on 19/12/2023.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Join")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.bottom, 70)
            }
            
            VStack(spacing: 5) {
                
                Text("Join and earn")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                
                Text("Join our Telegram group trade with our team")
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .regular))
                
                Button(action: {
                    
                    UIApplication.shared.open(telegram)
                    
                }, label: {
                    
                    Text("Join")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 0/255, green: 163/255, blue: 255/255)))
                })
                .padding(.top, 50)

            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Not()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                            .frame(width: 30, height: 30)
                            .background(Circle().fill(.white.opacity(0.2)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Join(telegram: URL(string: "h")!)
}
