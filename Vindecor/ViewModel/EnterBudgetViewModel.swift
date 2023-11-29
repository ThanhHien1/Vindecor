//
//  EnterBudgetViewModel.swift
//  Vindecor
//
//  Created by Thanh Hien on 28/11/2023.
//

import Foundation

class EnterBudgetViewModel: ObservableObject {
    @Published var budget = ""
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
        guard !budget.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Vui lòng điền đầy đủ thông tin"
            return false
        }
        return true
    }
}
