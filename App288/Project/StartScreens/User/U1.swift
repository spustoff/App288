//
//  U1.swift
//  App288
//
//  Created by IGOR on 15/12/2023.
//

import SwiftUI

struct U1: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.bottom, 70)
            }
            
            VStack(spacing: 5) {
                
                Text("Your income")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))

                Text("is your control")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                
                Text("Your professional earning tool")
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .regular))
                
                NavigationLink(destination: {
                    
                    Reviews(telegram: telegram, isTelegram: isTelegram)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
                .padding(.top, 50)

            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding()
        }
    }
}

#Preview {
    U1(telegram: URL(string: "h")!, isTelegram: false)
}
