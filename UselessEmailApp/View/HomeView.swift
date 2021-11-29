//
//  HomeView.swift
//  UselessEmailApp
//
//  Created by João Brentano on 29/11/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Speedrun de \npreenchimento de informações")
                .bold()
                .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.16)
                .font(.title2)
                .multilineTextAlignment(.center)
            NavigationLink(destination: FormView()) {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.green)
                    Text("Começar")
                        .foregroundColor(.black)
                        .bold()
                }
                .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.06)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
