//
//  InputFieldView.swift
//  UselessEmailApp
//
//  Created by João Brentano on 29/11/21.
//

import SwiftUI

struct InputFieldView: View {
    
    @Binding var contents: [String]
    let fieldName: String
    let placeholderText: String
    let inputId: Int
    var onComplete: () -> Void
    
    @State var isEditing: Bool = true
    let screenSize = UIScreen.main.bounds
    var fieldWidthPercentage: Double {
        if isEditing {
            return 0.75
        }
        return 0.9
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("\(fieldName)")
                        .foregroundColor(Color("marceloGray"))
                    Spacer()
                }
                .padding(.horizontal, screenSize.width * 0.05)
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color("marceloGray"))
                        TextField("\(placeholderText)", text: $contents[inputId])
                            .padding(.horizontal, screenSize.width * 0.05)
                    }
                    .frame(width: screenSize.width * fieldWidthPercentage, height: screenSize.width * 0.12)
                    Button {
                        isEditing.toggle()
                        onComplete()
                    } label: {
                        if isEditing {
                            if inputId == 5 {
                                NavigationLink(destination: ResultView(tempo: "9")) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .foregroundColor(.green)
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.black)
                                    }
                                    .frame(height: screenSize.width * 0.12)
                                }
                            } else {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .foregroundColor(.green)
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black)
                                }
                                .frame(height: screenSize.width * 0.12)
                            }
                            
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct InputFieldView_Previews: PreviewProvider {
    
    @State static var contents: [String] = ["content1"]
    
    static var previews: some View {
        InputFieldView(contents: $contents, fieldName: "Nome", placeholderText: "Digite...", inputId: 0, onComplete: {})
    }
}
