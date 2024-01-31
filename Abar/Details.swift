//
//  Details.swift
//  Abar
//
//  Created by haifa alfoiz on 23/01/2024.
//

import SwiftUI

struct Details: View {
    
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
                    
                    List{

                    //Card Preview
                    Rectangle()
                        .frame(width: 304, height: 357)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: Color(red: 0.5, green: 0.5, blue: 0.5).opacity(0.25), radius: 10, x: 10, y: 10)
                        .padding()
                        .listRowBackground(hidden())
                          
//                        Section(header: CustomText("Details")){
//                            TextField("Name", text: $recieverName)
//                                .background(.white)
//                                .cornerRadius(10)
//                                .foregroundColor(.black)
//                                .padding(.horizontal)
//                            
//                            TextField("Number", text: $recieverNumber)
//                                .background(.white)
//                                .cornerRadius(10)
//                                .foregroundColor(.black)
//                                .padding(.horizontal)
//                        }
                        
//                        Section(header: CustomText("Schedule Time")){
//                            
//                            HStack{
//                                Text("Select Date")
//                                Spacer()
//                                Button("\(date.formatted(date: .abbreviated, time: .omitted))") {
//                                    showDatePicker.toggle()
//                                    
//                                }
//                                .accentColor(.purplee)
//                                
//                            }
//                            
//                            
//                            if showDatePicker {
//                                DatePicker("Date", selection: $date, displayedComponents: .date)
//                                    .datePickerStyle(.graphical)
//                                    .accentColor(.purplee)
//                            }
//                            
//                        }
                        
                    }
//                    .listStyle(.inset)
                    .listStyle(.automatic)
//                    .background(Color.f3)
                    
                    
//                    NavigationLink(destination: ContentView()) {
                        
                        Button("Done"){
                        }
                        .padding()
                        .frame(width: 340 , height: 60)
                        .background(Color.purplee)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.custom("SF Pro", size: 20))
//                    }
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
    Details()
}
