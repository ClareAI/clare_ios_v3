//
//  CLAppDelegate.m
//  Clare
//
//
//

#import "CLAppDelegate.h"

@interface CLAppDelegate ()

@end

@implementation CLAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    CLSettings *settings = [CLSettings initWithAppId:@"appid"];
    settings.host = @"host";
    settings.userId=@"user@user1";
    settings.sessionId=@"session@session1";
    settings.languages = [[NSArray alloc]initWithObjects:@"en_US",@"zh_HK", @"zh_CN",nil];
    settings.avatarImage = [UIImage imageNamed:@"insurance" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection: nil];
    settings.repliesInFlowLayout = YES;
    settings.microphoneEnable = YES;
    settings.voiceEnable = NO;
    settings.loadHistory = YES;
    settings.sendGreetingAgain = YES;
    
    settings.titles = [[NSMutableDictionary alloc]init];
    
    [settings.titles setObject:@"Melvis" forKey:@"en_US"];
    [settings.titles setObject:@"Melvis" forKey:@"zh_HK"];
    [settings.titles setObject:@"Melvis" forKey:@"zh_CN"];
    settings.disclaimers = [[NSMutableDictionary alloc]init];
    [settings.disclaimers setObject:@[@"<span>• Virtual Assistant is an automated service, and therefore cannot answer questions specific to your account.<br>• Please do NOT disclose any personal account information in your messages.<br></span>"] forKey:@"en_US"];//,@"<span>• The information you input here will be recorded for service quality assurance.<br>• Data will be processed and stored by members of the Fidelity Group and authorised third parties, which may include processing overseas.<br>• For the details please read the <a href=\"hktv://www.hktvmall.com/p/H0883004_S_10214181\">Security and Privacy</a> guidelines.</span>"
    [settings.disclaimers setObject:@[@"<span>• 虛擬助理是全自動化服務，因此無法回答有關您的帳戶資料的問題。<br>• 請勿在您的訊息中透露任何個人帳戶資料。<br></span>"] forKey:@"zh_HK"];//,@"<span>• 富達將儲存您在此提供的資料，以確保服務質素。<br>• 富達集團成員及獲授權第三方將處理及儲存資料，當中可能包括海外處理。<br>• 詳情請細閱<a href=\"https://www.hktvmall.com/p/H0883004_S_10214181\">安全與私隱。</a></span>"
    [settings.disclaimers setObject:@[@"<span>• 虚拟助理是全自动化服务，因此无法回答有关您的帐户资料的问题。<br></span>",@"富达将储存您在此提供的资料，以确保服务质素。"] forKey:@"zh_CN"];
    
    
    NSMutableDictionary *properties = [[NSMutableDictionary alloc]init];
    [properties setObject:@"HK ISLAND" forKey:@"location"];
    [properties setObject:@"male" forKey:@"gender"];
    settings.properties = properties;
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
    
    settings.themeColor =  [UIColor colorWithRed:182.0/255.0 green:141.0/255.0 blue:60.0/255.0 alpha:1.0];
    
    [Clare sharedManager].conversationDelegate = self;
    
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    
    
    //    CLSettings * style = [[CLSettings alloc]init];
    //    style.chatBgColor = [UIColor lightGrayColor];
    //    style.linkColor = [UIColor redColor];
    //    style.watermarkColor = [UIColor yellowColor];
    //    style.headerBarBgColor = [UIColor greenColor];
    
    
    return YES;
}
static void uncaughtExceptionHandler(NSException *exception) {
    NSLog(@"%@\n%@", exception, [exception callStackSymbols]);
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL*)url {
    NSLog(@"url is %@\n url Scheme === %@\n url Host === %@",url, url.scheme,url.host);
    // url Scheme === testyang  url Host === testContent
    UIViewController *newview = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"second"];
    [[self topMostController] presentViewController:newview animated:YES completion:nil];
    return YES;
}

-(BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler{
    NSLog(@"url opened is %@", userActivity.webpageURL);
    [application openURL:userActivity.webpageURL options:@{} completionHandler:nil];
    return YES;
}

- (UIViewController*) topMostController {
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    return topController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"App"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                     */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
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

@end


