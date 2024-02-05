//
//  Final card.swift
//  AbarEx
//
//  Created by Noura. on 19/07/1445 AH.

import SwiftUI
import CoreImage.CIFilterBuiltins

struct FinalCardView: View {
    let category: String
    let cardIndex: Int
    let userInput: String
    let link: String?

    var body: some View {
        ZStack {
            Image("\(category) \(cardIndex + 1)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 304, height: 357)
                .cornerRadius(10)
                .clipped()
                .shadow(color: Color(red: 0.5, green: 0.5, blue: 0.5).opacity(0.25), radius: 20, x: 10, y: 10)
                .overlay{
                    VStack {
                        Spacer()
                        Text(userInput)
                            .padding()
                            .frame(width: 304, alignment: .leading)

                        // Conditionally display QRCodeView
                        if let validLink = link, !validLink.isEmpty {
                            QRCodeView(url: validLink)
                                .frame(width: 280, height: 200, alignment: .bottomLeading)
                        } else {
                            // Optional: Display a placeholder or leave it empty
                            Spacer()
                        }
                    }
                }
        }
    }
}







struct FinalCardView_Previews: PreviewProvider {
    static var previews: some View {
        // Specify the category in the preview
        FinalCardView(category: "Graduation", cardIndex: 0, userInput: "Congratulations on your graduation!", link: "https://example.com")
    }
}
