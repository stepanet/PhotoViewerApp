//
//  Navigation.swift
//  PhotoViewerApp
//
//  Created by Пятин Дмитрий on 11.07.2020.
//

import SwiftUI

struct Navigation: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    @ViewBuilder var body: some View {
        if horizontalSizeClass == .compact {
            AppTabNavigation()
        } else {
            AppSidebarNavigation()
        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
