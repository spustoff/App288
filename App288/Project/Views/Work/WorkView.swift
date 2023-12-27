//
//  WorkView.swift
//  App288
//
//  Created by IGOR on 20/12/2023.
//

import SwiftUI

struct WorkView: View {
    
    @StateObject var viewModel = WorkViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        AddWork(viewModel: viewModel)
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 18, weight: .regular))
                    })
                }
                
                Text("Work")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if viewModel.works.isEmpty {
                    
                    VStack {
                        
                        Text("Add a job")
                            .foregroundColor(.gray)
                            .font(.system(size: 18, weight: .semibold))
                    }
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                    .padding(.bottom)
                    
                } else {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHStack {
                            
                            ForEach(viewModel.works, id: \.self) { index in
                                
                                VStack(spacing: 10) {
                                    
                                    Text(index.workCompany ?? "")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 18, weight: .semibold))
                                    
                                    Text(index.workStatus ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                    Text("\(index.workFrom ?? "") - \(index.workTo ?? "")")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .medium))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                            }
                        }
                    }
                    .frame(height: 200)
                    .padding(.bottom)
                }
                
                HStack {
                    
                    Text("Tasks")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        AddTask(viewModel: viewModel)
                            .navigationBarBackButtonHidden()
                        
                    }, label:{
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 18, weight: .regular))
                    })
                    .disabled(viewModel.works.isEmpty ? true : false)
                }
                
                if viewModel.tasks.isEmpty {
                    
                    VStack {
                        
                        Text("Empty")
                            .foregroundColor(.gray)
                            .font(.system(size: 18, weight: .semibold))
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.tasks, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    Text(index.taskName ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Text(index.selectedCompany ?? "")
                                        .foregroundColor(.white.opacity(0.2))
                                        .font(.system(size: 14, weight: .medium))
                                    
                                    Text(index.taskTime ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .medium))
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                            }
                        }
                        
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchTasks()
        }
        .onAppear {
            
            viewModel.fetchWorks()
        }
    }
}

#Preview {
    WorkView()
}
