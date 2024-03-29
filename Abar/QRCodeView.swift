//
//  QRCodeView.swift
//  AbarEx
//
//  Created by Noura. on 19/07/1445 AH.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    var url: String

    var body: some View {
        Image(uiImage: generateQRCode(from: url))
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(width: 70, height: 74)
            .padding()
    }

    private func generateQRCode(from string: String) -> UIImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()

        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}



#Preview {
    QRCodeView(url: "https://example.com")
}
