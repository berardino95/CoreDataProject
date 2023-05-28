//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Berardino Chiarello on 25/05/23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
