//
//  ResultView.swift
//  UselessEmailApp
//
//  Created by Marcelo Diefenbach on 29/11/21.
//

import SwiftUI



struct ResultView: View {
    let screenSize = UIScreen.main.bounds
    @State private var showingMailComposer = false
    var body: some View {
        ZStack{
            VStack{
                Text("Pronto!")
                    .font(.system(size: screenSize.height*0.06))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(EdgeInsets.init(top: 0, leading: 0, bottom: screenSize.height*0.09, trailing: 0))
                Text("Você gastou")
                    .font(.body)
                Text("\(seconds) segundos")
                    .font(.system(size: screenSize.height*0.06))
                    .fontWeight(.bold)
                Text("preenchendo as informações")
                    .font(.body)
                    .padding(EdgeInsets.init(top: 0, leading: 0, bottom: screenSize.height*0.15, trailing: 0))
                Text("Agora você pode enviar suas informações por e-mail")
                    .font(.system(size: screenSize.height*0.02))
                    .bold()
                    .frame(width: screenSize.width*0.62, height: screenSize.height*0.07, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets.init(top: 0, leading: 0, bottom: screenSize.height*0.015, trailing: 0))
                Button(action: {
                    showingMailComposer = true
                }) {
                    HStack {
                        Text("Enviar e-mail")
                            .fontWeight(.semibold)
                            .font(.system(size: 20))
                    }
                    .frame(width: screenSize.width*0.9, height: screenSize.height*0.07, alignment: .center)
                    .foregroundColor(.black)
                    .background(Color.green)
                    .cornerRadius(40)
                }
            }
        }
        .sheet(isPresented: $showingMailComposer, content: {
            MailComposer()
        })
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
