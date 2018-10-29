//
//  CLAppDelegate.m
//  Clare
//
//  Created by zekail on 10/29/2018.
//  Copyright (c) 2018 zekail. All rights reserved.
//

#import "CLAppDelegate.h"
#import <Clare/Clare.h>

@implementation CLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    CLSettings *settings = [CLSettings initWithAppId:@"appid"];
    settings.host = @"apphost";
    settings.languages = [[NSArray alloc]initWithObjects:@"zh_HK",@"en_US", nil];
    settings.avatarImage = [UIImage imageNamed:@"insurance" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection: nil];
    settings.repliesInFlowLayout = YES;
    settings.microphoneEnable = YES;
    //settings.voiceEnable = YES;
    settings.loadHistory = YES;
    settings.titles = [[NSMutableDictionary alloc]init];
    [settings.titles setObject:@"Clare 聊天机器人" forKey:@"zh_CN"];
    [settings.titles setObject:@"Clare 聊天機械人" forKey:@"zh_HK"];
    [settings.titles setObject:@"Clare Assistant" forKey:@"en_US"];
    
    NSMutableDictionary *properties = [[NSMutableDictionary alloc]init];
    [properties setObject:@"HK ISLAND" forKey:@"location"];
    [properties setObject:@"male" forKey:@"gender"];
    settings.properties = properties;
    settings.languageDetection = false;
    
    [[Clare sharedManager] init:settings withCompletion:^(BOOL ignored,BOOL success, NSError* _Nullable error) {
        if(ignored){
            NSLog(@"already init, not need re-init");
        }else{
            NSLog(@"userid sessionid %@",[[Clare sharedManager]getUserSession]);
            if (success) {
                NSMutableDictionary *properties = [[NSMutableDictionary alloc]init];
                [properties setObject:@"Kowloon" forKey:@"location"];
                [properties setObject:@"10000" forKey:@"age"];
                [[Clare sharedManager]updateUserProperties:properties completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                    NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);
                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:nil];
                    NSLog(@"response %@",dict);
                    if(error){
                        NSLog(@"update_error %@", error);
                    }
                }];
            }
            if (error) {
                NSLog(@"init_error %@",error);
            }
        }
        
    }];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
