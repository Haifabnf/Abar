//
// ContentView.swift
// Abar
//
// Created by haifa alfoiz on 17/01/2024. //
import SwiftUI

struct ContentView: View {
    @State private var isSheetPresented = false
    @State private var selectedRectangleIndex: Int?
    @State private var searchTerm = ""
    
    var body: some View {
        let customGradient = LinearGradient(gradient: Gradient(colors: [Color("StartColor"), Color.white]), startPoint: .leading, endPoint: .trailing)
        
        let textArray = ["Happy Birthday", "Graduation", "New Job", "Memes", "Artist", "Gratitude"]
        let imageNameArray = ["balloon23", "grad23", "clap23", "Sticker", "mic23", "flower23"]
        
        var filteredIndices: [Int] {
            if searchTerm.isEmpty {
                return Array(0..<textArray.count)
            } else {
                return textArray.indices.filter {
                    let localizedString = textArray[$0].lowercased()
                    return localizedString.contains(searchTerm.lowercased())
                }
            }
        }
        
        NavigationView {
            VStack(alignment: .leading, spacing: 22) {
                searchField
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 22) {
                        Text("Special Occasions")
                            .font(.title2)
                            .bold()
                            //.padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                RectangleView(imageName: "Foundation Day", destination: FoundationDayCards())
                                RectangleView(imageName: "Leap Event", destination: LeapEventCards())
                            }
                            //.padding(.horizontal)
                        }
                        
                        Text("Occasions")
                            .font(.title2)
                            .bold()
                            //.padding(.horizontal)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            ForEach(filteredIndices, id: \.self) { index in
                                NavigationLink(destination: destinationView(for: textArray[index])) {
                                    occasionRectangle(index: index, customGradient: customGradient, textArray: textArray, imageNameArray: imageNameArray)
                                }
                            }
                        }
                       // .padding(.horizontal)

                    }
                }
            }
            .padding()
            .navigationBarTitle("Explore", displayMode: .large)
            .navigationBarBackButtonHidden(true) // Hide the back button
            .background(gradientBackground.edgesIgnoringSafeArea(.all))
        
        }
    }

    private var searchField: some View {
        TextField("Search occasion...", text: $searchTerm)
            .padding(.leading, 35)
            .padding(.vertical, 10) // Add vertical padding for better touch area
            .background(Color(.systemGray5))
            .cornerRadius(15)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .padding(.leading, 10) // Add padding to align the icon inside the TextField
                    
                    Spacer() // This will push the magnifying glass to the left and the microphone to the right
                    
                    Button(action: {
                        // Action for the microphone button
                    }) {
                        Image(systemName: "mic.fill")
                            .padding(.trailing, 10) // Add padding to align the icon inside the TextField
                    }
                }
            )
            .foregroundColor(.gray)
    }
    
    private func occasionRectangle(index: Int, customGradient: LinearGradient, textArray: [String], imageNameArray: [String]) -> some View {
        Rectangle()
            .fill(customGradient)
            .frame(width: 171, height: 117)
            .cornerRadius(10)
            .overlay(
                VStack {
                    Text(textArray[index])
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment:.leading)
                    
                    Spacer() // Pushes everything above to the top
                    
                    HStack {
                        Spacer() // Pushes everything after it to the right
                        
                        Image(imageNameArray[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                    }
                }
                .padding(.all, 5)
            )
    }
    
    private var gradientBackground: some View {
        LinearGradient(
            gradient: Gradient(
                stops: [
                    .init(color: Color(red: 0.5, green: 0.36, blue: 0.64), location: 0.07),
                    .init(color: Color(red: 0.71, green: 0.84, blue: 0.9), location: 0.40),
                    .init(color: Color(red: 0.95, green: 0.95, blue: 0.95), location: 0.89)
                ]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
}
@ViewBuilder
    private func destinationView(for occasion: String) -> some View {
        switch occasion {
        case "Happy Birthday":
            BirthdaysCards()
        case "Graduation":
            GraduationCards()
        case "New Job":
            NewJobCards()
        case "Memes":
            MemesCards()
        case "Artist":
            ArtistsCards()
        case "Gratitude":
            GratitudeCards()
        default:
            Text("Not available")
        }
    }

struct RectangleView<Destination: View>: View {
    var imageName: String
    let destination: Destination

    var body: some View {
        NavigationLink(destination: destination) {
            Rectangle()
                .fill(Color.black)
                .frame(width: 214, height: 117)
                .cornerRadius(10)
                .overlay(
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                )
        }
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
