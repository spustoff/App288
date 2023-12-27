//
//  APJob.swift
//  App288
//
//  Created by IGOR on 24/12/2023.
//

import SwiftUI
import CoreData

struct APJob: View {
    
    @StateObject var viewModel: AllWorkViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                
                ZStack {
                    
                    Text("New jobs")
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
                            .foregroundColor(viewModel.pastName.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.pastName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.pastName)
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
                            .foregroundColor(viewModel.pastPost.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.pastPost.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.pastPost)
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
                            .foregroundColor(viewModel.pastAdopted.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.pastAdopted.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.pastAdopted)
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
                        
                        Text("Enter")
                            .foregroundColor(viewModel.pastSalary.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.pastSalary.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.pastSalary)
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
                            .foregroundColor(viewModel.pastWorkFrom.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.pastWorkFrom.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.pastWorkFrom)
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
                            .foregroundColor(viewModel.pastWorkTo.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.pastWorkTo.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.pastWorkTo)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                    .padding(.bottom)
                    
                    Button(action: {
                        
                        viewModel.addPast(completion: {
                            
                            viewModel.pastName = ""
                            viewModel.pastPost = ""
                            viewModel.pastAdopted = ""
                            viewModel.activeSalary = ""
                            viewModel.pastWorkFrom = ""
                            viewModel.pastWorkTo = ""
                            
                            viewModel.fetchPast()
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
                    .opacity(viewModel.pastName.isEmpty || viewModel.pastPost.isEmpty || viewModel.pastSalary.isEmpty || viewModel.pastAdopted.isEmpty || viewModel.pastWorkFrom.isEmpty || viewModel.pastWorkTo.isEmpty ? 0.3 : 1)
                    .disabled(viewModel.pastName.isEmpty || viewModel.pastPost.isEmpty || viewModel.pastSalary.isEmpty || viewModel.pastAdopted.isEmpty || viewModel.pastWorkFrom.isEmpty || viewModel.pastWorkTo.isEmpty ? true : false)
                    
                }
            }
            .padding()
        }
    }
}
#Preview {
    APJob(viewModel: AllWorkViewModel())
}
