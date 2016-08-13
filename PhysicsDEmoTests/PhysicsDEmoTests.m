//
//  PhysicsDEmoTests.m
//  PhysicsDEmoTests
//
//  Created by Michael Henry on 4/24/14.
//  Copyright (c) 2014 Digital Javelina, LLC. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface PhysicsDEmoTests : XCTestCase

@end

@implementation PhysicsDEmoTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

typedef NS_OPTIONS(NSUInteger, BitMasks) {
    First = 1 << 0,
    Second = 1 << 1,
    Third = 1 << 2,
};

- (void) testBitMasks
{
    int maskCheck = First | Second;
    XCTAssert(maskCheck & First, @"I'm in there");
    XCTAssertFalse(maskCheck & Third, @"I'm not");
    
}

@end
