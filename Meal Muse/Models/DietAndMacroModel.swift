//
//  DietAndMacroModel.swift
//  Meal Muse
//
//  Created by Anish Sharma on 11/12/2023.
//

import Foundation

struct Question {
    var title: String
    var options: [String]
}

struct DietOption {
    var name: String
}

struct MacroOption {
    var name: String
}

struct UserPreferences {
    var selectedDiets: Set<String>
    var selectedMacros: Set<String>
}
