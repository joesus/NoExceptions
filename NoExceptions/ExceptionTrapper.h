//
//  ExceptionTrapper.h
//  NoExceptions
//
//  Created by CatPalace on 4/13/19.
//  Copyright © 2019 CatPalace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExceptionTrapper : NSObject

- (BOOL)catchExceptionIn:(void (^)(void))block
                   error:(NSError * _Nullable * _Nullable)error;

@end

NS_ASSUME_NONNULL_END
