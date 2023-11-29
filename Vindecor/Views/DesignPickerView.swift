//
//  DesignPickerView.swift
//  Vindecor
//
//  Created by Thanh Hien on 28/11/2023.
//

import SwiftUI

struct DesignPickerView: View {
    @Binding var path: NavigationPath
    let title: String = ""
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
                Text("Chọn chức năng thiết kế")
                    .font(.custom("BungeeShade-Regular", size: 21))
                    .padding(.top, 60)
                Spacer().frame(height: 60)
                EditButton(title: "Thiết kế bản vẽ") {
                    path.append("PremisesInformationView")
                }
                EditButton(title: "Thiết kế nội thất ") {
                    path.append("EnterBudgetView")
                }
                .padding(.top, 20)
                VStack(spacing: 0) {
                        Button(action: {
                            path.append("PremisesInformationView")
                        }) {
                            VStack(spacing: 0) {
                                Text("Thiết kế bản vẽ ")
                                    .padding(.bottom, -10)
                                Text("&")
                                    .padding(.bottom, -5)
                                Text("thiết kế nội thất")
                                    .padding(.bottom, 5)
                            }
                            .frame(width: 300)
                            .foregroundColor(Color("AB8776"))
                            .font(.custom("PaytoneOne-Regular", size: 26))
                        }
                        .overlay(
                            HStack(spacing: 0) {
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color("422716"), lineWidth: 2)
                            }
                        )
                        .background(Color.white)
                        .cornerRadius(25)
                    Spacer()
                    HStack(alignment: .center, spacing: 0) {
                        Image("home14")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .padding(.leading, 5)
                        Spacer()
                        VStack { Divider()}.frame(width: 40).background(.black).opacity(0.7)
                        Text("vindecor.com.vn")
                            .font(.system(size: 13))
                            .fontWeight(.medium)
                            .padding(.horizontal, 5)
                        VStack { Divider()}.frame(width: 40).background(.black).opacity(0.7)
                        Spacer()
                        Image("home16")
                            .resizable()
                            .frame(width: 90, height: 90)
//                            .padding(.trailing, 5)
                    }
                }
                .padding(.top, 20)
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
struct EditButton: View {
    let title: String
    var selected: () -> Void
    var body: some View {
        VStack {
                Button(action: {
                    selected()
                }) {
                    Text(title)
                        .foregroundColor(Color("AB8776"))
                        .font(.custom("PaytoneOne-Regular", size: 26))
                }
                .frame(width: 300, height: 60)
                .overlay(
                    HStack(spacing: 0) {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color("422716"), lineWidth: 2)
                    }
                )
                .background(Color.white)
                .cornerRadius(25)
            }
    }
}
struct DesignPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DesignPickerView(path: .constant(NavigationPath()))
    }
}
