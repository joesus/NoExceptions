//
//  NonThrowingClass.m
//  NoExceptionsTests
//
//  Created by CatPalace on 4/13/19.
//  Copyright © 2019 CatPalace. All rights reserved.
//

#import "NonThrowingClass.h"

@interface NonThrowingClass ()

@property (readwrite) BOOL methodWasInvoked;

@end

@implementation NonThrowingClass

- (void)nonThrowingMethod {
    self.methodWasInvoked = YES;
}

- (id)nonThrowingGetter {
    return self;
}

@end
