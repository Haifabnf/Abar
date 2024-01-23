//
//  ContentView.swift
//  Abar
//
//  Created by haifa alfoiz on 17/01/2024.
//

import SwiftUI
import EventKit
import EventKitUI

struct ContentView: View {
        
    @State private var wakeUp = Date.now

    var body: some View {
        NavigationView{
            VStack {
                
                NavigationLink(destination: Details()) {
                            Text("Next Page")
                    
                }
                Form{
                    Text("gg")
                    DatePicker("Select Date", selection: $wakeUp, in: Date()...)
                        .background(.white)
                        .cornerRadius(10)
                        .accentColor(.purple)
                        //.datePickerStyle(.graphical)
                                       
                        //.datePickerStyle(.compact)
                        //.datePickerStyle(.wheel)
                        //.datePickerStyle(.automatic)
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
