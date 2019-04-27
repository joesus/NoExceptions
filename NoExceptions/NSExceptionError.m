//
//  NSExceptionError.m
//  NoExceptions
//
//  Created by CatPalace on 4/27/19.
//  Copyright © 2019 CatPalace. All rights reserved.
//

#import "NSExceptionError.h"

@implementation NSExceptionError

- (instancetype)initWithException:(NSException *)exception {
    self = [super init];

    if (self) {
        _exception = exception;
    }

    return self;
}

@end
