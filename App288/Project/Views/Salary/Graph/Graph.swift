//
//  Graph.swift
//  App288
//
//  Created by IGOR on 20/12/2023.
//

import SwiftUI

struct Graph: View {
    
    @StateObject var viewModel = SalaryViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.current_currency)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom)
                
                Text("Currency value")
                    .foregroundColor(.white.opacity(0.5))
                    .font(.system(size: 12, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    Text("$\(String(format: "%.2f", Double(.random(in: 30...70))))")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Text("+$\(String(format: "%.2f", Double(.random(in: 30...70))))")
                        .foregroundColor(.green)
                        .font(.system(size: 12, weight: .regular))
                    
                    Spacer()
                }
                
                Image("Graph")
                    .resizable()
                    .padding(.bottom)
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Back")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.red))
                    })
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Apply")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.green))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Graph()
}
