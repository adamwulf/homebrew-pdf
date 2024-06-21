//
//  PDFContents.swift
//  pdf
//
//  Created by Adam Wulf on 6/20/24.
//

import Foundation
import ArgumentParser
import PDFKit
import SwiftToolbox

struct PDFContents: AsyncParsableCommand {
    enum Error: Swift.Error {
        case fileDoesNotExist(_ path: String)
        case invalidPDF
    }

    static var configuration = CommandConfiguration(
        commandName: "contents",
        abstract: "Extract plain text contents of PDF"
    )

    @Argument(help: "The location on disk of the pdf to check.")
    var input: String

    @Option(name: .shortAndLong, help: "An optional page to fetch contents")
    var page: Int?

    mutating func run() async throws {
        let absoluteURL = try PDF.expand(path: input)

        guard FileManager.default.fileExists(atPath: absoluteURL.path) else { throw Error.fileDoesNotExist(absoluteURL.path) }
        guard let pdf = PDFDocument(url: absoluteURL) else { throw Error.invalidPDF }
        var ret = ""
        for index in 0..<pdf.pageCount {
            guard
                let page = pdf.page(at: index),
                self.page == nil || self.page == index,
                let contents = page.string
            else { continue }
            if !ret.isEmpty {
                ret += "\n\n"
            }
            ret += contents
        }
        print(ret)
    }
}
