//
//  Details.swift
//  Abar
//
//  Created by haifa alfoiz on 23/01/2024.
//

import SwiftUI

struct Preview: View {
    
    @State var recieverName: String = ""
    @State var recieverNumber: String = ""
    @State var date: Date = Date()
    @State var showDatePicker = false
    
    var body: some View {
        
        NavigationView{
            
            ZStack {
                Color(.f2)
                    .ignoresSafeArea()
                
                VStack{
                    

                    //Card Preview
                    Rectangle()
                        .frame(width: 304, height: 357)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: Color(red: 0.5, green: 0.5, blue: 0.5).opacity(0.25), radius: 10, x: 10, y: 10)
                        .padding()
                        .listRowBackground(hidden())
                          
                        
//                   Spacer()
                    
                    
//                    NavigationLink(destination: ContentView()) {
                        
                        Button("Done"){
                        }
                        .padding()
                        .frame(width: 340 , height: 60)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.custom("SF Pro", size: 20))
                }

            }
            
            
            
        }
        .navigationTitle("Preview")
        
    }
}

struct CustomText: View {
    var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.custom("SF Pro", size: 22))
            .foregroundColor(.black)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .textCase(.none)
    }
}

#Preview {
    Preview()
}
