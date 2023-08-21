//
//  RemoteImage.swift
//  EmployeeDirectory
//
//  Created by Sameer Shaligram on 2023-08-12.
//

import Foundation

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    func loadImage(fromURL url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let loadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = loadedImage
                }
            }
        }.resume()
    }
}

struct RemoteImage: View {
    let url: URL
    @StateObject private var imageLoader = ImageLoader()
    
    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            Image(systemName: "person.crop.circle.fill")
                .onAppear {
                    imageLoader.loadImage(fromURL: url)
                }
        }
    }
}


