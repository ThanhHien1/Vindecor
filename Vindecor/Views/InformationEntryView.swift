//
//  InformationEntryView.swift
//  Vindecor
//
//  Created by Thanh Hien on 28/11/2023.
//

import SwiftUI

struct InformationEntryView: View {
    @ObservedObject var viewModel = InformationEnTryViewModel()
    @State private var showAlert = false
    @Binding var path: NavigationPath
    var body: some View {
            ZStack {
                Color("EEE8DB")
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
//                    .padding(.top, -10)
                    Text("Thông tin cá nhân")
                        .foregroundColor(.black)
                        .font(.custom("BungeeShade-Regular", size: 21))
                        .foregroundColor(.black)
                        .padding(.top, 60)
                    Spacer().frame(height: 60)
                    VStack {
                        EditTextField(title: "TÊN", color: "AB8776", text: $viewModel.name)
                        EditTextField(title: "ĐỊA CHỈ", color: "C3A08D", text: $viewModel.address)
                        EditTextField(title: "SỐ ĐIỆN THOẠI", color: "A18971", text: $viewModel.phone)
                        Spacer().frame(height: 50)
                        Button(action: {
                            viewModel.isNext(complete: {
                                showAlert = true
                            }, completed: {
                                path.append("DesignPickerView")
                            })
                        }) {
                            Text("Lưu")
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
                Spacer()
            }
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Vui lòng điền đầy đủ thông tin"), message: Text(""), dismissButton: .default(Text("OK")))
        }
    }
}
struct EditTextField: View {
    var title: String
    var color: String
    @Binding var text: String
    @FocusState var isFocused: Bool
    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .foregroundColor(.white)
                .fontWeight(.medium)
                .font(.system(size: 10))
                .multilineTextAlignment(.center)
//                .padding(10)
                .frame(width: 95, height: 48)
                .background(Color(color))
            TextField("", text: $text)
                .foregroundColor(.black)
                .padding(10)
                .frame(width: 250, height: 48)
                .background(.white)
                .cornerRadius(0)
            }
        .overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(isFocused ? Color(color) : Color("E1E2E7"), lineWidth: 1)
        )
        .focused($isFocused)
        .padding(.top, 8)
        .padding(.horizontal, 30)
    }
}

struct InformationEntryView_Previews: PreviewProvider {
    static var previews: some View {
        InformationEntryView(path: .constant(NavigationPath()))
    }
}
