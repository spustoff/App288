//
//  SettingsView.swift
//  App288
//
//  Created by IGOR on 20/12/2023.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://docs.google.com/document/d/1Vj1oYtSaGHN7AX5NllJ6d2ie9i9gakTuULcXnnjRtQU/edit?usp=sharing") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        VStack(spacing: 10) {
                            
                            Image(systemName: "doc")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Usage Policy")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 170)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                    })
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        VStack(spacing: 10) {
                            
                            Image(systemName: "star")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Rate Us")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 170)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
