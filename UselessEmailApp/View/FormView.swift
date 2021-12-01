//
//  FormView.swift
//  UselessEmailApp
//
//  Created by João Brentano on 29/11/21.
//

import SwiftUI

var seconds: Int = 0

struct FormView: View {
    
    @State var currentField: Fields = Fields.name
    @State var contents: [String] = ["", "", "", "", "", ""]
    
    func startTimer() {
        // 1. Make a new timer
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { tempTimer in
            // 2. Check time to add to H:M:S
            seconds = seconds + 1
        }
        
    }
    
    func showNextField() {
        self.currentField.next()
    }
    
    var body: some View {
        VStack {
            Spacer()
            InputFieldView(contents: $contents, fieldName: "Nome", placeholderText: "Digite...", inputId: 0, onComplete: showNextField)
            if(currentField >= .email) {
                InputFieldView(contents: $contents, fieldName: "Email", placeholderText: "Digite...", inputId: 1, onComplete: showNextField)
            }
            if(currentField >= .phone) {
                InputFieldView(contents: $contents, fieldName: "Telefone", placeholderText: "Digite...", inputId: 2, onComplete: showNextField)
            }
            if(currentField >= .work) {
                InputFieldView(contents: $contents, fieldName: "Trabalho", placeholderText: "Digite...", inputId: 3, onComplete: showNextField)
            }
            if(currentField >= .company) {
                InputFieldView(contents: $contents, fieldName: "Empresa", placeholderText: "Digite...", inputId: 4, onComplete: showNextField)
            }
            if(currentField >= .workload) {
                InputFieldView(contents: $contents, fieldName: "Turno", placeholderText: "Digite...", inputId: 5, onComplete: showNextField)
            }
        }.onAppear {
            startTimer()
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
