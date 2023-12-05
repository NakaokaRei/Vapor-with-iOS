//
//  TextRecognizer.swift
//  Vapor-with-iOS
//
//  Created by rei.nakaoka on 2023/12/05.
//

import Vapor
import Vision

class TextRecognizer {
    func recognizeText(from imageData: Data, on eventLoop: EventLoop) -> EventLoopFuture<String> {
        let promise = eventLoop.makePromise(of: String.self)

        let handler = VNImageRequestHandler(data: imageData, options: [:])
        let request = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else {
                promise.fail(error ?? Abort(.internalServerError))
                return
            }

            let recognizedText = observations.compactMap { $0.topCandidates(1).first?.string }.joined(separator: "\n")
            promise.succeed(recognizedText)
        }

        do {
            try handler.perform([request])
        } catch {
            promise.fail(error)
        }

        return promise.futureResult
    }
}
