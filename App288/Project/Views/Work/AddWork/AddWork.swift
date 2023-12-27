//
//  AddWork.swift
//  App288
//
//  Created by IGOR on 21/12/2023.
//

import SwiftUI

struct AddWork: View {
    
    @StateObject var viewModel: WorkViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                
                ZStack {
                    
                    Text("Add a work")
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
                        
                        Text("Name company")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Value")
                                .foregroundColor(viewModel.workCompany.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.workCompany.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.workCompany)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                        .padding(.bottom)
                        
                        Text("Work type")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Manager")
                                .foregroundColor(viewModel.workStatus.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.workStatus.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.workStatus)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                        .padding(.bottom)
                        
                        Text("Work from, time:")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("09:00")
                                .foregroundColor(viewModel.workFrom.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.workFrom.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.workFrom)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                        .padding(.bottom)
                        
                        Text("Work to, time:")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("19:00")
                                .foregroundColor(viewModel.workTo.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.workTo.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.workTo)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                        .padding(.bottom)
                        
                        Button(action: {
                            
                            viewModel.companies.append(viewModel.workCompany)
                            
                            viewModel.addWork(completion: {
                                
                                viewModel.workCompany = ""
                                
                                viewModel.workStatus = ""
                                viewModel.workFrom = ""
                                viewModel.workTo = ""
                                
                                viewModel.fetchWorks()
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
                        .opacity(viewModel.workCompany.isEmpty || viewModel.workStatus.isEmpty || viewModel.workFrom.isEmpty || viewModel.workTo.isEmpty ? 0.3 : 1)
                        .disabled(viewModel.workCompany.isEmpty || viewModel.workStatus.isEmpty || viewModel.workFrom.isEmpty || viewModel.workTo.isEmpty ? true : false)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddWork(viewModel: WorkViewModel())
}
