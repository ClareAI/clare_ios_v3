//
//  CLAppDelegate.m
//  Clare
//
//  Created by zekail on 10/08/2018.
//  Copyright (c) 2018 zekail. All rights reserved.
//

#import "CLAppDelegate.h"
#import <Clare/Clare.h>

@implementation CLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CLSettings *settings = [CLSettings initWithAppId:@"YOUR APP ID"];
    settings.host = @"HOST";
    settings.languages = [[NSArray alloc]initWithObjects:@"zh_HK",@"zh_CN",@"en_US",@"zh_TW", @"ja_JP", @"vi_VN",@"tl_PH", nil];
    settings.avatarImage = [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection: nil];
    settings.bubbleImage = [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection: nil];
    settings.repliesInFlowLayout = YES;
    settings.microphoneEnable = YES;
    settings.voiceEnable = YES;
    settings.loadHistory = NO;
    settings.titles = [[NSMutableDictionary alloc]init];
    [settings.titles setObject:@"Clare 聊天机器人" forKey:@"zh_CN"];
    [settings.titles setObject:@"Clare 聊天機械人" forKey:@"zh_HK"];
    [settings.titles setObject:@"Clare Assistant" forKey:@"en_US"];
    settings.disclaimers = [[NSMutableDictionary alloc]init];
    [settings.disclaimers setObject:@[@"<span>• 虚拟助理是全自动化服务，因此无法回答有关您的帐户资料的问题。<br></span>",@"富达将储存您在此提供的资料，以确保服务质素。"] forKey:@"zh_CN"];
    [settings.disclaimers setObject:@[@"<span>• 虛擬助理是全自動化服務，因此無法回答有關您的帳戶資料的問題。<br>• 請勿在您的訊息中透露任何個人帳戶資料。<br></span>",@"<span>• 存您在此提供的資料，以確保服務質素。<br>• 獲授權第三方將處理及儲存資料，當中可能包括海外處理。<br>• 詳情請細閱<a href=\"https://www.clare.com/p/H0883004_S_10214181\">安全與私隱。</a></span>"] forKey:@"zh_HK"];
    [settings.disclaimers setObject:@[@"<span>• Virtual Assistant is an automated service, and therefore cannot answer questions specific to your account.<br>• Please do NOT disclose any personal account information in your messages.<br></span>",@"<span>• The information you input here will be recorded for service quality assurance.<br>• Data will be processed and stored by members of the Group and authorised third parties, which may include processing overseas.<br>• For the details please read the <a href=\"clare://www.clare.ai/p/H0883004_S_10214181\">Security and Privacy</a> guidelines.</span>"] forKey:@"en_US"];
    
    NSMutableDictionary *properties = [[NSMutableDictionary alloc]init];
    [properties setObject:@"HK ISLAND" forKey:@"location"];
    [properties setObject:@"male" forKey:@"gender"];
    settings.properties = properties;
    settings.languageDetection = false;
    [[Clare sharedManager]init:settings withCompletion:^(){
        NSMutableDictionary *properties = [[NSMutableDictionary alloc]init];
        [properties setObject:@"Kowloon" forKey:@"location"];
        [properties setObject:@"10000" forKey:@"age"];
        [[Clare sharedManager]updateUserProperties:properties];
    }];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL*)url {
    NSLog(@"url is %@\n url Scheme === %@\n url Host === %@",url, url.scheme,url.host);
    // url Scheme === testyang  url Host === testContent
    return YES;
}

-(BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler{
    NSLog(@"url opened is %@", userActivity.webpageURL);
    [application openURL:userActivity.webpageURL options:@{} completionHandler:nil];
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
