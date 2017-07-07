//
//  L_Tool.h
//  repairSystem
//
//  Created by luhongyu on 17/3/31.
//  Copyright © 2017年 luhongyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface L_Tool : NSObject<UITabBarControllerDelegate>

+ (void)goMain;

+ (NSString *)toJSONData:(id)theData;

+ (id)toArrayOrNSDictionary:(NSData *)jsonData;

+ (UIImage *)scaleToSize:(UIImage *)img;

+ (UIImage*)getVideoPreViewImage:(NSURL *)videoPath;

+ (void)showLoginVC;

@end
