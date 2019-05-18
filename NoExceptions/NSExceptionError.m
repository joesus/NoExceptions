//
//  NSExceptionError.m
//  NoExceptions
//
//  Created by CatPalace on 4/27/19.
//  Copyright © 2019 CatPalace. All rights reserved.
//

#import "NSExceptionError.h"

NSErrorDomain NoExceptionsErrorDomain =  @"NoExceptionsErrorDomain";
NSErrorUserInfoKey NoExceptionsErrorExceptionKey = @"NoExceptionsErrorException";

@implementation NSExceptionError

- (instancetype)initWithException:(NSException *)exception {
    self = [super initWithDomain:NoExceptionsErrorDomain
                            code:0
                        userInfo:@{ NoExceptionsErrorExceptionKey: exception }];

    if (self) {
        _exception = exception;
    }

    return self;
}

@end
