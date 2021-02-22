//
//  CLAppDelegate.h
//  Clare
//
//  Created by vernalclareai on 02/22/2021.
//  Copyright (c) 2021 vernalclareai. All rights reserved.
//

@import UIKit;
#import <CoreData/CoreData.h>
#import <Clare/Clare.h>

@interface CLAppDelegate : UIResponder <UIApplicationDelegate,ConversationDelegate,ChatBotDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end
