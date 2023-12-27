//
//  Not.swift
//  App288
//
//  Created by IGOR on 19/12/2023.
//

import SwiftUI
import OneSignalFramework

struct Not: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Not")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.bottom, 70)
            }
            
            VStack(spacing: 5) {
                
                Text("Don’t miss anything")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))

                Text("Don’t miss the most userful information")
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .regular))
                
                Button(action: {
                    
                    OneSignal.Notifications.requestPermission({ accepted in
                      print("User accepted notifications: \(accepted)")
                    }, fallbackToSettings: true)
                    
                }, label: {
                    
                    Text("Enable Notifications")
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
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
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
    Not()
}
