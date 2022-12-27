//
//  liveActivitiesApp.swift
//  liveActivities
//
//  Created by 정유진 on 2022/12/27.
//

import SwiftUI

@main
struct liveActivitiesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
