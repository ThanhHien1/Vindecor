//
//  PremisesInformationView.swift
//  Vindecor
//
//  Created by Thanh Hien on 28/11/2023.
//

import SwiftUI

struct PremisesInformationView: View {
    @Binding var path: NavigationPath
    @ObservedObject var viewModel = PremisesInformationViewModel()
    @State private var show = false
    @State private var showAlertPremisesInformationView = false
    var body: some View {
        ZStack {
            Color("EEE8DB")
                .edgesIgnoringSafeArea(.all)
            ScrollView{
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
                    Text("Thông tin mặt bằng")
                        .foregroundColor(.black)
                        .font(.custom("BungeeShade-Regular", size: 21))
                        .padding(.top, 60)
                    Spacer().frame(height: 60)
                    VStack {
                        EditTextField(title: "DIỆN TÍCH MẶT BẰNG", color: "AB8776", text: $viewModel.acreage)
                        EditTextField(title: "HƯỚNG CỦA MẢNH ĐẤT", color: "C3A08D", text: $viewModel.direction)
                        EditTextField(title: "ĐỊA HÌNH MẢNH ĐẤT", color: "C3A08D", text: $viewModel.terrain)
                        EditTextField(title: "RÀNG BUỘC PHÁP LÍ", color: "A18971", text: $viewModel.juridical)
                        Spacer().frame(height: 50)
                        Button(action: {
                            viewModel.isNext(complete: {
                                showAlertPremisesInformationView = true
                            }, completed:  {
                                path.append("EnterBudgetView")
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
                            .font(.system(size: 14))
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
            .alert(isPresented: $showAlertPremisesInformationView) {
                Alert(title: Text("Vui lòng điền đầy đủ thông tin"), message: Text(""), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct PremisesInformationView_Previews: PreviewProvider {
    static var previews: some View {
        PremisesInformationView(path: .constant(NavigationPath()))
    }
}
