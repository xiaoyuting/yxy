//
//  ThreeModel.m
//  SDAutoLayoutDemo
//
//  Created by lixiya on 16/1/14.
//  Copyright © 2016年 lixiya. All rights reserved.
//

#import "ThreeModel.h"

@implementation ThreeModel

//+(NSDictionary*)mj_objectClassInArray{
//
//    return @{
//             @"imgextra":@"Imgextra",
//             @"editor":@"Editor",
//             @"ads":@"Ads"
//             };
//}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"imgextra":@"Imgextra",
             @"editor":@"Editor",
             @"ads":@"Ads"
             };
}
@end
