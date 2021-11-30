//
//  FormView.swift
//  UselessEmailApp
//
//  Created by João Brentano on 29/11/21.
//

import SwiftUI

enum Fields: Int, Comparable {
    
    static func < (lhs: Fields, rhs: Fields) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case name = 0
    case email
    case phone
    case work
    case company
    case workload

    mutating func next() {
        if let next = Fields(rawValue: rawValue+1) {
            self = next
        }
    }
}

struct FormView: View {
    
    @State var currentField: Fields = Fields.name
    @State var contents: [String] = ["aaa"]
    var inputs: [InputFieldView] = []
    
    func showNextField() {
        self.currentField.next()
    }
    
    var body: some View {
        VStack {
            Spacer()
            InputFieldView(contents: $contents, fieldName: "Nome", placeholderText: "Digite...", inputId: 0, onComplete: showNextField)
            if(currentField >= .email) {
                InputFieldView(contents: $contents, fieldName: "Email", placeholderText: "Digite...", inputId: 0, onComplete: showNextField)
            }
            if(currentField >= .phone) {
                InputFieldView(contents: $contents, fieldName: "Phone", placeholderText: "Digite...", inputId: 0, onComplete: showNextField)
            }
            if(currentField >= .work) {
                InputFieldView(contents: $contents, fieldName: "Work", placeholderText: "Digite...", inputId: 0, onComplete: showNextField)
            }
            if(currentField >= .company) {
                InputFieldView(contents: $contents, fieldName: "Company", placeholderText: "Digite...", inputId: 0, onComplete: showNextField)
            }
            if(currentField >= .workload) {
                InputFieldView(contents: $contents, fieldName: "Workload", placeholderText: "Digite...", inputId: 0, onComplete: showNextField)
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
