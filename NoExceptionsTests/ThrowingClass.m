//
//  ThrowingClass.m
//  NoExceptionsTests
//
//  Created by CatPalace on 4/13/19.
//  Copyright © 2019 CatPalace. All rights reserved.
//

#import "ThrowingClass.h"

@implementation ThrowingClass

- (NSException *)makeException {
    return [NSException exceptionWithName:@"ThrowingClassException"
                                   reason:nil
                                 userInfo:nil];
}

- (void)throwingMethod {
    [[self makeException] raise];
}

- (id)throwingGetter {
    [[self makeException] raise];
    return self;
}

@end
