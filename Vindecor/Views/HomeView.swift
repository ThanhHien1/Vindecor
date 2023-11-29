//
//  HomeView.swift
//  Vindecor
//
//  Created by Thanh Hien on 27/11/2023.
//

import SwiftUI

struct HomeView: View {
    @State var path = NavigationPath()
    @State private var navigateToInfoEntry = false
    var body: some View {
        NavigationStack(path: $path){
            ZStack {
                Color("EEE8DB")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 5) {
                    Spacer()
                    Text("THIẾT KẾ NỘI THẤT TRỰC TUYẾN")
                        .font(.custom("BungeeShade-Regular", size: 18))
                        .multilineTextAlignment(.center)
                    Text("VINDECOR")
                        .font(.custom("BungeeShade-Regular", size: 18))
                        .padding(.top, 10)
                    HStack {
                        RoundedRectangle (cornerRadius: 0).stroke().frame(width: 35, height: 10).background(Color("422716"))
                        RoundedRectangle (cornerRadius: 0).stroke().frame(width: 35, height: 10).background(Color("71513A"))
                        RoundedRectangle (cornerRadius: 0).stroke().frame(width: 35, height: 10).background(Color("A18971"))
                        RoundedRectangle (cornerRadius: 0).stroke().frame(width: 35, height: 10).background(Color("C9BFB7"))
                    }
                    .padding(.top, 15)
                    Spacer().frame(height: 15)
                    ZStack {
                        Image("home1")
                            .resizable()
                            .frame(width: (UIScreen.main.bounds.width - 80), height: 130)
                        VStack(spacing: 2) {
                            Text("TIỆN LỢI VÀ TIẾT KIỆM THỜI GIAN")
                                .frame(width: 70)
                                .bold()
                                .foregroundColor(.white)
                                .font(.custom("Anton-Regular", size: 9))
                                .padding(.vertical ,2)
                                .background(Color("422716"))
                            Text("LỰA CHỌN ĐA DẠNG")
                                .frame(width: 70)
                                .bold()
                                .foregroundColor(.white)
                                .font(.custom("Anton-Regular", size: 9))
                                .padding(.vertical ,2)
                                .background(Color("422716"))
                            Text("TUỲ CHỈNH VÀ CÁ NHÂN HOÁ")
                                .frame(width: 70)
                                .bold()
                                .foregroundColor(.white)
                                .font(.custom("Anton-Regular", size: 9))
                                .padding(.vertical ,2)
                                .background(Color("422716"))
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 15)
                    }
                    HStack(spacing: 0) {
                        ZStack {
                            Image("home2")
                                .resizable()
                                .frame(width: ((UIScreen.main.bounds.width - 80) / 2), height: 205)
                                .padding(.leading, 40)
                            VStack(alignment: .leading, spacing: 2) {
                                Text("SO SÁNH GIÁ CẢ")
                                    .frame(width: 80)
                                    .bold()
                                    .foregroundColor(.white)
                                    .font(.custom("Anton-Regular", size: 9))
                                    .padding(.vertical ,2)
                                    .background(Color("422716"))
                                Text("THAM KHẢO PHẢN HỒI CỦA KHÁCH HÀNG KHÁC")
                                    .frame(width: 80)
                                    .bold()
                                    .foregroundColor(.white)
                                    .font(.custom("Anton-Regular", size: 9))
                                    .padding(.vertical ,2)
                                    .background(Color("422716"))
                                Text("DỊCH VỤ GIAO HÀNG ĐẢM BẢO")
                                    .frame(width: 80)
                                    .bold()
                                    .foregroundColor(.white)
                                    .font(.custom("Anton-Regular", size: 9))
                                    .padding(.vertical ,2)
                                    .background(Color("422716"))
                            }
                            .padding(.leading, -90)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Image("home3")
                                .resizable()
                                .frame(width: ((UIScreen.main.bounds.width - 80) / 2), height: 200/2)
                            Image("home4")
                                .resizable()
                                .frame(width: ((UIScreen.main.bounds.width - 80) / 2), height: 200/2)
                        }
                        Spacer()
                    }
                  Spacer()
                }
                .padding(.bottom, 120)
            }
            .navigationDestination(for: String.self){ name in
                getScreen(id: name, path: $path )
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    path.append("InformationEntryView")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
