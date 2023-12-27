//
//  R1.swift
//  App288
//
//  Created by IGOR on 15/12/2023.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.bottom, 30)
            }
            
            VStack(alignment: .center, spacing: 5) {
                
                Text("Your employment")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("is your control")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                
                NavigationLink(destination: {
                    
                    R2()
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
    R1()
}
