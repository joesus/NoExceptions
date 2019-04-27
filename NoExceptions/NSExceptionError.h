//
//  NSExceptionError.h
//  NoExceptions
//
//  Created by CatPalace on 4/27/19.
//  Copyright © 2019 CatPalace. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// A custom `NSError` used for wrapping an `NSException`
@interface NSExceptionError : NSError

/// A reference to the captured `NSException`
@property (readonly) NSException *exception;

- (instancetype)initWithException:(NSException *)exception;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
