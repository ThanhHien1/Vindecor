//
//  ScreenList.swift
//  App
//
//  Created by Thanh Hien on 26/10/2023.
//

import SwiftUI

@ViewBuilder
func getScreen(id: String, path: Binding<NavigationPath>) -> some View{
    switch(id){
    case "InformationEntryView":
        InformationEntryView(path: path)
    case "DesignPickerView":
        DesignPickerView(path: path)
    case "PremisesInformationView":
        PremisesInformationView(path: path)
    case "EnterBudgetView":
        EnterBudgetView(path: path)
    case "DesignStyleView":
        DesignStyleView(path: path)
    case "ConfirmView":
        ConfirmView(path: path)
    case "DesignView":
        DesignView(path: path)
    default:
        Text("screen is developing")
    }
}
