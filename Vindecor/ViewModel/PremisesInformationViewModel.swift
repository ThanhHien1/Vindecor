//
//  PremisesInformationViewModel.swift
//  Vindecor
//
//  Created by Thanh Hien on 28/11/2023.
//

import Foundation

class PremisesInformationViewModel: ObservableObject {
    @Published var acreage: String = ""
    @Published var direction: String = ""
    @Published var terrain: String = ""
    @Published var juridical: String = ""
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
        guard !acreage.trimmingCharacters(in: .whitespaces).isEmpty, !direction.trimmingCharacters(in: .whitespaces).isEmpty, !juridical.trimmingCharacters(in: .whitespaces).isEmpty, !terrain.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Vui lòng điền đầy đủ thông tin"
            return false
        }
        return true
    }
}
