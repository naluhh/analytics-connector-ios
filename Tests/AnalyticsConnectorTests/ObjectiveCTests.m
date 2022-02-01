//
//  ObjectiveCTests.m
//  AnalyticsConnectorTests
//
//  Created by Brian Giori on 1/10/22.
//

#import <Foundation/Foundation.h>

#import <XCTest/XCTest.h>
#import <AnalyticsConnector/AnalyticsConnector-Swift.h>
#import <dispatch/dispatch.h>

@interface ObjectiveCTests : XCTestCase

@end

@implementation ObjectiveCTests

- (void)testObjectiveCBasic {
    AnalyticsConnector* connector = [AnalyticsConnector getInstance:@"test"];
    __block AnalyticsEvent* actualEvent = nil;
    [[connector eventBridge] setEventReceiver:^(AnalyticsEvent * _Nonnull event) {
        actualEvent = event;
    }];
    AnalyticsEvent* event = [[AnalyticsEvent alloc] initWithEventType:@"test-event" eventProperties:nil userProperties:nil];
    [[connector eventBridge] logEventWithEvent:event];
    XCTAssertEqual([actualEvent eventType], @"test-event");
}

@end
