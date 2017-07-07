//
//  L_Tool.m
//  repairSystem
//
//  Created by luhongyu on 17/3/31.
//  Copyright © 2017年 luhongyu. All rights reserved.
//

#import "L_Tool.h"
#import <AVFoundation/AVFoundation.h>
#import "L_QuestionBankVC.h"
#import "L_PlanVC.h"
#import "L_CourseVC.h"
#import "L_MineVC.h"

static L_Tool *__manager;

@implementation L_Tool

+(instancetype)manager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __manager=[[L_Tool alloc]init];
    });
    return __manager;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __manager=[super allocWithZone:zone];
    });
    return __manager;
}


+ (void)goMain{
    
    UITabBarController * tabC = [[UITabBarController alloc]init];
    
    tabC.delegate  = [L_Tool manager];
    
    UINavigationController * nav1 = [[UINavigationController alloc]initWithRootViewController:[[L_QuestionBankVC alloc]init]];
    
    UINavigationController * nav2 = [[UINavigationController alloc]initWithRootViewController:[[L_CourseVC alloc]init]];
    
    UINavigationController * nav3 = [[UINavigationController alloc]initWithRootViewController:[[L_PlanVC alloc]init]];
    
    UINavigationController * nav4 = [[UINavigationController alloc]initWithRootViewController:[[L_MineVC alloc]init]];
    
    [nav1 setTabBarItem:[[UITabBarItem alloc]initWithTitle:@"题库"  image:[[UIImage imageNamed:@"题库"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"题库--蓝"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    [nav2 setTabBarItem:[[UITabBarItem alloc]initWithTitle:@"课程"  image:[[UIImage imageNamed:@"课程-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"课程-蓝"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    [nav3 setTabBarItem:[[UITabBarItem alloc]initWithTitle:@"备考专区"  image:[[UIImage imageNamed:@"备考专区"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"备考-蓝"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    [nav4 setTabBarItem:[[UITabBarItem alloc]initWithTitle:@"我的"  image:[[UIImage imageNamed:@"我的"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"我的-蓝"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    
    nav1.navigationBar.barTintColor = UIColorFromRGB(0x124A96);
    nav2.navigationBar.barTintColor = UIColorFromRGB(0x124A96);
    nav3.navigationBar.barTintColor = UIColorFromRGB(0x124A96);
    nav4.navigationBar.barTintColor = UIColorFromRGB(0x124A96);
    
    nav1.navigationBar.tintColor = [UIColor whiteColor];
    nav2.navigationBar.tintColor = [UIColor whiteColor];
    nav3.navigationBar.tintColor = [UIColor whiteColor];
    nav4.navigationBar.tintColor = [UIColor whiteColor];
    
    
    [nav1.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [nav2.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [nav3.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [nav4.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [tabC addChildViewController:nav1];
    [tabC addChildViewController:nav2];
    [tabC addChildViewController:nav3];
    [tabC addChildViewController:nav4];
    tabC.tabBar.tintColor = UIColorFromRGB(0x2353b9);
    
    //tabC.tabBar.dk_tintColorPicker = DKColorPickerWithKey(BAR);
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [[UIApplication sharedApplication].delegate window].rootViewController = tabC;
}

// 将字典或者数组转化为JSON串
+ (NSString *)toJSONData:(id)theData
{
    if (!theData) {
        return @"";
    }
    
    NSError *error = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData options:NSJSONWritingPrettyPrinted error:nil];
    
    if ([jsonData length]&&error== nil){
        return [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }else{
        return @"";
    }
}

// 将JSON串转化为字典或者数组
+ (id)toArrayOrNSDictionary:(NSData *)jsonData{
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    
    if (jsonObject != nil && error == nil){
        return jsonObject;
    }else{
        // 解析错误
        return nil;
    }
}

+ (UIImage *)scaleToSize:(UIImage *)img{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    
    if (img.size.width < ScreenWidth) {
        
        return img;
    }
    
    CGSize  tempsize = CGSizeMake(ScreenWidth*1.2, img.size.height/img.size.width*ScreenWidth*1.2);
    
    UIGraphicsBeginImageContext(tempsize);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, tempsize.width, tempsize.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    
    NSData *imageData = UIImageJPEGRepresentation(scaledImage, 0.8);
    UIImage *newImage = [UIImage imageWithData:imageData];
    
    return newImage;
}

+ (UIImage*)getVideoPreViewImage:(NSURL *)videoPath
{
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoPath options:nil];
    AVAssetImageGenerator *assetGen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    
    assetGen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [assetGen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *videoImage = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    return videoImage;
}

+ (void)showLoginVC
{
    /*
    L_LoginViewController *vc = [[L_LoginViewController alloc] init];
    
    [[[[UIApplication sharedApplication] delegate] window].rootViewController presentViewController:[[UINavigationController alloc] initWithRootViewController:vc] animated:YES completion:^{
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }];
    */
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController NS_AVAILABLE_IOS(3_0)
{
    return YES;
 
    
    if (USER_DATA){
        return YES;
    }else{
        [L_Tool showLoginVC];
        
        return NO;
    }
}


@end
