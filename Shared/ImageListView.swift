//
//  ContentView.swift
//  Shared
//
//  Created by Пятин Дмитрий on 11.07.2020.
//

import SwiftUI
import SDWebImageSwiftUI


struct ImageListView: View {
    
    
    @ObservedObject var randomImages1 = PixelData()
    @ObservedObject var randomImages = UnsplashData()
    
    
    var body: some View {
        ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(randomImages.photoArray, id: \.id) { photo in
                        WebImage(url: URL(string: photo.urls["thumb"]!))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width - 50, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(15)
                        if photo.alt_description != nil {
                            Text(photo.alt_description!).font(.footnote).multilineTextAlignment(.leading)
                        }
                    }
                }.padding(25) 
            }.navigationTitle("Random list")
        }
}
