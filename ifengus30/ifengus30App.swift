//
//  ifengus30App.swift
//  ifengus30
//
//  Created by Alan Yang on 2/6/21.
//

import SwiftUI

@main
struct ifengus30App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            AppMainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
