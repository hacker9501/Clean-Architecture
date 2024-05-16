//
//  WhizPruebaTechApp.swift
//  WhizPruebaTech
//
//  Created by Elver Mayta Hernández on 17/04/24.
//

import SwiftUI

@main
struct WhizPruebaTechApp: App {
    var body: some Scene {
        WindowGroup {
            ProductoListFactory.createHome()
        }
    }
}
