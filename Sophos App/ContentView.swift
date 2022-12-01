//
//  ContentView.swift
//  Sophos App
//
//  Created by 1801C724748LM on 01/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("logo")
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
