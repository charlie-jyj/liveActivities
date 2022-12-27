//
//  liveActivitiesApp.swift
//  liveActivities
//
//  Created by 정유진 on 2022/12/27.
//

import SwiftUI

class LiveAppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    @Published var date: Date = .now // @Published = property wrapper ($date: Published<Date> + date: Date)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        //publish timer every second
        Timer
            .publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .assign(to: &$date) // assign to = republish to other publisher
        
        return true
    }
}

@main
struct liveActivitiesApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor var delegate: LiveAppDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(delegate)
        }
    }
}
