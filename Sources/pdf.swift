//
//  main.swift
//  pdf
//
//  Created by Adam Wulf on 6/20/24.
//

import Foundation
import ArgumentParser

@main
struct PDF: AsyncParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "pdf",
        discussion: "PDF file utilities",
        version: "pdf \(BuildSettings.VERSION)",
        subcommands: [PDFContents.self, PDFPages.self, PDFMeta.self]
    )

    static func expand(path: String) throws -> URL {
        // Expand tilde and resolve relative path
        let expandedPath = (path as NSString).expandingTildeInPath
        if expandedPath.hasPrefix("/") {
            return URL(fileURLWithPath: expandedPath)
        } else {
            let currentDirectory = FileManager.default.currentDirectoryPath
            return URL(fileURLWithPath: currentDirectory).appendingPathComponent(expandedPath).standardized
        }
    }
}
