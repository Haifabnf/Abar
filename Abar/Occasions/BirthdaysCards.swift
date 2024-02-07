//
//  Birthdays.swift
//  Abar
//
//  Created by Noura. on 12/07/1445 AH.
//

import SwiftUI



struct BirthdaysCards: View {
    @State private var selectedCard: Int? = nil // ID of the selected card.
    @State private var showingSheet = false // Controls whether the input sheet is shown.
    @State private var cardInfos: [CardInfo] = [] // Stores user-entered text for each card.
let category = "Birthday"

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    //images named like "BirthdayCard1", "BirthdayCard2", etc.
                    ForEach(0..<3) { index in // Example for 3 cards
                        GenericCard(id: index, imageName: "\(category) \(index + 1)", selectedCard: $selectedCard)
                    }


                }
                .padding(.vertical, 20)
            }
            .sheet(isPresented: $showingSheet) {
                CardInputView(selectedCard: $selectedCard, cardInfos: $cardInfos, category: category)
            }
            .onChange(of: selectedCard) { newValue in
                // Shows the sheet when a card is selected.
                showingSheet = newValue != nil
            }
        }
        .navigationBarTitle("Birthdays", displayMode: .large)
        
    }
}

struct BirthdaysCards_Previews: PreviewProvider {
    static var previews: some View {
        BirthdaysCards()
    }
}
