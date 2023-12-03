//
//  EditButton.swift
//  Vindecor
//
//  Created by Thanh Hien on 02/12/2023.
//

import SwiftUI

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
struct EditButton_Previews: PreviewProvider {
    static var previews: some View {
        EditButton(title: "Name", selected: {})
    }
}
