//
//  AnalyticsConnectorTests.swift
//  AnalyticsConnectorTests
//
//  Created by Brian Giori on 12/21/21.
//

import XCTest
@testable import AnalyticsConnector

class AnalyticsConnectorTests: XCTestCase {
    
    func testGetInstanceReturnsSameInstance() {
        let connector1 = AnalyticsConnector.getInstance("test")
        let connector2 = AnalyticsConnector.getInstance("test")
        XCTAssertEqual(connector1, connector2)
    }
    
    func testGetInstanceWithDifferentNamesGetsDifferentInstances() {
        let connector1 = AnalyticsConnector.getInstance("test1")
        let connector2 = AnalyticsConnector.getInstance("tett2")
        XCTAssertNotEqual(connector1, connector2)
    }
}
