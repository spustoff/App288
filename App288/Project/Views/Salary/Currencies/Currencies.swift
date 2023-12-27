//
//  Currencies.swift
//  App288
//
//  Created by IGOR on 20/12/2023.
//

import SwiftUI

struct Currencies: View {
    
    @StateObject var viewModel = SalaryViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Currency pair")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 15) {
                        
                        ForEach(viewModel.currencies, id: \.self) { index in
                            
                            NavigationLink(destination: {
                                
                                Graph()
                                    .navigationBarBackButtonHidden()
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .medium))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                            })
                            .onTapGesture {
                                
                                viewModel.current_currency = index
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    Currencies()
}
