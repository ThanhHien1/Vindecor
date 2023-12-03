//
//  DesignStyleView.swift
//  Vindecor
//
//  Created by Thanh Hien on 28/11/2023.
//

import SwiftUI

struct DesignStyleView: View {
    @ObservedObject var viewModel = DesignStyleViewModel()
    @Binding var path: NavigationPath
    @State private var showAlertDesignStyleView = false
    var body: some View {
//        NavigationView {
            ZStack {
                Color("EEE8DB")
                Color.clear
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 0) {
                    HStack(alignment: .center, spacing: 0) {
                        Image("home55")
                            .resizable()
                            .frame(width: 140, height: 90)
                            .padding(.leading, 3)
                        Spacer()
                        Image("home6")
                            .resizable()
                            .frame(width: 60, height: 60)
                        Spacer()
                        Image("home9")
                            .resizable()
                            .frame(width: 140, height: 90)
                    }
                    Text("NHU CẦU CỦA KHÁCH HÀNG")
                        .foregroundColor(.black)
                        .font(.custom("BungeeShade-Regular", size: 21))
                        .padding(.top, 60)
                    Spacer().frame(height: 60)
                    VStack {
                        EditTextField(title: "PHONG CÁCH THIẾT KẾ", color: "AB8776", text: $viewModel.style)
                        EditTextField(title: "BỐ CỤC NHÀ Ở", color: "C3A08D", text: $viewModel.layout)
                        EditTextField(title: "MÀU CHỦ ĐẠO", color: "C3A08D", text: $viewModel.color)
                        EditTextField(title: "HƯỚNG PHONG THỦY", color: "C3A08D", text: $viewModel.direction)
                        EditTextField(title: "NHU CẦU KHÁC", color: "A18971", text: $viewModel.other)
                        Spacer().frame(height: 50)
                        Button(action: {
                            viewModel.isNext(complete: {
                                showAlertDesignStyleView = true
                            }, completed:  {
                                path.append("ConfirmView")
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
                            .padding(.leading, 5)
                        Spacer()
                        VStack { Divider()}.frame(width: 40).background(.black).opacity(0.7)
                        Text("vindecor.com.vn")
                            .foregroundColor(.black)
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .padding(.horizontal, 5)
                        VStack { Divider()}.frame(width: 40).background(.black).opacity(0.7)
                        Spacer()
                        Image("home16")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .padding(.trailing, 5)
                    }
                }
                .padding(.top, 20)
//                .ignoresSafeArea(.keyboard)
                Spacer()
                
            }
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $showAlertDesignStyleView) {
            Alert(title: Text("Vui lòng điền đầy đủ thông tin"), message:  Text(""), dismissButton: .default(Text("OK")))
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct DesignStyleView_Previews: PreviewProvider {
    static var previews: some View {
        DesignStyleView(path: .constant(NavigationPath()))
    }
}
