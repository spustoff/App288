//
//  AllWorksView.swift
//  App288
//
//  Created by IGOR on 20/12/2023.
//

import SwiftUI

struct AllWorksView: View {
    
    @StateObject var viewModel = AllWorkViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        AAJob(viewModel: viewModel)
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 18, weight: .regular))
                    })
                }
                
                Text("Active jobs")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if viewModel.actives.isEmpty {
                    
                    VStack {
                        
                        Text("Add your current place of work")
                            .foregroundColor(.gray.opacity(0.4))
                            .font(.system(size: 18, weight: .semibold))
                            .multilineTextAlignment(.center)
                    }
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom)
                    
                } else {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHStack {
                            
                            ForEach(viewModel.actives, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    Text(index.activeAdopted ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .semibold))
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    
                                    Text(index.activeName ?? "")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 22, weight: .semibold))
                                    
                                    
                                    Text(index.activePost ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                    Text(index.activeSalary ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                }
                                .padding()
                                .frame(width: 180)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                            }
                        }
                    }
                    .frame(height: 200)
                    .padding(.bottom)
                }
                
                HStack {
                    
                    Text("Past work")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        APJob(viewModel: viewModel)
                            .navigationBarBackButtonHidden()
                        
                    }, label:{
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 18, weight: .regular))
                    })
                }
                
                if viewModel.pasts.isEmpty {
                    
                    VStack {
                        
                        Text("No previous jobs have been added")
                            .foregroundColor(.gray.opacity(0.4))
                            .font(.system(size: 18, weight: .semibold))
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.pasts, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    HStack {
                                        
                                        Text(index.pastName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        Text("\(index.pastWorkFrom ?? "")-\(index.pastWorkTo ?? "")")
                                            .foregroundColor(.white.opacity(0.2))
                                            .font(.system(size: 14, weight: .medium))
                                    }
                                    
                                    Text(index.pastPost ?? "")
                                        .foregroundColor(.white.opacity(0.2))
                                        .font(.system(size: 14, weight: .medium))
                                    
                                    Text("$\(index.pastSalary ?? "")")
                                        .foregroundColor(.white.opacity(0.2))
                                        .font(.system(size: 14, weight: .medium))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                            }
                        }
                        
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchActive()
        }
        .onAppear {
            
            viewModel.fetchPast()
        }
    }
}

#Preview {
    AllWorksView()
}
