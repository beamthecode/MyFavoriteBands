//
//  MyFavoriteBandsApp.swift
//  MyFavoriteBands
//
//  Created by Brent Beamer on 11/21/23.
//

import SwiftUI

@main
struct MyFavoriteBandsApp: App {
    
 
    init() {
        let appear = UINavigationBarAppearance()
        
        
        appear.configureWithOpaqueBackground() // configure
        
        let backItemAppearance = UIBarButtonItemAppearance()
        backItemAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.white] // fix text color
        appear.backButtonAppearance = backItemAppearance
        
        let image = UIImage(systemName: "chevron.backward")?.withTintColor(.white, renderingMode: .alwaysOriginal) // image
          appear.setBackIndicatorImage(image, transitionMaskImage: image)
       
        
        let atters: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "SpecialElite-Regular", size: 28)
        ]
        
        
        appear.largeTitleTextAttributes = atters
        appear.titleTextAttributes = atters
        UINavigationBar.appearance().standardAppearance = appear
        UINavigationBar.appearance().compactAppearance = appear
        UINavigationBar.appearance().scrollEdgeAppearance = appear
    }
    
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
