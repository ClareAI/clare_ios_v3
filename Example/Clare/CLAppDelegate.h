//
//  CLAppDelegate.h
//  Clare
//
//  Created by Ying Yu on 03/24/2020.
//  Copyright (c) 2020 Ying Yu. All rights reserved.
//

@import UIKit;
#import <CoreData/CoreData.h>
#import <Clare/Clare.h>

@interface CLAppDelegate : UIResponder <UIApplicationDelegate,ConversationDelegate,ChatBotDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end
