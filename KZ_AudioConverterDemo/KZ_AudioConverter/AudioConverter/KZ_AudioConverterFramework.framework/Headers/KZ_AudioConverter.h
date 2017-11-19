//
//  KZ_AudioConverter.h
//  KZ_AudioPlayer
//
//  Created by Kieron Zhang on 2017/9/27.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KZ_AudioConverter : NSObject

+ (BOOL)amrToWav:(NSString *)amrPath wavSavePath:(NSString *)savePath;
+ (BOOL)wavToAmr:(NSString *)wavPath amrSavePath:(NSString *)savePath;

@end
