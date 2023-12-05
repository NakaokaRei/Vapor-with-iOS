//
//  Server.swift
//  Vapor-with-iOS
//
//  Created by rei.nakaoka on 2023/12/05.
//

import Vapor
import Vision

final class Server: ObservableObject {

    var app: Application
    let port: Int
    let textRecognizer = TextRecognizer()

    init(port: Int) {
        self.port = port
        app = Application(.development)
    }

    func start() throws {
        Task(priority: .background) {
            do {
                try configure(app)
                try app.run()
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }

    func configure(_ app: Application) throws {
        app.http.server.configuration.hostname = "0.0.0.0"
        app.http.server.configuration.port = port

        try defineRoutes(app)
    }

    func defineRoutes(_ app: Application) throws {
        app.get { req in
            "Hello, world!"
        }

        app.post("recognize-text") { [self] req -> EventLoopFuture<String> in
            let imageBase64eData = try req.content.decode(ImageData.self)
            guard let imageData = Data(base64Encoded: imageBase64eData.image) else {
                throw Abort(.badRequest)
            }
            return textRecognizer.recognizeText(from: imageData, on: req.eventLoop)
        }
    }
}
