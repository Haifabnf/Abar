//
//  Details.swift
//  Abar
//
//  Created by haifa alfoiz on 23/01/2024.
//

import SwiftUI

struct Details: View {
    
    @State private var recieverName: String = ""
    @State private var recieverNumber: String = ""
    
    @State private var wakeUp = Date.now

    
    var body: some View {
        
        NavigationView{
            
            ZStack {
                Color(.f3)
                    .ignoresSafeArea()
                VStack{

                    //Card Preview
                        Rectangle()
                            .frame(width: 300, height: 360)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(color: Color(red: 0.5, green: 0.5, blue: 0.5).opacity(0.25), radius: 10, x: 10, y: 10)
                            .padding()
                        
                            
                    List{
                        Section(header: CustomText("Reciever Details")){
                            TextField("Reciever Name", text: $recieverName)
                                .background(.white)
                                .cornerRadius(10)
                                .foregroundColor(.black)
                                .padding(.horizontal)
                            
                            TextField("Reciever Number", text: $recieverNumber)
                                .background(.white)
                                .cornerRadius(10)
                                .foregroundColor(.black)
                                .padding(.horizontal)
                        }
                    
            
                    
                        Section(header: CustomText("Schedule Time")){
                            DatePicker("Select Date", selection: $wakeUp, in: Date()...)
                                .background(.white)
                                .cornerRadius(10)
                                .accentColor(.purple)
                                //.datePickerStyle(.graphical)
                                //.datePickerStyle(.compact)
                                //.datePickerStyle(.wheel)
                                .datePickerStyle(.automatic)
                            
                        }

                    }
                    .listStyle(PlainListStyle())
                    .background(Color.f3)
                    
                    NavigationLink(destination: ContentView()) {
                        
                        Button("Done"){
                            
                        }
                        .padding()
                        .frame(width: 339 , height: 60)
                        .background(Color.purplee)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        .font(.custom("SF Pro", size: 20))
                    }
                }
            }

                

        }
        .navigationTitle("Send Details")
        
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
    Details()
}
