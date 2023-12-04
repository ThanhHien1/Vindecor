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
            .keyboardAdaptive()
    case "DesignPickerView":
        DesignPickerView(path: path)
            .keyboardAdaptive()
    case "PremisesInformationView":
        PremisesInformationView(path: path)
            .keyboardAdaptive()
    case "EnterBudgetView":
        EnterBudgetView(path: path)
            .keyboardAdaptive()
    case "DesignStyleView":
        DesignStyleView(path: path)
            .keyboardAdaptive()
    case "ConfirmView":
        ConfirmView(path: path)
    case "DesignView":
        DesignView(path: path)
    case "HomeView":
        HomeView()
    default:
        Text("screen is developing")
    }
}
