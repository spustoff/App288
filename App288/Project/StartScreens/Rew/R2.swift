//
//  R2.swift
//  App288
//
//  Created by IGOR on 15/12/2023.
//

import SwiftUI

struct R2: View {
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.bottom, 30)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text("Your activity")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .center)
                
                NavigationLink(destination: {
                    
                    R3()
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
    R2()
}
