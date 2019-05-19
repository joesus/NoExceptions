//
//  NSExceptionError.h
//  NoExceptions
//
//  Created by CatPalace on 4/27/19.
//  Copyright © 2019 CatPalace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSErrorDomain NoExceptionsErrorDomain;
extern NSErrorUserInfoKey NoExceptionsErrorExceptionKey;

/// A custom `NSError` used for wrapping an `NSException`
@interface NSExceptionError : NSError

/// A reference to the captured `NSException`
@property (readonly) NSException *exception;

- (instancetype)initWithException:(NSException *)exception;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithDomain:(NSErrorDomain _Nullable)domain
                          code:(NSInteger)code
                      userInfo:(NSDictionary<NSErrorUserInfoKey,id> *_Nullable)dict NS_UNAVAILABLE;

- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (void)encodeWithCoder:(NSCoder *)aCoder NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
