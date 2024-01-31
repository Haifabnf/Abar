//
//  Birthdays.swift
//  Abar
//
//  Created by Noura. on 12/07/1445 AH.
//

import SwiftUI


// Main view for displaying a selection of cards.
struct Birthdays: View {
        @State private var selectedCard: Int? = nil // ID of the selected card.
        @State private var showingSheet = false // Controls whether the input sheet is shown.
        @State private var cardInfos: [CardInfo] = [] // Stores user-entered text for each card.

        var body: some View {
            NavigationView {
                ScrollView {
                    VStack(spacing: 20) {
                        
                        // Dynamic creation of card selection views.
                        BirthdaysCards(id: 0, selectedCard: $selectedCard)
                        BirthdaysCards(id: 1, selectedCard: $selectedCard)
                        BirthdaysCards(id: 2, selectedCard: $selectedCard)
                        // Add more cards as needed.

                        // Displays entered text for each selected card.
                        ForEach(cardInfos, id: \.cardIndex) { cardInfo in
                            Text("Card \(cardInfo.cardIndex): \(cardInfo.userText)")
                        }
                    }
                    .padding(.vertical, 20)
                }
                .sheet(isPresented: $showingSheet) {
                    // Presents the input view when a card is selected.
                    CardInputView(selectedCard: $selectedCard, cardInfos: $cardInfos)
                }
                .onChange(of: selectedCard) { newValue in
                    // Shows the sheet when a card is selected.
                    showingSheet = newValue != nil
                }
            }
            .navigationBarTitle("Birthdays", displayMode: .large)
            
        }
    }

    // View representing each card selection option.
    struct BirthdaysCards: View {
        let id: Int
        @Binding var selectedCard: Int?

        var body: some View {
            ZStack {
                // Image representing the card.
                Image("Birthdays \(id + 1)")
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




#Preview {
    Birthdays()
}
