//
//  ContentView.swift
//  Abar
//
//  Created by haifa alfoiz on 17/01/2024.
//

import SwiftUI


struct ContentView: View {

    
    var body: some View {
        NavigationView{
            VStack {
                
                NavigationLink(destination: Details()) {
                    Text("Next Page")
                    
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
