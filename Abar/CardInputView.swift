//
//  CardIContentView.swift
//  Abar
//
//  Created by Noura. on 12/07/1445 AH.
//

import SwiftUI


struct CardInputView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedCard: Int?
    @Binding var cardInfos: [CardInfo]
    @State private var userInput: String = ""
    @State private var linkInput: String = ""
    @State private var showLinkInput: Bool = false
    @State private var showQRCode = false
    @State private var selectedToolbarItem: String?
    @State private var navigateToFinalCard = false
    let category: String // Add this line

    
    private let characterLimit = 200
    
    var body: some View {
        NavigationView {
            VStack {
                userInputTextEditor
                characterCountText
                linkInputFieldIfNeeded
                // Hidden NavigationLink that triggers navigation when navigateToFinalCard is true
                NavigationLink(destination: PreviewView(
                    category: category, cardIndex: selectedCard ?? 0,
                            userInput: userInput,
                            link: linkInput
                        ), isActive: $navigateToFinalCard) {
                            EmptyView() // Invisible NavigationLink
                        }
                    }
                    .navigationBarItems(leading: cancelButton, trailing: saveButton)
                    .toolbar { toolbarContent }
            .background(navigationLinkToQRCodeView)
        }.padding()
    }

    
    private var navigationLinkToQRCodeView: some View {
        Group {
            if showQRCode {
                NavigationLink(destination: QRCodeView(url: linkInput), isActive: $showQRCode) {
                    EmptyView()
                }
            }
        }
    }

    private var userInputTextEditor: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $userInput)
                .padding(EdgeInsets(top: 12, leading: 4, bottom: 12, trailing: 4))
            
            if userInput.isEmpty {
                Text("What would you like to say?")
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: 21, leading: 8, bottom: 12, trailing: 4))
            }
        }
        .onChange(of: userInput) { newValue in
            userInput = String(newValue.prefix(characterLimit))
        }
    }

    private var characterCountText: some View {
        Text("\(userInput.count)/\(characterLimit) characters")
            .foregroundColor(Color.gray)
            .padding(.top, 5)
    }

    private var linkInputFieldIfNeeded: some View {
        Group {
            if showLinkInput {
                TextField("Enter link", text: $linkInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
    }

    private var cancelButton: some View {
        Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }

    private var saveButton: some View {
        Button("Save") {
            if let selectedCardIndex = selectedCard {
                // Assuming cardInfos is intended to store the input for each card
                let newCardInfo = CardInfo(cardIndex: selectedCardIndex, userText: userInput, link: linkInput)
                if let index = cardInfos.firstIndex(where: { $0.cardIndex == selectedCardIndex }) {
                    cardInfos[index] = newCardInfo
                } else {
                    cardInfos.append(newCardInfo)
                }
                navigateToFinalCard = true // Set to true to trigger navigation
            }
        }
    }

    private var toolbarContent: some ToolbarContent {
        ToolbarItemGroup(placement: .bottomBar) {
            CustomToolbarButton(label: "Auto", systemImage: "wand.and.rays", isSelected: selectedToolbarItem == "AI") {
                performAutoCompletion()
                selectedToolbarItem = "AI"
            }
            Spacer()
            CustomToolbarButton(label: "Link", systemImage: showLinkInput ? "checkmark" : "link", isSelected: selectedToolbarItem == "Link") {
                showLinkInput.toggle()
                selectedToolbarItem = showLinkInput ? "Link" : nil
            }
        }
    }



    private func performAutoCompletion() {
        // AI Auto Completion logic
    }

    struct CustomToolbarButton: View {
        let label: String
        let systemImage: String
        let isSelected: Bool
        let action: () -> Void

        var body: some View {
            Button(action: action) {
                VStack {
                    Image(systemName: systemImage)
                    Text(label).font(.caption)
                }
                .foregroundColor(isSelected ? Color("AccentColor") : Color.gray)
            }
        }
    }
}

struct CardInputView_Previews: PreviewProvider {
    static var previews: some View {
        // Use .constant to provide example values for the preview
        CardInputView(selectedCard: .constant(1), cardInfos: .constant([CardInfo(cardIndex: 1, userText: "Happy Birthday!", link: "https://example.com")]), category: "Birthday")
    }
}


