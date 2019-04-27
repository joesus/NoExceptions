//
//  ThrowingClass.h
//  NoExceptionsTests
//
//  Created by CatPalace on 4/13/19.
//  Copyright © 2019 CatPalace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThrowingClass : NSObject

- (void)throwingMethod;
- (id)throwingGetter;

@end

NS_ASSUME_NONNULL_END
