//
//  PDFPages.swift
//  pdf
//
//  Created by Adam Wulf on 6/20/24.
//

import Foundation
import ArgumentParser
import PDFKit
import SwiftToolbox

struct PDFPages: AsyncParsableCommand {
    enum Error: Swift.Error {
        case fileDoesNotExist(_ path: String)
        case invalidPDF
    }

    static var configuration = CommandConfiguration(
        commandName: "pages",
        abstract: "Output the page count"
    )

    @Argument(help: "The location on disk of the pdf to check.")
    var input: String

    mutating func run() async throws {
        let absolutePath = try PDF.expand(path: input)
        guard FileManager.default.fileExists(atPath: absolutePath.path) else { throw Error.fileDoesNotExist(absolutePath.path) }
        guard let pdf = PDFDocument(url: absolutePath) else { throw Error.invalidPDF }
        print("\(pdf.pageCount)")
    }
}
