//
//  DesignStyleViewModel.swift
//  Vindecor
//
//  Created by Thanh Hien on 28/11/2023.
//

import Foundation

class DesignStyleViewModel: ObservableObject {
    @Published var style: String = ""
    @Published var layout: String = ""
    @Published var color: String = ""
    @Published var direction: String = ""
    @Published var other: String = ""
    @Published var errorMessage = ""
    
    func isNext(complete : @escaping () -> Void, completed: @escaping () -> Void) {
        guard invalid() else {
            complete()
            return
        }
        completed()
    }
    
    private func invalid() -> Bool {
        errorMessage = ""
        guard !style.trimmingCharacters(in: .whitespaces).isEmpty, !layout.trimmingCharacters(in: .whitespaces).isEmpty, !color.trimmingCharacters(in: .whitespaces).isEmpty, !direction.trimmingCharacters(in: .whitespaces).isEmpty, !other.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Vui lòng điền đầy đủ thông tin"
            return false
        }
        return true
    }
}
