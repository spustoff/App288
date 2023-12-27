//
//  R3.swift
//  App288
//
//  Created by IGOR on 15/12/2023.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R3")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.top, 30)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text("Payment control")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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
            .frame(maxHeight: .infinity, alignment: .leading)
            .padding()
        }
    }
}

#Preview {
    R3()
}
