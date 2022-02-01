//
//  EventBridgeTests.swift
//  AnalyticsConnectorTests
//
//  Created by Brian Giori on 12/22/21.
//

import XCTest
@testable import AnalyticsConnector

class EventBridgeTests: XCTestCase {
    
    func testSetEventReceiverLogEventListenerCalled() {
        let testEvent = AnalyticsEvent(eventType: "test", eventProperties: nil, userProperties: nil)
        let eventBridge = EventBridgeImpl()
        eventBridge.setEventReceiver { (event) in
            XCTAssertEqual(testEvent, event)
        }
        eventBridge.logEvent(event: AnalyticsEvent(eventType: "test", eventProperties: nil, userProperties: nil))
    }
    
    func testMultipleLogEventLateSetEventReceiverListenerCalled() {
        let testEvent0 = AnalyticsEvent(eventType: "test0", eventProperties: nil, userProperties: nil)
        let testEvent1 = AnalyticsEvent(eventType: "test1", eventProperties: nil, userProperties: nil)
        let testEvent2 = AnalyticsEvent(eventType: "test2", eventProperties: nil, userProperties: nil)
        let eventBridge = EventBridgeImpl()
        eventBridge.logEvent(event: testEvent0)
        eventBridge.logEvent(event: testEvent1)
        var eventCount = 0
        eventBridge.setEventReceiver { (event) in
            if eventCount == 0 {
                XCTAssertEqual(testEvent0, event)
            } else if eventCount == 1 {
                XCTAssertEqual(testEvent1, event)
            } else if eventCount == 2 {
                XCTAssertEqual(testEvent2, event)
            }
            eventCount += 1
        }
        eventBridge.logEvent(event: testEvent2)
        XCTAssertEqual(3, eventCount)
    }
}
