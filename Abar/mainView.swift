//
// ContentView.swift
// Abar
//
// Created by haifa alfoiz on 17/01/2024. //

import SwiftUI

struct mainView: View {

@State private var isSheetPresented = false
@State private var selectedRectangleIndex: Int?
@State var searchTerm = ""

var body: some View {
    
    let customGradient = LinearGradient(
        gradient: Gradient(colors:[Color("StartColor"), Color("white")]),
            startPoint: .leading, endPoint: .trailing )
    let textArray = ["Happy Birthday", "Graduation", "New Job", "Memes", "Artist", "Gratitude"]
    let imageNameArray = ["balloon23", "grad23", "clap23", "Sticker", "mic23", "flower23"]
    
    var filteredIndices: [Int] {
        if searchTerm.isEmpty {
            return
            Array(0..<textArray.count)
        } else {
            return textArray.indices.filter { let localizedString = textArray[$0]
                let regularString = String(describing: localizedString)
                return
                regularString.lowercased().contains(searchTerm.lowercased())
            }
        } }
    NavigationView{
        ScrollView{
            VStack{
                HStack{
                    TextField("searchoccasion...", text: $searchTerm)
                        .padding(.leading,27)
                }
                    .padding(6)
                    .background(Color(.systemGray5)) .cornerRadius(15)
                    .padding(.horizontal)
                    .overlay(
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                            
                            Spacer()
                            
                            {}, label: {
                                Image(systemName: "mic.fill") })
                        }
                            .padding(.horizontal, 25)
                            .foregroundColor(.gray)
                        Button(action:
                              )
                        .padding(.vertical, 10)
                        
                        Text("Special Ocassions")
                            .font(.title2)
                            .frame(maxWidth:
                                    .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .bold()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack(spacing: 20) {
                                RectangleView(imageName: "foundationDay", destination: Text("Page 1"))
                                RectangleView(imageName: "Yarb", destination: Text("Page 2"))
                            }
                            .padding(.horizontal)
                        }
                        
                        Text("Occasions")
                            .font(.title2)
                            .frame(maxWidth:.infinity, alignment: .leading)
                            .padding(.horizontal)
                            .bold()
                        
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: -30), GridItem(.flexible(), spacing: -30)]) {
                        ForEach(filteredIndices,id: \.self) { index in
                        // Using NavigationLink to create a navigation link for each rectangle
                        
                        NavigationLink(destination: DetailView(index: index)) {
                            HStack {
                                Rectangle()
                                    .fill(customGradient)
                                    .frame(width: 171, height: 117)
                                    .padding(1)
                                    .cornerRadius(10)
                                    .overlay(
                                        VStack {
                                            Text(textArray[index]) .foregroundColor(.black) .fontWeight(.semibold)
                                                .font(.subheadline)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Spacer()
                                            
                                            HStack {
                                                
                                                Spacer()
                                                
                                                // Iterates over each image name and creates an Image view
                                                Image(imageNameArray[index])
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 45, height: 45) // Sets the image size.
                                            }
                                        }
                                        .frame(maxWidth: 150, maxHeight: 90, alignment: .bottomTrailing)
                                    )
                            } }
                    }
                        
                    } }
                    .navigationTitle("Explore")
                        } 
                    .background(LinearGradient(stops: [Gradient.Stop(color: Color(red: 0.5, green: 0.36, blue: 0.64), location: 0.07),
                                    Gradient.Stop(color: Color(red: 0.71, green: 0.84, blue: 0.9), location: 0.40),
                                    Gradient.Stop(color: Color(red: 0.95, green: 0.95, blue: 0.95), location: 0.89), ], startPoint: UnitPoint(x: endPoint: UnitPoint(x: 0.5,)) }
                                } }
                                struct DetailView: View {
                                    // Parameter to receive the index from the ContentView
                                    0.5, y: -0.26),
                                y: 0.46)
                                    
                                    let index: Int
                                    var body: some View {
                                        // Using the index to display specific
                                        data for each rectangle
                                                    Text("Detail for Rectangle \(index)") .navigationTitle("Rectangle
                                                                                                           \(index)") }
                                                                                                           }
                                                                                                           struct RectangleView: View { var imageName: String var destination: Text
                                                        var body: some View { NavigationLink(destination: destination)
                                                            {
                                                                Rectangle()
                                                                    .fill(Color.clear) // Make the
                                                                rectangle transparent
                                                                    .frame(width: 214, height: 117)
                                                                    .cornerRadius(10)
                                                                    .overlay(
                                                                        Image(imageName)
                                                                            .resizable()
                                                                            .scaledToFit() .clipShape(RoundedRectangle(cornerRadius: 10))
                                                                    )
                                                            } }
                                                        
                                                    }
                                                                                                           #Preview {
                                                        ContentView()
                                                    }
