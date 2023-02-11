//
//  QRGeneratorView.swift
//  Bong
//
//  Created by Mathias Raa on 10/02/2023.
//

import SwiftUI

struct QRGeneratorView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            TextField("Enter code", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Image(uiImage: UIImage(data: getQRCodeDate(text: text)!)!)
                .resizable()
                .frame(width: 200, height: 200)
        }
    }
    
    func getQRCodeDate(text: String) -> Data? {
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        let data = text.data(using: .ascii, allowLossyConversion: false)
        filter.setValue(data, forKey: "inputMessage")
        guard let ciimage = filter.outputImage else { return nil }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledCIImage = ciimage.transformed(by: transform)
        let uiimage = UIImage(ciImage: scaledCIImage)
        return uiimage.pngData()!
    }
}

struct QRGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        QRGeneratorView()
    }
}
