//
//  WhitespaceTests.swift
//  SwiftCSV
//
//  Created by ReedEs on 04/12/21.
//

import XCTest
import SwiftCSV

class WhitespaceTests: XCTestCase {

    func testBeforeQuoteBeginningLine() throws {
        let csv = try CSV(string: " \"name\"\n")
        XCTAssertEqual(csv.header, ["name"])
    }

    func testBeforeQuoteWithinLine() throws {
        let csv = try CSV(string: "id, \"name\"\n")
        XCTAssertEqual(csv.header, ["id", "name"])
    }

    func testAfterQuoteWithinLine() throws {
        let csv = try CSV(string: "\"name\" ,age\n")
        XCTAssertEqual(csv.header, ["name", "age"])
    }
    
    func testAfterQuoteAtEndOfLine() throws {
        let csv = try CSV(string: "\"age\" \n")
        XCTAssertEqual(csv.header, ["age"])
    }
}
