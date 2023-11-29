//
//  ConfirmView.swift
//  Vindecor
//
//  Created by Thanh Hien on 28/11/2023.
//

import SwiftUI

struct ConfirmView: View {
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
                        Spacer()
                        Image("home6")
                            .resizable()
                            .frame(width: 60, height: 60)
                        Spacer()
                        Image("home9")
                            .resizable()
                            .frame(width: 140, height: 90)
                    }
                    Text("Xác nhận đăng ký thiết kế")
                        .frame(width: 300)
                        .font(.custom("BungeeShade-Regular", size: 21))
                        .multilineTextAlignment(.center)
                        .padding(.top, 25)
                    Spacer().frame(height: 70)
                    Text("Sau khi xác nhận đăng kí thiết kế ")
                        .font(.custom("Bungee-Regular", size: 8))
                    Text("Sẽ có nhân viên hỗ trợ tư vấn và chăm sóc cho khách hàng sau khoảng 2 phút")
                        .padding(.horizontal, 6)
                        .font(.custom("Bungee-Regular", size: 8))
                        .padding(.top, 5)
                    Spacer().frame(height: 75)
                    HStack {
                        Button(action: {
                            path.append("DesignView")
                        }) {
                            VStack {
                                Image("home18")
                                    .resizable()
                                    .frame(width: 120, height: 100)
                                Text("Xác Nhận")
                                    .foregroundColor(.black)
                                    .font(.custom("Bungee-Regular", size: 20))
                                    .padding(.top, 10)
                            }
                            .padding(.leading, 10)
                        }
                        
                        Button(action: {
                            path.append("DesignPickerView")
                        }) {
                            VStack {
                                Image("home17")
                                    .resizable()
                                    .frame(width: 120, height: 100)
                                Text("Không Xác Nhận")
                                    .foregroundColor(.black)
                                    .font(.custom("Bungee-Regular", size: 18))
                                    .frame(width: 185)
                                    .padding(.top, 10)
                            }
                        }
                        .padding(.leading, 30)
                    }
                    Spacer()
                    HStack(alignment: .center, spacing: 0) {
                        Image("home14")
                            .resizable()
                            .frame(width: 90, height: 100)
                        Spacer()
                        VStack { Divider()}.frame(width: 35).background(.black).opacity(0.7)
                        Text("vindecor.com.vn")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .padding(.horizontal, 5)
                        VStack { Divider()}.frame(width: 35).background(.black).opacity(0.7)
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
    }
}

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView(path: .constant(NavigationPath()))
    }
}
