//
//  AddTask.swift
//  App288
//
//  Created by IGOR on 21/12/2023.
//

import SwiftUI

struct AddTask: View {
    
    @StateObject var viewModel: WorkViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                
                ZStack {
                    
                    Text("Add a task")
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
                        
                        HStack {
                            
                            Text(viewModel.currentCompany)
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                        }
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                    .padding(.bottom)
                    
                    Text("Name task")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Value")
                            .foregroundColor(viewModel.taskName.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.taskName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.taskName)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                    .padding(.bottom)
                    
                    Text("Term")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Days")
                                .foregroundColor(viewModel.taskDays.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.taskDays.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.taskDays)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                        .padding(.bottom)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Times")
                                .foregroundColor(viewModel.taskTime.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.taskTime.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.taskTime)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                        .padding(.bottom)
                        
                    }
                    
                    Text("Term")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("5 hours")
                            .foregroundColor(viewModel.taskLong.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.taskLong.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.taskLong)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                    .padding(.bottom)
                    
                    Text("Description")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Value")
                            .foregroundColor(viewModel.taskDescription.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.taskDescription.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.taskDescription)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                    .padding(.bottom)
                    
                    Button(action: {
                        
                        viewModel.addTask(selectedCompany: viewModel.currentCompany, completion: {
                            
                            viewModel.currentCompany = ""
                            
                            viewModel.taskName = ""
                            viewModel.taskDays = ""
                            viewModel.taskTime = ""
                            viewModel.taskLong = ""
                            viewModel.taskDescription = ""
                            
                            viewModel.fetchTasks()
                        })
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                    })
                    .opacity(viewModel.currentCompany.isEmpty || viewModel.taskName.isEmpty || viewModel.taskDays.isEmpty || viewModel.taskTime.isEmpty || viewModel.taskDescription.isEmpty || viewModel.taskLong.isEmpty ? 0.3 : 1)
                    .disabled(viewModel.currentCompany.isEmpty || viewModel.taskName.isEmpty || viewModel.taskDays.isEmpty || viewModel.taskTime.isEmpty || viewModel.taskDescription.isEmpty || viewModel.taskLong.isEmpty ? true : false)
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddTask(viewModel: WorkViewModel())
}
