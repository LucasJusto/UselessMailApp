//
//  InputFieldView.swift
//  UselessEmailApp
//
//  Created by João Brentano on 29/11/21.
//

import SwiftUI

struct InputFieldView: View {
    
    @State var didTapNextScreen: Bool = false
    @State var isEditing: Bool = true
    @Binding var contents: [String]
    let fieldName: String
    let placeholderText: String
    let inputId: Int
    let screenSize = UIScreen.main.bounds
    var onComplete: () -> Void
    var time: TimeInterval = Date().timeIntervalSinceReferenceDate
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
                        
                        if inputId == 0 {
                            MailComposer.nome = contents[inputId]
                        }
                        if inputId == 1 {
                            MailComposer.email = contents[inputId]
                        }
                        if inputId == 2 {
                            MailComposer.telefone = contents[inputId]
                        }
                        if inputId == 3 {
                            MailComposer.trabalho = contents[inputId]
                        }
                        if inputId == 4 {
                            MailComposer.empresa = contents[inputId]
                        }
                        if inputId == 5 {
                            MailComposer.turno = contents[inputId]
                        }
                    } label: {
                        if isEditing {
                            if inputId == 5 {
                                NavigationLink(destination: ResultView()) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .foregroundColor(.green)
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.black)
                                    }
                                    .frame(height: screenSize.width * 0.12)
                                }
                                .onTapGesture {
                                    MailComposer.turno = contents[inputId]
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
