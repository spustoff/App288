//
//  SalaryView.swift
//  App288
//
//  Created by IGOR on 20/12/2023.
//

import SwiftUI

struct SalaryView: View {
    
    @StateObject var viewModel = SalaryViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                
                HStack {
                    
                    ForEach(viewModel.months, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentMonth = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(viewModel.currentMonth == index ? .white : .gray)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.currentMonth == index ? Color("bg3") : .white.opacity(0.2)))
                        })
                    }
                }
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("Earned all the time")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .semibold))
                        
                        Text("$\(viewModel.earned)")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Currencies()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        HStack {
                            
                            Text(viewModel.current_currency)
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .medium))
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .regular))
                        }
                    })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                
                HStack {
                    
                    Text("Payments")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .bold))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        AddSalary(viewModel: viewModel)
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 20, weight: .regular))
                    })
                }
                
                if viewModel.payments.isEmpty {
                    
                    VStack {
                        
                        Text("There are no payments")
                            .foregroundColor(.gray.opacity(0.3))
                            .font(.system(size: 22, weight: .semibold))
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.payments, id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        
                                        Text("$\(index.payAmount)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .medium))
                                        
                                        Text(index.payCompany ?? "")
                                            .foregroundColor(.white.opacity(0.4))
                                            .font(.system(size: 12, weight: .medium))
                                    }
                                    
                                    Spacer()
                                    
                                    Text(index.payDate ?? "")
                                        .foregroundColor(.white.opacity(0.4))
                                        .font(.system(size: 14, weight: .medium))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchPayments()
        }
    }
}

#Preview {
    SalaryView()
}
