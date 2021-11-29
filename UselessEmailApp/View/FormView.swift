//
//  FormView.swift
//  UselessEmailApp
//
//  Created by João Brentano on 29/11/21.
//

import SwiftUI

struct FormView: View {
    
    @State var name: String = ""
    
    var body: some View {
        InputFieldView(name: $name, fieldName: "Nome", placeholderText: "Digite...")
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
