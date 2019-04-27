//
//  ExceptionTrapper.m
//  NoExceptions
//
//  Created by CatPalace on 4/13/19.
//  Copyright © 2019 CatPalace. All rights reserved.
//

#import "ExceptionTrapper.h"
#import "NSExceptionError.h"

@implementation ExceptionTrapper

- (BOOL)catchExceptionIn:(void (^)(void))block
                   error:(NSError * _Nullable * _Nullable)error {

    @try {
        block();
        return *error == nil;
    }
    @catch(NSException *caughtException) {
        *error = [[NSExceptionError alloc] initWithException:caughtException];
        return NO;
    }
}

@end
