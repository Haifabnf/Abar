//
//  Final card.swift
//  AbarEx
//
//  Created by Noura. on 19/07/1445 AH.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct FinalCardView: View {
    let cardIndex: Int
    let userInput: String
    let link: String?

    var body: some View {
        ZStack {
            // Display the selected card
            Image("Graduation \(cardIndex + 1)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 304, height: 357)
                .cornerRadius(10)
                .clipped()
                .shadow(color: Color(red: 0.5, green: 0.5, blue: 0.5).opacity(0.25), radius: 20, x: 10, y: 10)
                .overlay{
                    
                    VStack{

                        // Display the user input text
                        Text(userInput)
                            .padding()
                            .frame(width: 304, alignment: .leading)
//                        Spacer()
                    }
                    .padding()
                    
                    VStack{
                        Spacer()
                        HStack{
                            // If a link is provided, display the QR code
                            if let link = link, !link.isEmpty {
                                QRCodeView(url: link)
                                    .frame(width: 200, height: 200)
                            }
                            Spacer()
                        }
                    }
                    .padding(.top, 200)
                    
                }
            
        }
    }
}

struct FinalCardView_Previews: PreviewProvider {
    static var previews: some View {
        FinalCardView(cardIndex: 0, userInput: "Happy Birthday!", link: "https://example.com")
    }
}


