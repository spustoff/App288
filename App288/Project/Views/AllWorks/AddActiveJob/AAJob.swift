//
//  AAJob.swift
//  App288
//
//  Created by IGOR on 24/12/2023.
//

import SwiftUI
import CoreData

struct AAJob: View {
    
    @StateObject var viewModel: AllWorkViewModel
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
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("Back")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                    }
                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Text("Name company")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Value")
                            .foregroundColor(viewModel.activeName.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.activeName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.activeName)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                    .padding(.bottom)
                    
                    Text("Post")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Post")
                            .foregroundColor(viewModel.activePost.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.activePost.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.activePost)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                    .padding(.bottom)
                    
                    Text("Adopted")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("12.12.2023")
                            .foregroundColor(viewModel.activeAdopted.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.activeAdopted.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.activeAdopted)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                    .padding(.bottom)
                    
                    Text("Salary")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("$200")
                            .foregroundColor(viewModel.activeSalary.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.activeSalary.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.activeSalary)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                            .keyboardType(.decimalPad)
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                    .padding(.bottom)
                    
                    Text("Work schedule, from:")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("09:00")
                            .foregroundColor(viewModel.activeWorkFrom.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.activeWorkFrom.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.activeWorkFrom)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                    .padding(.bottom)
                    
                    Text("Work schedule, to:")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("19:00")
                            .foregroundColor(viewModel.activeWorkTo.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.activeWorkTo.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.activeWorkTo)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                    .padding(.bottom)
                    
                    Button(action: {
                        
                        viewModel.addActive(completion: {
                            
                            viewModel.activeName = ""
                            viewModel.activePost = ""
                            viewModel.activeAdopted = ""
                            viewModel.activeSalary = ""
                            viewModel.activeWorkFrom = ""
                            viewModel.activeWorkTo = ""
                            
                            viewModel.fetchActive()
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
                    .opacity(viewModel.activeName.isEmpty || viewModel.activePost.isEmpty || viewModel.activeSalary.isEmpty || viewModel.activeWorkFrom.isEmpty || viewModel.activeWorkTo.isEmpty || viewModel.activeAdopted.isEmpty ? 0.3 : 1)
                    .disabled(viewModel.activeName.isEmpty || viewModel.activePost.isEmpty || viewModel.activeSalary.isEmpty || viewModel.activeWorkFrom.isEmpty || viewModel.activeWorkTo.isEmpty || viewModel.activeAdopted.isEmpty ? true : false)
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    AAJob(viewModel: AllWorkViewModel())
}
