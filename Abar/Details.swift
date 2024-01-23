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
    
    
    var body: some View {
        
        NavigationStack{
            
            ScrollView{
                
                VStack{
                    
                    //Card Preview
                    Rectangle()
                    .frame(width: 304, height: 357)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: Color(red: 0.5, green: 0.5, blue: 0.5).opacity(0.25), radius: 20, x: 10, y: 10)
                    .padding()
                    
                    HStack{
                        Text("Reciever Details")
                            //.font(Font.custom("SF Pro", size: 18))
                            .font(.custom("SF Pro", size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding()
                    
                    List {
                        Section {
                            TextField("Reciever Name", text: $recieverName)
                            TextField("Reciever Number", text: $recieverNumber)                        }
                    }
                

                    
                    Spacer()
                }
                .padding()
                .textFieldStyle(.roundedBorder)


            }
        }
        .navigationTitle("Send Details")
        
    }
}

#Preview {
    Details()
}
