//
//  image_convertorApp.swift
//  image convertor
//
//  Created by Кирилл on 07.10.2021.
//

import SwiftUI

@main
struct image_convertorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
