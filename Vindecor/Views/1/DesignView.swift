//
//  DesignView.swift
//  Vindecor
//
//  Created by Thanh Hien on 29/11/2023.
//

import SwiftUI

struct DesignView: View {
        @Binding var path: NavigationPath
    @State private var textoffset = 380.0
    var body: some View {
        ZStack {
            Color("EEE8DB")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                HStack {
                    Spacer()
                    Button (action: {
                    path.append("DesignPickerView")
                    }) {
                        Image(systemName: "house")
                            .resizable()
                            .foregroundColor(Color("71513A"))
                            .frame(width: 30, height: 30)
                            .padding(.trailing, 20)
                    }
                }
                LottieView(lottieFile: "waitting")
                    .frame(height: 400)
                    .padding(.top, 30)
                Text("VINDECOR đang thiết kế theo yêu cầu của bạn")
                    .fontWeight(.bold)
                    . offset(x: textoffset, y: 0)
                    .fixedSize()
                    .animation(.linear(duration: 10)
                        .repeatForever(autoreverses: false), value: textoffset)
                    .clipped()
                    .onAppear {
                        textoffset = -380
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
                        .font(.system(size: 12))
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
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct DesignView_Previews: PreviewProvider {
    static var previews: some View {
        DesignView(path: .constant(NavigationPath()))
    }
}
