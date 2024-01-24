//
//  ContentView.swift
//  Abar
//
//  Created by haifa alfoiz on 17/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isSheetPresented = false
    @State private var selectedRectangleIndex: Int?
    @State var searchTerm = ""
    
    
    var body: some View {
        
        //        var filteredIndices: [Int] {
        //            if searchTerm.isEmpty {
        //                return Array(0..<textArray.count)
        //            } else {
        //                return textArray.indices.filter {
        //                    let localizedString = textArray[$0]
        //                    let regularString = String(describing: localizedString)
        //                    return regularString.lowercased().contains(searchTerm.lowercased())
        //                }
        //            }
        //        }
        
        
        
        NavigationView {
            ScrollView {
                VStack {
                    
                    HStack {
                        TextField("search occasion...", text: $searchTerm)
                            .padding(.leading, 27)
                        
                    } .padding(6)
                        .background(Color(.systemGray5))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .overlay(
                            
                            HStack {
                                Image(systemName: "magnifyingglass")
                                Spacer()
                                Button(action: {}, label: {
                                    Image(systemName: "mic.fill") })
                                
                            }.padding(.horizontal, 25)
                                .foregroundColor(.gray)
                            
                            
                        )
                    
                        .padding(.vertical, 10)
                    
                    
                    
                    Text("Special Ocassions")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                                  HStack(spacing: 20) {
                                      RectangleView(imageName: "image1", title: "Rectangle 1", destination: Text("Page 1"))
                                      RectangleView(imageName: "image2", title: "Rectangle 2", destination: Text("Page 2"))
                                      RectangleView(imageName: "image3", title: "Rectangle 3", destination: Text("Page 3"))
                                  }
                                  .padding()
                              }
                    
                    
                    
                    Text("Occasions")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]) {
                        ForEach(1..<7) { index in
                            createNavigationLink(index: index)
                        }
                    }
                    
                    
                }
                .navigationTitle("Explore")
                
                
              
            } .background(
                LinearGradient(
                stops: [
                Gradient.Stop(color: Color(red: 0.5, green: 0.36, blue: 0.64), location: 0.07),
                Gradient.Stop(color: Color(red: 0.71, green: 0.84, blue: 0.9), location: 0.40),
                Gradient.Stop(color: Color(red: 0.95, green: 0.95, blue: 0.95), location: 0.89),
                ],
                startPoint: UnitPoint(x: 0.5, y: -0.26),
                endPoint: UnitPoint(x: 0.5, y: 0.46)
                )
                )
        }
        
    }
}


struct RectangleView: View {
    var imageName: String
    var title: String
    var destination: Text
    
    var body: some View {
        NavigationLink(destination: destination) {
            Rectangle()
                .foregroundColor(.clear)
                .background(Color(.systemGray5))
                .frame(width: 214, height: 117)
                .cornerRadius(10)
                .overlay(
                    Text(title)
                        .foregroundColor(.black)
                )
        }
    }
}

func createNavigationLink(index: Int) -> some View {
    let content: String
    
    switch index {
    case 1:
        content = "rec 1"
    case 2:
        content = "rec 2"
    case 3:
        content = "rec 3"
    case 4:
        content = "rec 4"
    case 5:
        content = "rec 5"
    case 6:
        content = "rec 6"
    default:
        content = "Unknown Page Content"
    }

    return NavigationLink(destination: DetailView(content: content)) {
        createRectangle(index: index, content: content)
    }
    .buttonStyle(PlainButtonStyle())
}

func createRectangle(index: Int, content: String) -> some View {
    Rectangle()
        .foregroundColor(.clear)
        .frame(width: 171, height: 117)
        .background(Color(.systemGray5))
        .cornerRadius(10)
        .overlay(Text(content).foregroundColor(.black))
        .padding()
}


struct DetailView: View {
let content: String

var body: some View {
    VStack {
        Text(content)
            .padding()

        // Customize additional content for each page
        switch content {
        case "rec 1":
            Text("yeees this is page 1")
                .padding()
            
        case "rec 2":
            Text("page 2 !!!")
                .padding()
            
        case "rec 3":
            Text("nononono this page 3 ")
                .padding()
            
        case "rec 4":
            Text("Page 4 wohoo")
                .padding()
            
        case "rec 5":
            Text("yep yep page 5")
                .padding()
            
        case "rec 6":
            Text("page 6 laast")
                .padding()
            
        default:
            Text("Unknown Page Content").padding()
        }
    }
    .navigationBarTitle("Detail Page")
}
}



#Preview {
    ContentView()
}
