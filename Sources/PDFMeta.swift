//
//  PDFMeta.swift
//  pdf
//
//  Created by Adam Wulf on 6/20/24.
//

import Foundation
import ArgumentParser
import PDFKit
import SwiftToolbox

struct PDFMeta: AsyncParsableCommand {
    enum Error: Swift.Error {
        case fileDoesNotExist(_ path: String)
        case invalidPDF
    }

    static var configuration = CommandConfiguration(
        commandName: "meta",
        abstract: "Output the pdf metadata"
    )

    @Argument(help: "The location on disk of the pdf to check.")
    var input: String

    mutating func run() async throws {
        let absolutePath = try PDF.expand(path: input)
        guard FileManager.default.fileExists(atPath: absolutePath.path) else { throw Error.fileDoesNotExist(absolutePath.path) }
        guard let pdf = PDFDocument(url: absolutePath) else { throw Error.invalidPDF }
        if let title = pdf.title {
            print("Title: \(title)")
        }
        if let subject = pdf.subject {
            print("Subject: \(subject)")
        }
        if let author = pdf.author {
            print("Author: \(author)")
        }
        if let creator = pdf.creator {
            print("Creator: \(creator)")
        }
        if let keywords = pdf.keywords {
            print("Keywords: \(keywords.joined(separator: ", "))")
        }
        if let producer = pdf.producer {
            print("Producer: \(producer)")
        }
    }
}
