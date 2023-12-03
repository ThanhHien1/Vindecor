//
//  EnterBudgetView.swift
//  Vindecor
//
//  Created by Thanh Hien on 28/11/2023.
//

import SwiftUI

struct EnterBudgetView: View {
    @ObservedObject var viewModel = EnterBudgetViewModel()
    @Binding var path: NavigationPath
    @State private var showAlert = false
    var body: some View {
            ZStack {
                Color("EEE8DB")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 0) {
                    HStack(alignment: .center, spacing: 0) {
                        Image("home55")
                            .resizable()
                            .frame(width: 140, height: 90)
                        Spacer()
                        Image("home6")
                            .resizable()
                            .frame(width: 60, height: 60)
                        Spacer()
                        Image("home9")
                            .resizable()
                            .frame(width: 140, height: 90)
                    }
                    Text("Ngân sách của khách hàng")
                        .font(.custom("BungeeShade-Regular", size: 21))
                        .foregroundColor(.black)
                        .padding(.top, 60)
                    Spacer().frame(height: 60)
                    VStack {
                        ZStack {
                            TextField("", text: $viewModel.budget)
                                .foregroundColor(.black)
                                .padding(.leading, 15)
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .foregroundColor(.black.opacity(0.7))
                                .frame(width: 25, height: 25)
                                .padding(.trailing, 20)
                                .frame(maxWidth: .infinity, alignment: .trailing)
//                            HStack {  Divider()}.background(.black)
////                                .padding(.trailing, -900)
////                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .frame(width: 350, height: 60)
                            .overlay(
                                HStack(spacing: 0) {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color("422716"), lineWidth: 2)
                                }
                            )
                            .background(.white)
                            .cornerRadius(20)
                        Spacer().frame(height: 50)
                        Button(action: {
                        viewModel.isNext(complete: {
                            showAlert = true
                        }, completed:  {
                            path.append("DesignStyleView")
                        })
                        }) {
                            Text("Tiếp ")
                                .foregroundColor(.white)
                                .frame(width: 150, height: 40)
                                .cornerRadius(10)
                                .background(Color("C3A08D"))
                        }
                    }
                    Spacer()
                    HStack(alignment: .center, spacing: 0) {
                        Image("home14")
                            .resizable()
                            .frame(width: 90, height: 90)
                        Spacer()
                        VStack { Divider()}.frame(width: 40).background(.black).opacity(0.7)
                        Text("vindecor.com.vn")
                            .foregroundColor(.black)
                            .font(.system(size: 13))
                            .fontWeight(.medium)
                            .padding(.horizontal, 5)
                        VStack { Divider()}.frame(width: 40).background(.black).opacity(0.7)
                        Spacer()
                        Image("home16")
                            .resizable()
                            .frame(width: 90, height: 90)
                    }
                }
                .padding(.top, 20)
                Spacer()
                
            }
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Vui lòng điền đầy đủ thông tin"), message: Text(""), dismissButton: .default(Text("OK")))
        }
    }
}


struct EnterBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        EnterBudgetView(path: .constant(NavigationPath()))
    }
}
