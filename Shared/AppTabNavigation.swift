//
//  AppTabNavigation.swift
//  iOS
//
//  Created by Пятин Дмитрий on 11.07.2020.
//

import SwiftUI

struct AppTabNavigation: View {
    
    @State private var selection: Tab = .list
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
               ImageListView()
            }
            .tabItem {
                Label("List", systemImage: "list.bullet")
                    .accessibility(label: Text("List layout"))
            }
            NavigationView {
               ImageGridView()
            }
            .tabItem {
                Label("Grid", systemImage: "rectangle.3.offgrid.fill")
                    .accessibility(label: Text("Grid layout"))
            }
            NavigationView {
                ImageNooseView()
            }
            .tabItem {
                Label("Noose", systemImage: "nose")
                    .accessibility(label: Text("Noose layout"))
            }
        }
    }
}


extension AppTabNavigation {
    enum Tab {
        case list
        case grid
        case noose
    }
}
