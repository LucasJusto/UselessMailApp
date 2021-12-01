//
//  ContentView.swift
//  UselessEmailApp
//
//  Created by Lucas Dimer Justo on 29/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HomeView()
                .preferredColorScheme(.light)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
