//
//  KZ_MeterTable.h
//  KZ_AudioPlayer
//
//  Created by Kieron Zhang on 2017/9/28.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KZ_MeterTable : NSObject {
    float scaleFactor;
    NSMutableArray *meterTable;
}

+ (instancetype)sharedMeterTable;
- (float)valueForPower:(float)power;

@end
