//
//  Vapor_with_iOSApp.swift
//  Vapor-with-iOS
//
//  Created by rei.nakaoka on 2023/12/05.
//

import SwiftUI

@main
struct Vapor_with_iOSApp: App {

    let server = Server(port: 8080)

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    try? server.start()
                }
        }
    }
}
