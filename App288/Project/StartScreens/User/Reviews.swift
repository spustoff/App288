//
//  Reviews.swift
//  App288
//
//  Created by IGOR on 19/12/2023.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.bottom, 70)
            }
            
            VStack(spacing: 5) {
                
                Text("Rate our app in the AppStore")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .multilineTextAlignment(.center)

                Text("Don’t miss the most userful information")
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .regular))
                
                NavigationLink(destination: {
                    
                    if isTelegram == true {
                        
                        Join(telegram: telegram)
                            .navigationBarBackButtonHidden()
                        
                    } else if isTelegram == false {
                        
                        Not()
                            .navigationBarBackButtonHidden()
                    }
                    
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
        .onAppear{
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews(telegram: URL(string: "h")!, isTelegram: false)
}
