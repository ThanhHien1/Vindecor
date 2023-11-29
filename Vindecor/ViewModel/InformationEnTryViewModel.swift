//
//  InformationEnTryViewModel.swift
//  Vindecor
//
//  Created by Thanh Hien on 28/11/2023.
//

import Foundation

class InformationEnTryViewModel: ObservableObject {
    @Published var name = ""
    @Published var address = ""
    @Published var phone = ""
    @Published var errorMessage = ""
    
    func isNext(complete: @escaping () -> Void, completed: @escaping () -> Void) {
           DispatchQueue.main.async {
               guard self.invalid() else {
                   complete()
                   return
               }
               completed()
           }
       }
    
    private func isValidPhone(phone: String) -> Bool {
        let phoneRegex = "^\\d{10}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: phone)
    }
    
     func invalid() -> Bool {
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty, !address.trimmingCharacters(in: .whitespaces).isEmpty, !phone.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Vui lòng điền đầy đủ thông tin"
            return false
        }
//        guard isValidPhone(phone: phone) else {
//            errorMessage = "Vui lòng nhập đúng số điện thoại"
//            return false
//        }
        return true
    }
}
