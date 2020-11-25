//
//  CLAppDelegate.m
//  Clare
//
//  Created by vernalclareai on 11/25/2020.
//  Copyright (c) 2020 vernalclareai. All rights reserved.
//

#import "CLAppDelegate.h"

@implementation CLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    CLSettings *settings = [CLSettings initWithAppId:@"5e158202870229000f7b7a12"];
    //settings.host = @"http://10.0.1.23:5500";
    settings.host = @"https://api-staging.clare.ai";
    
    
    settings.titles = [[NSMutableDictionary alloc]init];
    [settings.titles setObject:@"Clare Assistant" forKey:@"en_US"]; //1
    [settings.titles setObject:@"Clare 聊天機械人" forKey:@"zh_HK"];
    [settings.titles setObject:@"Clare 聊天机器人" forKey:@"zh_CN"];
    settings.themeColor =  [UIColor colorWithRed:182.0/255.0 green:141.0/255.0 blue:60.0/255.0 alpha:1.0]; //2

    settings.disclaimers = [[NSMutableDictionary alloc]init];
    [settings.disclaimers setObject:@[@"<span>• Virtual Assistant is an automated service, and therefore cannot answer questions specific to your account.<br>• Please do NOT disclose any personal account information in your messages.<br></span>",@"<span>MallMall Chat is an automated service, and information provided for general enquiries is for reference only. Please do not disclose any personal information during the conversation.</span>"] forKey:@"en_US"];//4   //,@"<span>• The information you input here will be recorded for service quality assurance.<br>• Data will be processed and stored by members of the Fidelity Group and authorised third parties, which may include processing overseas.<br>• For the details please read the <a href=\"hktv://www.hktvmall.com/p/H0883004_S_10214181\">Security and Privacy</a> guidelines.</span>"
    [settings.disclaimers setObject:@[@"<span>• 虛擬助理是全自動化服務，因此無法回答有關您的帳戶資料的問題。<br>• 請勿在您的訊息中透露任何個人帳戶資料。<br></span>",@"<span>MallMall 查是全自動化服務，對一般查詢所提供的資料僅供參考，請勿在對話中透露任何個人資料。</span>"] forKey:@"zh_HK"];//,@"<span>• 富達將儲存您在此提供的資料，以確保服務質素。<br>• 富達集團成員及獲授權第三方將處理及儲存資料，當中可能包括海外處理。<br>• 詳情請細閱<a href=\"https://www.hktvmall.com/p/H0883004_S_10214181\">安全與私隱。</a></span>"
    [settings.disclaimers setObject:@[@"<span>• 虚拟助理是全自动化服务，因此无法回答有关您的帐户资料的问题。<br></span>",@"富达将储存您在此提供的资料，以确保服务质素。",@"<span>MallMall 查是全自動化服務，對一般查詢所提供的資料僅供參考，請勿在對話中透露任何個人資料。</span>"] forKey:@"zh_CN"];
    
    //settings.senderPlaceHolder = @"type a message";

    settings.languages = [[NSArray alloc]initWithObjects: @"zh_CN",nil]; //5
    settings.microphoneEnable = YES; //6
    settings.voiceEnable = NO; //7
    settings.isReplyButtonInOneRow = NO; //8
    settings.loadHistory = YES; //9
    settings.languageDetection = YES; //10
    settings.sendGreetingAgain = YES; // 11
    settings.autoStart = YES; // 12 if No, it will not make the connection to the chat server until the chatwidget is opened.
    
    settings.allowUploadFile = YES;
    
    CLLogoSetting* logoSetting = [CLLogoSetting new];
    logoSetting.defaultLogo = [UIImage imageNamed:@"default"];
    logoSetting.apiLogo = [UIImage imageNamed:@"api"];
    logoSetting.salesforceLogo = [UIImage imageNamed:@"salesforce"];
    logoSetting.livechatLogo = [UIImage imageNamed:@"liveagent"];
    
    [[Clare sharedManager] setLogo:logoSetting];
    
    CLStyleSetting* styleSetting = [CLStyleSetting new];
    styleSetting.chatBgColor = UIColor.whiteColor;
    styleSetting.linkColor = UIColor.blueColor;
    
    styleSetting.quickReplyButtonBgColor = UIColor.blueColor;
    styleSetting.quickReplyButtonFontColor = UIColor.whiteColor;
    styleSetting.quickReplyButtonBorderColor = UIColor.greenColor;

    styleSetting.bubbleFontColor = UIColor.whiteColor;
    styleSetting.bubbleBgColor = UIColor.whiteColor;
    styleSetting.bubbleBorder = YES;
    styleSetting.bubbleFontColor = UIColor.blackColor;

    styleSetting.headerBarBgColor = [UIColor colorWithRed:54.0/255.0 green:180.0/255.0 blue:73.0/255.0 alpha:1.0];

    styleSetting.userBubbleBgColor = [UIColor colorWithRed:54.0/255.0 green:180.0/255.0 blue:73.0/255.0 alpha:1.0];
    styleSetting.userBubbleBorder = YES;
    styleSetting.userBubbleFontColor = UIColor.whiteColor;

    styleSetting.postbackBgColor = UIColor.blueColor;
    styleSetting.postbackBorderColor = [UIColor colorWithRed:54.0/255.0 green:180.0/255.0 blue:73.0/255.0 alpha:1.0];
    styleSetting.postbackFontColor = UIColor.whiteColor;
    styleSetting.searchResultFontColor = UIColor.blackColor;
    [[Clare sharedManager] setStyle:styleSetting];

        
    settings.languageDetection = true;
    
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
                NSLog(@"init_error1 %@",error);
            }
        }
        
    }];
    
    [Clare sharedManager].conversationDelegate = self;
    [Clare sharedManager].chatBotDelegate = self;
    
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);

    
  
    
    return YES;
}

static void uncaughtExceptionHandler(NSException *exception) {
    NSLog(@"%@\n%@", exception, [exception callStackSymbols]);
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


#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

- (void)onUnreadCountChanged:(int)count {
    NSLog(@"未读 %d",count);
}

-(void)onChotBotClosed{
   
}

@end
