//
//  MusicSearchTests.m
//  MusicSearchTests
//
//  Created by jitendra rajoria on 8/12/15.
//  Copyright (c) 2015 jitendra rajoria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewModel.h"

@interface MyCardsTests : XCTestCase

@end

@implementation MyCardsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testCardListDownloadSuccess {
    __block BOOL done = NO;
    __block NSArray *dataArray;
    
    [[ViewModel sharedManager ] getTrackListWithURl:@"http://127.0.0.1:8080/manager/Card.json" withCompletionBlock:^(id response) {
        done = YES;
        dataArray = (NSArray *)response;
        XCTAssertNotNil(dataArray);
    }];
    
    XCTAssertTrue([self waitFor:&done timeout:3], @"Timed out waiting for response asynch method completion");
}

- (BOOL)waitFor:(BOOL *)flag timeout:(NSTimeInterval)timeoutSecs {
    NSDate *timeoutDate = [NSDate dateWithTimeIntervalSinceNow:timeoutSecs];
    
    do {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:timeoutDate];
        if ([timeoutDate timeIntervalSinceNow] < 0.0) {
            break;
        }
    }
    while (!*flag);
    return *flag;
}

@end
