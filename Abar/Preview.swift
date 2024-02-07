//
//  Details.swift
//  Abar
//
//  Created by haifa alfoiz on 23/01/2024.
//
//
//  Details.swift
//  Abar
//
//  Created by haifa alfoiz on 23/01/2024.
//

import SwiftUI
import PDFKit
import UIKit

// A SwiftUI view that displays the final card and provides functionality for generating and sharing a PDF version of the card.
struct PreviewView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var documentURL: URL? = nil
    
    let category: String
    let cardIndex: Int
    let userInput: String
    let link: String?
    
   
    
    var body: some View {
        VStack(spacing: 80) {
            FinalCardView(category: category, cardIndex: cardIndex, userInput: userInput, link: link)
            VStack(spacing: 20){
                Button("Done") {
                    generatePDF()
                }
                .frame(width: 334, height: 52)
                .background(Color("AccentColor"))
                .foregroundColor(.white)
                .cornerRadius(10)
                
                if let documentURL = documentURL {
                    ShareLink(item: documentURL) {
                        Image(systemName: "square.and.arrow.up")
                            .frame(width: 44, height: 44) // Adjust size as needed
                            .contentShape(Rectangle())
                            .background(Color("AccentColor"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            
           
        }
        .navigationBarTitle("Preview", displayMode: .inline)
    }
    

    // Generates a PDF from the FinalCardView and updates the documentURL state.
    func generatePDF() {
        let finalCardView = FinalCardView(category: category, cardIndex: cardIndex, userInput: userInput, link: link)
        
        // Adjust the size to fit the entire card within the PDF
        let imageSize = CGSize(width: 400, height: 453)
        
        if let image = renderViewToImage(finalCardView, size: imageSize), let url = saveImageAsPDF(image, withFileName: "Abar") {
            self.documentURL = url
        }
    }

    // Renders a SwiftUI View into an UIImage.
    func renderViewToImage<T: View>(_ view: T, size: CGSize) -> UIImage? {
        let controller = UIHostingController(rootView: view)
        let containerSize = CGSize(width: size.width, height: size.height) // Adjusted to fit image size
        controller.view.bounds = CGRect(origin: .zero, size: containerSize)
        controller.view.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            // Adjust the position to center the content
            let xOffset = (size.width - containerSize.width) / 2
            let yOffset = (size.height - containerSize.height) / 2
            controller.view.frame = CGRect(x: xOffset, y: yOffset, width: containerSize.width, height: containerSize.height)
            
            controller.view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }

  



    
    func saveImageAsPDF(_ image: UIImage, withFileName fileName: String) -> URL? {
        let pdfPageBounds = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)


        let pdfData = NSMutableData()
        
        UIGraphicsBeginPDFContextToData(pdfData, pdfPageBounds, nil)
        UIGraphicsBeginPDFPageWithInfo(pdfPageBounds, nil)
        guard let pdfContext = UIGraphicsGetCurrentContext() else { return nil }

        // Correcting the orientation by translating and scaling the context
        pdfContext.translateBy(x: 0, y: pdfPageBounds.height)
        pdfContext.scaleBy(x: 1.0, y: -1.0)
        
        pdfContext.draw(image.cgImage!, in: pdfPageBounds)
        UIGraphicsEndPDFContext()
        
        // Using the custom fileName parameter to name the PDF file
        let path = NSTemporaryDirectory().appending(fileName).appending(".pdf")
        let fileURL = URL(fileURLWithPath: path)
        
        do {
            try pdfData.write(to: fileURL, options: .atomic)
            return fileURL
        } catch {
            print("Could not save PDF file: \(error.localizedDescription)")
            return nil
        }
    }

}
    struct FinalCardView: View {
        let category: String
        let cardIndex: Int
        let userInput: String
        let link: String?
        
        let imageSize = CGSize(width: 304, height: 357) // This might need adjustment

        
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
        


struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView(category: "Graduation", cardIndex: 0, userInput: "Congratulations on your graduation!", link: "https://example.com")
    }
}
