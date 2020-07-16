//
//  ImageNooseView.swift
//  PhotoViewerApp
//
//  Created by Пятин Дмитрий on 11.07.2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageNooseView: View {
    
    @ObservedObject var randomImages = UnsplashData()
    
    var columns = [
        GridItem(spacing: 0),
        GridItem(spacing: 0),
        GridItem(spacing: 0),
        GridItem(spacing: 0)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(randomImages.photoArray, id: \.id) { photo in
                    WebImage(url: URL(string: photo.urls["thumb"]!))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80 )
                        .clipped()
                    if photo.alt_description != nil {
                        Text(photo.alt_description!).font(.footnote).multilineTextAlignment(.leading)
                    }
                }
            }.padding()
        }.navigationTitle("Random nose")
    }
}

struct ImageNooseView_Previews: PreviewProvider {
    static var previews: some View {
        ImageNooseView()
    }
}
