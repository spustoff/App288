//
//  AddSalary.swift
//  App288
//
//  Created by IGOR on 20/12/2023.
//

import SwiftUI

struct AddSalary: View {
    
    @StateObject var viewModel: SalaryViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                
                ZStack {
                    
                    Text("Add a salary")
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
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        Text("Company")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Menu(content: {
                            
                            ForEach(viewModel.companies, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentCompany = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentCompany.isEmpty {
                                
                                HStack {
                                    
                                    Text("Select company")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                }
                                
                            } else {
                                
                                HStack {
                                    
                                    Text(viewModel.currentCompany)
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16, weight: .regular))
                                }
                            }
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                        .padding(.bottom)
                        
                        Text("Date of Payment")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Value")
                                .foregroundColor(viewModel.payDate.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.payDate.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.payDate)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                        .padding(.bottom)
                        
                        Text("Amount")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Value")
                                .foregroundColor(viewModel.payAmount.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.payAmount.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.payAmount)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                        .padding(.bottom)
                        
                        Button(action: {
                            
                            viewModel.earned += Int(viewModel.payAmount) ?? 0
                            
                            viewModel.addPayment(payCompany: viewModel.currentCompany, completion: {
                                
                                viewModel.payDate = ""
                                
                                viewModel.payAmount = ""
                                
                                viewModel.currentCompany = ""
                                
                                viewModel.fetchPayments()
                            })
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        })
                        .opacity(viewModel.currentCompany.isEmpty || viewModel.payAmount.isEmpty || viewModel.payDate.isEmpty ? 0.3 : 1)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddSalary(viewModel: SalaryViewModel())
}
