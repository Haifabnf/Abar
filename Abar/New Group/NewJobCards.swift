//
//  NewJobView.swift
//  Abar
//
//  Created by Noura. on 24/07/1445 AH.
//

import SwiftUI

struct NewJobCards: View {
    @State private var selectedCard: Int? = nil // ID of the selected card.
    @State private var showingSheet = false // Controls whether the input sheet is shown.
    @State private var cardInfos: [CardInfo] = []// Stores user-entered text for each card.
let category = "New Job"

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
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .sheet(isPresented: $showingSheet) {
                CardInputView(selectedCard: $selectedCard, cardInfos: $cardInfos, category: category)
            }
            .onChange(of: selectedCard) { newValue in
                // Shows the sheet when a card is selected.
                showingSheet = newValue != nil
            }
        }
        .navigationBarTitle("New Job", displayMode: .large)
        
    }
}

struct NewJobCards_Previews: PreviewProvider {
    static var previews: some View {
        NewJobCards()
    }
}
