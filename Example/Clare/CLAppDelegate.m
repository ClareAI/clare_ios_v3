//
//  CLAppDelegate.m
//  Clare
//
//  Created by RajSwiftIos on 12/28/2018.
//  Copyright (c) 2018 RajSwiftIos. All rights reserved.
//

#import "CLAppDelegate.h"
#import <Clare/Clare.h>

@implementation CLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // Override point for customization after application launch.
    CLSettings *settings = [CLSettings initWithAppId:@"5b0fad75eabff10022552ea7"];
    //settings.host = @"http://10.0.1.23:5500";
    settings.host = @"https://api3.clare.ai";
    //    settings.userId=@"user@user1";
    //    settings.sessionId=@"session@session1";
    settings.languages = [[NSArray alloc]initWithObjects:@"zh_HK",@"en_US", nil];//,@"zh_CN",@"zh_TW", @"ja_JP", @"vi_VN",@"tl_PH"
    settings.avatarImage = [UIImage imageNamed:@"insurance" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection: nil];
    settings.repliesInFlowLayout = YES;
    settings.microphoneEnable = YES;
    //settings.voiceEnable = YES;
    settings.loadHistory = YES;
    settings.titles = [[NSMutableDictionary alloc]init];
    [settings.titles setObject:@"Clare 聊天机器人" forKey:@"zh_CN"];
    [settings.titles setObject:@"Clare 聊天機械人" forKey:@"zh_HK"];
    [settings.titles setObject:@"Clare Assistant" forKey:@"en_US"];
    settings.disclaimers = [[NSMutableDictionary alloc]init];
    [settings.disclaimers setObject:@[@"<span>• 虛擬助理是全自動化服務，因此無法回答有關您的帳戶資料的問題。<br>• 請勿在您的訊息中透露任何個人帳戶資料。<br></span>"] forKey:@"zh_HK"];//,@"<span>• 富達將儲存您在此提供的資料，以確保服務質素。<br>• 富達集團成員及獲授權第三方將處理及儲存資料，當中可能包括海外處理。<br>• 詳情請細閱<a href=\"https://www.hktvmall.com/p/H0883004_S_10214181\">安全與私隱。</a></span>"
    [settings.disclaimers setObject:@[@"<span>• Virtual Assistant is an automated service, and therefore cannot answer questions specific to your account.<br>• Please do NOT disclose any personal account information in your messages.<br></span>"] forKey:@"en_US"];//,@"<span>• The information you input here will be recorded for service quality assurance.<br>• Data will be processed and stored by members of the Fidelity Group and authorised third parties, which may include processing overseas.<br>• For the details please read the <a href=\"hktv://www.hktvmall.com/p/H0883004_S_10214181\">Security and Privacy</a> guidelines.</span>"
    
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
               /* NSMutableDictionary *properties = [[NSMutableDictionary alloc]init];
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
                }];*/
            }
            if (error) {
                NSLog(@"init_error1 %@",error);
            }
        }
        
    }];

    
    // Override point for customization after application launch.
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
