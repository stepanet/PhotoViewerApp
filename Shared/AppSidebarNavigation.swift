//
//  AppSidebarNavigation.swift
//  PhotoViewerApp
//
//  Created by Пятин Дмитрий on 11.07.2020.
//

import SwiftUI

struct AppSidebarNavigation: View {
    
    enum NavigationItem {
        case list
        case grid
    }
    
    @State private var selection: Set<NavigationItem> = [.list]
    
    
    var sidebar: some View {
        List(selection: $selection) {
            NavigationLink(destination: ImageListView()) {
                Label("List", systemImage: "list.bullet")
                    .accessibility(label: Text("List layout"))
                    .tag(NavigationItem.list)
            }
            NavigationLink(destination: ImageGridView()) {
                Label("Grid", systemImage: "rectangle.3.offgrid.fill")
                    .accessibility(label: Text("Grid layout"))
                    .tag(NavigationItem.grid)
            }
        }
        .navigationTitle("Content Options")
        .listStyle(SidebarListStyle())
    }
    
    var body: some View {
        NavigationView {
            sidebar
            Text("Select contents style")
                .frame(maxWidth: .infinity,  maxHeight: .infinity)
        }
    }
}

struct AppSidebarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarNavigation()
    }
}
