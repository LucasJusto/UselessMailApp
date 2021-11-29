//
//  FormView.swift
//  UselessEmailApp
//
//  Created by João Brentano on 29/11/21.
//

import SwiftUI

struct FormView: View {
    
    @State var contents: [String] = ["aaa"]
    var inputs: [InputFieldView] = []
    
    static func showNextField() {
        
    }
    
    var body: some View {
        VStack {
            Spacer()
            InputFieldView(contents: $contents, fieldName: "Nome", placeholderText: "Digite...", inputId: 0)
            InputFieldView(contents: $contents, fieldName: "Nome", placeholderText: "Digite...", inputId: 0)
            InputFieldView(contents: $contents, fieldName: "Nome", placeholderText: "Digite...", inputId: 0)
            InputFieldView(contents: $contents, fieldName: "Nome", placeholderText: "Digite...", inputId: 0)
            InputFieldView(contents: $contents, fieldName: "Nome", placeholderText: "Digite...", inputId: 0)
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
