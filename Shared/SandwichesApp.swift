//
//  SandwichesApp.swift
//  Shared
//
//  Created by chino on 2020/11/15.
//

import SwiftUI

@main
struct SandwichesApp: App {
    @StateObject private var store = SandwichStore()

    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
