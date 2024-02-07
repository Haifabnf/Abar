//
//  SwiftUIView.swift
//  Abar
//
//  Created by Noura. on 24/07/1445 AH.
//

import SwiftUI

struct CardInfo: Identifiable {
    let id = UUID()
    var cardIndex: Int
    var userText: String
    var link: String? 
}



struct GenericCard: View {
    let id: Int
    let imageName: String
    @Binding var selectedCard: Int?
    
    var body: some View {
        ZStack{
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                 .frame(width: 304, height: 357)
                .cornerRadius(10)
                .clipped()
                .shadow(color: Color(red: 0.5, green: 0.5, blue: 0.5).opacity(0.25), radius: 20, x: 10, y: 10)

            // Overlay for highlighting the selected card.
            Rectangle()
                .fill(Color.clear)
                .frame(width: 304, height: 357)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(selectedCard == id ? Color("AccentColor") : Color.clear, lineWidth: 2)
                )
        }
        .padding(.horizontal, 16)
        .onTapGesture {
            // Sets this card as the selected card.
            self.selectedCard = self.id
        }
}
}

struct GenericCardView_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var selectedCard: Int?
        
        var body: some View {
            GenericCard(id: 1, imageName: "sampleImage", selectedCard: $selectedCard)
        }
    }
    
    static var previews: some View {
        PreviewWrapper()
    }
}
